require 'rails_helper'

describe Api::TrackersController do

  it 'works' do
    get :index, {}, valid_session


    binding.pry
  end

end
