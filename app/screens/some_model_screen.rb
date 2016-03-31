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
    set_nav_bar_button :left, title: "Delete First", action: :destroy
  end

  def create
    @length = @names.length
    @names.create(name: "Emily#{@length + 1}", id: @length + 1)
    cdq.save
  end

  def destroy

    if @names.length > 0
      @names.first.destroy
      cdq.save
    end
  end

  def msg
    mp "clicked"
  end

  def delete_row(index_path)
    @names.all[index_path.row].destroy
    cdq.save
  end
end