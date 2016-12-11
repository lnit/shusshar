class ClarinetDriver
  LOGIN_URL = "https://www1.shalom-house.jp/komon/login.aspx"
  MAIN_URL = "https://www1.shalom-house.jp/cla_jnj/top.aspx"

  class UnauthorizedError < StandardError; end
  class UnshusshableError < StandardError; end
  class UntaishableError < StandardError; end
  class UndakokableError < StandardError; end

  module WorkStatus
    STANDBY = "standby"
    WORKING = "working"
    FINISHED = "finished"
  end

  # インスタンス生成時にブラウザ起動/ログインまでを実行する
  #
  # @param [Symbol] browser 起動するブラウザ(:firefox, :chromeなど)
  # @param [String] login_id ネットde勤怠のID
  # @param [String] login_pass ネットde勤怠のパスワード
  # @return [ClarinetDriver] 生成されたClarinetDriverのインスタンス
  def initialize(browser, login_id, login_pass, opt = {})
    d = Selenium::WebDriver.for browser, opt # url: "http://133.242.231.79:4444/wd/hub", desired_capabilities: :chrome

    d.navigate.to(LOGIN_URL)
    d.find_element(:id, "txtID").send_keys(login_id)
    d.find_element(:id, "txtPsw").send_keys(login_pass)
    d.find_element(:id, "btnLogin").click

    begin
      wait = Selenium::WebDriver::Wait.new
      wait.until { d.find_element(id: "ctl00_ContentPlaceHolder1_imgBtnSyuugyou") }
    rescue Selenium::WebDriver::Error::TimeOutError
      d.quit
      raise UnauthorizedError
    end

    d.navigate.to(MAIN_URL)

    @driver = d
  end

  attr_reader :driver

  def quit
    driver.quit
  end

  def work_status
    hash = {}

    if shusshable?
      hash[:status] = WorkStatus::STANDBY
    elsif taishable?
      hash[:status] = WorkStatus::WORKING
    else
      hash[:status] = WorkStatus::FINISHED
    end

    hash
  end

  def shussha!
    unless shusshable?
      raise UnshusshableError, "Your status is '#{work_status}'."
    end
    control_buttons[0].click
  end

  def taisha!
    unless taishable?
      raise UntaishableError, "Your status is '#{work_status}'."
    end
    control_buttons[3].click
  end

  # 勤務状態を取得して出社/退社を行う
  def dakoku!
    return shussha! if shusshable?
    return taisha! if taishable?
    raise UndakokableError, "Your status is '#{work_status}'."
  end

  def shusshable?
    control_buttons[0].tag_name == "input"
  end

  def taishable?
    control_buttons[3].tag_name == "input"
  end

  def control_buttons
    driver.navigate.to(MAIN_URL) unless driver.current_url == MAIN_URL # 違うページを表示している場合はメインページに戻ってくる
    driver.find_elements(:xpath, "//div[@id='ctl00_ContentPlaceHolder1_pnlInMode']/*")
  end
end
