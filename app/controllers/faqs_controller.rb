class FaqsController < ApplicationController
  def index
    @faqs_text = Text.first.faqs_text
    @footer_text = Text.first.footer_text
    @faqs_title = Text.first.faqs_title
    @faqs_description = Text.first.faqs_description
  end
end
