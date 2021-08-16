class Public::RankingsController < ApplicationController

  def ranking

    # week_countの大きい順に並べる。
    # ただし数が同じ場合は、shuffle_idが大きい順に並べる。

    # トップ100位の場合
    if params[:id] == "top100_ranking"
      @rankings = Ranking.order(week_count: :DESC, shuffle_id: :DESC).limit(100)
      @id = "top100_ranking"

    # 自身のランキングの場合
    elsif (params[:id] == "my_ranking")
      shuffle_id = Ranking.find_by(user_id: current_user.id).shuffle_id
      # 自身の上に並んでいるレコードを取得する
      above20_my_ranking = Ranking.where("(week_count > ?) or ( (week_count = ?) and (shuffle_id > ?) )", current_user.week_count, current_user.week_count, shuffle_id)
      # 並び替えて、自分の上に並べる２０のレコードのみにする
      above20_my_ranking = above20_my_ranking.order(week_count: :ASC, shuffle_id: :ASC).limit(20)
      above20_my_ranking = above20_my_ranking.order(week_count: :DESC, shuffle_id: :DESC)

      # 自身の下に並んでいるレコードを取得する
      below20_my_ranking = Ranking.where("(week_count < ?) or ( (week_count = ?) and (shuffle_id < ?) )", current_user.week_count, current_user.week_count, shuffle_id)
      # 並び替えて、自分の下に並べる２０のレコードのみにする
      below20_my_ranking = below20_my_ranking.order(week_count: :DESC, shuffle_id: :DESC).limit(20)

      # 自身のレコードを取得する
      my_ranking = Ranking.find_by(user_id: current_user.id)

      # レコードを結合させる
      @rankings = above20_my_ranking + [my_ranking] + below20_my_ranking
      @id = "my_ranking"

    # HTTPメソッドがpostでない場合
    elsif !params[:id]
      @rankings = Ranking.order(week_count: :DESC).limit(100)
      @id = "top100_ranking"
    end
  end

end
