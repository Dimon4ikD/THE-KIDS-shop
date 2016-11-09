# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    roless = Role.create([{name: 'Admin', number: '1'}, {name: 'Moderator', number: '2'}, {name: 'Buyer', number: '0'} ])


    userss= User.create( name: 'Admin',email: 'av48412@gmail.com', password:'admin', password_confirmation:'admin', role: roless.first)
    userss.activation_state = "active"
    userss.save

    sectionss= Section.create([name:"some thing"])

    catalogss=Catalog.create([name:"Catalog 1", HyTML:"text_there", description:"desc"])

    sectionss.first.catalogs<<catalogss.first

    catalogss.first.children.create(name:"Catalog 2", HyTML:"text_there", description:"desc")

    productss=Product.create([name:"Тарелка", price: "150", amount:"3000"])
    # productss.save
    #
    #
    # t.string :name
    # t.integer :amount
    # t.attachment :cover
    # t.integer :price
    # t.references :catalog, index: true