class CreateCompanions < ActiveRecord::Migration[6.1]
  def change
    create_table :companions do |t|
      
    t.timestamps
    end
  end
end
