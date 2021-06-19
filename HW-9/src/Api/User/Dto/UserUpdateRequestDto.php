<?php

declare(strict_types=1);

namespace App\Api\User\Dto;

use Symfony\Component\Validator\Constraints as Assert;

class UserUpdateRequestDto
{
    /**
     * @Assert\Length(min=3)
     * @Assert\Regex(
     *     pattern="/^[a-zA-Z0-9@]*$/",
     *     message="Incorrect data!"
     * )
     */
    public ?string $firstName = null;

    /**
     * @Assert\Length(min=3)
     * @Assert\Regex(
     *     pattern="/^[a-zA-Z0-9@]*$/",
     *     message="Incorrect data!"
     * )
     */
    public ?string $lastName = null;
}
