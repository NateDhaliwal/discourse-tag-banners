# frozen_string_literal: true

RSpec.describe "Tag banner", system: true do
  let!(:theme) { upload_theme_component }

  fab!(:tag) { Fabricate(:tag, name: "important") }

  before { SiteSetting.tagging_enabled = true }

  it "displays the tag banner when visiting a tag page" do
    visit("/tag/#{tag.name}")

    expect(page).to have_css(".tag-banner-container")
    expect(page).to have_css(".tag-title-header", text: tag.name)
  end
end
