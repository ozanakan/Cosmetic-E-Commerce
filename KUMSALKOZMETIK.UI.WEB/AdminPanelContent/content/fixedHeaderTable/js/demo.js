$(document).ready(function() {
    $('#myTable01').fixedHeaderTable({ footer: false, cloneHeadToFoot: true, altClass: 'odd', autoShow: true });
    //$('#myTable01').fixedHeaderTable({ width: auto });
    
    $('#myTable02').fixedHeaderTable({ footer: true, altClass: 'odd' });
    
    $('#myTable05').fixedHeaderTable({ altClass: 'odd', footer: true, fixedColumns: 1 });
    
    $('#myTable03').fixedHeaderTable({ altClass: 'odd', footer: true, fixedColumns: 1 });
    
    $('#myTable04').fixedHeaderTable({ altClass: 'odd', footer: false, cloneHeadToFoot: true, fixedColumns: 3 });
});
