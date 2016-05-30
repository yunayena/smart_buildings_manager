module SmartBuildingsManager
  class V1::Sensor < Grape::API

        helpers do
          params :token do
            optional :token, type: String, default: nil,
            documentation: {
              type: 'String',
              desc: 'Authenticate token'
            }
          end

          params :attributes do
            optional :attributes, type: Hash, default: {},
            documentation: {
              type: 'Hash',
              desc: 'Params attributes of board'
            }
          end
        end

    resource :sensors do

      #PUT
       params do
        use :token, type: String, desc: 'Authentication token'
        requires :id, type: Integer, desc: "Sensor ID"
        requires :attributes, type: Hash, desc: 'Sensor object to create' do
          requires :name, type: String, desc: 'Name of sensor'
          requires :description, type: String, desc: 'Description of sensor'
          requires :kind, type: String, desc: 'Kind of sensor'
        end
      end
      put do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes]).permit(:name, :description, :kind)

          if safe_params
            sensor = ::Sensor.find(params[:id])
            sensor.update_attributes(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end

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
     # Post
     params do
       use :token
       requires :attributes, type: Hash, desc: 'Sensor object to create' do
         requires :name, type: String, desc: 'Name of sensor'
         requires :description, type: String, desc: 'Description of sensor'
         requires :kind, type: String, desc: 'Model of sensor'
       end
     end
     post do
       begin
         authenticate!
         safe_params = clean_params(params[:attributes])
                       .permit(:name, :description, :kind)

         if safe_params
           ::Sensor.create!(safe_params)
           status 200 # Saved OK
         end
       rescue ActiveRecord::RecordNotFound => e
         status 404 # Not found
       end
     end

 end

 end

 end
