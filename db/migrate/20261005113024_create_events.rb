class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :external_id, null: false
      t.string :name, null: false
      t.text :description
      t.text :description_html
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :public_url
      t.string :image_url
      t.string :state
      t.string :currency

      t.timestamps
    end
  end
end
