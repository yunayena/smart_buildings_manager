module SmartBuildingsManager
  class API < Grape::API
    version 'v1', using: :header, vendor: 'smart_buildings_manager'
    format :json
    prefix :api

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    helpers do
      def current_user
        # Find token. Check if valid.
        token = ::ApiKey.where(access_token: params[:token]).first
        if token && !token.expired?
          @current_user = ::User.find(token.user_id)
        else
          false
        end
      end

      def clean_params(params)
        ActionController::Parameters.new(params)
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

    mount V1::Board
    mount V1::Building
    mount V1::Location
    mount V1::Sensor
  end
end
