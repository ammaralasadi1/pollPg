module Api
  module V1
    class VotesController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        votes = Vote.order('count DESC');
        render json: {status: 'Success', message: 'Loaded votes', data: votes}, status: :ok
      end

      def show
        vote = Vote.find(params[:id])
        render json: {status: 'Success', message: 'Loaded vote', data: vote}, status: :ok
      end

      def create
        vote = Vote.new(vote_params)
        if vote.save
        render json: {status: 'Success', message: 'Saved Vote', data: vote}, status: :ok
        else
        render json: {status: 'Error', message: 'Vote not saved', data: vote.errors}, status: :unprocessable_entry
        end
      end

      def destroy
        vote = Vote.find(params[:id])
        vote.destroy
        render json: {status: 'Success', message: 'Deleted vote', data: vote}, status: :ok
      end

      def update
        vote = Vote.find(params[:id])
        if vote.update_attributes(vote_params)
          render json: {status: 'Success', message: 'Vote Updated', data: vote}, status: :ok
        else
          render json: {status: 'Error', message: 'Vote not updated', data: vote.errors}, status: :unprocessable_entry
        end
      end

      private
      def vote_params
        params.permit(:title,  :count, :user)
      end

    end
  end
end
