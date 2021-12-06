require "csv"

task import_csv: :environment do
    csv_text = File.read(Rails.root.join("lib", "csvs", "products.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
        t = Product.new
        t.product_name = row["product_name"]
        t.price = row["price"]
        t.quantity = row["quantity"]
        t.save
      end
      puts "There are now #{Product.count} rows in the Products table"
end