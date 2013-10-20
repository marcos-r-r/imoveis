class Values < Enumeration

  def self.isnull
    if self.instance_values.values.count == 1
     true
    else
     false
    end
  end

end