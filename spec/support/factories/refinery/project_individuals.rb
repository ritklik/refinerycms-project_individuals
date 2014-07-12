
FactoryGirl.define do
  factory :project_individual, :class => Refinery::ProjectIndividuals::ProjectIndividual do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

