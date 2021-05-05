require 'secret_diary'

describe Locked do
  context 'locked' do
    it "if diary is locked, can't add entry." do
      diary = SecretDiary.new
      diary.lock!
      expect { diary.add_entry('My Entry') }.to raise_error 'The diary is locked!'
    end

    it "when diary is locked, can't access entry." do
      diary = SecretDiary.new
      diary.lock!
      expect { diary.access_entry }.to raise_error 'The diary is locked!'
    end
  end

  context 'unlock' do
    it 'if diary is unlocked, can add an entry.' do
      diary = SecretDiary.new
      diary.unlock!
      diary.add_entry('My entry')
      expect(diary.access_entry).to eq(['My entry'])
    end

    it 'if diary is unlocked, can access entry' do
      diary = SecretDiary.new
      diary.unlock!
      diary.add_entry('My entry')
      expect(diary.access_entry).to eq(['My entry'])
    end
  end
end
