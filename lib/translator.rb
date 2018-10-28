require "yaml"

def load_library(file)
  libs = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(file).each do |meaning, languages|
    english, japanese = languages
    libs["get_meaning"][japanese] = meaning
    libs["get_emoticon"][english] = japanese
  end
  libs
end

def get_japanese_emoticon(file, west_emo)
  eng_dictionary = load_library(file)
  east_emo = eng_dictionary["get_emoticon"][west_emo]
    if east_emo
      east_emo
    else
      "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(file, east_emo)
  emo_dictionary = load_library(file)
  english_meaning = emo_dictionary["get_meaning"][east_emo]
  if english_meaning
    english_meaning
  else
    "Sorry, that emoticon was not found"
  end
end
