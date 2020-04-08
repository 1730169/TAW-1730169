@extends('default')
@section('content')

<h1>INDEX GAMERS</h1>
<?php

foreach ($gamers as $gamer) {
    echo $gamer->nombre. "<br>";
}


?>

@endsection