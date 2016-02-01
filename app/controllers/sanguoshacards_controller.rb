class SanguoshacardsController < ApplicationController
	http_basic_authenticate_with name: "user", password: "toronto", only: [:edit, :destroy]
        def index
                @wu_cards = Card.where("cardtype = ? AND gamemode = ?","Wu Hero","sanguosha").order("blood ASC")
                @shu_cards = Card.where("cardtype = ? AND gamemode = ?","Shu Hero","sanguosha").order("blood ASC")
                @wei_cards = Card.where("cardtype = ? AND gamemode = ?","Wei Hero","sanguosha").order("blood ASC")
                @gray_cards = Card.where("cardtype = ? AND gamemode = ?","Gray Hero","sanguosha").order("blood ASC")
                @god_cards = Card.where("cardtype = ? AND gamemode = ?","God Hero","sanguosha").order("blood ASC")
                @other_cards = Card.where("cardtype = ? AND gamemode = ?","Other Hero","sanguosha").order("blood ASC")
                @basic_cards = Card.where("cardtype = ? AND gamemode = ?","Basic Card","sanguosha").order("blood ASC")
                @tool_cards = Card.where("cardtype = ? AND gamemode = ?","Tool Card","sanguosha").order("blood ASC")
                @timedelay_cards = Card.where("cardtype = ? AND gamemode = ?","Time-Delay Tool Card","sanguosha").order("blood ASC")
                @weapon_cards = Card.where("cardtype = ? AND gamemode = ?","Weapon","sanguosha").order("blood ASC")
                @armour_cards = Card.where("cardtype = ? AND gamemode = ?","Armour","sanguosha").order("blood ASC")
                @horse_cards = Card.where("cardtype = ? AND gamemode = ?","Horse","sanguosha").order("blood ASC")
                @treasure_cards = Card.where("cardtype = ? AND gamemode = ?","Treasure","sanguosha").order("blood ASC")
        end

	def show
		@sanguoshacard = Card.find(params[:id])
	end	

	def new
		@sanguoshacard = Card.new
	end

	def create
		@sanguoshacard = Card.new(sanguoshacard_params)
		if @sanguoshacard.save
			redirect_to action: 'show', id: @sanguoshacard.id
		else
			render 'new'
		end
	end

	def edit
		@sanguoshacard = Card.find(params[:id])
	end

	def update
		@sanguoshacard = Card.find(params[:id])
		if @sanguoshacard.update(sanguoshacard_params)
			redirect_to action: 'show', id: @sanguoshacard.id
		else
			render 'edit'
		end
	end

	def destroy
		@sanguoshacard = Card.find(params[:id])
		@sanguoshacard.destroy
		redirect_to sanguoshacards_path
	end
	
	private
	def sanguoshacard_params
		params.require(:card).permit(:gamemode, :blood, :name, :cardtype, :explanation, :image, :secondaryimage, :remove_image, :remove_secondaryimage)
	end
end
