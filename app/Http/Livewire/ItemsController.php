<?php

namespace App\Http\Livewire;

use Livewire\Component;

use Illuminate\Support\Facades\Auth;

use App\Item;
use App\AddCart;

class ItemsController extends Component
{
    // public $items_list;


    public function addToCart($item_id = null)
    {
        if(!Auth::id()){
            session()->flash('message', 'red|Please login.');
        }else{

            $item_cost = Item::where('id', $item_id)->select('item_price')->first();

            AddCart::firstOrCreate([
                'user_id'           => Auth::id(),
                'item_id'           => $item_id,
                'quantity'          => 1,
                'item_price'        => $item_cost->item_price,
                'item_order_status' => 1,
            ]);

            session()->flash('message', 'green|Item added to cart successfully.');
        }
    }

    public function render()
    {
        $data['items_list'] = Item::paginate(6);

        return view('livewire.items-controller',$data);
    }
}
