# frozen_string_literal: true

require 'capybara/rails'
require 'capybara/rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include Capybara::DSL
end

base_args = if ENV['NO_HEADLESS'] == '1'
              %w[no-sandbox disable-gpu]
            else
              %w[headless no-sandbox disable-gpu]
            end

Capybara.register_driver :headless_chrome do |app|
  args = base_args.dup << '--window-size=1900,1080'
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: args
    }
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: caps
  )
end

Capybara.default_driver = :headless_chrome
