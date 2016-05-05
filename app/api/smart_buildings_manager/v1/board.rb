module SmartBuildingsManager
  class V1::Board < Grape::API

    resource :board do

      get do
        ::Board.all
      end

      route_param :id do
        params do
         requires :id, name: String, description: String, model: String desc: "Board ID"
        end
        get do
          begin
            ::Board.find(params[:id])
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
     end

   end

  end
end
