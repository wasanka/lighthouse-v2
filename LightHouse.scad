$fn = 60;

module piece1(){
    
    difference(){
        union(){
            translate([0, 0, -13]) cylinder(15, d=22);
            translate([0, 0, -12]) cylinder(3, d=35);
            translate([0, 0, -13]) cylinder(2, d=45);
        }

        union(){
            for(i=[0:10]){
                rotate([0,0,i*32.5]) translate([12, 0, 1]) rotate([90, 0, 90]) cylinder(6.8, d=4.85, center = true);
            }
            translate([0, 0, -15]) cylinder(25, d=18);
        }
    }
    
    for(i=[0:15]){
        rotate([0,0,i*22.5]) translate([18,0,-12]){
                difference(){
                    cube([4, 3,7]);
                    rotate([0, 30, 0]) translate([-7, -1, 0]) cube([5, 4.5,15]);
                    translate([3.5, -1, 2]) cube([1, 5, 1]);
                    translate([3.5, -1, 4]) cube([1, 5, 1]);
                }
            } 
    }
    
}

module piece1b(){
    
    difference(){
        union(){
            translate([0, 0, -36]) cylinder(h=25, r1=20, r2=15, center=false);
            translate([0, 0, -36]) cylinder(2, d=60);
        }
        union(){
            for(i=[0:3]){
                rotate([0, 0, i * 90]) translate([21, 0, -25]) cube([10, 10,15], center = true);
            }
            translate([0, 0, -37]) cylinder(h=30, r1=15, r2=10, center=false);
        }
    }
    
    for(i=[0:15]){
        rotate([0,0,i*22.5]) translate([24,0,-35]){
                difference(){
                    cube([5, 3,10]);
                    rotate([0, 30, 0]) translate([-7, -1, 0]) cube([5, 4.5,15]);
                    translate([4.5, -1, 2]) cube([1, 5, 1]);
                    translate([4.5, -1, 4]) cube([1, 5, 1]);
                    translate([4.5, -1, 6]) cube([1, 5, 1]);
                    translate([4.5, -1, 8]) cube([1, 5, 1]);
                }
            } 
    }
}

module piece2(){
    difference(){
        union(){
            translate([0, 0, -48]) cylinder(h=24, r1=20, r2=18, center=true);
            translate([0, 0, -38]) cylinder(2, d=60);
        }
        translate([0, 0, -47]) cylinder(h=28, r1=16, r2=18, center=true);
    }
    for(i=[0:15]){
        rotate([0,0,i*22.5]) translate([20,0,-38]){
            translate([3,0,0]) cube([9, 3, 3], center=true);
            difference(){
                rotate([90, 0, 0]) translate([4,1,0]) cylinder(3, d = 10, center = true);
                translate([3,0,5.5]) cube([15, 5, 8], center=true);
            }
            translate([3,0,-6]) rotate([0, 30, 0]) cube([3, 3, 10], center = true, $fn = 4);
            translate([1.8,0,-9]) rotate([0, 10, 0]) cube([3, 3, 20], center = true, $fn = 4);
            translate([0,0,-10]) cube([3, 3, 20], center=true);
        }
    }
}

module tower(){


translate([0, 0, -180]) cylinder(h=245, r1=40, r2=20, center=true);
}

module doorTop(){
    difference(){
        union(){
            cylinder(h=3, r=52, center=true, $fn=8);
            translate([0, 0, 6]) cube([20, 20, 15],center = true);
            translate([0, 0, 3]) cylinder(h=5, r=40, center=true);
        }
        translate([0, 0, 6]) cube([15, 15, 25],center = true);
    }
}

module foundation(){
    difference(){
    union(){
    cylinder(h=3, r=60, center=true, $fn=8);
    translate([0, 0, -3]) cylinder(h=3, r=64, center=true, $fn=8);
    translate([0, 0, -6]) cylinder(h=3, r=68, center=true, $fn=8);
    translate([0, 0, -9]) cylinder(h=3, r=72, center=true, $fn=8);
    translate([0, 0, 2]) cylinder(h=2, r=46, center=true, $fn=8);
    }
    translate([0, 0, 0]) cylinder(h=40, r=36, center=true, $fn=8);
}
}

module post(){
    translate([0, 0, 10]) difference(){
                    cube([5, 3,20]);
                    translate([4.5, -1, 4]) cube([1, 5, 1]);
                    translate([4.5, -1, 8]) cube([1, 5, 1]);
                    translate([4.5, -1, 12]) cube([1, 5, 1]);
                    translate([4.5, -1, 16]) cube([1, 5, 1]);
    }
}

module base(){
    difference(){
        translate([0, 0, 11]) cube([165, 165, 4], center=true);
        translate([0, 0, 12]) cube([150, 150, 2], center=true);
        translate([0, 0, 12]) cube([140, 140, 10], center=true);
    }
    translate([0, 30, 11]) cube([165, 10, 4], center=true);
    translate([0, -30, 11]) cube([165, 10, 4], center=true);
    
    for(i=[0:3]){
        rotate([0, 0, i * 90]){
            translate([75, 0, 0]) post();
            for(j=[0:4]){
                translate([75, j * 16, 0]) post();
            }
            for(j=[0:4]){
                translate([75, -j * 16, 0]) post();
            }
        }
    }
    
}

module doors(){
    for(i=[0:0]){
        rotate([0, 0, i*45 + 22.5]) translate([44, 0, 0]){
            difference(){
                cube([3, 40, 40],center = true);
                translate([0, -20, 0]) rotate([0, 0, 22.5 + 45]) cube([3, 10, 45],center = true);
                translate([0, 20, 0]) rotate([0, 0, -22.5 - 45]) cube([3, 10, 45],center = true);
                translate([0, 0, 0]) cube([5, 30, 3],center = true);
                translate([0, 0, 2.5]) cube([5, 32, 3],center = true);
                translate([0, 0, 5]) cube([5, 30, 3],center = true);
                translate([0, 0, 7.5]) cube([5, 32, 3],center = true);
                translate([0, 0, 10]) cube([5, 30, 3],center = true);
                translate([0, 0, 12.5]) cube([5, 32, 3],center = true);
                translate([0, 0, 15]) cube([5, 30, 3],center = true);
                
                translate([0, 0, -2.5]) cube([5, 32, 3],center = true);
                translate([0, 0, -5]) cube([5, 30, 3],center = true);
                translate([0, 0, -7.5]) cube([5, 32, 3],center = true);
                translate([0, 0, -10]) cube([5, 30, 3],center = true);
                translate([0, 0, -12.5]) cube([5, 32, 3],center = true);
            }
        }
    }
    
}

module roof(){
    translate([0, 0, -10]) cylinder(3, d=35);
    cylinder(h=15, r1=23, r2=3, center=true, $fn=8);
    
}

translate([0, 0, 20]) roof();
//piece1();
//piece1b();
//piece2();
//tower();
//translate([0, 0, -333]) doorTop();
//translate([0, 0, -325]) doors();
//doors();
//translate([0, 0, -343]) foundation();
//translate([0, 0, -370]) base();