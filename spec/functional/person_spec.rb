require 'spec_helper'

RSpec.describe Person do
  describe 'validate if the city name is getting convert or not' do

    params = {
        birthdate: '1997-08-31',
        city: 'NYC',
        first_name: 'Gaurav'
    }

    actual_person= Person.new(params)

    # puts subject
    it 'returns the correct converted city name' do
      expect(actual_person.city).to eq "New York City"
    end
  end
end
