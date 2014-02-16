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

  context "application" do
    before(:each) do
      @user = create(:user, username: "tester", email: "tester@example.com", 
                            password: "secret01", password_confirmation: "secret01")

      visit "/"
      click_link "Login"
    end

    after(:each) do
      expect(page).to have_content("Signed in successfully.")
    end

    scenario "with username" do
      within("#new_user") do
        fill_in "Login", with: @user.username
        fill_in "Password", with: @user.password
      end
      click_button "Sign in"
    end

    scenario "with email" do
      within("#new_user") do
        fill_in "Login", with: @user.email
        fill_in "Password", with: @user.password
      end
      click_button "Sign in"
    end
  end
end
