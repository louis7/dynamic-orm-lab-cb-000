require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord







  def self.find_by_name(name)
      sql = "SELECT * FROM #{self.table_name} WHERE name = '#{name}'" 
      DB[:conn].execute(sql)
  end

end