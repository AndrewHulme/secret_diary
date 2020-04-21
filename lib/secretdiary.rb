class SecretDiary

  attr_accessor :locked

  def initialize
    @locked = true
    #@diary = Diary.new
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end


class Diary
  attr_accessor :body
  attr_accessor :secret

  def initialize
    @body = ""
    @secret = SecretDiary.new
  end

  def add_entry(entry)
    @secret.locked == true ? (raise "Diary is locked!") : (@body << entry)
  end

  def get_entries
    @secret.locked == true ? (raise "Diary is locked!") : (return @body)
  end
end
