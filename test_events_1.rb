def monthly_sales
  110
end

target_sales = 100

event "an event always happens" do
  monthly_sales > target_sales
end

event "an event never happens" do
  monthly_sales < target_sales
end