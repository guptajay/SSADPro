class GenerateFIB {
  List<String> question(int world_no, int sect_no, int attempt, int section_state) {
    String question = '';
    String answer = '';

    List<List<String>> FIB_Easy_1 = [['q1Easy', 'a'],
                                      ['q2Easy', 'a'],
                                      ['q3Easy', 'a'],
                                      ];

    List<List<String>> FIB_Medium_1 = [['q4Med', 'a'],
      ['q5Med', 'a'],
      ['q6Med', 'a'],
    ];

    List<List<String>> FIB_Hard_1 = [['q7', 'a'],
      ['q8Hard', 'a'],
      ['q9Hard', 'a'],
    ];



    if (world_no == 1 && sect_no == 1) {
      if (attempt == 1) {
        if(section_state==0 || section_state == 1)
          {
            question = FIB_Easy_1[attempt -1][0];
            answer = FIB_Easy_1[attempt -1][1];
          }

        if(section_state==2 || section_state == 3)
        {
          question = FIB_Medium_1[attempt -1][0];
          answer = FIB_Medium_1[attempt -1][1];
        }

        if(section_state==4 || section_state == 5)
        {
          question = FIB_Hard_1[attempt -1][0];
          answer = FIB_Hard_1[attempt -1][1];
        }

      }

      else if (attempt == 2) {
        if(section_state==0 || section_state == 1)
        {
          question = FIB_Easy_1[attempt -1][0];
          answer = FIB_Easy_1[attempt -1][1];
        }

        if(section_state==2 || section_state == 3)
        {
          question = FIB_Medium_1[attempt -1][0];
          answer = FIB_Medium_1[attempt -1][1];
        }

        if(section_state==4 || section_state == 5)
        {
          question = FIB_Hard_1[attempt -1][0];
          answer = FIB_Hard_1[attempt -1][1];
        }
      }

      else {
        if(section_state==0 || section_state == 1)
        {
          question = FIB_Easy_1[attempt -1][0];
          answer = FIB_Easy_1[attempt -1][1];
        }

        if(section_state==2 || section_state == 3)
        {
          question = FIB_Medium_1[attempt -1][0];
          answer = FIB_Medium_1[attempt -1][1];
        }

        if(section_state==4 || section_state == 5)
        {
          question = FIB_Hard_1[attempt -1][0];
          answer = FIB_Hard_1[attempt -1][1];
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
