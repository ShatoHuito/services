<?php

declare(strict_types=1);


$cfg['blowfish_secret'] = 'qwerty123123ytrewq'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */


$i = 0;


$i++;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'mysql-service';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
$cfg['Servers'][$i]['port'] = '3306';


$cfg['Servers'][$i]['user'] = 'qwerty';
$cfg['Servers'][$i]['password'] = 'qwerty';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

