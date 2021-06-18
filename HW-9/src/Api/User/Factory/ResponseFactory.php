<?php

declare(strict_types=1);

namespace App\Api\User\Factory;

use App\Api\User\Dto\ContactResponseDto;
use App\Api\User\Dto\UserResponseDto;
use App\Core\User\Document\Contact;
use App\Core\User\Document\User;
use App\Core\User\Enum\Role;
use App\Core\User\Enum\RoleHumanReadable;
use Symfony\Component\HttpFoundation\Response;

class ResponseFactory
{
    /**
     * @param User $user
     * @param Contact|null $contact
     *
     * @return UserResponseDto
     */
    public function createUserResponse(User $user, ?Contact $contact = null): UserResponseDto
    {
        $dto = new UserResponseDto();

        $dto->id = $user->getId();
        $dto->firstName = $user->getFirstName();
        $dto->lastName = $user->getLastName();
        $dto->phone = $user->getPhone();
        $dto->roleHumanReadable = $this->getRoleHumanReadable($user);
        $dto->token = $user->getApiToken();

        if ($contact) {
            $contactResponseDto = new ContactResponseDto();
            $contactResponseDto->id = $contact->getId();
            $contactResponseDto->phone = $contact->getPhone();
            $contactResponseDto->name = $contact->getName();

            $dto->contact = $contactResponseDto;
        }

        return $dto;
    }

    private function getRoleHumanReadable(User $user): ?string
    {
        if (in_array(Role::ADMIN, $user->getRoles(), true)) {
            return RoleHumanReadable::ADMIN;
        }

        if (in_array(Role::CHIEF, $user->getRoles(), true)) {
            return RoleHumanReadable::CHIEF;
        }

        if (in_array(Role::WORKER, $user->getRoles(), true)) {
            return RoleHumanReadable::WORKER;
        }

        if (in_array(Role::USER, $user->getRoles(), true)) {
            return RoleHumanReadable::USER;
        }

        return null;
    }
}
