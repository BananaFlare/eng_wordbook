require_relative 'input'
require 'selenium-webdriver'
require 'webdrivers'
require_relative 'driver_install'

module Parsing_page
  def self.page_content
    Webdrivers.install_dir = __dir__

    Selenium::WebDriver::Firefox::Service.driver_path = '/home/artem/Загрузки/eng_wordbook/eng_wordbook/lib/geckodriver'
    # DriverInstall.try_standard_method
    options = Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
    options.page_load_strategy = :eager
    driver = Selenium::WebDriver.for :firefox, options: options

    link = Input.link
    driver.get(link)
    element = driver.find_element(css: 'body')
    element.text
  end
end
