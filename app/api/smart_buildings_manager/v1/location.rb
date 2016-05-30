module SmartBuildingsManager
  class V1::Location < Grape::API
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

    resource :locations do
              #PUT
               params do
                use :token, type: String, desc: 'Authentication token'
                requires :id, type: Integer, desc: "Location ID"
                requires :attributes, type: Hash, desc: 'Location object to create' do
                  requires :name, type: String, desc: 'Name of Location'
                  requires :description, type: String, desc: 'Description of location'

                end
              end
              put do
                begin
                  authenticate!
                  safe_params = clean_params(params[:attributes]).permit(:name, :description)

                  if safe_params
                    location = ::Location.find(params[:id])
                    location.update_attributes(safe_params)
                    status 200 # Saved OK
                  end
                rescue ActiveRecord::RecordNotFound => e
                  status 404 # Not found
                end
              end
      get do
        ::Location.all
      end

      route_param :id do
        params do
         requires :id, type: Integer, desc: "Location ID"
        end
        get do
          begin
            ::Location.find(params[:id])
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
     end

     # Post
     params do
       use :token
       requires :attributes, type: Hash, desc: 'Location object to create' do
         requires :name, type: String, desc: 'Name of location'
         requires :description, type: String, desc: 'Description of location'
       end
     end
     post do
       begin
         authenticate!
         safe_params = clean_params(params[:attributes])
                       .permit(:name, :description)

         if safe_params
           ::Location.create!(safe_params)
           status 200 # Saved OK
         end
       rescue ActiveRecord::RecordNotFound => e
         status 404 # Not found
       end
     end

 end

 end

 end
