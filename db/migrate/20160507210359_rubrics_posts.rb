class RubricsPosts < ActiveRecord::Migration
  def change
    create_table :posts_rubrics, :id => false do |t|
      t.integer :rubric_id
      t.integer :post_id
    end
  end
end
