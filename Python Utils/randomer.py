import random

 
messages = [
    'Kaya mo yan!',
    'Fighting!',
    'Galingan mo para maturuan mo si Leanne!',
    'Matutuwa si Leanne sayo pag magaling ka dyan!',
    'What if chat mo si Leanne? Kamustahin lang, ganun'
]

maxLen = len(messages)
msg = random.randint(0, maxLen-1)

print(f"\n{messages[msg]}")