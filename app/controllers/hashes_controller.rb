# frozen_string_literal: true

class HashesController < ApplicationController
  def show
    delete_expired_keys
  end

  def new
    delete_expired_keys
  end

  def create
    now = Time.now
    permitted_params[:keys].each_with_index do |key, idx|
      _hash[key] = { value: permitted_params[:values][idx], time: now + 5.seconds }
    end
    flash[:notice] = 'Key-value pairs cached for 5 seconds.'
    redirect_to hash_path, status: :see_other
  end

  private

  def delete_expired_keys
    now = Time.now
    Concurrent::Promise.execute { _hash.delete_if { |_, v| Time.parse(v['time']) - now <= 0 } }
  end

  def permitted_params
    @permitted_params ||= params.require(:hash).permit(keys: [], values: [])
  end

  def _hash
    session[:hash] ||= {}
  end
end
