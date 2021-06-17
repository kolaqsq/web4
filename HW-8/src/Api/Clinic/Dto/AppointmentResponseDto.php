<?php

declare(strict_types=1);

namespace App\Api\Clinic\Dto;


class AppointmentResponseDto
{
    public ?string $id;

    public string $date;

    public ?string $specialization;

    public ?ClinicResponseDto $clinic;
}