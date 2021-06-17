<?php

declare(strict_types=1);

namespace App\Api\Clinic\Dto;

use Symfony\Component\Validator\Constraints as Assert;

class AppointmentUpdateRequestDto
{
    public string $date;

    /**
     * @Assert\Choice(callback={"App\Core\Clinic\Enum\Specialization", "getValues"})
     */
    public ?string $specialization;
}