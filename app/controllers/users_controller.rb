class UsersController < ApplicationController

    def index
        @user = current_user
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:sucess] = 'Conta criada com sucesso!'
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
           flash[:sucess] = 'Conta deletada com sucesso!'
            redirect_to users_path
        else
           flash[:error] = 'Erro ao detetar conta!'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :name, :password, :password_confirmation, :voted)
        end

end
