<?php

namespace App\Http\Livewire;

use Livewire\Component;

use Illuminate\Support\Facades\Auth;

use App\Item;
use App\AddCart;

class CartController extends Component
{
    public function addToCart($cart_id = null)
    {
        AddCart::where('id', $cart_id)->increment('quantity');

        session()->flash('message', 'Item Add to cart.');
    }

    public function removeFromCart($cart_id = null)
    {
        AddCart::where('id', $cart_id)
        ->where('quantity','>',1)->decrement('quantity');

        session()->flash('message', '1 Item Removed from cart !');
    }

    public function delFromCart($cart_id = null)
    {
        AddCart::where('id', $cart_id)
        ->delete();

        session()->flash('message', 'Item Removed from cart !');
    }

    public function check_out()
    {
        $order_no = date('Ymd').Auth::id().'-'.mt_rand(1,9999).time();

        AddCart::where('user_id', Auth::id())
        ->where('item_order_status', 1)
        // ->where('order_historie_id', '!=', $order_no)
        ->update([
            'created_at' => NOW(),
            'item_order_status' => 2,
            'order_historie_id' => $order_no,
        ]);

        session()->flash('message', 'green|Your Order number: '.$order_no);
    }

    public function render()
    {
        $data['cart_items'] = AddCart::where('add_carts.item_order_status', 1)
        ->whereNull('add_carts.order_historie_id')
        ->where('add_carts.user_id', Auth::id())
        ->orderBy('add_carts.created_at', 'DESC')
        ->leftJoin('items','items.id','add_carts.item_id')
        ->select(
            'add_carts.*',
            'items.item_name',
            'items.item_price',
            'items.item_banners'
        )
        ->get();

        return view('livewire.cart-controller', $data);
    }
}
