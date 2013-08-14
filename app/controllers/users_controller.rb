class Users::SessionsController < Devise::SessionsController
   load_and_authorize_resource
end
