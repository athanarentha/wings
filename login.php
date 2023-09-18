<?php
require('./_libFunc.php');
// if (isset($_SESSION['username'])) {
//     header('location: index.php?alert=Sudah Login!');
// }
if (isset($_POST['submit'])) {
    $q = query("SELECT * FROM login WHERE user='$_POST[username]'");
    if(rows($q) == 1){
        $pass = md5($_POST['password']);
        $qUser = query("SELECT * FROM login WHERE user ='$_POST[username]' AND password='$pass'");

        $fUser = f_a($qUser);

        $_SESSION['username'] = $fUser['user'];
        $_SESSION['uuid'] = $fUser['uuid'];

        header("Location: /");
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body style="height:90vh">
    <div class="row justify-content-center align-items-center h-100">
        <div class="col-4 shadow p-5 rounded">
            <div class="text-center">
                <h3 class="text-primary">LOGIN</h3>
            </div>
            <div>
                <form action="/login.php" method="post">
                    <div class="form-group mb-3">
                        <label class="form-label" for="username">Username :</label>
                        <input class="form-control" type="text" id="username" name="username">
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label" for="password">Password :</label>
                        <input class="form-control" type="password" id="password" name="password">
                    </div>
                    <div>
                        <button type="submit" name="submit" class="btn btn-primary">Login</button>
                        <button type="reset" class="btn btn-warning">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>