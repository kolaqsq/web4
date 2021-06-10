<?php

declare(strict_types=1);


namespace App\Api\Utils;


class AuthService
{
    private array $users = [
        'admin' => 'admin1'
    ];

    public function checkCredentials(string $authMetaData): bool
    {
        [$type, $credentials] = explode(' ', $authMetaData);
        $decodedCredentials = base64_decode($credentials);
        [$login, $password] = explode(':', $decodedCredentials);

        $userPass = $this->users[$login] ?? false;

        if (!$userPass) {
            return false;
        }

        if ($userPass === $password) {
            return true;
        }

        return false;
    }
}