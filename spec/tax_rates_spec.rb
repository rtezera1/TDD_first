require 'rspec'
require_relative '../lib/tax_rates'


describe "calculate how much tax is owed" do

  it "returns a string saying how much the person owes" do
    person = Person.new('Eric','Schmidt',54000,0,28)
    expect(person.reporting).to eq('Eric Schmidt owes $15,120 in taxes')
  end

  it "return a string with the proper refund" do
    person=Person.new("Orson","Orsillio",40000,8800,18)
    expect(person.reporting).to eq("Orson Orsillio will receive a refund of $1,600")
  end

end
