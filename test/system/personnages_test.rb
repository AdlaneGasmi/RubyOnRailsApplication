require "application_system_test_case"

class PersonnagesTest < ApplicationSystemTestCase
  setup do
    @personnage = personnages(:one)
  end

  test "visiting the index" do
    visit personnages_url
    assert_selector "h1", text: "Personnages"
  end

  test "creating a Personnage" do
    visit personnages_url
    click_on "New Personnage"

    fill_in "Nom", with: @personnage.Nom
    fill_in "Points attaque", with: @personnage.Points_attaque
    fill_in "Points de vie", with: @personnage.Points_de_vie
    click_on "Create Personnage"

    assert_text "Personnage was successfully created"
    click_on "Back"
  end

  test "updating a Personnage" do
    visit personnages_url
    click_on "Edit", match: :first

    fill_in "Nom", with: @personnage.Nom
    fill_in "Points attaque", with: @personnage.Points_attaque
    fill_in "Points de vie", with: @personnage.Points_de_vie
    click_on "Update Personnage"

    assert_text "Personnage was successfully updated"
    click_on "Back"
  end

  test "destroying a Personnage" do
    visit personnages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personnage was successfully destroyed"
  end
end
