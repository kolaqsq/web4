<?php

declare(strict_types=1);

namespace App\Api\Clinic\Controller;

use App\Api\Clinic\Dto\AppointmentCreateRequestDto;
use App\Api\Clinic\Dto\AppointmentListResponseDto;
use App\Api\Clinic\Dto\AppointmentResponseDto;
use App\Api\Clinic\Dto\AppointmentUpdateRequestDto;
use App\Api\Clinic\Factory\ResponseFactory;
use App\Core\Clinic\Service\AppointmentService;
use App\Core\Clinic\Document\Appointment;
use App\Core\Clinic\Document\Clinic;
use App\Core\Clinic\Service\ClinicService;
use App\Core\Common\Dto\ValidationFailedResponse;
use App\Core\Common\Factory\HTTPResponseFactory;
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
class AppointmentController extends AbstractController
{
    /**
     * @Route(path="/appointments/{id<%app.mongo_id_regexp%>}", methods={"GET"})
     *
     * @IsGranted(Permission::CLINIC_APPOINTMENT_SHOW)
     *
     * @ParamConverter("clinic")
     *
     * @Rest\View()
     *
     * @param ResponseFactory $responseFactory
     * @param ClinicService $clinicService
     * @param Appointment|null $appointment
     * @return AppointmentResponseDto
     */
    public function show(
        ResponseFactory $responseFactory,
        ClinicService $clinicService,
        Appointment $appointment = null
    ): AppointmentResponseDto {
        if (!$appointment) {
            throw $this->createNotFoundException('Appointment not found');
        }

        return $responseFactory->createAppointmentClinicResponse($appointment, $clinicService);
    }

    /**
     * @Route(path="/{id<%app.mongo_id_regexp%>}/appointments", methods={"GET"})
     * @IsGranted(Permission::CLINIC_APPOINTMENT_INDEX)
     *
     * @ParamConverter("clinic")
     *
     * @Rest\View()
     *
     * @param Request $request
     * @param ResponseFactory $responseFactory
     * @param AppointmentService $service
     * @param Clinic|null $clinic
     *
     * @return AppointmentListResponseDto|ValidationFailedResponse
     */
    public function index(
        Request $request,
        ResponseFactory $responseFactory,
        AppointmentService $service,
        Clinic $clinic = null
    ): AppointmentListResponseDto {
        $page = (int)$request->get('page');
        $quantity = (int)$request->get('slice');

        return $responseFactory->createAppointmentListResponse($service, $clinic, $quantity, $page);
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
     * @param ResponseFactory $responseFactory
     * @param HTTPResponseFactory $HTTPResponseFactory
     * @param AppointmentService $service
     * @param ClinicService $clinicService
     * @param Clinic|null $clinic
     * @return AppointmentResponseDto|ValidationFailedResponse|Response
     */
    public function create(
        AppointmentCreateRequestDto $requestDto,
        ConstraintViolationListInterface $validationErrors,
        ResponseFactory $responseFactory,
        HTTPResponseFactory $HTTPResponseFactory,
        AppointmentService $service,
        ClinicService $clinicService,
        Clinic $clinic = null
    ) {
        if ($validationErrors->count() > 0) {
            return $HTTPResponseFactory->createValidationFailedResponse($validationErrors);
        }

        return $responseFactory->createAppointmentClinicResponse(
            $service->createAppointment(
                $requestDto,
                $clinic
            ),
            $clinicService
        );
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
     * @param ClinicService $clinicService
     * @param ResponseFactory $responseFactory
     * @param HTTPResponseFactory $HTTPResponseFactory
     * @param AppointmentService $service
     * @param Appointment|null $appointment
     * @return AppointmentResponseDto|ValidationFailedResponse|Response
     */
    public function update(
        AppointmentUpdateRequestDto $requestDto,
        ConstraintViolationListInterface $validationErrors,
        ClinicService $clinicService,
        ResponseFactory $responseFactory,
        HTTPResponseFactory $HTTPResponseFactory,
        AppointmentService $service,
        Appointment $appointment = null
    ) {
        if (!$appointment) {
            throw $this->createNotFoundException('Appointment not found');
        }

        if ($validationErrors->count() > 0) {
            return $HTTPResponseFactory->createValidationFailedResponse($validationErrors);
        }

        $service->updateAppointment($appointment->getId(), $requestDto);

        return $responseFactory->createAppointmentClinicResponse($appointment, $clinicService);
    }

    /**
     * @Route(path="/appointments/{id<%app.mongo_id_regexp%>}", methods={"DELETE"})
     * @IsGranted(Permission::CLINIC_APPOINTMENT_DELETE)
     * @ParamConverter("clinic")
     *
     * @Rest\View()
     *
     * @param AppointmentService $service
     * @param Appointment|null $appointment
     * @return AppointmentResponseDto|ValidationFailedResponse
     */
    public function delete(
        AppointmentService $service,
        Appointment $appointment = null
    ) {
        if (!$appointment) {
            throw $this->createNotFoundException('Appointment not found');
        }

        $service->delete($appointment);
    }
}