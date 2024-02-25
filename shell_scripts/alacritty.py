import subprocess

output = subprocess.check_output(['ls', '-al'])
print(output.decode())

subprocess.run(['mkdir', 'new_directory'])
