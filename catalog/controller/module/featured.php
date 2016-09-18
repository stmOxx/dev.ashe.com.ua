<?php

class ControllerModuleFeatured extends Controller
{
    public function index($setting)
    {
        $this->load->language('module/featured');

        $data['heading_title'] = $this->language->get('heading_title');


        $this->load->model('catalog/category');

        $this->load->model('tool/image');

        $data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(0);


        foreach ($categories as $category) {
            if ($category['top']) {
                // Level 2
                $children_data = array();

                $children = $this->model_catalog_category->getCategories($category['category_id']);

                foreach ($children as $child) {
                    $filter_data = array(
                        'filter_category_id'  => $child['category_id'],
                        'filter_sub_category' => true
                    );

                    if($child['image']){
                        $thumb = $this->model_tool_image->resize($child['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));

                    }else{
                        $thumb = '';
                    }

                    $children_data[] = array(
                        'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
                        'thumb' => $thumb
                    );
                }

                // Level 1
                $data['categories'][] = array(
                    'name'     => $category['name'],
                    'children' => $children_data,
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }
        
        if ($data['categories']) {
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
                return $this->load->view($this->config->get('config_template') . '/template/module/featured.tpl', $data);
            } else {
                return $this->load->view('default/template/module/featured.tpl', $data);
            }
        }
    }
}