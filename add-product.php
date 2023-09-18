<?php

require_once('./_libFunc.php');

$q = query("SELECT * FROM product WHERE uuid='$_POST[data]'");

if (rows($q) > 0) {
    mysqli_begin_transaction($con);
    try {
        $Fetch = f_a($q);
        $q = query("SELECT * FROM transaction_header WHERE user='$_SESSION[username]' AND status = 0");
        if ($f = f_a($q)) {
            $uuidDetail = guidv4();
            $price = $Fetch['price'] * (100-(float)$Fetch['discount'])/100;
            query("INSERT INTO transaction_detail (uuid,document_code,document_number,product_code,price,quantity,unit,subtotal,currency) SELECT '$uuidDetail','$f[document_code]', '$f[document_number]', product_code,'$price', '1', unit, $price * 1, currency FROM product WHERE uuid='$_POST[data]'");
            $sum = query("SELECT SUM(price * quantity) as total FROM transaction_detail WHERE document_code='$f[document_code]' AND document_number='$f[document_number]'");
            $fSum = f_a($sum);
            query("UPDATE transaction_header SET total=$fSum[total] WHERE document_code='$f[document_code]' AND document_number='$f[document_number]'");
        }else {
            $uuidHeader = guidv4();
            $uuidDetail = guidv4();
            $qA = query("SELECT * FROM transaction_header WHERE user='$_SESSION[username]'");
            $counter = (int)rows($qA) + 1;
            $counter = sprintf('%03d', $counter);
            $price = (float)$Fetch['price'] * (100-(float)$Fetch['discount'])/100;
            query("INSERT INTO transaction_header (uuid,document_code,document_number,user,total,date,status) VALUES('$uuidHeader', 'TRX','$counter', '$_SESSION[username]',$price,NOW(),0)");
            query("INSERT INTO transaction_detail (uuid,document_code,document_number,product_code,price,quantity,unit,subtotal,currency) SELECT '$uuidDetail','TRX', '$counter', product_code,$price, '1', unit, $price * 1, currency FROM product WHERE uuid='$_POST[data]'");
        }
        echo 'sukses';
        mysqli_commit($con);
    } catch (\Throwable $th) {
        mysqli_rollback($con);
        echo $th;
    }
}