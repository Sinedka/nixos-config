ROOT_DIR="./modules"

# Рекурсивно обходим все папки
find "$ROOT_DIR" -type d | while read -r dir; do
    QMLDIR_FILE="$dir/qmldir"
    echo "module $(basename "$dir")" > "$QMLDIR_FILE"

    # Перечисляем все QML файлы в этой папке
    for file in "$dir"/*.qml; do
        # Проверяем, что файл существует
        [ -f "$file" ] || continue
        FILENAME=$(basename "$file")
        # Добавляем строку в qmldir: ИмяКласса 1.0 ИмяФайла.qml
        CLASS_NAME="${FILENAME%.qml}"
        echo "$CLASS_NAME 1.0 $FILENAME" >> "$QMLDIR_FILE"
    done

    echo "Создан qmldir в $dir"
done
