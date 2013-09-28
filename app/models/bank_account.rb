# == Schema Information
#
# Table name: bank_accounts
#
#  id               :integer          not null, primary key
#  holder_name      :string(255)
#  holder_name_kana :string(255)
#  bank_id          :string(255)
#  bank_name        :string(255)
#  branch_id        :string(255)
#  branch_name      :string(255)
#  account_number   :string(255)
#  status           :string(255)
#  note             :text
#  created_at       :datetime
#  updated_at       :datetime
#

class BankAccount < ActiveRecord::Base

  STATUS = {
    "0" => "書類提出待ち",
    "1" => "書類提出済み",
    "1" => "書類発送中",
    "2" => "書類発送済み",
    "3" => "書類返却",
    "4" => "本人手続待ち",
    "5" => "書類手続終了",
    "6" => "口座振替中",
  }

  has_many :members

  validates :holder_name_kana, :status, presence: true
  validates :holder_name_kana, uniqueness: { scope: [:bank_id, :branch_id] }

  default_scope -> { order(:holder_name_kana) }

  def delete?
    members.count == 0
  end
end
