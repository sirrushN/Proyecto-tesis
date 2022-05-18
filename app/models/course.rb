class Course < ApplicationRecord
  require 'pry'
  belongs_to :professor, optional: true
  belongs_to :subject, optional: true
  has_many :record, dependent: :destroy
  
  validates :professor, presence: { :message => "El nombre del profesor es requerido"}
  validates :subject, presence: { :message => "El nombre de la materia es requerida"}
  validates :period, presence: { :message => "El periodo es requerido"}
  
  validate :cambios?
  before_destroy :check_relations, prepend: true

  def check_relations
    return unless record.any?
    errors.add(:base, 'Este registro esta relacionado, no se puede eliminar')
    throw(:abort)
  end

  def cambios?
    return if self.changed? || self.new_record?
    errors.add(:base, 'Sin cambios en el registro')
  end
end
