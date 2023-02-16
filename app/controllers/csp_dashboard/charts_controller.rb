module CspDashboard
  class ChartsController < ApplicationController
    def violation_reports_in_last_month
      render json: CspDashboard::ViolationReport.group_by_day(:created_at, last: 31).count
    end
  end
end
