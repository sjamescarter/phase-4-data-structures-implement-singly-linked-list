require_relative './node'
require 'pry'

class LinkedList
  attr_accessor :head
  
  def initialize
    @head = nil
  end
  
  def prepend(node)
    if head.nil?
      self.head= node
    else
      node.next_node= self.head
      self.head= node
    end

  end

  def append(node)
    if head.nil?
      self.head= node
      return
    end
    
    last_node = head
    while last_node.next_node
      last_node = last_node.next_node
    end
    
    last_node.next_node = node
  end

  def delete_head
    if head.nil?
      return 
    elsif head.next_node
      self.head= self.head.next_node
    else
      self.head= nil
    end
  end

  def delete_tail
    if head.nil?
      return
    else
      last_node = head
      index = 0
      while last_node.next_node
        last_node = last_node.next_node
        index += 1
      end
      if last_node == head
        self.head = nil
      else
        index_node = head
        (index - 1).times do 
          index_node = index_node.next_node
        end
        index_node.next_node = nil
      end
    end
  end

  def add_after(index, node)
    index_node = head
    (index - 1).times do 
      index_node = index_node.next_node
    end
    if index_node.next_node.nil?
      index_node.next_node = node
      return
    end
    index_node = index_node.next_node
    node.next_node = index_node.next_node
    index_node.next_node = node
  end

  def search(value)
    if head.data == value
      return head
    else
      next_node = head
      while next_node.next_node
        next_node = next_node.next_node
        if next_node.data == value
          return next_node
        end
      end
    end
  end
end
