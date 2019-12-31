# frozen_string_literal: true

class Submit < ApplicationRecord
  has_one :submit_question
  has_one :question, through: :submit_question
  has_many :submit_codes
  belongs_to :user
  belongs_to :mission
end