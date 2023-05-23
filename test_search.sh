#!/bin/bash
chmod +x search_word.sh

touch input123456
touch output123456

echo "Проверяем скрипт на первый тест..."

echo "Маша Элина
Вика
Элина
Оля
Кирилл
Саша
Александр
Ольга
Сергей
Сережа
Оля
Элина
Макар
Александра
Матвей
Артек
Артем
Никита
Элина
Игнат" > input123456

./search_word.sh Элина <<< "input123456 output123456"
echo "showing file input123456"
cat input123456
echo "showing file output123456"
cat output123456

first_line=$(head -n 1 output123456)
echo "first line: $first_Line"
count=${first_line:54:1}

if [[ $count -eq 4 ]]
then
    echo "Скрипт успешно прошел первый тест!"
else
    echo "Тест провален :("
    echo "count is $count"
    rm input123456
    rm output123456
    exit 1
fi

rm output123456
touch output123456

echo ""

echo "Проверяем скрипт на второй тест..."

echo "Маша Элина
Вика
Элина Элина
Оля
Кирилл
Саша
Александр
Ольга
Сергей
Сережа
Оля
Элина
Макар
Александра
Матвей
Артек
Артем
Никита
Элина
Игнат" > input123456


./search_word.sh Элина <<< "input123456 output123456"

first_line=$(head -n 1 output123456)
count=${first_line:54:1}

if [[ $count -eq 4 ]]
then
    echo "Скрипт успешно прошел второй тест!"
else
    echo "Тест провален :("
    rm input123456
    rm output123456
    exit 1
fi

echo ""

rm input123456
rm output123456

echo "Проверяем скрипт на третий тест..."
./search_word.sh 

if [[ $? -eq 1 ]]
then
    echo "Скрипт успешно прошел третий тест!"
else
    echo "Тест провален :("
    exit 1
fi

echo ""

echo "Проверяем скрипт на четвертый и последний тест..."
./search_word.sh Элина Макс

if [[ $? -eq 1 ]]
then
    echo "Скрипт успешно прошел последний тест! Скрипт работает исправно."
else
    echo "Тест провален :("
    exit 1
fi



