require_relative 'person'

class PERSONFILEPROCESSOR
  SEPARATORS_ALLOWED = ['$', '%'].freeze

  attr_reader :file, :file_format

  def initialize(file:, file_format:)
    @file = file
    @file_format = file_format
  end

  def process
    raise "file format #{file_format} not supported" unless SEPARATORS_ALLOWED.include?(file_format)
    people = []
    file.each_line.with_index do |line, index|
      next if index.zero?
      line_info = line.strip.split(" #{file_format} ")
      people << Person.new(person_params(line_info))
    end
    people
  end

  private

  def person_params(line_info)
    case file_format
    when '$'
      {
        birthdate: line_info[1],
        city: line_info[0],
        first_name: line_info[3],
        last_name: line_info[2]
      }
    when '%'
      {
        birthdate: line_info[2],
        city: line_info[1],
        first_name: line_info[0]
      }
    else
      raise "file format not supported"
    end
  end
end
