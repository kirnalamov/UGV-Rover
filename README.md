
Этот репозиторий содержит рабочие пространства (workspaces) для управления мобильным роботом (UGV Rover) и манипулятором (RoArm).

---

## 📁 Структура проекта

```text
ws/
├── roarm_ws/      # Workspace для управления манипулятором RoArm
└── ugv_ws/        # Workspace для управления платформой UGV Rover
```

---

## 🚀 Быстрый старт

### 1. Клонирование репозитория

Чтобы репозиторий сразу выкачался в папку **`ws`**, укажите имя целевой директории при клонировании:

**Через SSH:**
```bash
git clone git@github.com:kirnalamov/UGV-Rover.git ws
cd ws
```

**Через HTTPS:**
```bash
git clone https://github.com/kirnalamov/UGV-Rover.git ws
cd ws
```

---

## 🛠 Сборка воркспейсов

Перейдите в нужный воркспейс и соберите пакеты с помощью `colcon` (или `catkin_make` в зависимости от версии ROS):

### UGV Rover Workspace
```bash
cd ugv_ws
colcon build --symlink-install
source install/setup.bash
```

### RoArm Workspace
```bash
cd roarm_ws
colcon build --symlink-install
source install/setup.bash
```

---