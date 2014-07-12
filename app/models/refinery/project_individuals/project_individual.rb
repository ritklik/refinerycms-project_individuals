module Refinery
  module ProjectIndividuals
    class ProjectIndividual < Refinery::Core::BaseModel
      self.table_name = 'refinery_project_individuals'

      attr_accessible :name, :category, :image_thumb_id, :image_full_id, :description, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :image_thumb, :class_name => '::Refinery::Image'

      belongs_to :image_full, :class_name => '::Refinery::Image'
    end
  end
end
