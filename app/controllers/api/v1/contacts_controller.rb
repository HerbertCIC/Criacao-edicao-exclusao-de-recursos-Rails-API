module Api
  module V1
    class ContactsController < ApplicationController
      before_action :set_contact, only: [:show, :update, :destroy]

      def index
        @contacts = Contact.all

        render json: @contacts
      end

      def show
        render json: @contact
      end

      def create
        @contact = Contact.new(contact_params)

        if @contact.save
          render json: @contact, status: :created, location: api_v1_contacts_path
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
      end

      def update
        if @contact.update(contact_params)
          render json: @contact
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @contact.destroy
      end

      private

      def set_contact
        @contact = Contact.find(params[:id])
      end

      def contact_params
        params.require(:contact).permit(:name, :email, :birthdate, :kind_id)
      end
    end
  end
end
