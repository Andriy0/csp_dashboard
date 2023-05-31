class CreateCspDashboardViolationReports < ActiveRecord::Migration[7.0]
  def change
    create_table :csp_dashboard_violation_reports do |t|
      t.text    :blocked_uri
      t.string  :disposition
      t.text    :document_uri
      t.string  :effective_directive
      t.string  :violated_directive
      t.text    :original_policy
      t.string  :referrer
      t.integer :status_code
      t.json    :raw_report
      t.string  :raw_browser
      t.string  :source_file
      t.string  :script_sample
      t.integer :line_number
      t.string  :incoming_ip
      t.boolean :archived, default: false, null: false

      t.timestamps
    end
  end
end
