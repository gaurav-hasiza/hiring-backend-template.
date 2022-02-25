require_relative 'person_file_processor'
require_relative 'person_presenter'
class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    people = PERSONFILEPROCESSOR.new(file: params[:dollar_format], file_format: '$').process
    people += PERSONFILEPROCESSOR.new(file: params[:percent_format], file_format: '%').process
    people.sort_by!(&params[:order]).collect { |person| PersonPresenter.new(person).to_s }
  end

  private

  attr_reader :params
end
