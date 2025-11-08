total = 0

while True:
    entry = input("Number[Enter blank to end]: ")
        
    if entry == "":
        break
    
    total += int(entry)
print("The sum is: ", total)