require 'secretdiary'

describe SecretDiary do

  it "checks it responds to lock method" do
    expect(subject).to respond_to(:lock)
  end

  it "check it responds to unlock method" do
    expect(subject).to respond_to(:unlock)
  end

  it "checks the the diary is initially locked" do
    expect(subject.locked).to eq true
  end

end

describe Diary do
  describe "method add_entry" do
    it "checks that method add_entry initially throws an error" do
      expect { subject.add_entry("entry") }.to raise_error "Diary is locked!"
    end

    it "checks that method add_entry adds an entry when diary is unlocked" do
      subject.secret.unlock
      subject.add_entry("Test")
      expect(subject.body).to eq "Test"
    end

    it "checks the method add_entry throws an error when diary is locked again" do
      subject.secret.unlock
      subject.secret.lock
      expect { subject.add_entry("entry") }.to raise_error "Diary is locked!"
    end
  end

  describe "method get_entries" do
    it "checks the method get_entries initially throws an error" do
      expect { subject.get_entries }.to raise_error "Diary is locked!"
    end

    it "checks the method get_entries gets the entries when diary is unlocked" do
      subject.secret.unlock
      subject.add_entry("Test")
      expect(subject.get_entries).to eq "Test"
    end

    it "checks the method get_entries throws an error when diary is locked again" do
      subject.secret.unlock
      subject.secret.lock
      expect { subject.get_entries }.to raise_error "Diary is locked!"
    end
  end
end
