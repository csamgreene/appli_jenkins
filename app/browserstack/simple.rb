require 'rubygems'
require 'selenium-webdriver'
require 'eyes_selenium'

# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new
# caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer
# caps[:browserName] = 'iPhone'
# caps['device'] = 'iPhone 8 Plus'
# caps['realMobile'] = 'true'
# caps['os_version'] = '11.0'

caps['browserName'] = 'Internet Explorer'
caps['version'] = '8.0'
caps['platform'] = 'WINDOWS'


puts "Getting driver"
driver = Selenium::WebDriver.for(:remote,
  :url => "http://christophergreen8:sgizbBXbnNtEyhbmmBgX@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)
puts "Driver: #{driver}"

  eyes = Applitools::Selenium::Eyes.new
  
  # Applitools api key.
  eyes.api_key = 'd1hQAwqXH04jtJ5wGIej01whl1108x4xRPK3SvsmXP3fA110'

  puts "Start visual testing"
  # Start visual testing with browser viewport set to 1024x768.
  eyes.test(app_name: 'Applitools-Browserstack - Ezra1', test_name: 'Applitools-Browserstack - Ezra',
            viewport_size: {width: 800, height: 600}, driver: driver) do
    
    driver.navigate.to 'https://applitools.com/helloworld'
    # driver.get 'https://applitools.com/helloworld?diff2'
          
    # Visual validation point #1
    eyes.check_window('Main Page')
puts "Done"          
  end

  eyes.abort_if_not_closed
  driver.quit
