require 'rails_helper'

module CspDashboard
  describe ViolationReportsController do
    routes { CspDashboard::Engine.routes }

    it 'get index' do
      get :index

      expect(response).to have_http_status :ok
    end
  end
end
