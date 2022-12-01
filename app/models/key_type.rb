class KeyType < ApplicationRecord
  has_many :product_keys
  validates :name, :comment, presence: true

  def self.create_key_type
    #KeyType.create_key_type
    KeyType.create(name: 'standart', comment: 'поддерживает ограничение по
           времени, требует проверки хеша на сервере лицензий при каждом
            запуске. Не поддерживает возможность работы с порталом через
             логин-пароль')

    KeyType.create(name: 'portal', comment: 'поддерживает ограничение по
       времени. Предназначен исключительно для работы через портал
        (через логин-пароль)')

    KeyType.create(name: 'local', comment: 'бессрочные ключи не требующие
       постоянного подключения для проверки к серверу, не поддерживают
        работу с порталом')
  end
end
