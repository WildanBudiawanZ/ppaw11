<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa_model extends CI_Model
{
    private $_table = "mahasiswa";

    public $matakuliah_id;
    public $matakuliah_unx;
    public $matakuliah_kode;
    public $matakuliah_deskripsi;
    public $sks;

    public function rules()
    {
        return [
            ['field' => 'matakuliah_kode',
            'label' => 'Kode',
            'rules' => 'required'],

            ['field' => 'matakuliah_deskripsi',
            'label' => 'Deskripsi',
            'rules' => 'required'],
            
            ['field' => 'sks',
            'label' => 'SKS',
            'rules' => 'required']
        ];
    }

    public function getAll()
    {
        return $this->db->get($this->_table)->result();
    }
    
    public function getById($unx)
    {
        return $this->db->get_where($this->_table, ["matakuliah_unx" => $unx])->row();
    }

    public function save()
    {

//get ID
        $q="select coalesce(max(matakuliah_id),0)+1 as id from matakuliah";
        $r = $this->db->query($q)->result();
        $id= $r[0]->id;

//POST
        $post = $this->input->post();

        $sql = "
        insert into matakuliah set 
        matakuliah_id=".$id.",
        matakuliah_unx='".uniqid()."',
        matakuliah_kode='".$post["matakuliah_kode"]."',
        matakuliah_deskripsi='".$post["matakuliah_deskripsi"]."',
        sks=".$post["sks"];

        $this->db->query($sql);

    }

    public function update()
    {
        $post = $this->input->post();

        $this->matakuliah_id = $post["id"];
        $this->matakuliah_unx = $post["unx"];

        $this->matakuliah_kode = $post["matakuliah_kode"];
        $this->matakuliah_deskripsi = $post["matakuliah_deskripsi"];
        $this->sks = $post["sks"];

        $this->db->update($this->_table, $this, array('matakuliah_id' => $post['id']));
    }

    public function delete($unx)
    {
        return $this->db->delete($this->_table, array("mahasiswa_unx" => $unx));
    }

    public function getCustom()
    {
        $q="select * from mahasiswa limit 2";
        return $this->db->query($q)->result();
    }

}