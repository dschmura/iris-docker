class PagesController < ApplicationController
  skip_filter :redirect_https
  
  def home
    @page_title="Home"
  end

  def contact
    @page_title="Contact Us"
  end

  def about
    @page_title="About the MClassrooms site"
  end

  def dentistry
    @page_title="Dentistry Demo"
  end

  def about_iss
    @page_title="About Instructional Support Services"
  end

  def faq
    @page_title="Frequently Asked Questions"
  end

  def iss_support
    @page_title="ISS Support"
  end

  def event_support
    @page_title="Event Support"
  end

  def privacy_policy
    @page_title="Privacy Policy"
  end

  def support
    @page_title="Support"
  end

  def development
    @page_title="Development"
  end

  def admin
    @page_title="Administration Jump Page"
  end
end