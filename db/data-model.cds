namespace demo.db;

using { cuid } from '@sap/cds/common';
using {reusable.types as types} from './reusable-types';
@assert.unique: {
  email: [email]
}
entity employee:cuid {
    fname : String;
    lname : String;
    gender: String;
    dob  : Date;
    age : String;
    email : String;
    phonenumber : String;
  department  :  Association to Department;
    
}

entity Department : cuid {
  name        : String;
  description : String;
  headCount   : Integer;
}

 