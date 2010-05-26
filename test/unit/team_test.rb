require File.dirname(__FILE__) + '/../test_helper'
 
class TeamTest < ActiveSupport::TestCase
 
  def setup
    @team = Team.new
  end 
 
  def test_invalid_without_name
    assert !@team.valid?
    assert @team.errors[:name].join.include?('blank')
  end

  def test_valid_with_name
    @team.attributes = { :name => 'Red Sox' }
    assert @team.valid?
  end
 
  def test_invalid_if_non_unique_name
    @team.attributes = {:name => teams(:mets).name}
    assert !@team.valid?
    assert @team.errors[:name].join.include?('taken')
  end
 
end
