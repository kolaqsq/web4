<?php

declare(strict_types=1);

namespace App\Api\Clinic\Controller;

use App\Api\Clinic\Dto\AppointmentCreateRequestDto;
use App\Api\Clinic\Dto\AppointmentListResponseDto;
use App\Api\Clinic\Dto\AppointmentResponseDto;
use App\Api\Clinic\Dto\AppointmentUpdateRequestDto;
use App\Api\Clinic\Dto\ClinicCreateRequestDto;
use App\Api\Clinic\Dto\ClinicListResponseDto;
use App\Api\Clinic\Dto\ClinicResponseDto;
use App\Api\Clinic\Dto\ClinicUpdateRequestDto;
use App\Core\Clinic\Document\Appointment;
use App\Core\Clinic\Document\Clinic;
use App\Core\Clinic\Repository\AppointmentRepository;
use App\Core\Clinic\Repository\ClinicRepository;
use App\Core\Common\Dto\ValidationFailedResponse;
use App\Core\User\Enum\Permission;
use FOS\RestBundle\Controller\Annotations as Rest;
use FOS\RestBundle\Controller\Annotations\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Validator\ConstraintViolationListInterface;

/**
 * @Route("/clinics")
 */
class ClinicController extends AbstractController
{
    /**
     * @Route(path="/{id<%app.mongo_id_regexp%>}", methods={"GET"})
     *
     * @IsGranted(Permission::CLINIC_SHOW)
     *
     * @ParamConverter("clinic")
     *
     * @Rest\View()
     *
     * @param Clinic|null $clinic
     *
     * @return ClinicResponseDto
     */
    public function show(Clinic $clinic = null)
    {
        if (!$clinic) {
            throw $this->createNotFoundException('Clinic not found');
        }

        return $this->createClinicResponse($clinic);
    }

    /**
     * @Route(path="", methods={"GET"})
     * @IsGranted(Permission::CLINIC_INDEX)
     * @Rest\View()
     *
     * @return ClinicListResponseDto|ValidationFailedResponse
     */
    public function index(
        Request $request,
        ClinicRepository $clinicRepository
    ): ClinicListResponseDto
    {
        $page = (int)$request->get('page');
        $quantity = (int)$request->get('slice');

        $clinics = $clinicRepository->findBy([], [], $quantity, $quantity * ($page - 1));

        return new ClinicListResponseDto(
            ... array_map(
                function (Clinic $clinic) {
                    return $this->createClinicResponse($clinic);
                },
                $clinics
            )
        );
    }

    /**
     * @Route(path="", methods={"POST"})
     * @IsGranted(Permission::CLINIC_CREATE)
     * @ParamConverter("requestDto", converter="fos_rest.request_body")
     *
     * @Rest\View(statusCode=201)
     *
     * @param ClinicCreateRequestDto $requestDto
     * @param ConstraintViolationListInterface $validationErrors
     * @param ClinicRepository $clinicRepository
     *
     * @return ClinicResponseDto|ValidationFailedResponse|Response
     */
    public function create(
        ClinicCreateRequestDto $requestDto,
        ConstraintViolationListInterface $validationErrors,
        ClinicRepository $clinicRepository
    )
    {
        if ($validationErrors->count() > 0) {
            return new ValidationFailedResponse($validationErrors);
        }

        if ($clinic = $clinicRepository->findOneBy(['name' => $requestDto->name])) {
            return new Response('Clinic already exists', Response::HTTP_BAD_REQUEST);
        }

        $clinic = new Clinic(
            $requestDto->name
        );
        $clinic->setAddress($requestDto->address);
        $clinic->setPhone($requestDto->phone);

        $clinicRepository->save($clinic);

        return $this->createClinicResponse($clinic);
    }

    /**
     * @Route(path="/{id<%app.mongo_id_regexp%>}", methods={"PUT"})
     * @IsGranted(Permission::CLINIC_UPDATE)
     * @ParamConverter("clinic")
     * @ParamConverter("requestDto", converter="fos_rest.request_body")
     *
     * @Rest\View()
     *
     * @param ClinicUpdateRequestDto $requestDto
     * @param ConstraintViolationListInterface $validationErrors
     * @param ClinicRepository $clinicRepository
     *
     * @return ClinicResponseDto|ValidationFailedResponse|Response
     */
    public function update(
        Clinic $clinic = null,
        ClinicUpdateRequestDto $requestDto,
        ConstraintViolationListInterface $validationErrors,
        ClinicRepository $clinicRepository
    )
    {
        if (!$clinic) {
            throw $this->createNotFoundException('Clinic not found');
        }

        if ($validationErrors->count() > 0) {
            return new ValidationFailedResponse($validationErrors);
        }

        $clinic->setAddress($requestDto->address);
        $clinic->setPhone($requestDto->phone);

        $clinicRepository->save($clinic);

        return $this->createClinicResponse($clinic);
    }

    /**
     * @Route(path="/{id<%app.mongo_id_regexp%>}", methods={"DELETE"})
     * @IsGranted(Permission::CLINIC_DELETE)
     * @ParamConverter("clinic")
     *
     * @Rest\View()
     *
     * @param Clinic|null $clinic
     * @param ClinicRepository $clinicRepository
     *
     * @return ClinicResponseDto|ValidationFailedResponse
     */
    public function delete(
        ClinicRepository $clinicRepository,
        Clinic $clinic = null
    )
    {
        if (!$clinic) {
            throw $this->createNotFoundException('Clinic not found');
        }

        $clinicRepository->remove($clinic);
    }

    /**
     * @param Clinic $clinic
     *
     * @return ClinicResponseDto
     */
    private function createClinicResponse(Clinic $clinic): ClinicResponseDto
    {
        $dto = new ClinicResponseDto();

        $dto->id = $clinic->getId();
        $dto->name = $clinic->getName();
        $dto->address = $clinic->getAddress();
        $dto->phone = $clinic->getPhone();

        return $dto;
    }

    /**
     * @Route(path="/appointments/{id<%app.mongo_id_regexp%>}", methods={"GET"})
     *
     * @IsGranted(Permission::CLINIC_APPOINTMENT_SHOW)
     *
     * @ParamConverter("clinic")
     *
     * @Rest\View()
     *
     * @param Appointment|null $appointment
     * @param ClinicRepository $clinicRepository
     *
     * @return AppointmentResponseDto
     */
    public function showAppointment(
        Appointment $appointment = null,
        ClinicRepository $clinicRepository)
    {
        if (!$appointment) {
            throw $this->createNotFoundException('Appointment not found');
        }

        return $this->createAppointmentClinicResponse($appointment, $clinicRepository);
    }

    /**
     * @Route(path="/{id<%app.mongo_id_regexp%>}/appointments", methods={"GET"})
     * @IsGranted(Permission::CLINIC_APPOINTMENT_INDEX)
     *
     * @ParamConverter("clinic")
     *
     * @Rest\View()
     *
     * @param Clinic|null $clinic
     *
     * @return AppointmentListResponseDto|ValidationFailedResponse
     */
    public function indexAppointment(
        Request $request,
        AppointmentRepository $appointmentRepository,
        Clinic $clinic = null
    ): AppointmentListResponseDto
    {
        $page = (int)$request->get('page');
        $quantity = (int)$request->get('slice');

        $appointments = $appointmentRepository->findBy(['clinic' => $clinic], [], $quantity, $quantity * ($page - 1));

        return new AppointmentListResponseDto(
            ... array_map(
                function (Appointment $appointment) {
                    return $this->createAppointmentResponse($appointment);
                },
                $appointments
            )
        );
    }

    /**
     * @Route(path="/{id<%app.mongo_id_regexp%>}/appointments", methods={"POST"})
     * @IsGranted(Permission::CLINIC_APPOINTMENT_CREATE)
     * @ParamConverter("clinic")
     * @ParamConverter("requestDto", converter="fos_rest.request_body")
     *
     * @Rest\View(statusCode=201)
     *
     * @param AppointmentCreateRequestDto $requestDto
     * @param ConstraintViolationListInterface $validationErrors
     * @param Clinic|null $clinic
     * @param AppointmentRepository $appointmentRepository
     * @param ClinicRepository $clinicRepository
     *
     * @return AppointmentResponseDto|ValidationFailedResponse|Response
     */
    public function createAppointment(
        AppointmentCreateRequestDto $requestDto,
        ConstraintViolationListInterface $validationErrors,
        AppointmentRepository $appointmentRepository,
        ClinicRepository $clinicRepository,
        Clinic $clinic = null
    )
    {
        if ($validationErrors->count() > 0) {
            return new ValidationFailedResponse($validationErrors);
        }

        $appointment = new Appointment(
            $requestDto->date,
            $clinic
        );
        $appointment->setSpecialization($requestDto->specialization);

        $appointmentRepository->save($appointment);

        return $this->createAppointmentClinicResponse($appointment, $clinicRepository);
    }

    /**
     * @Route(path="/appointments/{id<%app.mongo_id_regexp%>}", methods={"PUT"})
     * @IsGranted(Permission::CLINIC_APPOINTMENT_UPDATE)
     * @ParamConverter("clinic")
     * @ParamConverter("requestDto", converter="fos_rest.request_body")
     *
     * @Rest\View()
     *
     * @param AppointmentUpdateRequestDto $requestDto
     * @param ConstraintViolationListInterface $validationErrors
     * @param AppointmentRepository $appointmentRepository
     * @param ClinicRepository $clinicRepository
     *
     * @return AppointmentResponseDto|ValidationFailedResponse|Response
     */
    public function updateAppointment(
        Appointment $appointment = null,
        AppointmentUpdateRequestDto $requestDto,
        ConstraintViolationListInterface $validationErrors,
        AppointmentRepository $appointmentRepository,
        ClinicRepository $clinicRepository
    )
    {
        if (!$appointment) {
            throw $this->createNotFoundException('Appointment not found');
        }

        if ($validationErrors->count() > 0) {
            return new ValidationFailedResponse($validationErrors);
        }

        $appointment->setDate($requestDto->date);
        $appointment->setSpecialization($requestDto->specialization);

        $appointmentRepository->save($appointment);

        return $this->createAppointmentClinicResponse($appointment, $clinicRepository);
    }

    /**
     * @Route(path="/appointments/{id<%app.mongo_id_regexp%>}", methods={"DELETE"})
     * @IsGranted(Permission::CLINIC_APPOINTMENT_DELETE)
     * @ParamConverter("clinic")
     *
     * @Rest\View()
     *
     * @param Appointment|null $appointment
     * @param AppointmentRepository $appointmentRepository
     *
     * @return AppointmentResponseDto|ValidationFailedResponse
     */
    public function deleteAppointment(
        AppointmentRepository $appointmentRepository,
        Appointment $appointment = null
    )
    {
        if (!$appointment) {
            throw $this->createNotFoundException('Appointment not found');
        }

        $appointmentRepository->remove($appointment);
    }

    /**
     * @param Appointment $appointment
     *
     * @return AppointmentResponseDto
     */
    private function createAppointmentResponse(Appointment $appointment): AppointmentResponseDto
    {
        $dto = new AppointmentResponseDto();

        $dto->id = $appointment->getId();
        $dto->date = $appointment->getDate();
        $dto->specialization = $appointment->getSpecialization();

        return $dto;
    }

    /**
     * @param Appointment $appointment
     * @param ClinicRepository $clinicRepository
     *
     * @return AppointmentResponseDto
     */
    private function createAppointmentClinicResponse(
        Appointment $appointment,
        ClinicRepository $clinicRepository): AppointmentResponseDto
    {
        $dto = new AppointmentResponseDto();

        $dto->id = $appointment->getId();
        $dto->date = $appointment->getDate();
        $dto->specialization = $appointment->getSpecialization();

        $clinic = $clinicRepository->getOne($appointment->getClinicId());

        $clinicResponseDto = new ClinicResponseDto();
        $clinicResponseDto->id = $clinic->getId();
        $clinicResponseDto->name = $clinic->getName();
        $clinicResponseDto->address = $clinic->getAddress();
        $clinicResponseDto->phone = $clinic->getPhone();

        $dto->clinic = $clinicResponseDto;

        return $dto;
    }
}