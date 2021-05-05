class SecretDiary
  attr_reader :lock

  def initialize
    @diary = []
    @lock = Locked.new
  end

  def add_entry(entry)
    raise 'The diary is locked!' if @lock.locked == true

    @diary << entry
  end

  def access_entry
    raise 'The diary is locked!' if @lock.locked == true

    @diary
  end

  def unlock!
    @lock.unlock
  end

  def lock!
    @lock.lock
  end
end

class Locked
  attr_reader :locked

  def initialize
    @locked = true
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end
end
