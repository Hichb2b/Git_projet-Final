import random
import string


def get_rand():
    example = string.ascii_letters + string.digits
    rez = ""
    random_variable = random.randint(8, 20)
    for i in range(random_variable):
        rez += random.choice(example)
    return f"{rez}@gmail.com"