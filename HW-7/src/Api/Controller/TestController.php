<?php

declare(strict_types=1);

namespace App\Api\Controller;

use App\Api\Utils\AuthService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/status")
 */
class TestController
{
    /**
     * @Route(path="/", methods={"GET"})
     */
    public function index(Request $request, AuthService $authService)
    {
        $authMetaData = $request->headers->get('Authorization', '');

        if ($authMetaData !== '' && $authService->checkCredentials($authMetaData)) {
            return new  Response(
                json_encode(
                    [
                        'message' => 'The thing works!!!',
                    ]
                ),
                Response::HTTP_OK,
                [
                    'Content-type' => 'application/json',
                ]
            );
        }

        return new Response(
            json_encode(
                [
                    'message' => 'Not Authorized',
                ]
            ),
            Response::HTTP_UNAUTHORIZED,

            [
                'www-Authenticate' => 'Basic realm="Access to the staging site", charset="UTF-8"',
                'Content-type' => 'application/json',
            ]
        );
    }

    /**
     * @Route(path="/users", methods={"GET"})
     */
    public function users()
    {
        return new Response(
            json_encode(
                [
                    [
                        'username' => 'kolaq',
                        'password' => 'qwerty'
                    ],
                    [
                        'username' => 'admin',
                        'password' => 'admin'
                    ],
                ]
            ),
            Response::HTTP_OK,
            [
                'Content-type' => 'application/json',
            ]
        );
    }
}
