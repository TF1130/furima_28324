class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text        :text                    , null: false
      t.string      :title                   , null: false
      t.timestamps
    end
  end
end
