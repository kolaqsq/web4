<?php

declare(strict_types=1);

namespace App\Api\Clinic\Controller;

use App\Api\Clinic\Dto\ClinicCreateRequestDto;
use App\Api\Clinic\Dto\ClinicListResponseDto;
use App\Api\Clinic\Dto\ClinicResponseDto;
use App\Api\Clinic\Dto\ClinicUpdateRequestDto;
use App\Api\Clinic\Factory\ResponseFactory;
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
     * @param ResponseFactory $responseFactory
     *
     * @return ClinicResponseDto
     */
    public function show(
        ResponseFactory $responseFactory,
        Clinic $clinic = null
    ): ClinicResponseDto {
        if (!$clinic) {
            throw $this->createNotFoundException('Clinic not found');
        }

        return $responseFactory->createClinicResponse($clinic);
    }

    /**
     * @Route(path="", methods={"GET"})
     * @IsGranted(Permission::CLINIC_INDEX)
     * @Rest\View()
     *
     * @param Request $request
     * @param ResponseFactory $responseFactory
     * @param ClinicService $service
     * @return ClinicListResponseDto|ValidationFailedResponse
     */
    public function index(
        Request $request,
        ResponseFactory $responseFactory,
        ClinicService $service
    ): ClinicListResponseDto {
        $page = (int)$request->get('page');
        $quantity = (int)$request->get('slice');

        return $responseFactory->createClinicListResponse($service, $quantity, $page);
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
     * @param ResponseFactory $responseFactory
     * @param HTTPResponseFactory $HTTPResponseFactory
     * @param ClinicService $service
     * @return ClinicResponseDto|ValidationFailedResponse|Response
     */
    public function create(
        ClinicCreateRequestDto $requestDto,
        ConstraintViolationListInterface $validationErrors,
        ResponseFactory $responseFactory,
        HTTPResponseFactory $HTTPResponseFactory,
        ClinicService $service
    ) {
        if ($validationErrors->count() > 0) {
            return $HTTPResponseFactory->createValidationFailedResponse($validationErrors);
        }

        if ($service->findOneBy(['name' => $requestDto->name])) {
            return $HTTPResponseFactory->createBadRequestResponse('Clinic already exists');
        }

        return $responseFactory->createClinicResponse($service->createClinic($requestDto));
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
     * @param ResponseFactory $responseFactory
     * @param HTTPResponseFactory $HTTPResponseFactory
     * @param ClinicService $service
     * @param Clinic|null $clinic
     * @return ClinicResponseDto|ValidationFailedResponse|Response
     */
    public function update(
        ClinicUpdateRequestDto $requestDto,
        ConstraintViolationListInterface $validationErrors,
        ResponseFactory $responseFactory,
        HTTPResponseFactory $HTTPResponseFactory,
        ClinicService $service,
        Clinic $clinic = null
    ) {
        if (!$clinic) {
            throw $this->createNotFoundException('Clinic not found');
        }

        if ($validationErrors->count() > 0) {
            return $HTTPResponseFactory->createValidationFailedResponse($validationErrors);
        }

        $service->updateClinic($clinic->getId(), $requestDto);

        return $responseFactory->createClinicResponse($clinic);
    }

    /**
     * @Route(path="/{id<%app.mongo_id_regexp%>}", methods={"DELETE"})
     * @IsGranted(Permission::CLINIC_DELETE)
     * @ParamConverter("clinic")
     *
     * @Rest\View()
     *
     * @param ClinicService $service
     * @param Clinic|null $clinic
     * @return ClinicResponseDto|ValidationFailedResponse
     */
    public function delete(
        ClinicService $service,
        Clinic $clinic = null
    ) {
        if (!$clinic) {
            throw $this->createNotFoundException('Clinic not found');
        }

        $service->delete($clinic);
    }
}