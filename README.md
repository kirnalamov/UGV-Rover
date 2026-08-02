# UGV Rover & RoArm Workspaces

Данный репозиторий является корневым репозиторием проекта и объединяет два независимых рабочих пространства ROS 2:

* **UGV Rover** — программное обеспечение мобильной роботизированной платформы;
* **RoArm** — программное обеспечение роботизированного манипулятора.

Оба рабочих пространства подключаются как **Git Submodules**, что позволяет разрабатывать и обновлять их независимо друг от друга.

---

# Структура репозитория

```text
ws/
├── .git/
├── .gitmodules
├── .gitignore
├── README.md
├── scripts/        # Вспомогательные скрипты
├── roarm_ws/       # ROS 2 Workspace манипулятора RoArm (Git Submodule)
└── ugv_ws/         # ROS 2 Workspace мобильной платформы UGV Rover (Git Submodule)
```

---

# Клонирование репозитория

Для корректной загрузки всех компонентов рекомендуется использовать рекурсивное клонирование.

### Через SSH

```bash
git clone --recursive git@github.com:kirnalamov/UGV-Rover.git ws
cd ws
```

### Через HTTPS

```bash
git clone --recursive https://github.com/kirnalamov/UGV-Rover.git ws
cd ws
```

Если репозиторий уже был клонирован без параметра `--recursive`, выполните:

```bash
git submodule update --init --recursive
```

---

# Первоначальная настройка

Некоторые пакеты используют абсолютный путь `/home/ws`. После клонирования репозитория необходимо один раз создать символическую ссылку:

```bash
sudo ln -s /home/$USER/ws /home/ws
```

Проверить создание ссылки можно командой:

```bash
ls -l /home/ws
```

---

# Сборка проекта

## Workspace UGV Rover

```bash
cd ~/ws/ugv_ws

colcon build --symlink-install

source install/setup.bash
```

## Workspace RoArm

```bash
cd ~/ws/roarm_ws

colcon build --symlink-install

source install/setup.bash
```

---

# Запуск

## Генерация URDF и загрузка модели RoArm в Gazebo

Скрипт `manipulst.sh` автоматически:

1. генерирует URDF из модели `roarm_m3.xacro`;
2. сохраняет временный файл `/tmp/roarm_m3.urdf`;
3. запускает `spawn_entity.py` для загрузки модели в Gazebo.

Запуск:

```bash
cd ~/ws/scripts

./manipulst.sh
```

---

# Решение распространённых проблем

## Ошибки `AMENT_PREFIX_PATH`

Если после изменения структуры проекта или обновления зависимостей ROS 2 перестал обнаруживать пакеты, рекомендуется полностью очистить результаты предыдущей сборки и выполнить её повторно.

```bash
cd ~/ws/ugv_ws      # либо ~/ws/roarm_ws

rm -rf build install log

colcon build --symlink-install

source install/setup.bash
```

---

## Пересборка отдельного пакета

Если проблема связана только с одним пакетом, достаточно удалить результаты его сборки и выполнить повторную сборку рабочего пространства.

```bash
rm -rf build/<имя_пакета>
rm -rf install/<имя_пакета>

colcon build --symlink-install
```

Например:

```bash
rm -rf build/moveit_task_constructor_core
rm -rf install/moveit_task_constructor_core

colcon build --symlink-install
```

---

# Примечания

* Репозиторий содержит два независимых рабочих пространства ROS 2.
* Исходный код каждого рабочего пространства хранится в отдельном Git-подмодуле.
* После каждой сборки необходимо выполнить подключение окружения:

Для UGV Rover:

```bash
source ~/ws/ugv_ws/install/setup.bash
```

Для RoArm:

```bash
source ~/ws/roarm_ws/install/setup.bash
```

При первом клонировании репозитория рекомендуется убедиться, что все подмодули успешно инициализированы командой:

```bash
git submodule status
```
