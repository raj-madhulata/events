class CommandBus
  def call(command)
    case command.value
    when 1
      UpvoteEventHandler.new.call(command)
    when -1
      DownvoteEventHandler.new.call(command)
    else
      raise "Invalid vote value"
    end
  end
end