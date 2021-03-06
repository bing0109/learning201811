#!usr/bin/env python
# _*_ coding:utf-8 _*_


学习目标：
掌握进程和线程的基本概念及应用方法


课程内容：
    a.进程和线程
    b.多线程


a.进程和线程
    进程：正在运行的程序实例
    线程：进程的一个实体，被系统独立调度分配基本单位，线程自己不拥有系统资源，他可以和同属一个进程的线程共享资源

    区别：
        1.地址空间：进程内的一个指定单元，进程至少有一个线程，他们共享进程的地址空间，进程拥有自己的独立空间
        2.资源拥有：进程的资源分配和拥有单位，同一个进程内线程共享进程资源
        3.线程是处理器调度的基本单位，进程不是
        4.二者都可以并发执行


b.多线程
    需导入模块：threading
    加速程序及计算的有效方式
    1.添加线程
        import threading
        print(threading.active_count())    #获取当前线程的数量
        print(threading.current_thread())   #查看当前运行的线程

        # 添加线程
        def thread_job():
            print('当前的线程是%s' % threading.current_thread())

        def thread_job2():
            print('当前的线程是%s' % threading.current_thread())

        thread1 = threading.Thread(target=thread_job)
        thread2 = threading.Thread(target=thread_job2)
        thread1.start()
        thread2.start()

    2.join功能
        如果不加join功能，此程序输出可能会混乱，执行完全取决于线程的执行速度，
        通过join可以进行控制

        import threading
        import time

        def t1():
            print('t1开始了')
            for i in range(10):
                time.sleep(0.1)
            print('t1结束了')

        def t2():
            print(‘t2开始了’)
            print('')


        th1 = threading.Thread(target=t1)
        th2 = threading.Thread(target=t2)
        th1.start()
        th2.start()
        th1.join()
        th2.join()
        print('finish')


    3.gil
        python完全支持多线程编程，但代码并行是不安全的，通常会有一个 全局解释器锁 进行控制，确保任何时候只有一个线程在执行
        伪并发、伪并行

    4.线程锁
        lock在不同线程中共享同一内存的时候，互相之间不影响，使用lock方法是在每个线程执行运行修改之前，执行lock.aquire()将内存上锁
        import threading
        def job1():
            global a, lock
            lock.acquire()
            for i in range(10):
                a += 1
                print('job',a)
            lock.release()


        def job2():
            global a, lock
            lock.acquire()
            for i in range(10):
                a += 10
                print('job2', a)
            lock.release()

        lock = threading.Lock()
        a = 0
        th1 = threading.Thread(target=job1)
        th2 = threading.Thread(target=job2)
        th1.start()
        th2.start()
        th2.join()
        th1.join()













