require 'rails_helper'

describe CspDashboard::ViolationReportsController do
  routes { CspDashboard::Engine.routes }

  it 'get index' do
    get :index

    expect(response).to have_http_status :ok
  end
end
