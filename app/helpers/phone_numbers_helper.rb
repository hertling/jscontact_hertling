module PhoneNumbersHelper
  def print_numbers(numbers)
    #numbers.collect { |n| n.number }.join(", ")
    numbers.collect(&:number).join(", ")
  end
end
