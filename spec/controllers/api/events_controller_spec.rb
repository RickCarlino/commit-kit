require 'rails_helper'

describe Api::EventsController do
  let(:user){ login }
  let(:tracker) { FactoryGirl.create(:tracker, user: user) }

  it 'creates' do
    before = Event.count
    post :create, {tracker_id: tracker.id}
    after = Event.count

    expect(before < after).to be_truthy
    expect(json.has_key?(:event)).to be_truthy
  end

  it 'reads' do
    FactoryGirl.create_list(:event, 3, tracker: tracker)
    get :index, {tracker_id: tracker.id}

    expect(json[:events].count).to eq(3)
  end

  it 'destroys' do
    event = FactoryGirl.create(:event, tracker: tracker)
    before = Event.count
    delete :destroy, {tracker_id: tracker.id, id: event.id}
    after = Event.count

    expect(before > after).to be_truthy
  end

end
