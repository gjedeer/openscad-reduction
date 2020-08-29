/* Pipe reducer fitting, good for HAVC, gutters and other low pressure applications.
   The upper part is defined by its INNER diameter because a pipe is supposed to be placed into it. The lower part is defined by its OUTER diameter because it's supposed to go into another pipe.
   There's no room for the gasket so make sure to leave a millimeter or two for silicone

  */
  
/* Redukcja rury, powinna dać się zastosować do wentylacji czy rynien gdzie ciśnienie jest niewielkie.
   Górna część redukcji jest opisana przez średnicę wewnętrzną ponieważ wchodzi do niej inna rura. Dolna część jest opisana przez średnicę zewnętrzną, ponieważ wchodzi do innej rury.
   Nie jest przewidziane miejsce na uszczelkę więc dobrze jest zostawić w górnej części milimetr albo dwa luzu na silikon.
  */
   

/* The inner diameter of the top part */
ID = 80;
IR = ID/2;
/* Length of the top part */
larger_length = 70;

/* The outer diameter of the lower part */
OD = 75;
OR = OD / 2;
/* Length of the bottom part */
smaller_length = 70;

/* Length of the middle part */
reduction_length = 50;
/* Thickness of the pipe wall */
thickness = 2;

module larger() {
    difference() {
        cylinder(r=IR+thickness, h=larger_length, $fn=100);
        cylinder(r=IR, h=larger_length, $fn=100);
    }
}

module reduction() {
    difference() {
        cylinder(r1=OR, r2=IR+thickness, h=reduction_length, $fn=100);
        cylinder(r1=OR-thickness, r2=IR, h=reduction_length, $fn=100);
    }
}

module smaller() {
    difference() {
        cylinder(r=OR, h=smaller_length, $fn=100);
        cylinder(r=OR-thickness, h=smaller_length, $fn=100);
    }
}

translate([0,0,reduction_length+smaller_length]) larger();
translate([0,0,smaller_length]) reduction();
smaller();
