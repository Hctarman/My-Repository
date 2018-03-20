import os
def rename_files():
    file_list = os.listdir(r"C:\Users\Owner\Pictures\Secret Message")
    print(file_list)
    saved_path = os.getcwd()
    print("Current Working Directory is " + saved_path)
    os.chdir(r"C:\Users\Owner\Pictures\Secret Message")
    for file_name in file_list:
        os.rename(file_name, file_name.translate(None, "0123456789"))
rename_files()
