require "open3"
require 'selenium-webdriver'
require 'webdrivers'

module DriverInstall
def self.default_browser_linux

  browser = `xdg-settings get default-web-browser`.chomp
  browser.empty? ? nil : browser
  version = `firefox --version 2>/dev/null`.chomp
  version unless version.empty?
  [browser, version]
end
def self.try_standard_method
  options = Selenium::WebDriver::Firefox::Options.new
  # options.page_load_stategy = :eager
  driver = Selenium::WebDriver.for :firefox,  options: options
end
def self.driver_install
  bv = default_browser_linux
  browser = bv[0]
  version = bv[1]
  url = "https://example.com/file.zip"
  output_file = "downloaded_file.zip"

  Open3.popen3("wget", "-O", output_file, url) do |stdin, stdout, stderr, wait_thr|
    stdin.close  # wget не требует ввода через stdin

    errors = stderr.read
    unless errors.empty?
      puts "Error occurred: #{errors}"
    end
    if wait_thr.value.success?
      puts "Download completed successfully!"
    else
      puts "Download failed with status #{wait_thr.value.exitstatus}"
    end
  end
end
end