module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Главная',
      :icon => 'list',
      :controller => :welcome, 
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'file-text-o',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Наполнение',
       :controller => :catalogs, :action => :index,
       :icon => 'file-text-o'},
      {:name => 'База данных',
       :controller => :dabase, :action => :dabase,
       :icon => 'database'}

    ]}
    result << {
      :name => 'Заголовок ссылок',
      :icon => 'search-plus',
      :children => [
      {:name => 'Ссылка товаров',
       :controller => :welcome, :action => :index,
       :icon => 'binoculars'},
      {:name => 'Ссылка Поиска',
       :controller => :welcome, :action => :index,
       :icon => 'search',
       :class => 'long'}
    ]} 
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
