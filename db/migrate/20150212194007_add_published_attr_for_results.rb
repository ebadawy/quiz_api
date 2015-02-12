class AddPublishedAttrForResults < ActiveRecord::Migration
  def change
  	add_column "results", "published", :boolean
  end
end
