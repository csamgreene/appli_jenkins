require 'eyes_selenium'

describe 'Applitools and BrowserStack' , :type=>:feature, :js=>true do
  
  before(:all) do
  end
  
  let(:eyes) do
    Applitools::Selenium::Eyes.new
  end
  
  describe 'Test Applitools, Browserstack, and Jenkins' do
    it 'should test the capabilities of the driver/platform in Applitools in Jenkins' do
      begin
        
        caps = Selenium::WebDriver::Remote::Capabilities.new
        caps['browserName'] = 'Internet Explorer'
        caps['version'] = '8.0'
        caps['platform'] = 'WINDOWS'
        
        driver = Selenium::WebDriver.for(:remote,
          :url => "http://christophergreen8:sgizbBXbnNtEyhbmmBgX@hub-cloud.browserstack.com/wd/hub",
          :desired_capabilities => caps)
        
        # Applitools api key.
        eyes.api_key = 'd1hQAwqXH04jtJ5wGIej01whl1108x4xRPK3SvsmXP3fA110'
            
        # Start visual testing with browser viewport set to 1024x768.
        eyes.test(app_name: 'Applitools-Browserstack-Jenkins1', test_name: 'Applitools-Browserstack-Jenkins1',
                  viewport_size: {width: 800, height: 600}, driver: driver) do
          
          driver.get 'https://applitools.com/helloworld'
          # driver.get 'https://applitools.com/helloworld?diff2'
                
          # Visual validation point #1
          eyes.check_window('Main Page')
                
        end
      ensure
        eyes.abort_if_not_closed
        driver.quit
      end
    end
  end
end