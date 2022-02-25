require_relative 'date_format_constant'
class PersonPresenter
  attr_reader :person

  def initialize(person)
    @person = person
  end

  def to_s
    "#{person.first_name}, #{person.city}, #{person.birthdate.strftime(DATEFORMATCONSTANT::TRIMMED_DATE_MONTH_FORMAT)}"
  end
end
