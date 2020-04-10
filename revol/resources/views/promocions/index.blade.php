@extends('layouts.app')

@section('title', __('Promocions'))
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md">
                <h1>@yield('title')</h1>
            </div>
            <div class="col-md-auto mb-3 mb-md-0">
                <a href="{{ route('promocions.create') }}" class="btn btn-primary">{{ __('Create Promocion') }}</a>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                {!! $html->table() !!}
                {!! $html->scripts() !!}
            </div>
        </div>
    </div>
@endsection
