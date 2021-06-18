<?php

declare(strict_types=1);

namespace App\Core\Clinic\Factory;

use App\Core\Clinic\Document\Clinic;

class ClinicFactory
{
    public function create(string $name): Clinic
    {
        $clinic = new Clinic($name);

        return $clinic;
    }
}