<?php

declare(strict_types=1);

namespace App\Core\Clinic\Repository;

use App\Core\Clinic\Document\Appointment;
use App\Core\Common\Repository\AbstractRepository;
use Doctrine\ODM\MongoDB\LockException;
use Doctrine\ODM\MongoDB\Mapping\MappingException;

/**
 * @method Appointment save(Appointment $clinic)
 * @method Appointment|null find(string $id)
 * @method Appointment|null findOneBy(array $criteria)
 * @method Appointment getOne(string $id)
 */
class AppointmentRepository extends AbstractRepository
{
    public function getDocumentClassName(): string
    {
        return Appointment::class;
    }

    /**
     * @throws LockException
     * @throws MappingException
     */
    public function getAppointmentById(string $id): ?Appointment
    {
        return $this->find($id);
    }
}