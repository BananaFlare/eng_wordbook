require_relative 'input'
require 'selenium-webdriver'
require 'webdrivers'
require_relative 'driver_install'
module Parsing_page
  def self.page_content
    link = Input.link
    tt = DriverInstall.try_standard_method
    driver_path = __dir__+'/chromedriver'
    Selenium::WebDriver::Chrome::Service.driver_path = driver_path
    options = Selenium::WebDriver::Chrome::Options.new

    # Добавляем аргументы (например, headless-режим)
    # options.add_argument('--headless=new')
    options.page_load_strategy=:eager
    driver = Selenium::WebDriver.for :chrome, options: options

    driver.get(link)
    element = driver.find_element(css: 'body')
    element.text
  end
end
