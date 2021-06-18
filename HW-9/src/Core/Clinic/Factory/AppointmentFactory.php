<?php

declare(strict_types=1);

namespace App\Core\Clinic\Factory;

use App\Core\Clinic\Document\Appointment;
use App\Core\Clinic\Document\Clinic;

class AppointmentFactory
{
    public function create(
        string $date,
        Clinic $clinic
    ): Appointment {
        return new Appointment(
            $date,
            $clinic
        );
    }
}