# Playbook

## Состав

* Playbook состоит из нескольких `play`:
   - Инсталляция Java
   - Инсталляция ElasticSearch
   - Инсталляция Kibana
-------------------------------------

## Задачи в каждом из `play`:

* `Install Java`:
  * Разделен на задачи:
    * Установки факта наличия переменной **java_home**, для информации
    * Загрузки архива с `jdk` с основного хоста на удаленные хосты (старается до состояния `success`)
    * Проверки наличия директории **JAVA_HOME**
    * Извлечения данных архива в выбранную директорию
    * Экспорта глобальных переменных
    
    > Основной используемый тэг на каждой задаче - ***java***

----------------
* `Install Elasticsearch`:
  * Разделен на задачи:
    * Загрузки архива с исполняемым файлом в выбранную директорию (старается до состояния `success`)
    * Создания директории для `elasticsearch`
    * Извлечения данных архива в созданную директорию
    * Экспорта глобальных переменных
    
    > Основной используемый тэг на каждой задаче - ***elastic***

-----------------
* `Install Kibsns`:
  * Разделен на задачи:
    * Загрузки архива с исполняемым файлом в выбранную директорию (старается до состояния `success`)
    * Создания директории для `kibana`
    * Извлечения данных архива в созданную директорию
    * Экспорта глобальных переменных
    
    > Основной используемый тэг на каждой задаче - ***kibana***