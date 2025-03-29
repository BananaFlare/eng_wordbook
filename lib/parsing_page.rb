require_relative 'input'
require 'selenium-webdriver'
def page_content
  link = Input.link
  # Selenium::WebDriver::Firefox::Service.driver_path = '/home/artem/Загрузки/eng_wordbook/eng_wordbook/lib/gecodriver/geckodriver-v0.36.0-linux64/geckodriver'
  # options = Selenium::WebDriver::Firefox::Options.new
  # # options.add_argument('--headless')  # Режим без GUI
  # driver = Selenium::WebDriver.for :firefox, options: options
  # driver.get(link)
  # driver = Selenium::WebDriver.for :firefox, options: options
  # driver.get('https://google.com')
  # puts driver.title

end
page_content