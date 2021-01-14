class ItemsController < ApplicationController
    before_action :set_item, only:[:show, :edit, :update, :destroy]
        def show
        end
    
        def index
            @items = Item.all
        end
    
        def new
            @item = Item.new
        end
     
        def create
            @item = Item.new(item_params)
            @item.user = User.first
            if @item.save
                flash[:notice] = "Item was created successfully!"
                redirect_to @item
            else
                render 'new'
            end
        end
        
        def edit
        end
    
        def update
            if @item.update(item_params)
                flash[:notice] = "Item was updated successfully!"
                redirect_to @item
            else
                render 'edit'
            end
        end
    
        def destroy
            @item.destroy
            redirect_to items_path
        end
        
        private
    
        def set_item
            @item = Item.find(params[:id])
        end
    
        def item_params
            params.require(:item).permit(:name, :amount, :price)
        end
    
    end
    