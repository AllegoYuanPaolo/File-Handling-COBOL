from plyer import notification
import subprocess
from random import randint, choice
import time 

content = []
msg = [
    'pahinga ka naman uy😭',
    'batak ka mag code ah HAHAHAHAH',
    'baka ikaw na naman ang highest sa comprog nyan😔',
    'huy kanina ka pa dyan',
    'yayy gumana🥳 ata HAHAHAHA',
    'goodluck lods, kaya mo yan'
    ]

size = 0

with open('counter.txt', 'r') as file:
    for line in file:
        content.append(line.strip())

    size = len(content)
    
if size == 5:
    with open('counter.txt', 'w') as f:
        f.write('')
    
    delay = randint(1, 60)
    time.sleep(delay)
    notification.notify(
        title='Leanne says:',
        message=choice(msg),
        timeout=5
    )