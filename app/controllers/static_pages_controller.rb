class StaticPagesController < ApplicationController
  skip_before_action :authorize, only: [:contact, :portfolio]

  def contact
  end

  def portfolio
  end
end
