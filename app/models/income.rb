class Income < ActiveRecord::Base
  belongs_to :user

  def distribute(bucket, distribution_amount)
    zero = BigDecimal.new(0, 8)

    # Calculate the remaining amount after this distribution
    new_current = current_amount - distribution_amount
    # If the amount would go negative
    if new_current <= zero
      # Ensure
      bucket.amount += current_amount
      self.current_amount = zero
    else
      bucket.amount += distribution_amount
      self.current_amount -= distribution_amount
    end
    save
    bucket.save
  end
end
