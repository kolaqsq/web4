<?php

declare(strict_types=1);

namespace App\Core\Clinic\Document;

use App\Core\Common\Document\AbstractDocument;
use App\Core\Clinic\Repository\AppointmentRepository;
use Doctrine\ODM\MongoDB\Mapping\Annotations as MongoDB;
use Doctrine\ODM\MongoDB\Mapping\Annotations\ReferenceOne;

/**
 * @MongoDB\Document(repositoryClass=AppointmentRepository::class, collection="appointments")
 */
class Appointment extends AbstractDocument
{
    /**
     * @MongoDB\Id
     */
    protected ?string $id = null;

    /**
     * @MongoDB\Field(type="string")
     */
    protected string $date;

    /**
     * @MongoDB\Field(type="string")
     */
    protected ?string $specialization = null;

    /**
     * @ReferenceOne(targetDocument=Clinic::class)
     */
    protected Clinic $clinic;


    public function __construct(
        string $date,
        Clinic $clinic
    )
    {
        $this->date = $date;
        $this->clinic = $clinic;
    }

    public function getDate(): string
    {
        return $this->date;
    }

    public function setDate(string $date): void
    {
        $this->date = $date;
    }

    public function getClinicId(): string
    {
        return $this->clinic->getId();
    }

    public function getClinicName(): string
    {
        return $this->clinic->getName();
    }

    public function getSpecialization(): ?string
    {
        return $this->specialization;
    }

    public function setSpecialization(?string $specialization): void
    {
        $this->specialization = $specialization;
    }
}