
class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
    def leave_review(user,star_rating,comment)
        Review.create(star_rating:star_rating,comment:comment,user_id:user.id,product_id:self.id)
    end
    def print_all_reviews
        self.reviews.each  do |review|
           puts "Review for #{self.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
        end
    end

    def average_rating
        if self.reviews.count == 0
          return  0
        else
           sum = 0
           self.reviews.each do |review|
              sum += review.star_rating
           end
          return sum / self.reviews.count
        end
    end
end
