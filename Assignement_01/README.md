# Disk Space Usage Monitoring Script

## 1. Introduction
A Bash shell script that monitors disk space usage in a Linux system and displays filesystem details with their usage status.

## 2. Objectives
- Monitor disk space utilization.
- Display total, used, and available storage.
- Identify disk usage as OK, WARNING, or CRITICAL.
- Save disk information into a log file.

## 3. Thresholds

| Usage | Status |
|---|---|
| Below 70% | OK |
| 70% – 89% | WARNING |
| 90% or above | CRITICAL |

## 4. Commands Used

- `df -hP` – Displays disk usage.
- `tail` – Removes the header row.
- `awk` – Processes disk information and checks thresholds.
- `printf` – Formats the output.
- `read` – Accepts user input.
- `case` – Handles user choices.
- `>` – Saves output to a file.

## 5. Execution

```bash
nano disk_monitor.sh
chmod +x disk_monitor.sh
./disk_monitor.sh
```

Choose option 1 to save the report or option 2 to skip saving.

To view the log file:

```bash
cat disk.log
```

## 6. Result
Successfully implemented a disk monitoring script that displays filesystem usage, identifies warning conditions, and saves disk information into a log file.

## 7. Conclusion
This assignment demonstrates Bash scripting, Linux commands, AWK processing, conditional statements, and file handling.
