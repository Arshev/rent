class TermsController < ApplicationController
  def index
    @terms_text = Text.first.terms_text
    @footer_text = Text.first.footer_text
  end
end
