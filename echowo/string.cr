class String
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
    temp = self

    UWUISM.each do |k, v|
      temp = temp.gsub(k, v)
    end

    temp
  end
end
