<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT'].'/connection.php');

function guidv4($data = null) {
    // Generate 16 bytes (128 bits) of random data or use the data passed into the function.
    $data = $data ?? random_bytes(16);
    assert(strlen($data) == 16);

    // Set version to 0100
    $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
    // Set bits 6-7 to 10
    $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

    // Output the 36 character UUID.
    return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
}

function sqlerror($tbl,$evt,$sqlx,$errMsg,$file=''){
    global $con; global $db;
    
        $DB = $db ." -- $file";
        $ip = htmlspecialchars($_SERVER['REMOTE_ADDR']);
        $sql = str_replace("'","|",$sqlx);
        $sql = str_replace('"',"|",$sql);													
        $err =  str_replace("'","|",$errMsg);
        $err =  str_replace('"',"|",$err);
        if ($sql != 'unknown'){
            mysqli_query($con,"INSERT INTO $db.error_log(DBase,Table_ID,Evt,SqLoad,Error_Msg,IP_Address) VALUES ('$DB','$tbl','$evt','$sql','$err','$ip')");	
        }
        return "error";
}

function query($sql){
    global $con;
    $q = mysqli_query($con, $sql);

    if ($q == false){
        return sqlerror('','query',htmlspecialchars($sql),htmlspecialchars(mysqli_error($con)));	
    }else{
        return $q;
    }
}

function rows($res){
    global $con;
    
    $num = mysqli_num_rows($res);

    if ($num == false) {
        return sqlerror('','rows',htmlspecialchars('mysqli_num_rows'),htmlspecialchars(mysqli_error($con)));
    }else {
        return $num;
    }
}

function f_a($sql,$table = ""){
global $con;	
        $res = mysqli_fetch_array($sql);
        
        if ($res == false){
            
            sqlerror($table,'fetch_array',htmlspecialchars('unknown'),htmlspecialchars(mysqli_error($con)));	
            
        }else{
            
            return $res;
            
        }

}