import Foundation

// Домашнее задание
// Создать три очереди. Каждой присвоить соответсвенно номер 1,2,3.
// Реализовать вывод в консоль последовательность 1,2,3 - 2,3,1 - 3,1,2

func printSeparator() {
    sleep(1)
    print("🍎")
}

func threadLauncher(threads: [Thread]) {
    for (i, t) in threads.enumerated() {
        if i == 0 {
            t.qualityOfService = .userInteractive
        } else if i == 1 {
            t.qualityOfService = .userInitiated
        } else {
            t.qualityOfService = .utility
        }
    }
    threads.forEach { t in
        t.start()
    }
}

func grabThreads() -> [Thread] {
    [Thread {
        print("1")
        },
     Thread {
        print("2")
        },
     Thread {
        print("3")
        }
    ]
}

print("вариант 1 (потоки):\n----------")

var tt = grabThreads()
threadLauncher(threads: [tt[0], tt[1], tt[2]])

printSeparator()

tt = grabThreads()
threadLauncher(threads: [tt[1], tt[2], tt[0]])

printSeparator()

tt = grabThreads()
threadLauncher(threads: [tt[2], tt[0], tt[1]])

/* sleep(1)
print("\nвариант 2 (очереди):\n----------")

//
// вариант 2: проходили вроде потоки, но в условии задания говорится, что создать нужно очереди ... 😵
//

func queueLauncher(_ xx: [Int]) {
    for (i, x) in xx.enumerated() {
        let q: DispatchQueue
        if i == 0 {
            q = DispatchQueue.global(qos: .userInteractive)
        } else if i == 1 {
            q = DispatchQueue.global(qos: .default)
        } else {
            q = DispatchQueue.global(qos: .utility)
        }
        q.async {
            print(x)
        }
    }
    printSeparator()
}

queueLauncher([1, 2, 3])
queueLauncher([2, 3, 1])
queueLauncher([3, 1, 2]) */

sleep(5)
