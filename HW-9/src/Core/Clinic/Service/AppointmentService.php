<?php

declare(strict_types=1);

namespace App\Core\Clinic\Service;


use App\Api\Clinic\Dto\AppointmentCreateRequestDto;
use App\Api\Clinic\Dto\AppointmentUpdateRequestDto;
use App\Core\Clinic\Document\Appointment;
use App\Core\Clinic\Document\Clinic;
use App\Core\Clinic\Factory\AppointmentFactory;
use App\Core\Clinic\Repository\AppointmentRepository;
use Psr\Log\LoggerInterface;

class AppointmentService
{
    /**
     * @var AppointmentRepository
     */
    private AppointmentRepository $appointmentRepository;

    /**
     * @var AppointmentFactory
     */
    private AppointmentFactory $appointmentFactory;

    /**
     * @var LoggerInterface
     */
    private LoggerInterface $logger;

    public function __construct(
        AppointmentRepository $appointmentRepository,
        AppointmentFactory $appointmentFactory,
        LoggerInterface $logger
    ) {
        $this->appointmentRepository = $appointmentRepository;
        $this->appointmentFactory = $appointmentFactory;
        $this->logger = $logger;
    }

    public function findBy(
        array $criteria,
        ?array $orderBy = null,
        $limit = null,
        $offset = null
    ): array {
        return $this->appointmentRepository->findBy($criteria, $orderBy, $limit, $offset);
    }

    public function findOneBy(array $criteria): ?Appointment
    {
        return $this->appointmentRepository->findOneBy($criteria);
    }

    public function save(Appointment $appointment)
    {
        $this->appointmentRepository->save($appointment);
    }

    public function delete(Appointment $appointment)
    {
        $appointmentId = $appointment->getId();
        $date = $appointment->getDate();
        $specialization = $appointment->getSpecialization();
        $clinicId = $appointment->getClinicId();
        $clinicName = $appointment->getClinicName();

        $this->appointmentRepository->remove($appointment);

        $this->logger->info(
            'Appointment deleted successfully',
            [
                'appointment_id' => $appointmentId,
                'date' => $date,
                'specialization' => $specialization,
                'clinic_id' => $clinicId,
                'clinic_name' => $clinicName,
            ]
        );
    }

    public function updateAppointment(string $id, AppointmentUpdateRequestDto $requestDto)
    {
        $appointment = $this->findOneBy(['id' => $id]);

        $oldDate = $appointment->getDate();
        $oldSpecialization = $appointment->getSpecialization();

        $appointment->setDate($requestDto->date);
        $appointment->setSpecialization($requestDto->specialization);

        $this->save($appointment);

        $this->logger->info(
            'Appointment updated successfully',
            [
                'appointment_id' => $appointment->getId(),
                'date' => $appointment->getDate(),
                'old_date' => $oldDate,
                'specialization' => $appointment->getSpecialization(),
                'old_specialization' => $oldSpecialization,
                'clinic_id' => $appointment->getClinicId(),
                'clinic_name' => $appointment->getClinicName(),
            ]
        );
    }

    public function createAppointment(
        AppointmentCreateRequestDto $requestDto,
        Clinic $clinic
    ): Appointment {
        $appointment = $this->appointmentFactory->create($requestDto->date, $clinic);

        $appointment->setSpecialization($requestDto->specialization);

        $this->save($appointment);

        $this->logger->info(
            'Appointment created successfully',
            [
                'appointment_id' => $appointment->getId(),
                'date' => $appointment->getDate(),
                'specialization' => $appointment->getSpecialization(),
                'clinic_id' => $appointment->getClinicId(),
                'clinic_name' => $appointment->getClinicName(),
            ]
        );

        return $appointment;
    }
}