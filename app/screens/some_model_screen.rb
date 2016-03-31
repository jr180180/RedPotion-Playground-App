class SomeModelScreen < PM::DataTableScreen
  title "CoreData Example"
  model MyModel
  stylesheet HomeScreenStylesheet

  attr_accessor :names

  def model_query
    @names = MyModel.where(:name).contains("Emily")
  end

  def on_live_reload
    self.view.subviews.each(&:removeFromSuperview)
    @names = MyModel.where(:name).contains("Emily")
    on_load
  end

  def on_load
    set_nav_bar_button :right, title: "Add", action: :create
    set_nav_bar_button :left, title: "Delete All", action: :destroy
  end

  def create
    @length = @names.length
    @names.create(
        name: "Emily#{@length + 1}",
        id: @length + 1
    )
    cdq.save
  end

  def destroy

    if @names.length > 0

      @names.all.each do |name|
        name.destroy
      end
      cdq.save
    end
    
  end

  def msg
    mp "clicked"
  end

  def on_cell_deleted(cell, index_path)
    @names.all[index_path.row].destroy
    cdq.save

    false
  end
end