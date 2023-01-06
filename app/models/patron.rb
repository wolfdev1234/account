# frozen_string_literal: true

# Class to model Patron information
class Patron
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_reader :record

  CAMPUSES = { 'UP-PAT' => 'UNIVERSITY PARK or WORLD CAMPUS',
               'DSL-CARL' => 'DICKINSON SCHOOL OF LAW - CARLISLE',
               'DSL-UP' => 'PENN STATE LAW - UNIVERSITY PARK',
               'ABINGTON' => 'ABINGTON',
               'ALTOONA' => 'ALTOONA',
               'BEAVER' => 'BEAVER',
               'BEHREND' => 'BEHREND COLLEGE',
               'BERKS' => 'BERKS',
               'BRANDYWINE' => 'BRANDYWINE',
               'DUBOIS' => 'DUBOIS',
               'FAYETTE' => 'FAYETTE',
               'GREATVLY' => 'GREAT VALLEY',
               'GALLEGHENY' => 'GREATER ALLEGHENY',
               'HARRISBURG' => 'HARRISBURG',
               'HAZLETON' => 'HAZLETON',
               'HERSHEY' => 'HERSHEY',
               'LEHIGHVLY' => 'LEHIGH VALLEY',
               'MONTALTO' => 'MONT ALTO',
               'NEWKEN' => 'NEW KENSINGTON',
               'SCHUYLKILL' => 'SCHUYLKILL',
               'SHENANGO' => 'SHENANGO',
               'YORK' => 'YORK',
               'WILKESBAR' => 'WILKES-BARRE',
               'WSCRANTON' => 'WORTHINGTON SCRANTON' }.freeze

  PATRON_STANDING_ALERTS = {
    BARRED: 'The user is BARRED.',
    BLOCKED: 'The user is BLOCKED.',
    DELINQUENT: 'The user is DELINQUENT.',
    COLLECTION: 'The user has been sent to collection agency.'
  }.with_indifferent_access

  WAGE_GARNISHMENT_EXEMPT_LIBRARIES = [
    'DSL-CARL',
    'DSL-UP',
    'HERSHEY'
  ].freeze

  validates_presence_of :key

  def initialize(record)
    @record = record
  end

  def to_param
    id
  end

  def key
    record['key'] if record.present?
  end

  def id
    fields['alternateID'].downcase
  end

  def barcode
    fields['barcode']
  end

  def first_name
    fields['firstName']
  end

  def middle_name
    fields['middleName']
  end

  def last_name
    fields['lastName']
  end

  def suffix
    fields['suffix']
  end

  def display_name
    fields['displayName']
  end

  def checkouts
    @checkouts ||= fields['circRecordList']
                     &.map { |checkout| Checkout.new(checkout) }
                     &.select { |checkout| checkout.status == 'ACTIVE' }
  end

  def holds
    @holds ||= fields['holdRecordList']&.map { |hold| Hold.new(hold) }
  end

  def fines
    @fines ||= fields['blockList']&.map { |fine| Fine.new(fine) }
  end

  def standing_human
    PATRON_STANDING_ALERTS[standing_code] || ''
  end

  def library
    fields.dig('library', 'key')
  end

  def custom_information
    fields['customInformation']
  end

  def eligible_for_wage_garnishment?
    faculty_or_staff? && garnish_date == '00000000' && WAGE_GARNISHMENT_EXEMPT_LIBRARIES.exclude?(library)
  end

  def faculty_or_staff?
    profile = fields.dig('profile', 'key')

    ['FACULTY', 'STAFF'].include?(profile)
  end

  def garnish_date
    custom_field('GARNISH-DT')
  end

  private

    def fields
      record['fields']
    end

    def standing_code
      fields.dig('standing', 'key')
    end

    def custom_field(field_name)
      field = custom_information.select { |k| k.dig('fields', 'code', 'key') == field_name }
      field.first&.dig('fields', 'data')
    end
end
