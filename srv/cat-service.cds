using { demo.db as my} from '../db/data-model';

@path: '/EmployeeSRV'
service employeeService@(require:'autrhenticated-user') { 
    @odata.draft.enabled
entity employee @(restrict:[
{
    grant:['*'],
    to:'Admin'
},
{
    grant:['READ'],
    to:'Nigama'
}

]) as projection on my.employee;
entity Department  @(restrict:[
{
    grant:['*'],
    to:'Admin'
},
{
    grant:['READ','UPDATE'],
    to:'Kalyani'
},
{
    grant:['READ'],
    to:'Deva'
}


]) as projection on my.Department;

}
annotate employeeService.employee with @(UI:{
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Employee Details',
        TypeNamePlural : 'Employees Data',
    },
    SelectionFields  : [ ID, fname, lname, age, 
    ],
    LineItem  : [
        {
            Value :ID
        },
        {
            Value :fname
        },
        {
            Value :lname
        },
        {
            Value :age
        },
        {
            Value :email
        },
        
    ],
  Facets  : [{
    $Type : 'UI.ReferenceFacet',
    Label : 'Employee details',
    Target : '@UI.FieldGroup#Main'
  }],
  FieldGroup #Main  : {Data : [
    {
        Value: ID,
        Label: 'ID'
    },
    {
        Value: fname,
        Label: 'First Name'
    },
    {
        Value: lname,
        Label: 'Last Name'
    },
    {
        Value: age,
        Label: 'Age'
    },
    {
        Value: email,
        Label: 'Email'
    },
  ]
  },

});


