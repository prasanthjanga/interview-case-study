<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use TCG\Voyager\Traits\Resizable;

class AddCart extends Model
{
    use Resizable;

    protected $table = 'add_carts';

    protected $fillable = [
        'user_id',
        'item_id',
        'quantity',
        'item_note',
        'order_historie_id',
        'item_price',
        'item_order_status',
        'created_at',
        'updated_at',
        'deleted_at'
    ];

    /**************** TO UUID() START ******************/
	public $incrementing = false;
    /**************** TO UUID() END ******************/
    public static function boot()
    {
        /**************** TO INSER created_by & updated_by COLUMNS START ******************/
		// Update field update_by with current user id each time article is updated.
		static::updating(function ($article) {
			// $article->updated_by = Auth::user()->id;
		});

		// Create field created_by with current user id each time article is created.
		static::creating(function ($article) {
			// $article->created_by = !empty(Auth::user()->id)?Auth::user()->id:1;
		});
		/**************** TO INSER created_by & updated_by COLUMNS END ******************/

		/**************** TO UUID() START ******************/
		parent::boot();

		static::creating(function ($instance) {
		   $instance->id = (string) Str::uuid();
		});
		/**************** TO UUID() END ******************/
	}
}
