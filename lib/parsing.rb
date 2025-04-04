require_relative 'input'
require 'selenium-webdriver'
require 'webdrivers'
module Parsing_page
  def self.page_content
    link = Input.link
    Selenium::WebDriver::Chrome::Service.driver_path = "/home/artem/Загрузки/eng_wordbook/eng_wordbook/lib/chromedriver-linux64/chromedriver"
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
