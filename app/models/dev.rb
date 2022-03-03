class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        # [1,2,100].any?{|i| i > 99}
        self.freebies.any? {|freebie| freebie.item_name == item_name} 
    end

    def give_away(dev, freebie)
        # freebie.update(dev: dev) unless freebie.dev != self
        if self.received_one?(freebie.item_name)
            freebie.update(dev_id: dev.id)
        end
    end
end
