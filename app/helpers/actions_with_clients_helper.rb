module ActionsWithClientsHelper
  def self.give_name_key
    name_key = ''
    4.times do |i|
      name_key = forming_name(name_key, i)
    end
    name_key
  end

  def self.give_part_name
    m = ('A'..'Z').to_a + (0..9).to_a
    (0..3).map { m[rand(36)] }.join
  end

  def self.forming_name(name_key, i)
    if i.zero?
      give_part_name
    else
      "#{name_key}-#{give_part_name}"
    end
  end
end
