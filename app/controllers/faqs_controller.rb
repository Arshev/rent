class FaqsController < ApplicationController
  def index
    @faqs_text = Text.first.faqs_text
    @footer_text = Text.first.footer_text
  end
end
