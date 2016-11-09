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

    sectionss= Section.create([{name:"Расходные медицинские материалы"},
                              {name: "Медицинская мебель"},
                              {name: "Хирургические расходные материалы"},
                               {name: "Измерительные приборы (тонометры, термометры)"}
                              ])

    catalogss=Catalog.create([name:"Бинты", HyTML:"text_there", description:"desc"])
    catalogss1=Catalog.create([name:"Вата", HyTML:"text_there", description:"Вата медицинская хлопковая (от нем. Watte) - пушистая масса волокон, слабо переплетённых между собой в различных направлениях предназначена для применения в больничных, амбулаторных и домашних условиях.
Различают гигроскопическую гигиеническую (компрессную) медицинскую, хирургическую и глазную вату.
Хирургическая вата - белая, легко расслаивается, употребляется как материал, впитывающий жидкие выделения (гной), при перевязке ран поверх слоев бинта. При контакте с кожей и слизистой раздражающего действия не вызывает.  Имеет равномерную структуру, без посторонних включений, мягкий гриф. Легко распределяется на параллельные слои. Вата обладает высокой сорбционной способностью, достаточно эффективно впитывает и удерживает раневое отделяемое, хорошо смачивается, как раневым экссудатом, так и растворами лекарственных препаратов.
Компрессная вата служит для утепления завязанной или забинтованной части тела (например, при согревающих компрессах), а также мягкой подкладкой при наложении шин и иммобилизирующих повязок (например, гипсовых).
При производстве медицинской ваты - сырьё подвергается варке в щёлочи под давлением и затем обрабатывается гипосульфитом натрия. В результате волокно приобретает белизну и характерные свойства - способность быстро смачиваться и поглощать жидкости.
Вата медицинская гигроскопическая хирургическая стерильная соответствует медицинским требованиям и рекомендована для широкого применения в медицинской практике в качестве перевязочных средств: ватно-марлевых повязок, ватных шариков, турундов."])
    catalogss2=Catalog.create([name:"Перчатки", HyTML:"text_there", description:"desc"])

    catalogss3=Catalog.create([name:"Оборудование для эндоскопии и лапароскопии", HyTML:"text_there", description:"desc"])
    catalogss4=Catalog.create([name:"Столы, тележки медецинские универсальные", HyTML:"text_there", description:"desc"])
    catalogss5=Catalog.create([name:"Подставка для стерилизационных коробок (биксов)", HyTML:"text_there", description:"desc"])

    catalogss6=Catalog.create([name:"Лезвия и скальпели хирургические одноразовые", HyTML:"text_there", description:"desc"])
    catalogss7=Catalog.create([name:"Наборы для катетеризации центральных вен по методике Сельдингера", HyTML:"text_there", description:"desc"])
    catalogss8=Catalog.create([name:"Набор для плеврального дренирования (плевральной пункции)", HyTML:"text_there", description:"desc"])
    catalogss9=Catalog.create([name:"Станок для бритья операционного поля", HyTML:"text_there", description:"desc"])

    catalogss10=Catalog.create([name:"Тонометры", HyTML:"text_there", description:"desc"])
    catalogss11=Catalog.create([name:"Термометры", HyTML:"text_there", description:"Термометр медицинский (градусник медицинский) применяется для измерения температуры тела в медицинских учреждениях и в домашних условиях.АМС-Мед предлагает купить термометр безртутный, термометр ртутный, термометр электронный. В данном разделе вы найдете подробное описание товара, который вы можете купить по оптовой цене. Термометр медицинский (градусник медицинский) применяется для измерения температуры тела в медицинских учреждениях и в домашних условиях.АМС-Мед предлагает купить термометр безртутный, термометр ртутный, термометр электронный. В данном разделе вы найдете подробное описание товара, который вы можете купить по оптовой цене. "])
    catalogss12=Catalog.create([name:"Термометры для воды", HyTML:"text_there", description:"desc"])
    catalogss13=Catalog.create([name:"Термометры для холодильника", HyTML:"text_there", description:"desc"])


    sectionss.first.catalogs<<catalogss.first
    sectionss.first.catalogs<<catalogss1.first
    sectionss.first.catalogs<<catalogss2.first

    sectionss.second.catalogs<<catalogss3.first
    sectionss.second.catalogs<<catalogss4.first
    sectionss.second.catalogs<<catalogss5.first

    sectionss.third.catalogs<<catalogss6.first
    sectionss.third.catalogs<<catalogss7.first
    sectionss.third.catalogs<<catalogss8.first
    sectionss.third.catalogs<<catalogss9.first

    sectionss.fourth.catalogs<<catalogss10.first
    sectionss.fourth.catalogs<<catalogss11.first
    sectionss.fourth.catalogs<<catalogss12.first
    sectionss.fourth.catalogs<<catalogss13.first

    catalogss14=Catalog.create([name:"Термометр ртутный", HyTML:"text_there", description:"desc"])
    catalogss15=Catalog.create([name:"Термометр безртутный", HyTML:"text_there", description:"desc"])
    catalogss16=Catalog.create([name:"Термометр электронный", HyTML:"text_there", description:"desc"])

    catalogss14.first.catalogs<<catalogss11.first
    catalogss15.first.catalogs<<catalogss11.first
    catalogss16.first.catalogs<<catalogss11.first




    # catalogss.first.children.create(name:"Посуда", HyTML:"text_there", description:"desc")

    productss=Product.create([{name:"Термометр электронный медицинский (цифровой серии WT)", price: "150", amount:"3000", catalog_id: catalogss16.first},
                              {name:"Термометр безртутный", price: "350", amount:"3000", catalog_id: catalogss15.first},
                              {name:"Термометр медицинский ртутный (Градусник)", price: "150", amount:"3000", catalog_id: catalogss.first},
                              {name:"Бинт медицинский марлевый", price: "78", amount:"3000", catalog_id: catalogss.first},
                              {name:"Вата медицинская гигиеническая нестерильная", price: "40", amount:"3000", catalog_id: catalogss1.first},
                              {name:"Вата кипная - 100% Хлопок", price: "1200", amount:"3000", catalog_id: catalogss1.first},
                              {name:"Перчатки латексные смотровые", price: "40", amount:"3000", catalog_id: catalogss2.first},
                              {name:"Установка эндоскопическая УДЭ", price: "5340", amount:"3000", catalog_id: catalogss3.first},
                              {name:"Тележки КРОНТ", price: "7800", amount:"3000", catalog_id: catalogss4.first},
                              {name:"Подставка для стерилизационных коробок (БИКСОВ)", price: "78", amount:"3000", catalog_id: catalogss5.first},
                             ])


    # Previous stable seed
    #
    # roless = Role.create([{name: 'Admin', number: '1'}, {name: 'Moderator', number: '2'}, {name: 'Buyer', number: '0'} ])
    #
    #
    # userss= User.create( name: 'Admin',email: 'av48412@gmail.com', password:'admin', password_confirmation:'admin', role: roless.first)
    # userss.activation_state = "active"
    # userss.save
    #
    # sectionss= Section.create([name:"some thing"])
    #
    # catalogss=Catalog.create([name:"Catalog 1", HyTML:"text_there", description:"desc"])
    #
    # sectionss.first.catalogs<<catalogss.first
    #
    # catalogss.first.children.create(name:"Catalog 2", HyTML:"text_there", description:"desc")
    #
    # productss=Product.create([{name:"Тарелка", price: "150", amount:"3000"}, {name:"Тарель", price: "150", amount:"3000"}])





    # productss.save
    #
    #
    # t.string :name
    # t.integer :amount
    # t.attachment :cover
    # t.integer :price
    # t.references :catalog, index: true