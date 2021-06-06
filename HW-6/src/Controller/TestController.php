<?php

declare(strict_types=1);

namespace App\Controller;

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
    public function index(): Response
    {
        return new Response(
            json_encode(
                [
                    "aboba" => "not_available",
                    "amogus" => "restricted",
                    "chungus" => "big"
                ]
            ),
            Response::HTTP_OK,
            [
                'Content-type' => "application/json"
            ]
        );
    }
}

?>