<?php

declare(strict_types=1);

namespace App\Api\Clinic\Dto;


class ClinicResponseAppointmentDto
{
    public ?string $id;

    public string $name;

    public ?string $address;

    public ?string $phone;

    public ?AppointmentResponseDto $appointment;
}