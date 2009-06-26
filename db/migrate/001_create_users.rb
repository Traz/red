class CreateUsers < ActiveRecord::Migration
 def self.up
  create_table :users do |t|
   t.string   :username, :email, :ident, :null => false
   t.string   :lastname, :last_login_ip, :current_login_ip
   t.string   :crypted_password, :password_salt, :persistence_token
   t.datetime :last_request_at, :last_login_at, :current_login_at
   t.integer  :login_count, :failed_login_count
   t.string   :perishable_token, :default => "", :null => false
   t.boolean  :remenber_me
   t.timestamps
  end

  add_index :users, :ident
  add_index :users, :persistence_token
  add_index :users, :last_request_at
  add_index :users, :email

  u=User.new
  u.password='admin'
  u.password_confirmation = 'admin'
  u.password_salt
  u.id = 1
  u.username = 'Admin'
  u.lastname = 'Admin'
  u.ident = 'red'
  u.email = "admin@red.net"
  u.save
 end

 def self.down
  drop_table :users
 end

end
