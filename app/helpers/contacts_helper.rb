module ContactsHelper

  def days_until(dob)
    now = DateTime::now()
    days_in_year = Date.new(now.year, 12, 31).yday
    ( dob.yday - now.yday ) % days_in_year
  end
  
end
