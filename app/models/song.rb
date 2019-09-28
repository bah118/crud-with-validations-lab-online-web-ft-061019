class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year] }
    # validates :title, uniqueness: { scope: [:artist_name, :released] }
    #   message: "cannot be repeated by the same artist in the same year" }

    validates :released, inclusion: { in: [true, false] }
    # validates :released, exclusion: { in: [nil] }
    
    # validates :release_year, presence: true, if: :released?

    validates :release_year, numericality: {less_than_or_equal_to: Date.today.year} 

    def released?
        self.released
    end 

end