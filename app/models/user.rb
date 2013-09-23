class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :surveys


  validates_uniqueness_of :username, :email
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # devise wiki : How To Allow users to sign in using their username or email address
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :authentication_keys => [ :login ]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login, :role
  
  # Create a login virtual attribute in the User model
  attr_accessor :login

  # 사용자 생성 전 role을 설정하는 메서드 호출
  before_create :setup_default_role_for_new_users

  def self.find_first_by_auth_conditions(warden_conditions)
  # Create a login virtual attribute in the User model

    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  # role에는 admin, default, banned이 존재, 나중에 banned도 추가 예정
  ROLES =  %w[admin default banned]

  private

  def setup_default_role_for_new_users
  # admin이 아니면 기본 role로 'default' 설정
    if self.role.blank?
      self.role = "default"
    end
  end

end
