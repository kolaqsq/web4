--
-- Вывод свободных записей к офтальмологу во всех клиниках кроме Касимовского медицинского центра
--
select clinic_name, specialization_name, available_date, available_time
from electronic_registry.ELREG_available_dates Ead
         join electronic_registry.ELREG_available_times Eat
              on Ead.id = Eat.date_id
         join electronic_registry.ELREG_specializations Es
              on Es.id = Ead.specialization_id
         join electronic_registry.ELREG_clinics Ec
              on Ec.id = Ead.clinic_id
where specialization_name = 'Прием офтальмолога'
  and Ec.clinic_name !=
      'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ "КАСИМОВСКИЙ МЕЖРАЙОННЫЙ МЕДИЦИНСКИЙ ЦЕНТР"'
  and Ead.available = 1
  and Eat.available = 1
order by clinic_name, available_date

-- --------------------------------------------------------

--
-- Формирование рейтинга больниц по количеству специализаций
--
select clinic_name, count(Ec.id) specializations
from electronic_registry.ELREG_clinics Ec
         join electronic_registry.ELREG_clinics_specializations Ecs
              on Ec.id = Ecs.clinic_id
         join electronic_registry.ELREG_specializations Es
              on Es.id = Ecs.specialization_id
group by clinic_name
order by specializations desc

-- --------------------------------------------------------
