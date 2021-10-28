class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :photo, null: false, default: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fvectors%2Ftable-furniture-wooden-1300555%2F&psig=AOvVaw3theIKVGmB8Bhk-5pQMxEK&ust=1635523566809000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJCqjZi-7fMCFQAAAAAdAAAAABAI'
      t.text :bio, null: false
      t.timestamps
      t.integer :posts_counter, default: 0, null: false
    end
  end
end
