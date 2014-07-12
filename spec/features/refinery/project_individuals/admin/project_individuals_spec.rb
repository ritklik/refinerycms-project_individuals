# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "ProjectIndividuals" do
    describe "Admin" do
      describe "project_individuals" do
        refinery_login_with :refinery_user

        describe "project_individuals list" do
          before do
            FactoryGirl.create(:project_individual, :name => "UniqueTitleOne")
            FactoryGirl.create(:project_individual, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.project_individuals_admin_project_individuals_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.project_individuals_admin_project_individuals_path

            click_link "Add New Project Individual"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::ProjectIndividuals::ProjectIndividual.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::ProjectIndividuals::ProjectIndividual.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:project_individual, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.project_individuals_admin_project_individuals_path

              click_link "Add New Project Individual"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::ProjectIndividuals::ProjectIndividual.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:project_individual, :name => "A name") }

          it "should succeed" do
            visit refinery.project_individuals_admin_project_individuals_path

            within ".actions" do
              click_link "Edit this project individual"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:project_individual, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.project_individuals_admin_project_individuals_path

            click_link "Remove this project individual forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::ProjectIndividuals::ProjectIndividual.count.should == 0
          end
        end

      end
    end
  end
end
