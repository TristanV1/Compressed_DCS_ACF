import random


def gen_samples(num_samples):

    samples = []
    outputstr = ""

    for i in range(0,num_samples):
        samples.append(random.randrange(0,11,1))

    for sample in samples:
        outputstr += f"4'd{sample}, "

    return (outputstr,samples)

a,b = gen_samples(125)
print(a)
print()
print(b)


