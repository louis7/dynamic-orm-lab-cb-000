require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord




  def values_for_insert
      values = []
      self.class.column_names.each do |col_name|
          values << "'#{send(col_name)}'" unless send(col_name).nil?
      end
      values.join(", ")
  end

  def save
      sql = "INSERT INTO #{table_name_for_insert} (#{col_names_for_insert}) VALUES (#{values_for_insert})"
      DB[:conn].execute(sql)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM #{table_name_for_insert}")[0][0]
  end

  def self.find_by_name(name)
      sql = "SELECT * FROM #{self.table_name} WHERE name = '#{name}'"
      DB[:conn].execute(sql)
  end

end
