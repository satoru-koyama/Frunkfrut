namespace :ranking_create do
  desc "時間が経過ごとにでランキングを更新する処理"
  task create: :environment do
    users = User.all
    users.each do |user|
      if Ranking.find_by(user_id: user.id) && user.is_deleted == false
        ranking = Ranking.find_by(user_id: user.id)
        ranking.week_count = user.week_count
        ranking.day30_count = user.day30_count
        ranking.total_count = user.total_count
        ranking.update
      elsif !Ranking.find_by(user_id: user.id) && user.is_deleted == false
        ranking = Ranking.new
        ranking.user_id = user.id
        ranking.week_count = user.week_count
        ranking.day30_count = user.day30_count
        ranking.total_count = user.total_count
        ranking.update
      elsif Ranking.find_by(user_id: user.id) && user.is_deleted == true
        ranking = Ranking.find_by(user_id: user.id)
        ranking.destroy
      elsif !Ranking.find_by(user_id: user.id) && user.is_deleted == true
      end
    end
  end

end
