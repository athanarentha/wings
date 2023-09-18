<?php
    require_once($_SERVER['DOCUMENT_ROOT'].'/_libFunc.php');
    $qHead = query("SELECT * FROM transaction_header WHERE user='$_SESSION[username]' AND status = 0");
    if ($fHead = f_a($qHead)) {
        $qDetail = query("SELECT a.*,b.* FROM transaction_detail a LEFT JOIN product b ON a.product_code = b.product_code WHERE document_code = '$fHead[document_code]' AND document_number='$fHead[document_number]'");
        while($fDetail = f_a($qDetail)){
    ?>
    <div class="card w-100 my-3">
        <div class="card-body">
                <div class="row">
                    <div class="col-md-4 col-12">
                        <div class="my-auto" style="overflow:hidden;width:100%;">
                            <?php
                                $img = explode(',',$fDetail['images']);
                            ?>
                            <img class="img-thumbnail" src="<?= ($img[0] ?? '')?>" alt="<?= $fDetail['product_name'] ?>-image" style="height:120px;width:100% !important;object-fit:cover">
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-6">
                                <b>
                                    <?= $fDetail['product_name']?>
                                </b>
                                <p for="quantity">Quantity</p>
                                <input type="number" class="quantity" name="quantity" data-data="<?= $fDetail[1] ?>" id="quantity<?= $fDetail['product_code']?>" value="<?=(int)$fDetail['quantity']?>">
                            </div>
                            <div class="col-6 my-auto">
                                <div>
                                    <p>
                                        <?=$fDetail['currency'] ." <span class='subtotal' data-data='".$fDetail[1]."'>". number_format($fDetail['subtotal'], 2,'.',',')."</span>"?>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <?php
        }
    }
    ?>