<?php
$title = 'Halaman Produk';
require_once('./_libFunc.php');
require_once('./layouts/header.php');
if (!isset($_SESSION['username'])) {
    header('location:login.php');
}
// Jika mendownload faker dengan composer
// require_once 'vendor/autoload.php';
 
// inisialisasi faker
// $faker = Faker\Factory::create('id_ID');
 
// generate data nama, alamat
?>
<body>
    <div class="position-absolute" style="right:20px;top:20px;z-index:100">
        <div style="width: 100px;height:100px;border:1px solid white;cursor:pointer;color:white" class="rounded-circle" data-bs-toggle="dropdown">
            <p class="d-flex justify-content-center align-items-center h-100"><?= $_SESSION['username']?></p>
        </div>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <li><a class="dropdown-item" href="/report.php">Report</a></li>
            <li><a class="dropdown-item" href="/logout.php">Logout</a></li>
        </ul>
    </div>
    <div class="d-flex justify-content-center">
        <form id="msform">
                <!-- progressbar -->
                <ul id="progressbar">
                    <li class="active"></li>
                    <li></li>
                    <li></li>
                </ul>
                <!-- fieldsets -->
                <fieldset>
                    <h2 class="fs-title">Product List</h2>
                    <h3 class="fs-subtitle">List of All Products</h3>
                    <div class="text-start row">
                        <?php
                            $qProduct = query("SELECT * FROM product");
                            while($fProduct = f_a($qProduct)){
                         ?>
                        <div class="col-lg-4 col-md-4 col-12">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4 col-12">
                                            <div class="my-auto" style="overflow:hidden;width:100%;">
                                                <?php
                                                    $img = explode(',',$fProduct['images']);
                                                ?>
                                                <img class="img-thumbnail" src="<?= ($img[0] ?? '')?>" alt="<?= $fProduct['product_name'] ?>-image" style="height:120px;width:100% !important;object-fit:cover">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-6">
                                                    <b>
                                                        <?= $fProduct['product_name']?>
                                                    </b>
                                                    <p>
                                                        <?=$fProduct['currency'] ." ". number_format($fProduct['price'], 2,'.',',')?>
                                                    </p>
                                                </div>
                                                <div class="col-6 my-auto">
                                                    <div>
                                                        <button type="button" class="btn btn-primary buy" data-data="<?= $fProduct['uuid']?>">Buy</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <?php       
                            }
                        ?>
                    </div>
                    <input type="button" name="next" class="next action-button" value="Next"/>
                </fieldset>
                <fieldset>
                    <h2 class="fs-title">Shopping Cart</h2>
                    <h3 class="fs-subtitle">This all the list you want to checkout</h3>
                    <div class="" id="cart">
                    </div>
                    <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                    <input type="button" name="next" class="next action-button checkout" value="Checkout"/>
                </fieldset>
                <fieldset>
                    <h2 class="fs-title">Checkout Berhasil</h2>
                    <span class="fa fa-check text-success fa-3x"></span>
                </fieldset>
            </form>
    </div>

    <script>
    </script>
</body>
</html>