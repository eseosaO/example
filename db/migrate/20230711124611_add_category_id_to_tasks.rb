class AddCategoryIdToTasks < ActiveRecord::Migration[7.0]
  def change
    #populates migration which adds column (i.e. category_id) to 'tasks' table and it will be a column of integer type
    # Because it is going to be a foreign key, we set index to true
    add_column(:tasks, :category_id, :integer, index: true )
  end
end
