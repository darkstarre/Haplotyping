require '../haplotypes'
require 'minitest/test'
require '../data'

class UnitTest < Minitest::Test

  def test_it_checks_if_the_haplotypes_are_the_same
    type1 = "R1b"
    type2 = "J2"

    assert_equal false, Haplotypes.new.compare(type1,type2)
  end

  def test_it_locates_the_appropriate_category
    type2 = "J2"
    
    assert_equal "Etruscans", Haplotypes.new.search_for_type(type2)
  end

  def test_it_queries_the_SQL_database
    query = "Q != 0;"
    
    assert_equal ["Calabria","Latium","Sicily"], Haplotypes.new.search_database(query)

  end

  def test_it_finds_all_instances_of_the_same_type
    query = "L != 0;"

    assert_equal ["Abruzzo","Calabria","Friuli-Venezia Giulia", "Liguria", "Marches","Sardinia", "Tuscany","Trentino-South Tyrol","Veneto"], Haplotypes.new.search_database("L")
  end

  def test_it_gives_lineage_backwards
    type = "G2"

    assert_equal $groupG, Haplotypes.new.return_group(type)

  end
end
