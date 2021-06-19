<?php

declare(strict_types=1);

namespace App\Api\User\Dto;

use App\Core\User\Validator\UserExists;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @UserExists()
 */
class UserCreateRequestDto
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

    /**
     * @Assert\Length(11)
     */
    public string $phone = '';

    public ?string $apiToken = null;

    /**
     * @Assert\Choice(callback={"App\Core\User\Enum\Role", "getValues"}, multiple=true)
     */
    public array $roles = [];
}
