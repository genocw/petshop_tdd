def pet_shop_name(pet_shop)
  return pet_shop[:name]
end


def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end


def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end


def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end


def increase_pets_sold(pet_shop, amount)
  pet_shop[:admin][:pets_sold] += amount
end


def stock_count(pet_shop)
  # get number in pets array
  return pet_shop[:pets].length
end


def pets_by_breed(pet_shop, breed_search)

  all_pets = pet_shop[:pets]
  breed_found = []

  for pet in all_pets
    if pet[:breed] == breed_search
      breed_found.push(pet[:name])
    end
  end

  return breed_found

end


def find_pet_by_name(pet_shop, name)
  all_pets = pet_shop[:pets]
  found = nil

  for pet in all_pets
    if pet[:name] == name
      found = pet
    end
  end

  return found
end


def remove_pet_by_name(pet_shop, name)
  all_pets = pet_shop[:pets]

  for pet in all_pets
    if pet[:name] == name
      all_pets.delete(pet)
    end
  end

end


def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end


def customer_cash(customer)
  return customer[:cash]
end


def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end


def customer_pet_count(customer)
  return customer[:pets].length
end


def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end


def customer_can_afford_pet(customer, new_pet)

  if customer[:cash] >= new_pet[:price]
    return true
  end

  return false

end


def sell_pet_to_customer(pet_shop, new_pet, customer)

  #search for pet name in inventory
  if new_pet == nil
    return
  elsif
    customer_can_afford_pet(customer, new_pet) == false
    return
  else
  #add pet to customer
    add_pet_to_customer(customer, new_pet)
    # inc pets sold by 1
    increase_pets_sold(pet_shop, 1)
    # reduce customer money by price amount
    p remove_customer_cash(customer, new_pet[:price])
    # inc pet_shop money by price amount
    add_or_remove_cash(pet_shop, new_pet[:price])
  end
  # doesn't return
end
