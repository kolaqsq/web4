<?php

declare(strict_types=1);

namespace App\Core\Clinic\Repository;

use App\Core\Clinic\Document\Clinic;
use App\Core\Common\Repository\AbstractRepository;
use Doctrine\ODM\MongoDB\LockException;
use Doctrine\ODM\MongoDB\Mapping\MappingException;

/**
 * @method Clinic save(Clinic $clinic)
 * @method Clinic|null find(string $id)
 * @method Clinic|null findOneBy(array $criteria)
 * @method Clinic getOne(string $id)
 */
class ClinicRepository extends AbstractRepository
{
    public function getDocumentClassName(): string
    {
        return Clinic::class;
    }

    /**
     * @throws LockException
     * @throws MappingException
     */
    public function getClinicById(string $id): ?Clinic
    {
        return $this->find($id);
    }
}