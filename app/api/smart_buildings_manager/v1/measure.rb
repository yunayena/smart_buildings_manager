module SmartBuildingsManager
  class V1::Measure < Grape::API

        helpers do
          params :token do
            optional :token, type: String, default: nil,
            documentation: {
              type: 'String',
              desc: 'Authenticate token'
            }
          end

          params :value do
            optional :value, type: Integer, default: nil,
            documentation: {
              type: 'Integer',
              desc: 'Value of measure'
            }
          end

          params :sensor_id do
            optional :sensor_id, type: Integer, default: nil,
            documentation: {
              type: 'Integer',
              desc: 'Sensor ID of measure'
            }
          end

          params :metric do
            optional :metric, type: Integer, default: nil,
            documentation: {
              type: 'Integer',
              desc: 'Metric of measure'
            }
          end
        end

    resource :measures do

      #PUT
       params do
        use :token, type: String, desc: 'Authentication token'
        requires :id, type: Integer, desc: "Measure ID"
        requires :value, type: String, desc: 'Value of measure'
        requires :metric, type: String, desc: 'Metric of measure'
        requires :sensor_id, type: String, desc: 'Sensor of measure'
      end
      put do
        begin
          authenticate!
          safe_params = clean_params(params).permit(:value, :metric, :sensor_id)

          if safe_params
            measure = ::Measure.find(params[:id])
            measure.update_attributes(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end

      get do
        ::Measure.all
      end

      route_param :id do
        params do
         requires :id, type: Integer, desc: "Measure ID"
        end
        get do
          begin
            ::Measure.find(params[:id])
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
     end
     # Post
     params do
       use :token
       requires :value, type: String, desc: 'Value of measure'
       requires :metric, type: String, desc: 'Metric of measure'
       requires :sensor_id, type: String, desc: 'Sensor of measure'
     end
     post do
       begin
         authenticate!
         safe_params = clean_params(params)
                       .permit(:value, :metric, :sensor_id)

         if safe_params
           ::Measure.create!(safe_params)
           status 200 # Saved OK
         end
       rescue ActiveRecord::RecordNotFound => e
         status 404 # Not found
       end
     end

 end

 end

 end
