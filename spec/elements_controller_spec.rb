# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

#  require '/home/ksusha/uni/labs_web/laba8/app/controllers/elements_controller'

# testing ElementsController
RSpec.describe ElementsController, type: :controller do
  it 'returns true if value is a power of 5' do
    expect(ElementsController.power_of_5?(0)).to eq(false)
    expect(ElementsController.power_of_5?(1)).to eq(true)
    expect(ElementsController.power_of_5?(5)).to eq(true)
  end

  it 'returns zero length array when there are no segments of powers of 5' do
    arr = [0, 6, 7, 24, 26, 90]
    expect(ElementsController.segments_of_powers(arr)).to eq([])
  end

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index, xhr: true
      expect(response.status).to eq(200)
    end
  end
end

RSpec.describe ElementsController, type: 'request' do
  it 'expects to see sequences of powers of 5' do
    get '/elements/result.json?length=7&str_elem=1+2+3+4+5+6+7'
    expect(assigns[:length_of_arr]).to eq(7)
  end

  it 'alert message' do
    get '/elements/result.json?length=7&str_elem=1+2+3+4+5+6+q'
    expect(assigns[:error]).to eq("Sequence isn't correct")

    get '/elements/result.json?length=4&str_elem=1+2+3+4+5+6'
    expect(assigns[:error]).to eq("Length isn't correct")
  end
end

RSpec.describe 'Test of page with Selenium' do
  it 'check url of page' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000')
    expect(driver.current_url).to eq('http://localhost:3000/')
    driver.quit
  end

  it 'show alert message about sequence error' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000')
    driver.manage.timeouts.implicit_wait = 500

    num_field = driver.find_element(id: 'number')
    sequence_field = driver.find_element(id: 'text')
    btn = driver.find_element(id: 'btn')

    num_field.send_keys(10)
    sequence_field.send_keys('1 2 erer')
    btn.click

    alert = driver.switch_to.alert
    alert_text = alert.text
    alert.accept

    expect(alert_text).to eq("Sequence isn't correct")
    driver.quit
  end

  it 'show alert message about error with length' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000')
    driver.manage.timeouts.implicit_wait = 500

    num_field = driver.find_element(id: 'number')
    sequence_field = driver.find_element(id: 'text')
    btn = driver.find_element(id: 'btn')

    num_field.send_keys(10)
    sequence_field.send_keys('1 2 3 4 5 6')
    btn.click

    alert = driver.switch_to.alert
    alert_text = alert.text
    alert.accept

    expect(alert_text).to eq("Length isn't correct")
    driver.quit
  end
end
