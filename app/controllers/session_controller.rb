class SessionController < ApplicationController

    def new
        redirect_to root_path if is_user_logged?
    end

    def create
        user = User.find_by(email: params[:session][:email])

        if user && user.authenticate(params[:session][:password])
            sign_in(user)
            flash[:success] = 'Logado com sucesso. Bem vindo!'
            redirect_to root_path
        else
            flash.now[:notice] = 'Erro ao logar. Dados inválidos.'
            render 'new'
        end
    end

    def destroy
        sign_out

        flash[:success] = 'Deslogado com sucesso.'

        redirect_to root_path
    end

end
