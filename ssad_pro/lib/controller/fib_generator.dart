class GenerateFIB {
  List<String> question(
      int world_no, int sect_no, int attempt, int section_state) {
    String question = '';
    String answer = '';

    List<List<String>> FIB_Easy_1 = [
      [
        'Which diagram graphically represents what happens when an actor interacts with a system? ',
        'Use Case'
      ],
      ['There are how many types of actors in a use case diagram? ', 'Two'],
      [
        'What is textually describing the use case scenarios called? ',
        'Use Case Description'
      ],
    ];

    List<List<String>> FIB_Medium_1 = [
      [
        'What is an external agent who lies outside the system but still interacts with it called? ',
        'Actor'
      ],
      [
        'What is an external agent who lies outside the system but still interacts with it called? ',
        'Actor'
      ],
      [
        'Which type of actor requires assistance from the system to achieve a goal? ',
        'Primary'
      ],
    ];

    List<List<String>> FIB_Hard_1 = [
      [
        'Which relationship denotes a connection between two interactions when an interaction is invoked by another?',
        'Include'
      ],
      [
        'Which relationship denotes a connection between two interactions when an interaction is invoked by another?',
        'Include'
      ],
      [
        'What is used when a use case conditionally adds steps to another first-class use case?',
        'Extend'
      ],
    ];

    if (world_no == 1 && sect_no == 1) {
      if (attempt == 1) {
        if (section_state == 0 || section_state == 1) {
          question = FIB_Easy_1[attempt - 1][0];
          answer = FIB_Easy_1[attempt - 1][1];
        }

        if (section_state == 2 || section_state == 3) {
          question = FIB_Medium_1[attempt - 1][0];
          answer = FIB_Medium_1[attempt - 1][1];
        }

        if (section_state == 4 || section_state == 5) {
          question = FIB_Hard_1[attempt - 1][0];
          answer = FIB_Hard_1[attempt - 1][1];
        }
      } else if (attempt == 2) {
        if (section_state == 0 || section_state == 1) {
          question = FIB_Easy_1[attempt - 1][0];
          answer = FIB_Easy_1[attempt - 1][1];
        }

        if (section_state == 2 || section_state == 3) {
          question = FIB_Medium_1[attempt - 1][0];
          answer = FIB_Medium_1[attempt - 1][1];
        }

        if (section_state == 4 || section_state == 5) {
          question = FIB_Hard_1[attempt - 1][0];
          answer = FIB_Hard_1[attempt - 1][1];
        }
      } else {
        if (section_state == 0 || section_state == 1) {
          question = FIB_Easy_1[attempt - 1][0];
          answer = FIB_Easy_1[attempt - 1][1];
        }

        if (section_state == 2 || section_state == 3) {
          question = FIB_Medium_1[attempt - 1][0];
          answer = FIB_Medium_1[attempt - 1][1];
        }

        if (section_state == 4 || section_state == 5) {
          question = FIB_Hard_1[attempt - 1][0];
          answer = FIB_Hard_1[attempt - 1][1];
        }
      }
    } else if (world_no == 1 && sect_no == 2) {
      if (attempt == 1) {
        question = 'A ______ is a stable condition of a system';
        answer = 'state';
      } else if (attempt == 2) {
        question = 'Attempt 2';
        answer = 'data dictionary';
      } else {
        question = 'Attempt 3';
        answer = 'data dictionary';
      }
    } else if (world_no == 1 && sect_no == 3) {
      if (attempt == 1) {
        question = '______ layer has entity classes';
        answer = 'presentation data';
      } else if (attempt == 2) {
        question = 'Attempt 2';
        answer = 'data dictionary';
      } else {
        question = 'Attempt 3';
        answer = 'data dictionary';
      }
    } else if (world_no == 1 && sect_no == 4) {
      if (attempt == 1) {
        question = 'SRS is called Software _______ Specification';
        answer = 'requirement';
      } else if (attempt == 2) {
        question = 'Attempt 2';
        answer = 'data dictionary';
      } else {
        question = 'Attempt 3';
        answer = 'data dictionary';
      }
    } else if (world_no == 1 && sect_no == 5) {
      if (attempt == 1) {
        question = 'Sequence diagram is a ________ model';
        answer = 'dynamic';
      } else if (attempt == 2) {
        question = 'Attempt 2';
        answer = 'data dictionary';
      } else {
        question = 'Attempt 3';
        answer = 'data dictionary';
      }
    }
    List<String> fib = [question, answer];
    return fib;
  }
}
