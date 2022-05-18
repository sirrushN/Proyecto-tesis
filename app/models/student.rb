class Student < ApplicationRecord
  has_many :record, dependent: :destroy

  validates :name, presence: { :message => "El nombre es requerido"}
  validates :address, presence: { :message => "La dirección es requerida"}
  validates :phone, presence: { :message => "El telefono es requerido"},
                    length: {maximum: 9, :message => "Numero demasiado largo"},
                    numericality: { only_integer: true, :message => "Debe ser numero entero" }

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
