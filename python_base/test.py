#!usr/bin/env python
# _*_ coding:utf-8 _*_

def fab(max):
    a, b, n = 0, 1, 1
    while n < max:
        a, b = b, a+b
        n += 1
        yield b


f = fab(6)

print(f.next())
