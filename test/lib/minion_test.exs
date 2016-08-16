defmodule AssembleTheMinions.MinionTest do
  use ExUnit.Case
  doctest AssembleTheMinions.Minion

  test "Returns a hello message" do
    AssembleTheMinions.Minion.start_link(:kevin)

    message = AssembleTheMinions.Minion.say_hello(:kevin)

    assert message == "Hello from kevin"
  end

  test "Can return the count and increment it" do
    AssembleTheMinions.Minion.start_link(:jorge)

    count = AssembleTheMinions.Minion.current_count(:jorge)

    assert count == 0

    AssembleTheMinions.Minion.count(:jorge)

    second_count = AssembleTheMinions.Minion.current_count(:jorge)

    assert second_count == 1
  end

  test "Changing on minion's count doesn't affect another's" do
    AssembleTheMinions.Minion.start_link(:kevin)
    AssembleTheMinions.Minion.start_link(:jorge)

    AssembleTheMinions.Minion.count(:kevin)
    AssembleTheMinions.Minion.count(:kevin)

    kevin_count = AssembleTheMinions.Minion.current_count(:kevin)
    jorge_count = AssembleTheMinions.Minion.current_count(:jorge)

    assert jorge_count == 0

    assert kevin_count == 2
  end

  test "Minions can perform addition" do
    AssembleTheMinions.Minion.start_link(:addam)

    AssembleTheMinions.Minion.add(:addam, 5)

    addam_count = AssembleTheMinions.Minion.current_count(:addam)

    assert addam_count == 5
  end

  test "Minions can perform subtraction" do
    AssembleTheMinions.Minion.start_link(:subtractam)

    AssembleTheMinions.Minion.subtract(:subtractam, 5)

    sub_count = AssembleTheMinions.Minion.current_count(:subtractam)

    assert sub_count == -5
  end
end
