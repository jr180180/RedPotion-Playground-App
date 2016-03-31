class HomeScreen < PM::Screen
  title "Your title here"
  stylesheet HomeScreenStylesheet
  def on_live_reload
      # teardown all views and data
      self.view.subviews.each(&:removeFromSuperview)
      @some_live_data = nil

      # rebuild all
      on_load
  end


  def on_load
    set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, title: "Right", action: :nav_right_button

    @image_url = append!(UITextField, :image_url)

    append(UIButton, :go_button).on(:touch) do |sender|
        @sample_image.remote_image = @image_url.text
        @image_url.resignFirstResponder # Closes keyboard
    end

    @sample_image = append!(UIImageView, :sample_image)
  end

  def nav_left_button
    mp 'Left button'
  end

  def nav_right_button
    mp 'Right button'
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
end
