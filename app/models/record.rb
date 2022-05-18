class Record < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :student, optional: true

  validates :course, presence: { :message => "El nombre del curso es requerido"}
  validates :student, presence: { :message => "El nombre del estudiante es requerido"}
  validates :score, presence: { :message => "El regitro de nota es requerido"}
  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, :message => "El rango de nota es de 0 a 100" }
  validates :score, numericality: { only_integer: true, :message => "La nota debe ser un entero" }

  validate :cambios?

  def cambios?
    return if self.changed? || self.new_record?
    errors.add(:base, 'Sin cambios en el registro')
  end
end
