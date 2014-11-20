<?php


namespace mails\Repositories;

use mails\Entities\Mail;

class MailsRepo extends BaseRepo {

    protected $mails;

    public function getModel()
    {
        return new MailsRepo;
    }

    public function     getMail(){

        $this->mails  = new MailsRepo();

        return compact("mail");
    }

    public function newMail(){

        $mail             = new mail();
        return $mail;
    }


}