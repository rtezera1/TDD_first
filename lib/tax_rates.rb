require 'csv'
require 'pry'


class Person
  def initialize(first_name, last_name, annual_income, tax_paid, tax_rate)

    first_name.nil? ? @first_name = '[First Name]' : @first_name = first_name

    last_name.nil? ? @last_name = '[Last Name]' : @last_name = last_name

    @annual_income = annual_income.to_f
    @tax_paid = tax_paid.to_f
    @tax_rate = tax_rate.to_f
  end

  def reporting
    if amount_owed < 0
      refund = amount_owed * -1
      "#{@first_name} #{@last_name} will receive a refund of #{format_currency(refund)}"
    elsif amount_owed > 0
      "#{@first_name} #{@last_name} has a tax liability of #{format_currency(amount_owed)}"
    else
      "#{@first_name} #{@last_name} has no tax liability"
    end
  end

  def amount_owed
    should_pay = @annual_income * (@tax_rate / 100)
    (should_pay - @tax_paid).round
  end

  def format_currency(currency)
    currency = currency.to_s
    currency.prepend('$')
    if currency.length > 3
      currency.insert(-4, ',')
    end
  end

end

taxpayer_summary = []

CSV.foreach('../tax.csv', headers: true) do |row|
  taxpayer_summary << Person.new(row['first_name'], row['last_name'],
    row['annual_income'], row['tax_paid'], row['tax_rate'])
end

taxpayer_summary.each do |person|
  puts person.reporting
end
