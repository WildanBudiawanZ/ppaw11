<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class MahasiswaApi extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->model("mahasiswa_model");
    }

    function index_get() {
        $this->response(404);
    }    

    function index_post(){

        $r = $this->mahasiswa_model->getCustom();

        $this->response($r, 200);
    }
    
}

?>