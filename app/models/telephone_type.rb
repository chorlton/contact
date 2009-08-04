class TelephoneType
  
  attr_reader :id
  attr_reader :teltype
  
  def initialize(id, teltype)
    @id = id
    @teltype = teltype
  end
  
  @@TYPES = [ TelephoneType.new(0, 'home'), TelephoneType.new(1, 'mobile'), TelephoneType.new(2, 'work') ]

  def TelephoneType.types
    @@TYPES
  end
  
end


