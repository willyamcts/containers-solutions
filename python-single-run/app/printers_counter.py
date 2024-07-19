import io
import os

filename = 'output_example.log'

# process Unicode text
if os.path.exists(filename):
    with io.open(filename, 'r', encoding='utf8') as f:
        text = f.read()
else:
    os.system(f'touch {filename}')
    text = None

with io.open(filename,'w',encoding='utf8') as f:
    None if text is None else f.write(text)

    # get date to write in file
    time = os.popen('date +"%d/%m/%Y %T %z"').read().strip()
    f.write(f" * Executed in: {time}\n")
