class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        Freebie.where(item_name: item_name) == [] ? false : true
    end
    
    def give_away(dev, freebie)
        if self == freebie.dev
            freebie.dev = self
        end
    end
end
