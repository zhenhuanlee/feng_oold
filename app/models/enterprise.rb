# == Schema Information
#
# Table name: enterprises
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  mobile                 :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_enterprises_on_account               (mobile,email) UNIQUE
#  index_enterprises_on_confirmation_token    (confirmation_token) UNIQUE
#  index_enterprises_on_email                 (email)
#  index_enterprises_on_mobile                (mobile)
#  index_enterprises_on_name                  (name) UNIQUE
#  index_enterprises_on_reset_password_token  (reset_password_token) UNIQUE
#  index_enterprises_on_unlock_token          (unlock_token) UNIQUE
#

class Enterprise < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :contacts
  has_many :labors
  has_many :companies
  has_many :jobs
  has_many :cash_outs
  has_one :debit, as: :user
end
