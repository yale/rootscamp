object @user do
  attributes :name, :company, :phone, :email, :twitter
end

child :location do
  attributes :street, :city, :state, :zip
end
