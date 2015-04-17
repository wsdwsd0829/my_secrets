class User < ActiveRecord::Base
  has_many :secrets

  #virtual attr for password, encrypt and store as hidden.  #using blowfish gem
  #validates_presence_of,  validates_confirmation_of
  #1.install bcript-gem, 2 add password_digest column to users for the gem
  has_secure_password

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates_presence_of :username, :message=>"you must have a username"
  validates_length_of :username, :maximum=>25
  validates_uniqueness_of :username

  #duplicate with has_secure_password
  #validates_presence_of :password
  #validates_confirmation_of :password

 # validates_presence_of :email
 # validates_format_of :email, :with=>EMAIL_REGEX
  validates :email, :presence=>true,
                    :length => {:maximum=>50},
                    :uniqueness => true,
                    :format => {:with=>EMAIL_REGEX}

end
