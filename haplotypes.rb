require_relative 'data.rb'
require 'sqlite3'
require 'rubygems'

class Haplotypes
 include Enumerable
  
  def initialize
    @DB = SQLite3::Database.new("../Haplotypes.sqlite")
  end

  def compare(type1,type2)
    if type1 == type2
      true
    else
      false
   end 
  end

  def search_for_type(type2)
    if type = $classical_Italy.find_all{|type| type['type'] == type2}
      
      p type[0]['people']
    else
      p "No match"
    end
  end
  
  def search_database(query)
    query_start = "SELECT place FROM 'Present' WHERE"
    query = [query_start, query].join(' ')
    results = @DB.execute(query).flatten

  end

  def return_group(type)
    first = type.chars.first
    if first == "E"
      return $groupE1b
    elsif first == "G"
      return $groupG
    elsif first == "I" || first == "J"
      return $groupIJ
    elsif first == "Q" || first == "N" || first == "K" || first == "T" || first == "P" || first == "R"
      return $groupK
    end
  end
end
