module CspDashboard
  module ApplicationHelper
    include Pagy::Frontend

    def pagination(pagy)
      raw pagy_bootstrap_nav(pagy) if pagy.pages > 1 # rubocop:disable Rails/OutputSafety
    end
  end
end
