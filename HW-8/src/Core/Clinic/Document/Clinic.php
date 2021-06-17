<?php

declare(strict_types=1);

namespace App\Core\Clinic\Document;

use App\Core\Clinic\Repository\ClinicRepository;
use App\Core\Common\Document\AbstractDocument;
use Doctrine\ODM\MongoDB\Mapping\Annotations as MongoDB;

/**
 * @MongoDB\Document(repositoryClass=ClinicRepository::class, collection="clinic")
 */
class Clinic extends AbstractDocument
{
    /**
     * @MongoDB\Id
     */
    protected ?string $id = null;

    /**
     * @MongoDB\Field(type="string")
     * @MongoDB\UniqueIndex(name="clinic_name")
     */
    protected string $name;

    /**
     * @MongoDB\Field(type="string")
     */
    protected ?string $address = null;

    /**
     * @MongoDB\Field(type="string")
     */
    protected ?string $phone = null;


    public function __construct(string $name)
    {
        $this->name = $name;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function setName(string $name): void
    {
        $this->address = $name;
    }

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(?string $address): void
    {
        $this->address = $address;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(?string $phone): void
    {
        $this->phone = $phone;
    }
}