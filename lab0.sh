#!/bin/bash

mkdir lab0

cd lab0

mkdir claude_monet

cd claude_monet

mkdir kitchen hall bar office locker_room

cd kitchen

mkdir hot_station pastry_station

cd hot_station

touch senya_task fedya_task

cat > senya_task << EOF
Сеня готовит мясо для банкета
Проверяет температуру горячего цеха
После смены считает оставшиеся продукты
EOF

cat > fedya_task << EOF 
Федя разделывает рыбу для гостей
Готовит фирменную закуску вместе с Сеней
Перед подачей зовёт Баринова
EOF

cd ..

cd pastry_station

touch lui_dessert katya_idea

cat > lui_dessert << EOF
Луи выпекает коржи для мильфея
Готовит крем по старому рецепту
Оставляет один десерт для команды
EOF

cat > katya_idea << EOF
Катя предлагает новый шоколадный десерт
Баринов просит уменьшить количество сахара
Пробную порцию получает Макс
EOF

cd ..

touch barinov_order

cat > barinov_order << EOF
Баринов собирает всю команду перед сменой
Каждый повар отвечает за своё рабочее место
Лёва контролирует выдачу блюд
EOF

cd ..

cd hall

touch waiter_plan

cat > waiter_plan << EOF
Настя обслуживает столики у окна
Официанты встречают гостей в главном зале
Особые просьбы гостей передают Вике
EOF

cd ..

cd bar

touch kostya_report nastya_note

cat > kostya_report << EOF
Костя проверил запас напитков
Для вечера подготовлены новые коктейли
Бар откроется одновременно с залом
EOF

cat > nastya_note << EOF
Настя просит Костю не опаздывать
После смены они ужинают вместе
Для гостей оставлены чистые бокалы
EOF

cd ..

cd office

touch vika_summary

cat > vika_summary << EOF
Вика проверила кухню и главный зал
Команда готова к вечерней смене
Отчёт нужно передать Нагиеву
EOF

cd ..

cd locker_room

touch max_note leva_note

cat > max_note << EOF
Макс придумал новое блюдо для меню
Баринов разрешил приготовить пробную порцию
Вика ждёт Макса после смены
EOF

cat > leva_note << EOF
Лёва проверяет форму новых поваров
Ключ от кладовой лежит у шефа
Последним кухню закрывает су-шеф
EOF

cd ~/lab0/lab0

chmod 755 claude_monet

cd claude_monet

chmod u=rwx kitchen
chmod g=rx kitchen
chmod o=- kitchen

cd kitchen

chmod 750 hot_station

cd hot_station

chmod u=rw senya_task
chmod g=r senya_task
chmod o-r senya_task

chmod 640 fedya_task

cd ..

chmod u=rwx pastry_station
chmod g=rx pastry_station
chmod o=- pastry_station

cd pastry_station

chmod 644 lui_dessert

chmod u=rw katya_idea
chmod g=r katya_idea
chmod o=r katya_idea

cd ..

chmod 640 barinov_order

cd ..

chmod u=rwx hall
chmod g=rx hall
chmod o=- hall

cd hall

chmod 644 waiter_plan

cd ..

chmod 750 bar

cd bar

chmod u=rw kostya_report
chmod g=r kostya_report
chmod o=- kostya_report

chmod 640 nastya_note

cd ..

chmod u=rwx office
chmod g=rx office
chmod o=- office

cd office

chmod 640 vika_summary

cd ..

chmod 750 locker_room

cd locker_room

chmod u=rw max_note
chmod g=r max_note
chmod o=- max_note

chmod 644 leva_note

cd ..

cp locker_room/max_note office/max_report

rm office/max_report

cd ..

cd claude_monet

cp locker_room/max_note office/max_report

cp -r bar hall/bar_backup

cd ..

ln -s claude_monet/kitchen/barinov_order final_menu

cd claude_monet/office

ln -s ../kitchen/barinov_order final_menu

ln -s ../kitchen kitchen_access

cd ../kitchen/hot_station

ln senya_task senya_task_copy

cat senya_task > ../cook_tasks

cat fedya_task >> ../cook_tasks

cd ../../hall

cat waiter_plan >> ../office/vika_summary

cd ..

mv locker_room/max_note kitchen/max_final_note

cd ..

ls -lR | grep "^-" | sort -k5 -nr | head -n 5

grep -rhEi "баринов|макс" . | grep -vi "порц" | sort | head -n 6

grep -rEi "кост|наст" claude_monet/bar claude_monet/hall/bar_backup | wc -l

{ head -qn 1 claude_monet/kitchen/hot_station/*_task; tail -qn 1 claude_monet/kitchen/hot_station/*_task; } | grep -Ei "сеня|федя|продукт" | sort -r

grep -vE "сеня|федя" claude_monet/kitchen/cook_tasks | sort -r | head -n 4 | wc -w

ls -lRi | grep -E "^..... -......... 2 " | sort -k1 -n

ls -lR | grep "^l" | grep -v "final" | sort -k10

rm claude_monet/office/max_report

rm final_menu

rm claude_monet/office/kitchen_access

rm claude_monet/kitchen/hot_station/senya_task_copy

rm claude_monet/locker_room/leva_note

rmdir claude_monet/locker_room

rm claude_monet/kitchen/max_final_note

rm -r claude_monet/hall/bar_backup