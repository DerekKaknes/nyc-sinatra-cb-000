class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  def update_titles_by_ids(title_ids)
    self.titles.clear
    begin
      title_ids.each do |tid|
        self.titles << Title.find(tid)
      end
    rescue NoMethodError
    end
  end

  def update_landmarks_by_ids(landmark_ids)
    self.landmarks.clear
    begin
      landmark_ids.each do |lid|
        self.landmarks << Landmark.find(lid)
      end
    rescue NoMethodError
    end
  end
end
