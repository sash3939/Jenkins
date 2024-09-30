# Домашнее задание к занятию 10 «Jenkins»

## Подготовка к выполнению

1. Создать два VM: для jenkins-master и jenkins-agent.

<img width="1250" alt="Screen VM" src="https://github.com/user-attachments/assets/f6cb15de-e6be-4f59-a596-b9c3aae42d70">

2. Установить Jenkins при помощи playbook.
На мастере перед запуском playbook
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

<img width="597" alt="Status service jenkins server" src="https://github.com/user-attachments/assets/eadf80ac-2f9c-44cf-a573-4b7d4e33eeae">

<img width="647" alt="Installed Jenkins" src="https://github.com/user-attachments/assets/dd9c1eec-2f41-4dfb-a302-8d939ab29d19">

3. Запустить и проверить работоспособность.

<img width="590" alt="Start Jenkins" src="https://github.com/user-attachments/assets/5417717e-a4d9-4456-a937-972d8b7553f3">

4. Сделать первоначальную настройку.

<img width="472" alt="Unlock" src="https://github.com/user-attachments/assets/c1b491c7-9995-4e99-be9b-7414a4b09d9e">

<img width="498" alt="Start1 Jenkins" src="https://github.com/user-attachments/assets/0bf96d28-339d-4d9d-890b-aec08f005739">

Произвел первоначальную настройку, добавил агент agent, настроил запуск на Launch agent by connecting it to the control

<img width="884" alt="Jenkins Agent Work" src="https://github.com/user-attachments/assets/fe284746-5880-4138-89d5-f3d7eacac22b">

<img width="615" alt="Agent Working" src="https://github.com/user-attachments/assets/652224a6-eba3-483b-8094-b1e97de58592">

Чтобы не сомневались!

## Основная часть

1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.

**В первую очередь необходимо НА АГЕНТ ДЖЕНКИНС поставить правильный Python, зависимости и Молекулу!!! О чем естественно не сказано ни в лекции, ни на вебинарах, ни в личных переписках, за что Нетологии большой минус!**

Далее нужно ввести команду
cd /usr/bin && sudo rm python3 && sudo ln -s /usr/local/bin/python3.10 python3 && python3 -V
после этого ставить молекулу
pip install molecule
**Еще нужно поставить ssl module https://isdigi.ru/blog/centos-openssl/ и пересобрать python и openssl тоже**

<img width="892" alt="OpenSSL" src="https://github.com/user-attachments/assets/ac7b0e49-9758-40d2-a1f4-5fcf4bf2dfd0">

**Это нужная версия Openssl. Преподаватели, вы вообще не в курсе, что это нужно сделать в определенных случаях???**

<img width="857" alt="Freestylejob1" src="https://github.com/user-attachments/assets/3f8d67b1-22be-4924-a1f0-0e93096ad36e">

<img width="361" alt="Freestylejob2" src="https://github.com/user-attachments/assets/6b97bce5-086e-463a-a256-e444f200092d">

ДАЛЕЕ СМОТРИМ ДРУГОЙ README.MD

2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.
3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.
4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.
5. Создать Scripted Pipeline, наполнить его скриптом из [pipeline](./pipeline).
6. Внести необходимые изменения, чтобы Pipeline запускал `ansible-playbook` без флагов `--check --diff`, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами `--check --diff`.
7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл `ScriptedJenkinsfile`.
8. Отправить ссылку на репозиторий с ролью и Declarative Pipeline и Scripted Pipeline.
9. Сопроводите процесс настройки скриншотами для каждого пункта задания!!

## Необязательная часть

1. Создать скрипт на groovy, который будет собирать все Job, завершившиеся хотя бы раз неуспешно. Добавить скрипт в репозиторий с решением и названием `AllJobFailure.groovy`.
2. Создать Scripted Pipeline так, чтобы он мог сначала запустить через Yandex Cloud CLI необходимое количество инстансов, прописать их в инвентори плейбука и после этого запускать плейбук. Мы должны при нажатии кнопки получить готовую к использованию систему.



31e1798837ce4192bdc07add083374ff

pip3 install -r roles/test-role/tox-requirements.txt
cd /root/Ansible5/roles/test-role/molecule/tox

https://www.youtube.com/watch?v=ee1XcQxKfRk -   выручил по настройке агента
