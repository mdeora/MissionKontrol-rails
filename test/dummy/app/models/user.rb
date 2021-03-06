# frozen_string_literal: true

class User < ActiveRecord::Base
  has_one :company

  validates_uniqueness_of :name
  validates :name, length: { minimum: 2 },
                   confirmation: { case_sensitive: false }
  validates :active, inclusion: { in: [true, false] }
  validate :company_id_exists

  private

  def company_id_exists; end
end
