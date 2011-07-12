module PhoneNumbersHelper
  def print_numbers(numbers)
    #numbers.collect { |n| n.number }.join(", ")
    #numbers.collect(&:number).join(", ")
    #"<ul><li>" + numbers.collect(&:number).join("</li><li>") + "</li></ul>"
    content_tag :ul do
      numbers.collect { |pn| content_tag :li, pn.number }.join.html_safe
    end
  end
end
