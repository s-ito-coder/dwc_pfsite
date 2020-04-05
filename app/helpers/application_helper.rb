module ApplicationHelper
  # 整数を３桁区切りの文字列として返す
  def number_separation( number )
    result = number.to_s
    # 「,」を入れる数の確認
    sep = ( result.length - 1 ) / 3
    # カンマ区切りにする処理
    sep.times do |i|
      # 大きい位から「,」を挿入
      result.insert( -3*( sep - i )-1, ?, )
    end
    return result
  end
end
