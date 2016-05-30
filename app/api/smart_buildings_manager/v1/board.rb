module SmartBuildingsManager

  class V1::Board < Grape::API

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

    resource :boards do
      #PUT
       params do
        use :token, type: String, desc: 'Authentication token'
        requires :id, type: Integer, desc: "Board ID"
        requires :attributes, type: Hash, desc: 'Board object to create' do
          requires :name, type: String, desc: 'Name of board'
          requires :description, type: String, desc: 'Description of board'
          requires :model, type: String, desc: 'Model of board'
        end
      end
      put do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes]).permit(:name, :description, :model)

          if safe_params
            board = ::Board.find(params[:id])
            board.update_attributes(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end
      #GET
      get do
        ::Board.all
      end

      route_param :id do

        # Get
        params do
         requires :id, type: Integer, desc: "Board ID"
        end
        get do
          begin
            ::Board.find(params[:id])
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end

      end

      # Post
      params do
        use :token
        requires :attributes, type: Hash, desc: 'Board object to create' do
          requires :name, type: String, desc: 'Name of board'
          requires :description, type: String, desc: 'Description of board'
          requires :model, type: String, desc: 'Model of board'
        end
      end
      post do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes])
                        .permit(:name, :description, :model)

          if safe_params
            ::Board.create!(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end

  end

end

end
