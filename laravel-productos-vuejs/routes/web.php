<?php

Route::get('/{any}', function () {
  return view('producto');
})->where('any', '.*');
