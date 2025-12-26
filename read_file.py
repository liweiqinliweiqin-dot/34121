import sys

encodings = ['utf-8', 'gbk', 'gb2312', 'cp936']

for encoding in encodings:
    try:
        with open('e:/富婆江南修改/服务端源码/仙玉商城购买处理.txt', 'r', encoding=encoding) as f:
            content = f.read()
            print(f"\n=== Reading with {encoding} ===")
            print(content[:2000])  # 只打印前2000个字符以避免输出过多
            print("\n=== Success with this encoding ===")
            # 将成功读取的内容保存到临时文件
            with open('temp_content.txt', 'w', encoding='utf-8') as out_f:
                out_f.write(content)
            print("Content saved to temp_content.txt")
            sys.exit(0)
    except Exception as e:
        print(f"Error with {encoding}: {e}")

print("Failed to read the file with all tested encodings")