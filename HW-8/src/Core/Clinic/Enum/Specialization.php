<?php

declare(strict_types=1);

namespace App\Core\Clinic\Enum;

use App\Core\Common\Enum\AbstractEnum;

class Specialization extends AbstractEnum
{
    public const HEART = 'Прием кардиолога';
    public const HEAD = 'Прием невролога';
    public const EYES = 'Прием офтальмолога';
    public const BLOOD = 'Анализ крови';
}