require_relative 'input'
require 'selenium-webdriver'
module Parsing_page
  def self.page_content
    link = Input.link
    Selenium::WebDriver::Chrome::Service.driver_path = "/home/artem/Загрузки/eng_wordbook/eng_wordbook/lib/chromedriver-linux64/chromedriver"

    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      'pageLoadStrategy' => 'eager'
    )

    driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps
    driver.get(link)
    element = driver.find_element(css: 'body')
    element.text
  end
end
