class SecretDiary

attr_accessor :locked
attr_accessor :body

  def initialize
    @locked = true
    @body = ""
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

  def add_entry(entry)
    @locked == true ? (raise "Diary is locked!") : (@body << entry)
  end

  def get_entries
    @locked == true ? (raise "Diary is locked!") : (return @body)
  end

end
