a = ""

for i in range(1,41):
    a += f"""    $display($time, " ACF_result_{i}=%0d", ACF_result_{i});\n"""

print(a)