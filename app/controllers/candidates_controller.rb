class CandidatesController < ApplicationController

    before_action :require_logged_in_user
    before_action :verify_if_already_voted, only: [:new] 

    def new
        verify_if_already_voted
        @candidate = Canditate.new
    end

    def result
    end

    def azul
        current_user.voted = 1

        if current_user.save(validate: false)
            @azul = Canditate.find_by(name: "azul")
            @azul.update(votes: @azul.votes + 1)

            flash[:success] = "Voto salvo com sucesso"
        else
            flash[:notice] = "Erro ao salvar voto"
        end
    end

    def vermelho
        current_user.voted = 1

        if current_user.save(validate: false)
            @vermelho = Canditate.find_by(name: "vermelho")
            @vermelho.update(votes: @vermelho.votes + 1)

            flash[:success] = "Voto salvo com sucesso"
        else
            flash[:notice] = "Erro ao salvar voto"
        end
    end

    def amarelo
        current_user.voted = 1

        if current_user.save(validate: false)
            @amarelo = Canditate.find_by(name: "amarelo")
            @amarelo.update(votes: @amarelo.votes + 1)

            flash[:success] = "Voto salvo com sucesso"
        else
            flash[:notice] = "Erro ao salvar voto"
        end
    end

    private
        def verify_if_already_voted
            if current_user.voted == 1
                redirect_to resultado_path
            else
                
            end
        end



end
