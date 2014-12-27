require 'rails_helper'

describe Api::TrackersController do
  let(:user){ login }
  let(:tracker) { FactoryGirl.create(:tracker, user: user) }
  it 'creates' do
    user
    json = {tracker: {name: 'Hello, world!'}}
    before = Tracker.count
    post :create, json
    after = Tracker.count

    expect(before < after).to be_truthy
    expect(json[:tracker][:name]).to eq('Hello, world!')
  end

  it 'reads' do
    FactoryGirl.create_list(:tracker, 3, user: user)
    get :index

    expect(json.has_key?(:trackers)).to be_truthy
    expect(json[:trackers].count).to eq(3)
    expect(json[:trackers][0][:user_id]).to eq(nil)
  end

  it 'updates' do
    json = {tracker: {name: 'Hello, world!'}, id: tracker.id}
    patch :update, json

    expect(json[:tracker][:name]).to eq('Hello, world!')
    expect(tracker.reload.name).to eq('Hello, world!')
  end

  it 'destroys' do
    id = tracker.id
    before = Tracker.count
    delete :destroy, {id: id}
    after = Tracker.count
    expect(before > after).to be_truthy
    expect(Tracker.find_by(id: id)).to be_nil
  end
end
