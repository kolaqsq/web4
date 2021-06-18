<?php

declare(strict_types=1);

namespace App\Api\Clinic\Factory;

use App\Api\Clinic\Dto\AppointmentListResponseDto;
use App\Api\Clinic\Dto\AppointmentResponseDto;
use App\Api\Clinic\Dto\ClinicListResponseDto;
use App\Api\Clinic\Dto\ClinicResponseDto;
use App\Core\Clinic\Service\AppointmentService;
use App\Core\Clinic\Document\Appointment;
use App\Core\Clinic\Document\Clinic;
use App\Core\Clinic\Repository\ClinicRepository;
use App\Core\Clinic\Service\ClinicService;

class ResponseFactory
{
    /**
     * @param Clinic $clinic
     *
     * @return ClinicResponseDto
     */
    public function createClinicResponse(Clinic $clinic): ClinicResponseDto
    {
        $dto = new ClinicResponseDto();

        $dto->id = $clinic->getId();
        $dto->name = $clinic->getName();
        $dto->address = $clinic->getAddress();
        $dto->phone = $clinic->getPhone();

        return $dto;
    }

    /**
     * @param ClinicService $service
     * @param int $quantity
     * @param int $page
     * @return ClinicListResponseDto
     */
    public function createClinicListResponse(
        ClinicService $service,
        int $quantity,
        int $page
    ): ClinicListResponseDto {
        return new ClinicListResponseDto(
            ... array_map(
                    function (Clinic $clinic) {
                        return $this->createClinicResponse($clinic);
                    },
                    $service->findBy([], [], $quantity, $quantity * ($page - 1))
                )
        );
    }

    /**
     * @param Appointment $appointment
     *
     * @return AppointmentResponseDto
     */
    public function createAppointmentResponse(Appointment $appointment): AppointmentResponseDto
    {
        $dto = new AppointmentResponseDto();

        $dto->id = $appointment->getId();
        $dto->date = $appointment->getDate();
        $dto->specialization = $appointment->getSpecialization();

        return $dto;
    }

    /**
     * @param AppointmentService $service
     * @param Clinic $clinic
     * @param int $quantity
     * @param int $page
     * @return AppointmentListResponseDto
     */
    public function createAppointmentListResponse(
        AppointmentService $service,
        Clinic $clinic,
        int $quantity,
        int $page
    ): AppointmentListResponseDto {
        return new AppointmentListResponseDto(
            ... array_map(
                    function (Appointment $appointment) {
                        return $this->createAppointmentResponse($appointment);
                    },
                    $service->findBy(['clinic' => $clinic], [], $quantity, $quantity * ($page - 1))
                )
        );
    }

    /**
     * @param Appointment $appointment
     * @param ClinicService $service
     * @return AppointmentResponseDto
     */
    public function createAppointmentClinicResponse(
        Appointment $appointment,
        ClinicService $service
    ): AppointmentResponseDto {
        $dto = new AppointmentResponseDto();

        $dto->id = $appointment->getId();
        $dto->date = $appointment->getDate();
        $dto->specialization = $appointment->getSpecialization();

        $dto->clinic = $this->createClinicResponse($service->getOne($appointment->getClinicId()));

        return $dto;
    }
}