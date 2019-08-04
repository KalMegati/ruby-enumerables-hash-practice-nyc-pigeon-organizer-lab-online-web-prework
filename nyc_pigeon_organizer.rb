# pigeon_data > color, gender, lives

def name_extractor(data)
  ex_names = []
  data[:gender].keys.each {|gend| ex_names += data[:gender][gend]}
  pigeon_list = {}
  ex_names.each { |name|
    pigeon_list[name] = {color: [], gender: [], lives: []}
  }
  pigeon_list
  end  

def color_extractor(data, list)
  x_colors = data[:color].keys
  list.keys.length.times { |index|
    x_colors.each { |y_color|
      if data[:color][y_color].include? list.keys[index]
        list[list.keys[index]][:color].push(y_color.to_s)
      end
    }
  }
  list
end

def gender_extractor(data,list)
  x_genders = data[:gender].keys
  list.keys.length.times { |index|
    x_genders.each { |y_gender|
      if data[:gender][y_gender].include? list.keys[index]
        list[list.keys[index]][:gender].push(y_gender.to_s)
      end
    }
  }
  list
end

### correct so far

def live_extractor(data, list)
  x_lives = data[:lives].keys
  list.keys.length.times { |index|
    x_lives.each { |y_live|
      if data[:live][y_live].include? list.keys[index]
        list[list.keys[index]][:live].push(y_live)
      end
    }
  }
  list
end

def nyc_pigeon_organizer(data)
  # write your code here!
end

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

pigeon_list = name_extractor(pigeon_data)

pigeon_list = color_extractor(pigeon_data, pigeon_list)

pigeon_list = gender_extractor(pigeon_data, pigeon_list)

live_extractor(pigeon_data, pigeon_list)