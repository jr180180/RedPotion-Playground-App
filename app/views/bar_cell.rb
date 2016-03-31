class BarCell < MGSwipeTableCell
  def on_load
    delete = MGSwipeButton.buttonWithTitle(
        "Delete",
        backgroundColor: color.grass,
        padding: 20,
        callback: -> sender { delete_action }
    )

    block = MGSwipeButton.buttonWithTitle(
        "Block User",
        backgroundColor: color.red,
        padding: 20,
        callback: -> sender { block_action }
    )

    self.rightButtons = [delete, block]
    self.rightSwipeSettings.transition = MGSwipeTransitionDrag
    self.rightExpansion.buttonIndex = 0
    self.rightExpansion.fillOnTrigger = true
  end

  def will_display
  end

  def delete_action
    mp "deleted!"
  end

  def block_action
    mp "blocked!"
  end
end