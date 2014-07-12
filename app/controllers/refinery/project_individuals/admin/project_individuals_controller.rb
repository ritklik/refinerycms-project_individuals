module Refinery
  module ProjectIndividuals
    module Admin
      class ProjectIndividualsController < ::Refinery::AdminController

        crudify :'refinery/project_individuals/project_individual',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
