<?php

declare(strict_types=1);

namespace App\Core\User\Enum;

use App\Core\Common\Enum\AbstractEnum;

class Permission extends AbstractEnum
{
    public const USER_CONTACT_CREATE       = 'ROLE_USER_CONTACT_CREATE';
    public const USER_SHOW                 = 'ROLE_USER_SHOW';
    public const USER_INDEX                = 'ROLE_USER_INDEX';
    public const USER_CREATE               = 'ROLE_USER_CREATE';
    public const USER_UPDATE               = 'ROLE_USER_UPDATE';
    public const USER_DELETE               = 'ROLE_USER_DELETE';
    public const USER_VALIDATION           = 'ROLE_USER_VALIDATION';
    public const CLINIC_SHOW               = 'ROLE_CLINIC_SHOW';
    public const CLINIC_INDEX              = 'ROLE_CLINIC_INDEX';
    public const CLINIC_CREATE             = 'ROLE_CLINIC_CREATE';
    public const CLINIC_UPDATE             = 'ROLE_CLINIC_UPDATE';
    public const CLINIC_DELETE             = 'ROLE_CLINIC_DELETE';
    public const CLINIC_APPOINTMENT_SHOW   = 'ROLE_CLINIC_APPOINTMENT_SHOW';
    public const CLINIC_APPOINTMENT_INDEX  = 'ROLE_CLINIC_APPOINTMENT_INDEX';
    public const CLINIC_APPOINTMENT_CREATE = 'ROLE_CLINIC_APPOINTMENT_CREATE';
    public const CLINIC_APPOINTMENT_UPDATE = 'ROLE_CLINIC_APPOINTMENT_UPDATE';
    public const CLINIC_APPOINTMENT_DELETE = 'ROLE_CLINIC_APPOINTMENT_DELETE';
}
