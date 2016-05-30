module SmartBuildingsManager
  class V1::Building < Grape::API

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
            desc: 'Params attributes of building'
          }
        end
      end

    resource :buildings do
            #PUT
             params do
              use :token, type: String, desc: 'Authentication token'
              requires :id, type: Integer, desc: "Building ID"
              requires :attributes, type: Hash, desc: 'Building object to create' do
                requires :name, type: String, desc: 'Name of building'
                requires :description, type: String, desc: 'Description of building'
                requires :address, type: String, desc: 'Address of building'
                requires :postal_code, type: String, desc: 'Model of building'
                requires :phone, type: String, desc: 'Telephone of building'

              end
            end
            put do
              begin
                authenticate!
                safe_params = clean_params(params[:attributes]).permit(:name, :description, :address, :postal_code, :phone)

                if safe_params
                  building = ::Building.find(params[:id])
                  building.update_attributes(safe_params)
                  status 200 # Saved OK
                end
              rescue ActiveRecord::RecordNotFound => e
                status 404 # Not found
              end
            end

      get do
        ::Building.all
      end

      route_param :id do
        #Get
        params do
         requires :id, type: Integer, desc: "Building ID"
       end
        get do
          begin
            ::Building.find(params[:id])
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
     end
     # Post
     params do
       use :token
       requires :attributes, type: Hash, desc: 'Building object to create' do
         requires :name, type: String, desc: 'Name of building'
         requires :description, type: String, desc: 'Description of building'
         requires :address, type: String, desc: 'Model of building'
         requires :postal_code, type: String, desc: 'Postal code of building'
         requires :phone, type: Integer, desc: 'Telephone of building'

       end
     end

     post do
       begin
         authenticate!
         safe_params = clean_params(params[:attributes])
                       .permit(:name, :description, :address, :postal_code, :phone)

         if safe_params
           ::Building.create!(safe_params)
           status 200 # Saved OK
         end
       rescue ActiveRecord::RecordNotFound => e
         status 404 # Not found
       end
     end

   end

   end

   end
