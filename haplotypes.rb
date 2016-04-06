require_relative 'data.rb'
require 'sqlite3'
require 'rubygems'

class Haplotypes
 include Enumerable
  def initialize
    @DB = SQLite3::Database.new("../Haplotypes.sqlite")
  end

  present_day = [{"R1b152" => "Tuscany"}]
  #move to data.rb for lineage stacking 
  $classical_Italy = [{"type" => "J2",       "people" => "Etruscans"},
                      {"type" => "E1b1b",    "people" => "Etruscans"},
                      {"type" => "G2a",      "people" => "Etruscans"},
                      {"type" => "R1b-M269", "people" => "Etruscans"}]

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

  def inverse_phylogeny(type)
    type = "R1b"

  end
end
