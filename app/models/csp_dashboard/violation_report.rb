module CspDashboard
  class ViolationReport < ApplicationRecord
    scope :archived,   -> { where(archived: true) }
    scope :unarchived, -> { where(archived: false) }

    class << self
      def ransackable_attributes(_ = nil)
        %w(blocked_uri violated_directive incoming_ip created_at)
      end

      def ransackable_associations(_ = nil)
        %w(blocked_uri violated_directive incoming_ip)
      end

      def ransackable_scopes(_ = nil)
        %i(archived unarchived)
      end
    end
  end
end
