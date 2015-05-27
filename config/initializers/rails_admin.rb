RailsAdmin.config do |config|
  config.main_app_name = ["The Co App Backoffice"]
  config.main_app_name = Proc.new { |controller| [ "The Co App", "BackOffice - #{controller.params[:action].try(:titleize)}" ] }
  config.excluded_models = ["AssignedRole",
                            "AvailableArea",
                            "AvailablePricing",
                            "AvailableService"]
  ### Popular gems integration

  ## == Sorcery ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  # timezone
  module Fields
    module Types
      class Datetime < RailsAdmin::Config::Fields::Base
        def value
          value_in_default_time_zone = bindings[:object].send(name)
          return nil if value_in_default_time_zone.nil?
          pacific_time_zone = ActiveSupport::TimeZone.new('Asia/Kuala_Lumpur')
          value_in_default_time_zone.in_time_zone(pacific_time_zone)
        end
      end
    end
  end
  # models
  config.model Area do
    list do
      field :id
      field :name
    end
  end

  config.model Company do
    edit do
      field :description, :ck_editor
      include_all_fields
      exclude_fields :created_at, :updated_at
    end
  end

  config.model Event do
    edit do
      field :description, :ck_editor
      include_all_fields
      exclude_fields :created_at, :updated_at
    end
  end

  config.model Location do
    list do
      field :id
      field :name
    end
    edit do
      field :description, :ck_editor
      field :address, :ck_editor
      include_all_fields
      exclude_fields :available_areas, :available_pricings, :available_services, :created_at, :updated_at
    end
  end

  config.model Profile do
    edit do
      include_all_fields
      exclude_fields :assigned_roles, :location_mentorships, :created_at, :updated_at
    end
  end

  config.model Service do
    list do
      field :id
      field :title
    end
    edit do
      field :description, :ck_editor
      include_all_fields
      exclude_fields :created_at, :updated_at
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
