require '../haplotypes.rb'
require 'minitest/test'

class AcceptanceTest < Minitest::Test
  
  haplotypes = {"Present day Italy" => {"R1b152" => "Tuscany"}}

               {"Ancient Italy"     => { "J2" => "Etruscans",
                                         "E1b1b" => "Etruscans",
                                         "G2a" => "Etruscans",
                                         "R1b-M269" => "Etruscans"}
               }
 

  def test_it_compares_the_haplotype_against_the_main_one
    type1 = "J2"
    type2 = "R1b152"
    Haplotypes.new(type1,type2).compare(type1,type2)
    assert true
  end
end
