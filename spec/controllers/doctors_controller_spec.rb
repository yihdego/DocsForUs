require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do
  describe "doctors#new" do
    before(:each) {get :new}
    it "returns the status of 200" do
      expect(response.status).to eq 200
    end
    it "returns the form for creating new doctor" do
      expect(response).to render_template(:new)
    end
  end
  describe "doctors#create" do
    context "when inputs are valid" do
      before(:each) {post :create, params: {doctor: {first_name: 'Ash', last_name: 'Jay', specialty: 'General',email_address: 'ash@ash.com',zipcode: 35816}}}
      it "creates the doctor when all details are provided" do
        expect(Doctor.find_by(email_address: 'ash@ash.com')).to be_a Doctor
      end
      it "redirects to the doctor_path" do
        expect(response.status).to eq 302
      end
    end
    context "when inputs are invalid" do
      before(:each) {post :create, params: {doctor: {first_name: 'Ash', last_name: 'Jay', specialty: 'General',zipcode: 35816}}}
      it "assigns the errors variable" do
        expect(assigns[:errors]).to eq (["Specify either phone number or email address of the Doctor"])
      end
      it "does not create the entry on to the database" do
        expect(Doctor.find_by(first_name: 'Ash')).to be nil
      end
    end
  end
end#end of class
