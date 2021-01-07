class ApplicationController < ActionController::Base

    include SessionHelper

    private
        def require_logged_in_user
            unless is_user_logged?
                flash[:danger] = "Acesso restrito. Por favor, realize login primeiro."
                redirect_to entrar_path
            end
        end

end
