module SmartBuildingsManager
  class V1::Sensor < Grape::API

    resource :sensors do

      get do
        ::Sensor.all
      end

      route_param :id do
        params do
         requires :id, type: Integer, desc: "Sensor ID"
        end
        get do
          begin
            ::Sensor.find(params[:id])
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
     end
     
   end

  end
end
