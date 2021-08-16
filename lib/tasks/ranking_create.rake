namespace :ranking_create do
  desc "時間が経過ごとにでランキングを更新する処理"
  task create: :environment do

    users = User.all
    users.each do |user|
      # すでにテーブルに対象のuser_idのレコードが存在する場合
      # 対象がアカウント停止されていない場合
      if Ranking.find_by(user_id: user.id) && (user.is_deleted == false)
        ranking = Ranking.find_by(user_id: user.id)
        ranking.week_count = user.week_count
        ranking.day30_count = user.day30_count
        ranking.total_count = user.total_count
        ranking.save
      # テーブルに対象のuser_idのレコードが存在しない場合
      # 対象がアカウント停止されていない場合
      elsif !Ranking.find_by(user_id: user.id) && (user.is_deleted == false)
        ranking = Ranking.new
        ranking.user_id = user.id
        ranking.week_count = user.week_count
        ranking.day30_count = user.day30_count
        ranking.total_count = user.total_count
        ranking.save
      # すでにテーブルに対象のuser_idのレコードが存在する場合
      # 対象がアカウント停止されている場合
      elsif Ranking.find_by(user_id: user.id) && (user.is_deleted == true)
        ranking = Ranking.find_by(user_id: user.id)
        ranking.destroy
      # テーブルに対象のuser_idのレコードが存在しない場合
      # 対象がアカウント停止されている場合
      elsif !Ranking.find_by(user_id: user.id) && (user.is_deleted == true)
      end
    end

    # すべてのレコードからuser_idの数値を取得し、その数値をshuffle_idとしてレコードにランダムに割り振っていく
    id = 0
    numbers = Ranking.pluck(:user_id).shuffle
    numbers.each do |number|
      id += 1
      ranking = Ranking.find(id)
      ranking.update(shuffle_id: number)
    end

  end

end
