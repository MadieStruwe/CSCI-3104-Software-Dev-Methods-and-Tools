double coord_2d_area_triangle(const coord_2d_t* a, 
							const coord_2d_t* b, 
							const coord_2d_t* c)
{
	double area;
	area = abs(((a.x)((b.y)-(c.y)) + (b.x)((c.y)-(a.y)) + (c.x)((a.y)-(b.y)))/2);
	return area
}

double sum_of_x_coord(const coord_2d_t* a, 
					const coord_2d_t* b, 
					const coord_2d_t* c)
{
	double sum;
	sum = a.x+b.x+c.x;
	return sum;
}

double midpoint_of_triangle(const coord_2d_t* a, 
					const coord_2d_t* b, 
					const coord_2d_t* c)
{
	double midpoint_x, midpoint_y;
	midpoint_x = (a.x+b.x+c.x)/3;
	midpoint_y = (a.y+b.y+c.y)/3;
	
}