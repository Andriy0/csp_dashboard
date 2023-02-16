module CspDashboard
  class ViolationReportsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    before_action :load_report, only: %i(show destroy)

    helper_method :report_attributes_to_display

    def index
      respond_to do |format|
        format.html { load_reports }
      end
    end

    def show; end

    def create
      report_base = JSON.parse(request.body.read)

      if report_base.key? 'csp-report'
        report_params = report_base['csp-report']

        save_report report_params
      end

      head :no_content
    end

    def destroy
      @report.destroy

      redirect_to :root
    end

    def destroy_all
      CspDashboard::ViolationReport.destroy_all

      redirect_to :root
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

    def report_attributes_to_display(action = :index)
      case action
      when :show
        %w(id blocked_uri document_uri referrer effective_directive violated_directive
           original_policy status_code source_file line_number script_sample incoming_ip
           raw_browser created_at)
      when :index
        %w(id blocked_uri document_uri violated_directive incoming_ip created_at)
      else
        []
      end
    end

    def load_report
      @report = CspDashboard::ViolationReport.find params[:id]
    end

    def load_reports
      @q       = ViolationReport.ransack(params[:q])
      @q.sorts = ['created_at DESC'] if @q.sorts.blank?
      @pagy, @reports = pagy(@q.result, items: 50)
    end
  end
end
