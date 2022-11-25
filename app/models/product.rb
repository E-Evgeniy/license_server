# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true

  def self.begin_data
    Product.create(name: 'LeoVR')
    Client.create(name: 'Admin', email: 'admin@yax.ru', comment: 'this is user is admin')
    Client.create(name: 'Manager_1', email: 'manager_1@yax.ru', comment: 'this is user is manager')
    Client.create(name: 'Manager_2', email: 'manager_2@yax.ru', comment: 'this is user is manager')
    Client.create(name: 'Client_1', email: 'client_1@yax.ru', comment: 'this is user is client')
    Client.create(name: 'Client_2', email: 'client_2@yax.ru', comment: 'this is user is client')

    # ProductKey.create(name: 'XXAGFQH', duration: -1, key_type: 'local', product_id: 1, client_id: 1, status: true, comment: 'First key')
    # ProductKey.create(name: 'XXadaFQH', duration: -1, key_type: 'local', product_id: 1, client_id: 1, status: false, comment: 'Second key')
    # ProductKey.create(name: 'sddGFQH', duration: 10, key_type: 'standart', product_id: 1, client_id: 2, status: true, comment: 'Key for Manager 1')
    # ProductKey.create(name: 'XsczGFQH', duration: 10, key_type: 'standart', product_id: 1, client_id: 3, status: true, comment: 'Key for Manager 2')
    # ProductKey.create(name: 'XtyGFQH', duration: 10, key_type: 'portal', product_id: 1, client_id: 4, status: true, comment: "Client_1's key")
  end

  
end
