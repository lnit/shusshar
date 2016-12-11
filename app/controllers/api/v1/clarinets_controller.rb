class Api::V1::ClarinetsController < ApplicationController
  def status
    render json: clarinet.work_status
  ensure
    @clarinet&.quit
  end

  private
  def clarinet
    return @clarinet if @clarinet
    @clarinet = ClarinetDriver.new(:firefox, auth[:login_id], auth[:login_pass])
  end

  def auth
    return @auth if @auth
    @auth = params.slice(:login_id, :login_pass)
  end
end
