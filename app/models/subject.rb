class Subject < ApplicationRecord
  validates :name, presence: { :message => "El nombre es requerido"}
  validates :description, presence: { :message => "La descripción es requerida"}
  has_many :course, dependent: :destroy

  validate :cambios?

  before_destroy :check_relations, prepend: true

  def check_relations
    return unless course.any?
    errors.add(:base, 'Este registro esta relacionado, no se puede eliminar')
    throw(:abort)
  end

  def cambios?
    return if self.changed? || self.new_record?
    errors.add(:base, 'Sin cambios en el registro')
  end
end
