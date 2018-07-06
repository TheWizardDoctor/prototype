module ApplicationHelper

  #this sorts the list properly with a combonation of cases and alphanumerics
  def sorting_function(x,y)
    if x[/\d+/].to_i == 0 && y[/\d+/].to_i == 0
      return x.upcase <=> y.upcase
    elsif x[/^\D+(?=\d)/] == nil or y[/^\D+(?=\d)/] == nil
      x[/^\D+(?=\d)/] == nil ? a = x.upcase : a = x[/^\D+(?=\d)/].upcase
      y[/^\D+(?=\d)/] == nil ? b = y.upcase : b = y[/^\D+(?=\d)/].upcase
      return a <=> b
    elsif (x[/^\D+(?=\d)/].upcase) == (y[/^\D+(?=\d)/].upcase)
      return x[/\d+/].to_i <=> y[/\d+/].to_i
    else
      return (x[/^\D+(?=\d)/].upcase) <=> (y[/^\D+(?=\d)/].upcase)
    end
  end

end
