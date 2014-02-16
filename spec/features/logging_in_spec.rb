require "spec_helper"

feature "Logging In" do
  scenario "Registration" do
    visit "/"

    click_link "Register"

    expect {
      within("#new_user") do
        fill_in "Username", with: "sample_email"
        fill_in "Email", with: "sample_email@example.com"
        fill_in "Password", with: "SuperSeCreT"
        fill_in "Password confirmation", with: "SuperSeCreT"
      end
      click_on "Sign up"
    }.to change(User, :count).by(1)

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
