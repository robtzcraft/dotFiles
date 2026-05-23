
file_path = "./hyprland/ui.conf"

with open(file_path, "r") as file:
    lines = file.readlines()

with open(file_path, "w") as file:
    for line in lines:
        if "rounding" in line:
            file.write("rounding = 2\n")
        else:
            file.write(line)
