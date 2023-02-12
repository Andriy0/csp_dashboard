require 'rails_helper'

module CspDashboard
  describe 'Violation Reports' do
    it 'visits violation_reports#index' do
      visit violation_reports_path

      expect(page).to have_text 'hello, world'
    end
  end
end
