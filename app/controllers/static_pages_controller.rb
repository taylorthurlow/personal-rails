class StaticPagesController < ApplicationController
  skip_before_action :authorize, only: [:contact, :projects]

  def contact
  end

  def projects
  end
end
