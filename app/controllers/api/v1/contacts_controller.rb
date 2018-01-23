class Api::V1::ContactsController < Api::V1::BaseController
    before_action  except: [:index] do 
        authenticate_permission(2, @current_level)
    end

    def index
        @contacts = @current_user.contacts.all
    end

    def create
        @contact = @current_user.contacts.create(contact_params)
        render 'show'
    end

    def update
        @contact = @current_user.contacts.update_attributes(contact_params)
        render 'show'
    end

    def destroy
        @contact = @current_user.contacts.destroy(params[:id])
        render 'show'
    end

    private

    def contact_params
        params.require(:contact).permit(:title, :icon, :link)
    end

end