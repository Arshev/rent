class TermsController < ApplicationController
  def index
    @terms_text = Text.first.terms_text
    @footer_text = Text.first.footer_text
    @terms_title = Text.first.terms_title
    @terms_description = Text.first.terms_description    
  end
end
