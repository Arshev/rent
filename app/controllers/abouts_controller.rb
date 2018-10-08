class AboutsController < ApplicationController
  def index
    @about_text = Text.first.about_text
    @footer_text = Text.first.footer_text
    @abouts_title = Text.first.abouts_title
    @abouts_description = Text.first.abouts_description
  end
end
