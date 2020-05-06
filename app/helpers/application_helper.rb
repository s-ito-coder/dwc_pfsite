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

    # 受取人名義を１行にまとめる
    def join_ex_username( last_name, first_name )
        # 返す変数の作成
        str = String.new
        # 先頭に郵便番号を配置
        str = last_name
        # ２番目に住所を配置
        str += first_name
        # 結合した配送先情報を返す
        return str
    end

end
