require "open3"
require 'selenium-webdriver'
require 'webdrivers'

module DriverInstall
  def self.try_standard_method
    # Webdrivers.install_dir = __dir__
    # profile = Selenium::WebDriver::Firefox::Profile.new
    # profile_path = "#{Dir.home}/.mozilla/firefox/"
    # profile = Selenium::WebDriver::Firefox::Profile.new(profile_path)
    # driver = Selenium::WebDriver.for :firefox
  end
end