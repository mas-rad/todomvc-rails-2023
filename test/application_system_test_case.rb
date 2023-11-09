require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: {
    browser: :remote,
    url: "http://chrome-server:4444/wd/hub"
  }
  def setup
    Capybara.server_host = "0.0.0.0" # bind to all interfaces
    Capybara.app_host = "http://#{IPSocket.getaddress(Socket.gethostname)}"  #"http://app:3000"
    super
  end
end

# Remove "Capybara starting Puma..." test logs
Capybara.server = :puma, { Silent: true }
