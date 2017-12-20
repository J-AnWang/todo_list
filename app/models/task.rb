class Task < ApplicationRecord
    # 驗證欄位必須有輸入值
    validates_presence_of :name, :date, :note
    # 限定name欄位的輸入字數為10個字
    validates :name, length: {maximum: 30}
end
