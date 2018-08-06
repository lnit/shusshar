class Api::V1::ClarinetsController < ApplicationController
  def status
    render json: clarinet.work_status
  ensure
    @clarinet&.quit
  end

  def shussha
    clarinet.shussha!
    render head: :ok
  ensure
    @clarinet&.quit
  end

  def taisha
    clarinet.taisha!
    render head: :ok
  ensure
    @clarinet&.quit
  end

  def punch
    clarinet.punch!
    render head: :ok
  ensure
    @clarinet&.quit
  end

  private
  def clarinet
    return @clarinet if @clarinet
    browser = Settings.clarinet_driver.browser || :firefox
    if Settings.clarinet_driver.opts_enabled
      opts = Settings.clarinet_driver.opts&.to_hash || {}
    else
      opts = {}
    end

    @clarinet = ClarinetDriver.new(browser, auth[:login_id], auth[:login_pass], opts)
  end

  def auth
    return @auth if @auth
    @auth = params.slice(:login_id, :login_pass)
  end
end
