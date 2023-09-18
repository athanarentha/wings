<?php

require_once('./_libFunc.php');
header('Content-Type: application/json; charset=utf-8');
if (isset($_POST)) {
    mysqli_begin_transaction($con);
    try {
        $q = query("UPDATE transaction_header SET status = 1 WHERE user='$_SESSION[username]' AND status = 0");
        mysqli_commit($con);
    } catch (\Throwable $th) {
        mysqli_rollback($con);
        echo $th;
    }
    
    echo json_encode(['status' => 'sukses']);
}