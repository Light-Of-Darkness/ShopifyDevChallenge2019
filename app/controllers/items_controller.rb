class ItemsController < ApplicationController

	def index
		@items = Item.all
	end
	
	def show
		@item = Item.find(params[:id])
	end

	def new
	end
	
	def create
		@item = Item.new(item_params)
		
		@item.save
		redirect_to @item
	end
	
	#make a purchase on this item by decrementing inventory
	#inventory must be at least 1 to be purchased 
	def purchase
		
		if self.inventory >= 1
			#reduce inventory by 1 then save to db
			self.inventory = self.inventory - 1
			self.save
			#successful purchase, return true
			self.show
			return true
		end
		
		#unsuccessful purchase, return false
		return false
	end

	#show the next item in the database by ID, looping back to the beginning if at the end of the db
	def next
		@curItem.where("id > ?", id).order("id ASC").first || @curItem.first
		@curItem.show
	end
	
	#returns an array of items that have inventory greater than 0
	def withInventory
		@inventoryItems = Item.where(:inventory > 0)
	end
	
	private
	def item_params
		params.require(:item).permit(:title, :price, :inventory)
	end

end
