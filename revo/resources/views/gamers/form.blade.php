@extends('default')
@section('content')
<br>
<form>
<div class="card shadow mb-4">
    
    <div class="card-header py-3">
      <h5 class="m-0 font-weight-bold text-primary">Gamer</h5>
    </div>
    
    <div class="card-body">
        <div class="row">
          
            <div class="col-md-6">
            
              <div class="form-group">
                <label>Nombre</label>
                <input type="text" class="form-control" name="nombre" required>
              </div>

              <div class="form-group">
                <label>Apellidos</label>
                <input type="text" class="form-control" name="apellidos" required>
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Correo electrónico</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
              </div>

              <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1">
              </div>
  
            </div>
            <div class="col-md-6">
                
            </div>

            
        </div>
    </div>
</div>

</form>
<button type="submit" class="btn btn-primary">Guardar</button>
@endsection