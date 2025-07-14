require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # Fixture is needed to load sets of data for unit test
  fixtures :products

  test "Product attributes must not be empty" do
    product = Product.new

    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "Price must be positive" do
    product = Product.new(
      title: "My Book",
      description: "My book",
      image_url: "xyz.jpg"
    )

    product.price = -1
    assert product.invalid?
    assert_equal [ "must be greater than or equal to 0.01" ], product.errors[:price]


    product.price = 0
    assert product.invalid?
    assert_equal [ "must be greater than or equal to 0.01" ], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(
      title: "My Book",
      description: "My book",
      price: 25.87,
      image_url: image_url
    )
  end

  test "product image URL must be valid" do
    ok = %w[ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif ]
    bad = %w[ fred.doc fred.gif/more fred.gif.more ]

    ok.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} must be valid"
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{ image_url} must be invalid"
    end
  end

  test "Product title must be unique" do
    product = Product.new(
      title: products(:ruby).title,
      description: products(:ruby).description,
      price: products(:ruby).price,
      image_url: products(:ruby).image_url
    )

    assert product.invalid?
    assert_equal [ "has already been taken" ], product.errors[:title]
    #   assert_equal [ I18n.translate( "errors.messages.taken" ) ], product. errors [ :title ]
  end
end
