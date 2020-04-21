class GenerateMatch {
  List<String> question(int world, int section, int attempt, int section_state) {
    String question1 = '';
    String question2 = '';
    String question3 = '';
    String question4 = '';
    String option1 = '';
    String option2 = '';
    String option3 = '';
    String option4 = '';

    List<List<String>> Match_Easy_1 = [['q1Easy', 'q', 'q', 'q', 'o', 'o', 'o', 'o'],
      ['q2Easy', 'q', 'q', 'q', 'o', 'o', 'o', 'o'],
      ['q3', 'q', 'q', 'q', 'o', 'o', 'o', 'o']];

    List<List<String>> Match_Medium_1 = [['q4Med', 'q', 'q', 'q', 'o', 'o', 'o', 'o'],
      ['q5Med', 'q', 'q', 'q', 'o', 'o', 'o', 'o'],
      ['q6Med', 'q', 'q', 'q', 'o', 'o', 'o', 'o']];

    List<List<String>> Match_Hard_1 = [['q7', 'q', 'q', 'q', 'o', 'o', 'o', 'o'],
      ['q8Hard', 'q', 'q', 'q', 'o', 'o', 'o', 'o'],
      ['q9Hard', 'q', 'q', 'q', 'o', 'o', 'o', 'o']];


    if (world == 1 && section == 1) {
      if (attempt == 1) {
        if(section_state ==0 || section_state==1)
          {
            question1 = Match_Easy_1[attempt-1][0];
            question2 = Match_Easy_1[attempt-1][1];
            question3 = Match_Easy_1[attempt-1][2];
            question4 = Match_Easy_1[attempt-1][3];
            option1 = Match_Easy_1[attempt-1][4];
            option2 = Match_Easy_1[attempt-1][5];
            option3 = Match_Easy_1[attempt-1][6];
            option4 = Match_Easy_1[attempt-1][7];
          }

        if(section_state ==2 || section_state==3)
        {
          question1 = Match_Medium_1[attempt-1][0];
          question2 = Match_Medium_1[attempt-1][1];
          question3 = Match_Medium_1[attempt-1][2];
          question4 = Match_Medium_1[attempt-1][3];
          option1 = Match_Medium_1[attempt-1][4];
          option2 = Match_Medium_1[attempt-1][5];
          option3 = Match_Medium_1[attempt-1][6];
          option4 = Match_Medium_1[attempt-1][7];
        }

        if(section_state ==4 || section_state==5)
        {
          question1 = Match_Hard_1[attempt-1][0];
          question2 = Match_Hard_1[attempt-1][1];
          question3 = Match_Hard_1[attempt-1][2];
          question4 = Match_Hard_1[attempt-1][3];
          option1 = Match_Hard_1[attempt-1][4];
          option2 = Match_Hard_1[attempt-1][5];
          option3 = Match_Hard_1[attempt-1][6];
          option4 = Match_Hard_1[attempt-1][7];
        }

      }

      else if (attempt == 2) {
        if(section_state ==0 || section_state==1)
        {
          question1 = Match_Easy_1[attempt-1][0];
          question2 = Match_Easy_1[attempt-1][1];
          question3 = Match_Easy_1[attempt-1][2];
          question4 = Match_Easy_1[attempt-1][3];
          option1 = Match_Easy_1[attempt-1][4];
          option2 = Match_Easy_1[attempt-1][5];
          option3 = Match_Easy_1[attempt-1][6];
          option4 = Match_Easy_1[attempt-1][7];
        }

        if(section_state ==2 || section_state==3)
        {
          question1 = Match_Medium_1[attempt-1][0];
          question2 = Match_Medium_1[attempt-1][1];
          question3 = Match_Medium_1[attempt-1][2];
          question4 = Match_Medium_1[attempt-1][3];
          option1 = Match_Medium_1[attempt-1][4];
          option2 = Match_Medium_1[attempt-1][5];
          option3 = Match_Medium_1[attempt-1][6];
          option4 = Match_Medium_1[attempt-1][7];
        }

        if(section_state ==4 || section_state==5)
        {
          question1 = Match_Hard_1[attempt-1][0];
          question2 = Match_Hard_1[attempt-1][1];
          question3 = Match_Hard_1[attempt-1][2];
          question4 = Match_Hard_1[attempt-1][3];
          option1 = Match_Hard_1[attempt-1][4];
          option2 = Match_Hard_1[attempt-1][5];
          option3 = Match_Hard_1[attempt-1][6];
          option4 = Match_Hard_1[attempt-1][7];
        }



      } else {
        if(section_state ==0 || section_state==1)
        {
          question1 = Match_Easy_1[attempt-1][0];
          question2 = Match_Easy_1[attempt-1][1];
          question3 = Match_Easy_1[attempt-1][2];
          question4 = Match_Easy_1[attempt-1][3];
          option1 = Match_Easy_1[attempt-1][4];
          option2 = Match_Easy_1[attempt-1][5];
          option3 = Match_Easy_1[attempt-1][6];
          option4 = Match_Easy_1[attempt-1][7];
        }

        if(section_state ==2 || section_state==3)
        {
          question1 = Match_Medium_1[attempt-1][0];
          question2 = Match_Medium_1[attempt-1][1];
          question3 = Match_Medium_1[attempt-1][2];
          question4 = Match_Medium_1[attempt-1][3];
          option1 = Match_Medium_1[attempt-1][4];
          option2 = Match_Medium_1[attempt-1][5];
          option3 = Match_Medium_1[attempt-1][6];
          option4 = Match_Medium_1[attempt-1][7];
        }

        if(section_state ==4 || section_state==5)
        {
          question1 = Match_Hard_1[attempt-1][0];
          question2 = Match_Hard_1[attempt-1][1];
          question3 = Match_Hard_1[attempt-1][2];
          question4 = Match_Hard_1[attempt-1][3];
          option1 = Match_Hard_1[attempt-1][4];
          option2 = Match_Hard_1[attempt-1][5];
          option3 = Match_Hard_1[attempt-1][6];
          option4 = Match_Hard_1[attempt-1][7];
        }
      }

    }

    else if (world == 1 && section == 2) {
      if (attempt == 1) {
        question1 = 'User Interface';
        question2 = 'ref';
        question3 = 'FSM';
        question4 = 'Activity Diagram';
        option1 = 'Dialog Map';
        option2 = 'Boundary Class';
        option3 = 'Dynamic Model';
        option4 = 'Sequence Diagram';
      } else if (attempt == 2) {
        question1 = 'Attempt 2';
        question2 = 'Attempt 2';
        question3 = 'Attempt 2';
        question4 = 'Attempt 2';
        option1 = 'Attempt 2';
        option2 = 'UAttempt 2';
        option3 = 'Attempt 2';
        option4 = 'Attempt 2';
      } else {
        question1 = 'Attempt 3';
        question2 = 'Attempt 3';
        question3 = 'Attempt 3';
        question4 = 'Attempt 3';
        option1 = 'Attempt 3';
        option2 = 'UAttempt 3';
        option3 = 'Attempt 3';
        option4 = 'Attempt 3';
      }
    } else if (world == 1 && section == 3) {
      if (attempt == 1) {
        question1 = 'Architecture';
        question2 = 'Minimise Coupling';
        question3 = 'Database';
        question4 = 'Logic';
        option1 = 'Conceptual Model';
        option2 = 'Bottom Layer';
        option3 = 'Layered';
        option4 = 'Control Class';
      } else if (attempt == 2) {
        question1 = 'Attempt 2';
        question2 = 'Attempt 2';
        question3 = 'Attempt 2';
        question4 = 'Attempt 2';
        option1 = 'Attempt 2';
        option2 = 'UAttempt 2';
        option3 = 'Attempt 2';
        option4 = 'Attempt 2';
      } else {
        question1 = 'Attempt 3';
        question2 = 'Attempt 3';
        question3 = 'Attempt 3';
        question4 = 'Attempt 3';
        option1 = 'Attempt 3';
        option2 = 'UAttempt 3';
        option3 = 'Attempt 3';
        option4 = 'Attempt 3';
      }
    } else if (world == 1 && section == 4) {
      if (attempt == 1) {
        question1 = 'Customer';
        question2 = 'Unambiguous';
        question3 = 'Feasible';
        question4 = 'Template';
        option1 = 'IEEE';
        option2 = 'Implementable';
        option3 = '1 interpretation';
        option4 = 'Writes SRS';
      } else if (attempt == 2) {
        question1 = 'Attempt 2';
        question2 = 'Attempt 2';
        question3 = 'Attempt 2';
        question4 = 'Attempt 2';
        option1 = 'Attempt 2';
        option2 = 'UAttempt 2';
        option3 = 'Attempt 2';
        option4 = 'Attempt 2';
      } else {
        question1 = 'Attempt 3';
        question2 = 'Attempt 3';
        question3 = 'Attempt 3';
        question4 = 'Attempt 3';
        option1 = 'Attempt 3';
        option2 = 'UAttempt 3';
        option3 = 'Attempt 3';
        option4 = 'Attempt 3';
      }
    } else if (world == 1 && section == 5) {
      if (attempt == 1) {
        question1 = 'Emphasises talk links';
        question2 = 'Inheritance';
        question3 = 'Uses Temporarily';
        question4 = 'Extends';
        option1 = 'Dependency';
        option2 = 'Optional Functionality';
        option3 = 'Communication Diag.';
        option4 = 'Generalization';
      } else if (attempt == 2) {
        question1 = 'Attempt 2';
        question2 = 'Attempt 2';
        question3 = 'Attempt 2';
        question4 = 'Attempt 2';
        option1 = 'Attempt 2';
        option2 = 'UAttempt 2';
        option3 = 'Attempt 2';
        option4 = 'Attempt 2';
      } else {
        question1 = 'Attempt 3';
        question2 = 'Attempt 3';
        question3 = 'Attempt 3';
        question4 = 'Attempt 3';
        option1 = 'Attempt 3';
        option2 = 'UAttempt 3';
        option3 = 'Attempt 3';
        option4 = 'Attempt 3';
      }
    }

    List<String> match = [
      question1,
      question2,
      question3,
      question4,
      option1,
      option2,
      option3,
      option4,
    ];
    return match;
  }
}
