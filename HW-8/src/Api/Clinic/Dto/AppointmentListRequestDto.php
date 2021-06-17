<?php

declare(strict_types=1);

namespace App\Api\Clinic\Dto;

use Symfony\Component\Validator\Constraints as Assert;

class AppointmentListRequestDto
{
    /**
     * @Assert\Type("integer")
     */
    public $page = "1";

    /**
     * @Assert\LessThan(50)
     */
    public $slice = "10";
}