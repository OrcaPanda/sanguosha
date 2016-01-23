class CardsController < ApplicationController
	before_action :find_card, only: [:show, :edit, :update, :destroy]
	http_basic_authenticate_with name: "user", password: "toronto", only: [:edit, :destroy]
	def index
		@cards = Card.all
		@wu_cards = Card.where(cardtype: "Wu Hero")
		@shu_cards = Card.where(cardtype: "Shu Hero")
		@wei_cards = Card.where(cardtype: "Wei Hero")
		@gray_cards = Card.where(cardtype: "Gray Hero")
		@god_cards = Card.where(cardtype: "God Hero")
		@other_cards = Card.where(cardtype: "Other Hero")
		@basic_cards = Card.where(cardtype: "Basic Card")
		@scroll_cards = Card.where(cardtype: "Scroll Card")
		@timedelay_cards = Card.where(cardtype: "Time-Delay Scroll Card")
		@weapon_cards = Card.where(cardtype: "Weapon")
		@armour_cards = Card.where(cardtype: "Armour")
		@horse_cards = Card.where(cardtype: "Horse")
		@special_cards = Card.where(cardtype: "Special Equipment")
	end

	def show
		#Has before_action
	end

	def new
		@card = Card.new
	end
	
	def edit
		# Has before_action
	end

	def create
		@card = Card.new(card_params)
		if @card.save
			redirect_to @card
		else
			render 'new'
		end
	end

	def update
		# Has before_action
		if @card.update(card_params)
			redirect_to @card
		else
			render 'edit'
		end
	end
	
	def destroy
		@card.destroy
		redirect_to cards_path
	end

	private
	def find_card
		@card = Card.find(params[:id])
	end
	
	def card_params
		params.require(:card).permit(:name, :cardtype, :explanation, :image)
	end
end
