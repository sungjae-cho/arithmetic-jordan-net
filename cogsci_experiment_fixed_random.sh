exec &> "log_cogsci2019_fixed_random.txt"

sleep_sec=10
experiment_name='cogsci2019'
operand_digits=4
hidden_units=64

start_echo()
{
  i=$1
  operator=$2
  echo "==================================================================="
  echo "Run the $i-th training of ${operand_digits} digit ${operator}"
}

experiment()
{
  operator=$1
  device_num=$2
  for i in {1..100..1}
  	do
      start_echo $i $operator
  		python3 mlp_run.py $experiment_name $operand_digits $operator $hidden_units $device_num
  		#sleep $sleep_sec
  	done
}


experiment 'fixed_random' 0 &
