require 'rails_helper'

describe 'Violation Report Request' do
  let(:report) do
    {
      'document-uri' => 'http://localhost:3000/',
      'referrer' => '',
      'blocked-uri' => '',
      'violated-directive' => "script-src 'self'",
      'original-policy' => "script-src 'self'; report_uri /csp_dashboard/violation_reports"
    }
  end

  it 'creates a report' do
    expect do
      post violation_reports_path, params: { 'csp-report' => report }.to_json
    end.to change(CspDashboard::ViolationReport, :count).by(1)

    expect(response).to have_http_status :no_content
  end
end
