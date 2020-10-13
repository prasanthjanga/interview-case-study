<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB; //TO WRITE CUSTOM QUERY USING LARAVEL EXTENDS.

use Illuminate\Support\Facades\Auth;
use App\Item;
use App\AddCart;


class LandingController extends Controller
{

	protected $application_name = 'landing_system';
    protected $application_title = 'Welcome to Supplycart System :: ';

    public function __construct()
    {
        $this->middleware('auth',['except'=>['index']]);
    }

    public function index()
    {
        $thisApp = $this->application_name;
		$thisPage = 'i1';
        $thisTitle = $this->application_title.'Landing';


        return view('landing.index', compact('thisApp','thisTitle','thisPage'));
    }

    public function cart()
    {
        $thisApp = $this->application_name;
		$thisPage = 'c1';
        $thisTitle = $this->application_title.'Cart';

        return view('landing.cart', compact('thisApp','thisTitle','thisPage'));
    }

    public function my_orders()
    {
        $thisApp = $this->application_name;
		$thisPage = 'mo1';
        $thisTitle = $this->application_title.'My Orders';

        $orders_list = AddCart::where('user_id', Auth::id())
        ->whereNotNull('order_historie_id')
        ->select(
            '*',
            DB::raw("SUM(item_price) AS order_total")
        )
        ->groupBy('order_historie_id')
        ->orderBy('order_historie_id','DESC')
        ->orderBy('created_at','DESC')
        ->paginate(5);

        return view('landing.my_orders', compact('thisApp','thisTitle','thisPage','orders_list'));
    }

    public function my_order_details($order_id)
    {
        $thisApp = $this->application_name;
		$thisPage = 'mo1';
        $thisTitle = $this->application_title.'My Orders';

        $order_details = AddCart::where('add_carts.user_id', Auth::id())
        ->where('add_carts.order_historie_id', $order_id)
        ->leftJoin('items','items.id','add_carts.item_id')
        ->select(
            'add_carts.*',
            'items.item_name',
            'items.item_banners'
        )
        ->orderBy('add_carts.order_historie_id','DESC')
        ->orderBy('add_carts.created_at','DESC')
        ->get();

        return view('landing.my_order_details', compact('thisApp','thisTitle','thisPage','order_details'));
    }
}
