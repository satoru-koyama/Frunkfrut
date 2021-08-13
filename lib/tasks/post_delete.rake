namespace :post_delete do
  desc "時間が経過したPostデータのis_deletedをtrueに変更する処理"
  task delete: :environment do


    #ここから処理を書いていく
    #定期実行する際に、そのログを取っておくのは大事。ログがないと定期実行でエラーが起きても分からない。
    # logger = Logger.new 'log/post_delete.log'

    #全てのユーザーを取得していく
    #eachを使うと全てのユーザーがメモリに載せられてしまうが、find_eachにすることで1000件ずつ読み込んでメモリに展開される ユーザー数が多いならfind_eachを使った方が安全
    limit_time = Time.zone.now - ( 60 * 60 * 24 * 3 )
    posts = Post.where("(created_at < ?) AND (is_deleted = ?)", limit_time, false)
    posts.each do |post|
      # begin
        post.update!(is_deleted: true)
        comments = post.comments
        comments.each do |comment|
          comment.update!(is_deleted: true)
          replies = comment.replies
          replies.each do |reply|
            reply.update!(is_deleted: true)
          end
        end

      # rescue => e
      #   #何かしらエラーが起きたら、エラーログの書き込み ただし次のユーザーの処理へは進む
      #   logger.error "user_id: #{user.id}でエラーが発生"
      #   logger.error e
      #   logger.error e.backtrace.join("\n")
      #   next
      # end
    end
  end
end
