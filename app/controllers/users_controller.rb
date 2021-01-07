class UsersController < ApplicationController

    before_action :require_logged_in_user, only: [:edit, :update, :destroy]

    def index
        @user = current_user
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:success] = 'Conta criada com sucesso!'
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
        @user = current_user
    end

    def update
        if current_user.update(user_params)
            flash[:success] = 'Dados atualizados com sucesso'
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def destroy
        if current_user.destroy
           flash[:success] = 'Conta deletada com sucesso!'
            redirect_to root_path
        else
           flash[:notice] = 'Erro ao detetar conta!'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :name, :password, :password_confirmation, :voted)
        end

end
