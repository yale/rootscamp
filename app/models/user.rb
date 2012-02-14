class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  has_many :private_contacts

  def add_contact! other, params = {}
    unless has_contact? other
      params.merge!(:contact_user_id => other.id)
      private_contacts.create(params)
    end
  end

  def has_contact? other
    private_contacts.map(&:contact_user).include? other
  end
end
