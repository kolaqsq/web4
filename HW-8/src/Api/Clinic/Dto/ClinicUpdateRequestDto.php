<?php

declare(strict_types=1);

namespace App\Api\Clinic\Dto;

use Symfony\Component\Validator\Constraints as Assert;

class ClinicUpdateRequestDto
{
    /**
     * @Assert\Length(max=300, min=10)
     */
    public ?string $address = null;

    /**
     * @Assert\Length(11)
     */
    public ?string $phone = null;
}