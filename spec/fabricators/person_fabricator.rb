Fabricator(:person) do
  first_name {"John"}
  last_name {"Doe"}
  phone_numbers!(:count => 3) { |person, i| Fabricate(:phone_number, :contact => person)}
end