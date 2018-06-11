class AboutsController < ApplicationController
  def index
    @about_text = Text.first.about_text
    @footer_text = Text.first.footer_text
  end
end
