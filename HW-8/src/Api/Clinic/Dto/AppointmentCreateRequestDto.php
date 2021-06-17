<?php

declare(strict_types=1);

namespace App\Api\Clinic\Dto;

use App\Core\Clinic\Document\Clinic;
use Symfony\Component\Validator\Constraints as Assert;

class AppointmentCreateRequestDto
{
    public string $date = '';

    /**
     * @Assert\Choice(callback={"App\Core\Clinic\Enum\Specialization", "getValues"})
     */
    public ?string $specialization = null;

//    public ?string $clinic = null;

    public ?Clinic $clinic = null;

}