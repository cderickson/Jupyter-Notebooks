**Variable Types**:<br>
- **INT** : Integers
- **DECIMAL(M,N)** : Floats, N = Total digits, N = Total digits AFTER decimal point
- **VARCHAR(N)** : String of text length N
- **BLOB** : Binary Large Object, stores large data (images, files)
- **DATE** : 'YYYY-MM-DD'
- **TIMESTAMP** : 'YYYY-MM-DD HH:MM:SS'

# Entity Relationship (ER) Diagrams
- **Entity**: Object about which we want to store information.
- **Schema**: Tables and table attributes that will be a part of your database.
- This diagram is a good way to map relationships.
- Turn design requirements into a database schema.

**Attributes**: Specific pieces of information about an entity.<br>
**Primary Key**: Attribute(s) that uniquely identify an entry in the table. Underlined (could also be colored differently but not generally).<br>
**Composite Attribute**: Attribute that can be broken up into sub-attributes (eg. 'name' -> 'fname' + 'lname').<br>
**Multi-Valued Attribute**: An attribute that can have more than one value (eg. 'clubs' a student belongs to). Double-outlined circle.<br>
**Derived Attribute**: An attribute that can be derived from other attributes (eg. 'has_honors' -> anyone with 'gpa' > 3.5). This isn't necessarily something that our table will need to track explicitly. Dotted outlined circle.<br>
**Multiple Entities**: More than one entity can be defined in the ER diagram. This would take the form of a second tree (eg. a 'Class' tree and a 'Student' tree).<br>
**Relationship**: Defines a relationship between two entities. Represented by a diamond with lines between each entity.<br>
**Participation**: Whether all members must participate in the relationship. Partial participation: single line. Total participation: double line.<br>
**Relationship Attribute**: An attribute about the relationship that is stored on the relationship, not on the entity (eg. a 'grade' attribute would not be stored in the 'Student' or 'Class' table.).<br>
**Relationship Cardinality**: The number of instances of an entity from a relation that can be associated with the relation (eg. A 'Student' can take N number of 'Classes' and a 'Class' can be taken by M number of 'Students'). Represented by a number over the relationship line.<br>
**Weak Entity**: An entity that can not be uniquely identifies by its attributes alone (eg. An 'Exam' can not exist without being connected to a 'Class'). Represented by the name of the entity in a double-lined box. Weak entities must always have a total participation (double-lined) relationship to another entity (eg. 'Class' can exist without 'Exam', but 'Exam' can not exist without a connected 'Class'.).
**Identifying Relationship**: A relationship that serves to uniquely identify the weak entity. Represented by a double-lined diamond and lines connecting the two entities.


