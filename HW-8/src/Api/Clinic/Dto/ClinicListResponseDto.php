<?php

declare(strict_types=1);

namespace App\Api\Clinic\Dto;


class ClinicListResponseDto
{
    public array $data;

    public function __construct(ClinicResponseDto ... $data)
    {
        $this->data = $data;
    }
}