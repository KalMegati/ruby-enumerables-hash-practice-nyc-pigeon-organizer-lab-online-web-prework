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

def live_extractor(data, list)
  x_lives = data[:lives].keys
  list.keys.length.times { |index|
    x_lives.each { |y_live|
      if data[:lives][y_live].include? list.keys[index]
        list[list.keys[index]][:lives].push(y_live)
      end
    }
  }
  list
end

def nyc_pigeon_organizer(data)
  pigeon_list = name_extractor(data)

  pigeon_list = color_extractor(data, pigeon_list)

  pigeon_list = gender_extractor(data, pigeon_list)

  pigeon_list =  live_extractor(data, pigeon_list)
  
  pigeon_list
end