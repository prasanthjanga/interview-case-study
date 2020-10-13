<?php

if (! function_exists('pre')) {
  function pre($data) {
    echo '<pre>';
    print_r($data);
    echo '</pre>';
  }
}

function displayAlert()
{
  if (Session::has('message'))
  {
    list($type, $message) = explode('|', Session::get('message'));
    // $type = ($type == 'error')?'danger': (($type == 'success')?'success':'');

    return sprintf('<div class="text-white px-6 py-4 border-0 rounded relative mb-4 bg-%s-500">
    <span class="text-xl inline-block mr-5 align-middle">
      <i class="fa fa-bell"></i>
    </span>
    <span class="inline-block align-middle mr-8">
        %s
    </span>
  </div>', $type, $message);
  }
  return '';
}

function price_number_format($price = null) {
    return (!empty($price))?number_format($price,2):0;
}

function get_drop_down_list($data_row_id = 1)
{
  $row_data = null;
  $row_data_list = Cache::remember('data_rows_' . $data_row_id, config('app.cache_timeout', 1440), function () use ($data_row_id) {
      $db = DB::connection();
      return DB::table('data_rows')->find($data_row_id);
  });

  $row_data_list = json_decode($row_data_list->details,true);
  if (!empty($row_data_list['options'])) {
    $row_data_list = $row_data_list['options'];
  }

  return $row_data_list;
}

function date_ui($data)
{
    return (!empty($data))?date('d M Y H:i A',strtotime($data)):date('d M Y H:i A');
}
