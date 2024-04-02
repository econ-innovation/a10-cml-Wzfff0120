source_file="assignment_cml/pubnr_cn.txt"

target_dir="target_directory"

file_count=0
dir_count=0

mkdir -p "$target_dir"

while IFS= read -r line; do
    # 每处理 100 个文件，创建一个新的子文件夹
    if [ $file_count -eq 100 ]; then
        ((dir_count++))
        file_count=0
        mkdir -p "$target_dir/$dir_count"
    fi
    # 移动文件到目标文件夹
    mv "$line" "$target_dir/$dir_count"
    
    ((file_count++))
done < "$source_file"