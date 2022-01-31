function fast_dist_lte(x1,y1,x2,y2,d){
	var xx = x1-x2;
	var yy = y1-y2;
	return xx*xx + yy*yy <= d*d;
}

function fast_dist_gte(x1,y1,x2,y2,d){
	var xx = x1-x2;
	var yy = y1-y2;
	return xx*xx + yy*yy >= d*d;
}