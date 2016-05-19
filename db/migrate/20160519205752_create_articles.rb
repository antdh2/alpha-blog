class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      # add a title column
      t.string :title

    end
  end
end
