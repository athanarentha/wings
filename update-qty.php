<?php

require_once('./_libFunc.php');

mysqli_begin_transaction($con);
try {
    $q = query("SELECT * FROM transaction_detail WHERE uuid='$_POST[data]'");
    $f = f_a($q);
    query("UPDATE transaction_detail SET quantity=$_POST[val],subtotal=price*$_POST[val] WHERE uuid='$_POST[data]'");
    $sum = query("SELECT SUM(price * quantity) as total FROM transaction_detail WHERE document_code='$f[document_code]' AND document_number='$f[document_number]'");
    $fSum = f_a($sum);
    query("UPDATE transaction_header SET total=$fSum[total] WHERE document_code='$f[document_code]' AND document_number='$f[document_number]'");
    mysqli_commit($con);
} catch (\Throwable $th) {
    mysqli_rollback($con);
    echo $th;
}

echo 'sukses';