<?php

declare(strict_types=1);

namespace App\Core\Clinic\Service;


use App\Api\Clinic\Dto\ClinicCreateRequestDto;
use App\Api\Clinic\Dto\ClinicUpdateRequestDto;
use App\Core\Clinic\Document\Clinic;
use App\Core\Clinic\Factory\ClinicFactory;
use App\Core\Clinic\Repository\ClinicRepository;
use Psr\Log\LoggerInterface;

class ClinicService
{
    /**
     * @var ClinicRepository
     */
    private ClinicRepository $clinicRepository;

    /**
     * @var ClinicFactory
     */
    private ClinicFactory $clinicFactory;

    /**
     * @var LoggerInterface
     */
    private LoggerInterface $logger;

    public function __construct(
        ClinicRepository $clinicRepository,
        ClinicFactory $clinicFactory,
        LoggerInterface $logger
    ) {
        $this->clinicRepository = $clinicRepository;
        $this->clinicFactory = $clinicFactory;
        $this->logger = $logger;
    }

    public function findBy(
        array $criteria,
        ?array $orderBy = null,
        $limit = null,
        $offset = null
    ): array {
        return $this->clinicRepository->findBy($criteria, $orderBy, $limit, $offset);
    }

    public function findOneBy(array $criteria): ?Clinic
    {
        return $this->clinicRepository->findOneBy($criteria);
    }

    public function getOne(string $id): Clinic
    {
        return $this->clinicRepository->getOne($id);
    }

    public function save(Clinic $clinic)
    {
        $this->clinicRepository->save($clinic);
    }

    public function delete(Clinic $clinic)
    {
        $clinicId = $clinic->getId();
        $name = $clinic->getName();

        $this->clinicRepository->remove($clinic);

        $this->logger->info(
            'Clinic deleted successfully',
            [
                'clinic_id' => $clinicId,
                'name' => $name,
            ]
        );
    }

    public function updateClinic(string $id, ClinicUpdateRequestDto $requestDto)
    {
        $clinic = $this->findOneBy(['id' => $id]);

        $oldAddress = $clinic->getAddress();
        $oldPhone = $clinic->getPhone();

        $clinic->setAddress($requestDto->address);
        $clinic->setPhone($requestDto->phone);

        $this->save($clinic);

        $this->logger->info(
            'Clinic updated successfully',
            [
                'clinic_id' => $clinic->getId(),
                'name' => $clinic->getName(),
                'address' => $clinic->getAddress(),
                'old_address' => $oldAddress,
                'phone' => $clinic->getPhone(),
                'old_phone' => $oldPhone,
            ]
        );
    }

    public function createClinic(ClinicCreateRequestDto $requestDto): Clinic
    {
        $clinic = $this->clinicFactory->create($requestDto->name);

        $clinic->setAddress($requestDto->address);
        $clinic->setPhone($requestDto->phone);

        $this->save($clinic);

        $this->logger->info(
            'Clinic created successfully',
            [
                'clinic_id' => $clinic->getId(),
                'name' => $clinic->getName(),
            ]
        );

        return $clinic;
    }
}