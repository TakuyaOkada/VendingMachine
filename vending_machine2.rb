#! ruby -Ks
class VendingMachine
  a = 0
  def initialize
    @total = 0
    @available_money = [10, 50, 100, 500, 1000]
    @hash_juice = {}
    @array_juice_key = [[120, "�R�[��"], [200, "���b�h�u��"], [100, "��"]]
    @array_juice_key.each{|key| @hash_juice[key] = 5}
    @sales = 0
  end
  
  def insert(insert)
    if @available_money.include?(insert)
      @total = @total + insert
    else
      p "�ނ�K#{insert}�~"
    end
  end
  
  def purchasable?
    @hash_juice.each{|key, value|
      if @total >= key[0] && value > 0
        p "#{key[1]}�͔����܂�"
      end
    }
  end
  
  def total
    return @total
  end
  
  def refund
    p "�ނ�K#{@total}�~"
    @total = 0
  end
  
  def stock_info
    return @hash_juice
  end
  
  def purchase(juice_kind)
    @hash_juice.each{|key, value|
      if juice_kind == key[1]
        if @total >= key[0] && value > 0
          @hash_juice[key] = @hash_juice[key] - 1
          @sales = @sales + key[0]
          @total = @total - key[0]
          p "�ނ�K#{@total}�~"
          @total = 0
        end
      end
    }
  end
  
  def sale_amount
    p "������z#{@sales}�~"
  end
  
end

machine = VendingMachine.new()
machine.insert(10)
machine.insert(50)
machine.total
machine.insert(5)
machine.refund
machine.stock_info
machine.insert(100)
machine.insert(50)
machine.purchasable?
machine.purchase("�R�[��")
machine.sale_amount