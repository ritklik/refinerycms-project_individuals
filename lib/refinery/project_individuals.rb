require 'refinerycms-core'

module Refinery
  autoload :ProjectIndividualsGenerator, 'generators/refinery/project_individuals_generator'

  module ProjectIndividuals
    require 'refinery/project_individuals/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
