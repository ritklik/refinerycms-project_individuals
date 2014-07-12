module Refinery
  module ProjectIndividuals
    class ProjectIndividualsController < ::ApplicationController

      before_filter :find_all_project_individuals
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @project_individual in the line below:
        present(@page)
      end

      def show
        @project_individual = ProjectIndividual.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @project_individual in the line below:
        present(@page)
      end

    protected

      def find_all_project_individuals
        @project_individuals = ProjectIndividual.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/project_individuals").first
      end

    end
  end
end
