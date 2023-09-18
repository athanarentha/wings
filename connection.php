<?php
// require_once 'vendor/autoload.php';

$host = "localhost";
$db = "product";
$user = "root";
$pass = '';

$con = mysqli_connect($host,$user,$pass);
try {
    $link = mysqli_select_db($con,$db);
} catch (\Throwable $th) {
    mysqli_begin_transaction($con);
    try {
        mysqli_query($con, "CREATE DATABASE $db");
    
        
        $link = mysqli_select_db($con,$db);
        mysqli_query($con, "CREATE TABLE $db.login (
            id bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
            uuid varchar(255) NOT NULL,
            user varchar(50) NOT NULL,
            password varchar(255) NOT NULL
            )ENGINE InnoDB");

        mysqli_query($con, "CREATE TABLE $db.product (
            id bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
            uuid varchar(255) NOT NULL,
            product_code varchar(18) NOT NULL,
            product_name varchar(50) NOT NULL,
            brand varchar(50) NOT NULL,
            stock integer(10) DEFAULT 0,
            price double(6,2) DEFAULT 0.00,
            currency varchar(5) DEFAULT 'IDR',
            discount double(6,2) DEFAULT 0.00,
            dimension varchar(50) DEFAULT NULL,
            unit varchar(5) DEFAULT NULL,
            images text DEFAULT NULL,
            description text NOT NULL
            )ENGINE InnoDB");

        mysqli_query($con, "CREATE TABLE $db.transaction_header (
            id bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
            uuid varchar(255) NOT NULL,
            document_code varchar(3) NOT NULL,
            document_number varchar(10) NOT NULL,
            user varchar(50) NOT NULL,
            total double(10,2) DEFAULT 0.00,
            date date NOT NULL,
            status varchar(1) DEFAULT 0,
            )ENGINE InnoDB");

        mysqli_query($con,"CREATE TABLE $db.transaction_detail (
            id bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
            uuid varchar(255) NOT NULL,
            document_code varchar(3) NOT NULL,
            document_number varchar(10) NOT NULL,
            product_code varchar(18) NOT NULL,
            price double(6,2) NOT NULL,
            quantity double(6,2) NOT NULL,
            unit varchar(5) NOT NULL,
            subtotal double(10,2) NOT NULL,
            currency varchar(5) NOT NULL
            )ENGINE InnoDB");

        mysqli_query($con, "CREATE TABLE $db.error_log (
            ID bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Table_ID varchar(40) DEFAULT NULL,
            Evt varchar(20) DEFAULT NULL,
            SqLoad text,
            Error_Msg text,
            Date_Error timestamp NULL DEFAULT CURRENT_TIMESTAMP,
            IP_Address varchar(30) DEFAULT NULL,
            DBase varchar(50) DEFAULT NULL,
            Customer_ID varchar(30) DEFAULT NULL
          ) ENGINE MyISAM");
        
        mysqli_query($con, "CREATE TABLE $db.cart (
            id bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
            uuid varchar(255) NOT NULL,
            product_code varchar(255) NOT NULL,
            
        ) ENGINE MYISAM");
        mysqli_commit($con);
    } catch (\Throwable $th) {
        mysqli_rollback($con);
        echo $th->getMessage();
        exit;
    }
}

if (mysqli_errno($con) > 0) {
    echo mysqli_error($con);
}