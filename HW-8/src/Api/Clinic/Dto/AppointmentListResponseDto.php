<?php

declare(strict_types=1);

namespace App\Api\Clinic\Dto;


use App\Core\Clinic\Document\Appointment;

class AppointmentListResponseDto
{
    public array $data;

    public function __construct(AppointmentResponseDto ... $data)
    {
        $this->data = $data;
    }
}