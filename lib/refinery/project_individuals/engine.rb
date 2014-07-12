module Refinery
  module ProjectIndividuals
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::ProjectIndividuals

      engine_name :refinery_project_individuals

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "project_individuals"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.project_individuals_admin_project_individuals_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/project_individuals/project_individual',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ProjectIndividuals)
      end
    end
  end
end
