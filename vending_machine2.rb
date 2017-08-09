#! ruby -Ks
class VendingMachine
  def initialize
    @total = 0
    @available_money = [10, 50, 100, 500, 1000]
    @hash_juce = {}
    @array_juce_key = [[120, "�R�[��"], [200, "���b�h�u��"], [100, "��"]]
    juce_kind_count = 0
    while juce_kind_count < @array_juce_key.size
      @hash_juce[@array_juce_key[juce_kind_count]] = 5
      juce_kind_count += 1
    end
    @sales = 0
  end
  
  def insert(insert)
    @insert_money = insert
    if @available_money.include?(@insert_money)
      @total = @total + @insert_money
    else
      p "�ނ�K", @insert_money
    end
  end
  
  def purchasable?
    juce_kind_count = 0
    while juce_kind_count < @array_juce_key.size
      if @total >= @array_juce_key[juce_kind_count][0] && @hash_juce[@array_juce_key[juce_kind_count]] > 0
        p @array_juce_key[juce_kind_count][1], "purchasable"
      else
        p @array_juce_key[juce_kind_count][1], "unpurchasable"
      end
      juce_kind_count += 1
    end
  end
  
  def total
    p "�������z���v", @total
  end
  
  def refund
    p "�ނ�K", @total
    @total = 0
  end
  
  def stock_info
    p "�W���[�X���", @hash_juce
  end
  
  def purchase(juce_kind)
    @drink = juce_kind
    juce_kind_count = 0
    while juce_kind_count < @array_juce_key.size
      if @drink == @array_juce_key[juce_kind_count][1]
        if @total >= @array_juce_key[juce_kind_count][0] && @hash_juce[@array_juce_key[juce_kind_count]] > 0
          @hash_juce[@array_juce_key[juce_kind_count]] = @hash_juce[@array_juce_key[juce_kind_count]] - 1
          @sales = @sales + @array_juce_key[juce_kind_count][0]
          @total = @total - @array_juce_key[juce_kind_count][0]
          p "�ނ�K", @total
          @total = 0
        else
          return
        end
      end
      juce_kind_count += 1
    end
  end
  
  def sale_amount
    p "������z", @sales
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