<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model("matakuliah_model");
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data["matakuliah"] = $this->matakuliah_model->getAll();
        $this->load->view("matakuliah/list", $data);
    }

    public function add()
    {
        $matakuliah = $this->matakuliah_model;
        $validation = $this->form_validation;
        $validation->set_rules($matakuliah->rules());

        if ($validation->run()) {
            $matakuliah->save();
            $this->session->set_flashdata('success', 'Mata Kuliah Berhasil disimpan');
        }

        $this->load->view("matakuliah/new_form");
    }

    public function edit($id = null)
    {
        if (!isset($id)) redirect('matakuliah');
       
        $matakuliah = $this->matakuliah_model;
        $validation = $this->form_validation;
        $validation->set_rules($matakuliah->rules());

        if ($validation->run()) {
            $matakuliah->update();
            $this->session->set_flashdata('success', 'Mata Kuliah Berhasil disimpan');
        }

        $data["matakuliah"] = $matakuliah->getById($id);
        if (!$data["matakuliah"]) show_404();
        
        $this->load->view("matakuliah/edit_form", $data);
    }

    public function delete($unx=null)
    {
        if (!isset($unx)) show_404();
        
        if ($this->matakuliah_model->delete($unx)) {
            redirect(site_url('matakuliah'));
        }
    }
}