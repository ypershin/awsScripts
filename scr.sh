#bin/bash

pth="http://datasnapshot.pjm.com/content"

# PJM folder to write to
wf="pjm"



function process_link {
	curl -o $wf/$fn.html $pth/$page
	python h2t.py $wf/$fn.html > $wf/$fn.txt
}


arr=(
	'ZonalAggregateLmp.aspx' zonalLmp
	'Constraints.aspx' constraints
	'DispatchRates.aspx' dispatchRates
	'InstantaneousLoad.aspx' instantLoad
	'ForecastedLoad.aspx' forecastedLoad
	'TieFlows.aspx' tieFlows
	'ReactiveTransferInterfaces.aspx' trfInterfaces
	'ReserveQuantities.aspx' reserveQuantities
	'DayAheadLoadHistory.aspx?name=PJM+RTO+Total&viewType=table' daLoadRTO
	'DayAheadLoadHistory.aspx?name=Mid-Atlantic+Region&viewType=table' daLoadMA
    )


n=0
while [ "x${arr[n]}" != "x" ]; do
  page=${arr[n]}
  fn=${arr[n+1]}
  echo $page $fn 
  process_link
  n=$(( $n+2 ))
done


fn=20160211.csv
echo "downloading $fn"
# curl -o $wf/$fn http://ftp.pjm.com/pub/account/lmp/$fn

exit

