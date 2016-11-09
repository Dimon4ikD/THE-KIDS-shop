module BannersHelper

  # def add_click
  #   if !@banner.click.nil?
  #     a=@banner.click
  #     a.increment!
  #     a.save
  #   else
  #     return
  #   end
  # end


  def add_click
    self.click+=1
  end

end
