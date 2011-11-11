require 'spec_helper'

describe LinksController do
  render_views

  it "renders the index view" do
    get :index
    response.should render_template('links/index')
    response.should render_template('shared/_nav')
    response.should render_template('layouts/application')
  end

  it "renders the show view" do
    @link = Factory(:link) #Factory() same as Factory.create()
    @user = Factory(:user) #Factory() same as Factory.create()
    get :show, :id => @link.id
    response.should render_template('links/show')
    response.should render_template('shared/_nav')
    response.should render_template('layouts/application')
  end

  it "lets you login" do
    @user = Factory(:user)
    sign_in @user #sign_in is a helper provided by Devise

    response.should be_success
  end

  it "correctly sets a user up" do
    @user = Factory(:user)

    @user.id.should == 1 && @user.email.should == 'test@test.com' #from our factory
  end

  it "doesn't let guests submit links" do
    if @user
      sign_out @user
    end

    @link = Link.create(:title => 'test', :url => 'http://test.com')

    response.should_not be_success
  end

end
