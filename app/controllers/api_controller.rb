class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token

    private
        def set_default_format
            request.format = :json
        end
end
