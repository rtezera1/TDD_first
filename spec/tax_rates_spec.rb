require 'rspec'
require_relative '../lib/tax_rates'


describe "calculate how much tax is owed" do

  it "returns a string saying how much the person owes" do
    person = Person.new('Eric','Schmidt',54000,0,28)
    expect(person.reporting).to eq('Eric Schmidt has a tax liability of $15,120')
  end

  it "return a string with the proper refund" do
    person=Person.new("Orson","Orsillio",40000,8800,18)
    expect(person.reporting).to eq("Orson Orsillio will receive a refund of $1,600")
  end

  it 'fills in default values for missing data' do
    person = Person.new(nil, 'Jones',40000,8800,18)
    expect(person.reporting).to eq('[First Name] Jones will receive a refund of $1,600')
  end

  it "fills in zero for missing numeric value" do
    person=Person.new("steve","smith",nil,40000,40)
    expect(person.reporting).to eq("steve smith will receive a refund of $40,000")

    person = Person.new('Eric','Schmidt',54000,nil,28)
    expect(person.reporting).to eq('Eric Schmidt has a tax liability of $15,120')
  end

  it 'tells us when a person doesn\'t owe anything' do
    person = Person.new('steve', 'smith', 54000, 15120, 28)
    expect(person.reporting).to eq('steve smith has no tax liability')
  end

end
