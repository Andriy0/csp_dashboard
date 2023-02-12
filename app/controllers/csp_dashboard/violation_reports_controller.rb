module CspDashboard
  class ViolationReportsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def index
      respond_to do |format|
        format.html { load_reports }
        # format.png  { respond_with_monthly_bar_graph }
        # format.zip  { respond_with_zipped_reports }
      end
    end

    def create
      report_base = JSON.parse(request.body.read)

      if report_base.key? 'csp-report'
        report_params = report_base['csp-report']

        save_report report_params
      end

      head :ok
    end

    private

    def save_report(report_params)
      CspDashboard::ViolationReport.create do |r|
        allowed_report_attributes.each do |attr|
          r.public_send "#{attr}=", report_params[attr.dasherize]
        end

        r.raw_report  = report_params
        r.raw_browser = request.headers['User-Agent']
        r.incoming_ip = request.remote_ip
      end
    end

    def allowed_report_attributes
      CspDashboard::ViolationReport
        .attribute_names
        .reject { |attr| ignored_report_attributes.include?(attr) }
    end

    def ignored_report_attributes
      %w(id created_at updated_at archived raw_report raw_browser incoming_ip)
    end

    def set_report
      @report = CspViolationReport.find params[:id]
    end

    def load_reports
      @reports = CspDashboard::ViolationReport.all
    end
  end
end
