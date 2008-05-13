require 'time'

Time.class_eval { 
  @@advance_by_days = 0
  cattr_accessor :advance_by_days

#  class << Time
#    alias now_old now
#    def now
#      if Time.advance_by_days != 0
#        return Time.at(now_old.to_i + Time.advance_by_days * 60 * 60 * 24 + 1)
#      else
#        now_old
#      end
#    end
#  end

  class << Time
    old_now = self.instance_method(:now)
    
    define_method(:now) do
      tmp = old_now.bind(self).call
      if Time.advance_by_days != 0
        return Time.at(tmp.to_i + Time.advance_by_days * 60 * 60 * 24 + 1)
      else
        tmp
      end
    end
  end
    
}
