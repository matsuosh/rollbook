require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AccessLogsController do

  # This should return the minimal set of attributes required to create a valid
  # AccessLog. As you add validations to AccessLog, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "user_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AccessLogsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all access_logs as @access_logs" do
      access_log = AccessLog.create! valid_attributes
      get :index, {}, valid_session
      assigns(:access_logs).should eq([access_log])
    end
  end

  describe "GET show" do
    it "assigns the requested access_log as @access_log" do
      access_log = AccessLog.create! valid_attributes
      get :show, {:id => access_log.to_param}, valid_session
      assigns(:access_log).should eq(access_log)
    end
  end

  describe "GET new" do
    it "assigns a new access_log as @access_log" do
      get :new, {}, valid_session
      assigns(:access_log).should be_a_new(AccessLog)
    end
  end

  describe "GET edit" do
    it "assigns the requested access_log as @access_log" do
      access_log = AccessLog.create! valid_attributes
      get :edit, {:id => access_log.to_param}, valid_session
      assigns(:access_log).should eq(access_log)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AccessLog" do
        expect {
          post :create, {:access_log => valid_attributes}, valid_session
        }.to change(AccessLog, :count).by(1)
      end

      it "assigns a newly created access_log as @access_log" do
        post :create, {:access_log => valid_attributes}, valid_session
        assigns(:access_log).should be_a(AccessLog)
        assigns(:access_log).should be_persisted
      end

      it "redirects to the created access_log" do
        post :create, {:access_log => valid_attributes}, valid_session
        response.should redirect_to(AccessLog.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved access_log as @access_log" do
        # Trigger the behavior that occurs when invalid params are submitted
        AccessLog.any_instance.stub(:save).and_return(false)
        post :create, {:access_log => { "user_id" => "invalid value" }}, valid_session
        assigns(:access_log).should be_a_new(AccessLog)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AccessLog.any_instance.stub(:save).and_return(false)
        post :create, {:access_log => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested access_log" do
        access_log = AccessLog.create! valid_attributes
        # Assuming there are no other access_logs in the database, this
        # specifies that the AccessLog created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AccessLog.any_instance.should_receive(:update).with({ "user_id" => "1" })
        put :update, {:id => access_log.to_param, :access_log => { "user_id" => "1" }}, valid_session
      end

      it "assigns the requested access_log as @access_log" do
        access_log = AccessLog.create! valid_attributes
        put :update, {:id => access_log.to_param, :access_log => valid_attributes}, valid_session
        assigns(:access_log).should eq(access_log)
      end

      it "redirects to the access_log" do
        access_log = AccessLog.create! valid_attributes
        put :update, {:id => access_log.to_param, :access_log => valid_attributes}, valid_session
        response.should redirect_to(access_log)
      end
    end

    describe "with invalid params" do
      it "assigns the access_log as @access_log" do
        access_log = AccessLog.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AccessLog.any_instance.stub(:save).and_return(false)
        put :update, {:id => access_log.to_param, :access_log => { "user_id" => "invalid value" }}, valid_session
        assigns(:access_log).should eq(access_log)
      end

      it "re-renders the 'edit' template" do
        access_log = AccessLog.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AccessLog.any_instance.stub(:save).and_return(false)
        put :update, {:id => access_log.to_param, :access_log => { "user_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested access_log" do
      access_log = AccessLog.create! valid_attributes
      expect {
        delete :destroy, {:id => access_log.to_param}, valid_session
      }.to change(AccessLog, :count).by(-1)
    end

    it "redirects to the access_logs list" do
      access_log = AccessLog.create! valid_attributes
      delete :destroy, {:id => access_log.to_param}, valid_session
      response.should redirect_to(access_logs_url)
    end
  end

end
