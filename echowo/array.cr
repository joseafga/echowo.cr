class Array(T)
  UWUISM = {
    "ll"  => "ww",
    "orr" => "oww",
    "or"  => "ow",
    "er"  => "ew",
    "na"  => "nya",
    "nan" => "nyan",
    "ma"  => "mya",
    "mam" => "myam",
  }

  # uwufy array words
  def uwufication
    self.map do |word| 
      UWUISM.each { |k, v|
        word = word.gsub(k, v)
      }

      word
    end
  end
end
