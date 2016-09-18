<div class="row no-gutter">

    <?php
    $column_left = array();
    $column_right = array();
    $index = 0;

    foreach ($categories as $category) {
        if ($category['children']) {
            if ($index == 0) {
                $column_left = $category['children'];
                $index++;
            } elseif ($index == 1) {
                $column_right = $category['children'];
                $index++;
            } else {
                break;
            }
        }
    }
    ?>


    <div class="col-md-6 col-left">
        <?php if (count($column_left)) {
            foreach ($column_left as $item) {
                ?>
                <div class="feature-item">
                    <a href="<?= $item['href'] ?>">
                        <img src="<?= $item['thumb'] ?>" alt="<?= $item['name'] ?>" style="width: 100%">
                    </a>
                </div>

                <?php
            }
        } ?>
    </div>

    <div class="col-md-6 col-right">
        <?php if (count($column_right)) {
            foreach ($column_right as $item) {
                ?>
                <div class="feature-item">
                    <a href="<?= $item['href'] ?>">

                    <img src="<?= $item['thumb'] ?>" alt="<?= $item['name'] ?>" style="width: 100%">
                    </a>

                </div>

                <?php
            }
        } ?>
    </div>


</div>
