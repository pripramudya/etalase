class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  accepts_nested_attributes_for :order_items, reject_if: :all_blank, allow_destroy: true

  validates :status, presence: true
  before_save :calculate_total

  def self.total_number
    count
  end

  def self.total_amount
    sum(:total_amount)
  end

  private

  def calculate_total
    # Hitung total dari unit_price * quantity untuk setiap item
    # Pastikan item sudah punya unit_price saat ini
    self.total_amount = order_items.reject(&:marked_for_destruction?).sum do |item|
      # Ambil harga dari produk jika item baru dan belum punya harga
      price = item.product&.price || 0
      quantity = item.quantity || 0
      price * quantity
    end
  end
end
