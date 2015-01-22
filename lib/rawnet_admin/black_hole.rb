module RawnetAdmin
  # Nothing can escape.. even time itself.
  class BlackHole
    instance_methods.each do |m|
      undef_method m unless m =~ /^(__|object_id)/
    end

    def method_missing(*args)
      nil
    end
  end
end
