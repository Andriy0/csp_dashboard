require 'rails_helper'

describe 'Violation Reports' do
  it 'visits violation_reports#index' do
    visit violation_reports_path

    expect(page).to have_text 'CSP Violation Reports (0)'
  end
end
