module SmartBuildingsManager
  class API < Grape::API
    version 'v1', using: :header, vendor: 'smart_buildings_manager'
    format :json
    prefix :api

    helpers do
      def current_user
        # @current_user ||= User.authorize!(env)
      end

      def authenticate!
        # error!('401 Unauthorized', 401) unless current_user
      end
    end

    mount V1::Sensor
  end
end
