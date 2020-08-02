import Foundation

// I wanna make a linkedList waaaahn
class Node {
    let value: Int
    var link: Node?

    init(_ value: Int,_ linkNode: Node?) {
        self.value = value
        self.link = linkNode
    }
    
}

class LinkedList {
    var head: Node?

    func insertElementInOrder(_ value: Int) {
        print("Value to be inserted - \(value)")
        if head == nil {
            head = Node(value, nil)
            return
        }
        var prevNode: Node?
        var currentNode = head
        while currentNode?.link != nil {
            print("In the loop")
            if let currentValue = currentNode?.value, currentValue > value {
                 print("Break condition")
                break
            }
            prevNode = currentNode
            currentNode = currentNode?.link
        }
        if let currentValue = currentNode?.value, currentValue <= value {
            let newNode = Node(value, currentNode?.link)
            if prevNode?.link != nil {
                currentNode?.link = newNode
            } else {
                head?.link = newNode
            }
        } else {
            let newNode = Node(value, currentNode)
            if prevNode?.link != nil {
                prevNode?.link = newNode
            } else {
                head = newNode
            }
        }
    } 

    func insertNewElement(_ value: Int) {
        if head == nil {
            head = Node(value, nil)
            return
        }
        var currentNode = head
        while currentNode?.link != nil {
            currentNode = currentNode?.link
        }
        let newNode = Node(value, nil)
        currentNode?.link = newNode
    }

    func deleteElement(_ value: Int) {
        if (head?.value == value) {
            head = head?.link
            return
        }
        var currentNode = head
        while currentNode?.link != nil, currentNode?.link?.value != value {
            currentNode = currentNode?.link
        }
        currentNode?.link = currentNode?.link?.link
    }

    func displayListItems() {
        var currentNode: Node? = head
        while currentNode != nil {
            print(currentNode?.value ?? "")
            currentNode = currentNode?.link
        } 
    }
}

let sampleLinkedList = LinkedList()
sampleLinkedList.insertElementInOrder(7)
sampleLinkedList.insertElementInOrder(3)
sampleLinkedList.insertElementInOrder(1)
sampleLinkedList.insertElementInOrder(4)
//sampleLinkedList.deleteElement(130)
sampleLinkedList.displayListItems()
