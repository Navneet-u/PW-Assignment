#!/bin/bash
# Interactive command-line To-Do List
# Save tasks to todo.txt

TODO_FILE="todo.txt"
touch "$TODO_FILE"

show_menu() {
    echo "===== TO-DO LIST MENU ====="
    echo "1. View tasks"
    echo "2. Add a task"
    echo "3. Remove a task"
    echo "4. Exit"
    echo "==========================="
}

view_tasks() {
    if [ ! -s "$TODO_FILE" ]; then
        echo "No tasks found."
    else
        echo "Your tasks:"
        nl -w2 -s'. ' "$TODO_FILE"
    fi
}

add_task() {
    read -p "Enter the task to add: " TASK
    echo "$TASK" >> "$TODO_FILE"
    echo "Task added!"
}

remove_task() {
    view_tasks
    read -p "Enter the task number to remove: " TASK_NUM
    if [ "$TASK_NUM" -gt 0 ] 2>/dev/null && [ "$TASK_NUM" -le $(wc -l < "$TODO_FILE") ]; then
        sed -i "${TASK_NUM}d" "$TODO_FILE"
        echo "Task removed!"
    else
        echo "Invalid task number."
    fi
}

while true; do
    show_menu
    read -p "Choose an option [1-4]: " CHOICE
    case $CHOICE in
        1) view_tasks ;;
        2) add_task ;;
        3) remove_task ;;
        4) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option, try again." ;;
    esac
    echo ""
done

