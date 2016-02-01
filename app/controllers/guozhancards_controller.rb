class GuozhancardsController < ApplicationController
	http_basic_authenticate_with name: "user", password: "toronto", only: [:edit, :destroy]
        def index
                @wu_cards = Card.where("cardtype = ? AND gamemode = ?","Wu Hero","guozhan").order("blood ASC")
                @shu_cards = Card.where("cardtype = ? AND gamemode = ?","Shu Hero","guozhan").order("blood ASC")
                @wei_cards = Card.where("cardtype = ? AND gamemode = ?","Wei Hero","guozhan").order("blood ASC")
                @gray_cards = Card.where("cardtype = ? AND gamemode = ?","Gray Hero","guozhan").order("blood ASC")
                @god_cards = Card.where("cardtype = ? AND gamemode = ?","God Hero","guozhan").order("blood ASC")
                @other_cards = Card.where("cardtype = ? AND gamemode = ?","Other Hero","guozhan").order("blood ASC")
                @basic_cards = Card.where("cardtype = ? AND gamemode = ?","Basic Card","guozhan").order("blood ASC")
                @tool_cards = Card.where("cardtype = ? AND gamemode = ?","Tool Card","guozhan").order("blood ASC")
                @timedelay_cards = Card.where("cardtype = ? AND gamemode = ?","Time-Delay Tool Card","guozhan").order("blood ASC")
                @weapon_cards = Card.where("cardtype = ? AND gamemode = ?","Weapon","guozhan").order("blood ASC")
                @armour_cards = Card.where("cardtype = ? AND gamemode = ?","Armour","guozhan").order("blood ASC")
                @horse_cards = Card.where("cardtype = ? AND gamemode = ?","Horse","guozhan").order("blood ASC")
                @treasure_cards = Card.where("cardtype = ? AND gamemode = ?","Treasure","guozhan").order("blood ASC")
                @unsorted_cards = Card.where("cardtype = ? AND gamemode = ?","Scroll Card","guozhan").order("blood ASC")
                @unsorted1_cards = Card.where("cardtype = ? AND gamemode = ?","Time-Delay Scroll Card","guozhan").order("blood ASC")
                @unsorted2_cards = Card.where("cardtype = ? AND gamemode = ?","Special Equipment","guozhan").order("blood ASC")
        end

        def show
                @guozhancard = Card.find(params[:id])
        end

        def new
                @guozhancard = Card.new
        end

        def create
                @guozhancard = Card.new(guozhancard_params)
                if @guozhancard.save
                        redirect_to action: 'show', id: @guozhancard.id
                else
                        render 'new'
                end
        end
	
	def edit
                @guozhancard = Card.find(params[:id])
        end

        def update
                @guozhancard = Card.find(params[:id])
                if @guozhancard.update(guozhancard_params)
                        redirect_to action: 'show', id: @guozhancard.id
                else
                        render 'edit'
                end
        end

        def destroy
                @guozhancard = Card.find(params[:id])
                @guozhancard.destroy
                redirect_to guozhancards_path
        end

        private
        def guozhancard_params
                params.require(:card).permit(:gamemode, :blood, :name, :cardtype, :explanation, :image, :secondaryimage, :remove_image, :remove_secondaryimage)
        end
end
