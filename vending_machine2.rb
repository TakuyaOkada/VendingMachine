#! ruby -Ks
class VendingMachine
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
    juice_kind_count = 0
    while juice_kind_count < @array_juice_key.size
      if @total >= @array_juice_key[juice_kind_count][0] && @hash_juice[@array_juice_key[juice_kind_count]] > 0
        p "#{@array_juice_key[juice_kind_count][1]}�͔����܂�"
      end
      juice_kind_count += 1
    end
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
    @drink = juice_kind
    juice_kind_count = 0
    while juice_kind_count < @array_juice_key.size
      if @drink == @array_juice_key[juice_kind_count][1]
        if @total >= @array_juice_key[juice_kind_count][0] && @hash_juice[@array_juice_key[juice_kind_count]] > 0
          @hash_juice[@array_juice_key[juice_kind_count]] = @hash_juice[@array_juice_key[juice_kind_count]] - 1
          @sales = @sales + @array_juice_key[juice_kind_count][0]
          @total = @total - @array_juice_key[juice_kind_count][0]
          p "�ނ�K#{@total}�~"
          @total = 0
        else
          return
        end
      end
      juice_kind_count += 1
    end
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