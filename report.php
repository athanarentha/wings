<?php
$title = 'Report';
require_once('./_libFunc.php');
require_once('./layouts/header.php');
?>
<body>
    <div class="p-4">
        <div class="card">
            <div class="card-body">
                <div>
                    <a href="/">Back to Index</a>
                </div>
                <div class="text-center">
                    <h3>Report</h3>
                </div>
                <table class="table table-responsive table-hover table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>Transaction</th>
                            <th>User</th>
                            <th>Total</th>
                            <th>Date</th>
                            <th>Item</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $q = query("SELECT * FROM transaction_header");
                            while($f = f_a($q)){
                        ?>
                        <tr>
                            <td><?= $f['document_code']?> - <?=$f['document_number']?></td>
                            <td><?=$f['user']?></td>
                            <td><?=$f['total']?></td>
                            <td><?=date('d-F-Y',strtotime($f['date']))?></td>
                            <td>
                                <ul>
                                <?php
                                $qDetail = query("SELECT * FROM transaction_detail LEFT JOIN product ON transaction_detail.product_code = product.product_code WHERE document_code='$f[document_code]' AND document_number='$f[document_number]'");
                                while($fDetail = f_a($qDetail)){
                                ?>
                                    <li><?=$fDetail['product_name']?> (<?=$fDetail['quantity']?> * <?=$fDetail['currency']?> <?=$fDetail['price']?>)</li>
                                <?php
                                }
                                ?>
                                </ul>
                            </td>
                            <td><?php if($f['status'] == 0) echo 'PENDING' ;else echo 'CHECKOUTED' ?></td>
                        </tr>
                        <?php        
                            }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>