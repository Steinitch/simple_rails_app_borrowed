class User < ActiveRecord::Base

  attr_accessor   :passowrd
  attr_accessible :name, :email, :passowrd, :passowrd_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  :presence => true,
                     :length => { :maximum => 50 }

  validates :email, :presence   => true,
                     :format     => { :with => email_regex },
                     :uniqueness => { :case_sensitive => false }

  validates :passowrd, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }
end
# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

