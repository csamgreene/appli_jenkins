require 'eyes_selenium'

describe 'Applitools' , :type=>:feature, :js=>true do
  before(:all) do
  end
  let(:eyes) do
    Applitools::Selenium::Eyes.new
  end
  describe 'Test Applitools Home Web Page' do
    it 'should navigate from the main page to the features page' do
      begin
        # This is your api key, make sure you use it in all your tests.
        eyes.api_key = 'd1hQAwqXH04jtJ5wGIej01whl1108x4xRPK3SvsmXP3fA110'
            
            
        b = Applitools::BatchInfo.new "Simple AT - Jenkins Tests"
        b.id = "1234"
        eyes.batch = b      
            
        driver = Selenium::WebDriver.for :chrome
            
        # Start visual testing with browser viewport set to 1024x768.
        eyes.test(app_name: 'Example 1', test_name: 'Example 1',
        viewport_size: {width: 800, height: 600}, driver: driver) do
          driver.get 'http://example.com'
                
          # Visual validation point #1
          eyes.check_window('Main Page')
                
        end
      ensure
        eyes.abort_if_not_closed
      end
    end
  end
end