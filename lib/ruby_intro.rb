# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  if arr.empty?
    return 0
  else
    sum=0
    arr.each {|a| sum+=a}
    return sum
  end
end

def max_2_sum arr
  # YOUR CODE HERE
  if arr.empty?
      return 0
    elsif arr.length==1
      return arr[0]
    else
      max1 = arr[0]
      max2 = arr[1]
      for i in 2..arr.length-1
        if max1<max2
          flag = max1
          max1 = max2
          max2=flag
        end
        max2 =[arr[i],max2].max
      end
      return max1+max2
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  for i in 0..arr.length-1
    for j in i+1..arr.length-1
      if arr[i]+arr[j]==n
        return true
      end
    end
  end
  return false
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, "+name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  if s.length==0 
    return false
  elsif ['A','E','I','O','U'].include?(s[0].upcase)
    return false
  elsif s[0]=~ /[[:alpha:]]/
    return true
  else
    return false
  end
end


def binary_multiple_of_4? s
  # YOUR CODE HERE
  #for Fixnum
  if s.class==Fixnum
    if s==0
      return true
    end
    length = Math.log10(s).to_i+1
    #binary number test
    for i in 0..length-1
      if ![0,1].include?(s[i]) 
        return false
      end
    end
    if length>2&&s[0]==0&&s[1]==0
      return true
    end
  end
  #For String
  if s.class==String
    if s[0]=='0' 
      return true
    end
    for i in 0..s.length-1
      if !['0','1'].include?(s[i]) 
        return false
      end
    end
    if s.length>2&&s[s.length-1]=='0'&&s[s.length-2]=='0'
      return true
    end
  end
  return false
end


# Part 3
class BookInStock
# YOUR CODE HERE
@@isbn
@@price
  
  def initialize(isbn,price)
    if isbn.empty?||price<=0
      raise ArgumentError
    end
    @@isbn = isbn
    @@price = price
  end

  def isbn
    return @@isbn
  end
  def isbn=(value)
    if isbn.empty?
      raise ArgumentError
    end
      @@isbn = value
  end
  
  def price
    return @@price
  end
  def price=(value)
    if price<0
      raise ArgumentError
    end
      @@price = value
  end
  
  def price_as_string
    res = '$'+((@@price*100).round/100.0).to_s
    if res[res.length-2]=='.' 
      res+='0'
    end
    return res
  end
end