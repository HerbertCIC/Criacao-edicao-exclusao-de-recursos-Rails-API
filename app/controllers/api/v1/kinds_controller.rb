module Api
  module V1
    class KindsController < ApplicationController
      before_action :set_kind, only: [:show, :update, :destroy]

      def index
        @kinds = Kind.all

        render json: @kinds
      end

      def show
        render json: @kind
      end

      def create
        @kind = Kind.new(kind_params)

        if @kind.save
          render json: @kind, status: :created, location: api_v1_kinds_path
        else
          render json: @kind.errors, status: :unprocessable_entity
        end
      end

      def update
        if @kind.update(kind_params)
          render json: @kind
        else
          render json: @kind.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @kind.destroy
      end

      private

      def set_kind
        @kind = Kind.find(params[:id])
      end

      def kind_params
        params.require(:kind).permit(:description)
      end
    end
  end
end
