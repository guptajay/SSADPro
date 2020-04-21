class GenerateMCQ {
  List<String> question(int world_no, int sect_no, int attempt, int section_state) {
    String question = '';
    String option1 = '';
    String option2 = '';
    String option3 = '';
    String option4 = '';
    String correct_ans = '';

    List<List<String>> MCQ_Easy_1= [['q1Easy', 'o1', 'o2', 'o3', 'o4', '1'],
                                    ['q2Easy', 'o1', 'o2', 'o3', 'o4', '1'],
                                    ['q3Easy', 'o1', 'o2', 'o3', 'o4', '1'],
                                    ['q4Easy', 'o1', 'o2', 'o3', 'o4', '1']];

    List<List<String>> MCQ_Medium_1= [['q5Medium', 'o1', 'o2', 'o3', 'o4', '1'],
                                      ['q6Medium', 'o1', 'o2', 'o3', 'o4', '1'],
                                      ['q7Medium', 'o1', 'o2', 'o3', 'o4', '1']];


    List<List<String>> MCQ_Hard_1= [['q8Hard', 'o1', 'o2', 'o3', 'o4', '1'],
                                    ['q9Hard', 'o1', 'o2', 'o3', 'o4', '1'],
                                    ['q10Hard', 'o1', 'o2', 'o3', 'o4', '1']];


    if (world_no == 1 && sect_no == 1) {
      if (attempt == 1) {
        if (section_state == 0 || section_state == 1) {
          question = MCQ_Easy_1[attempt - 1][0];
          option1 = MCQ_Easy_1[attempt - 1][1];
          option2 = MCQ_Easy_1[attempt - 1][2];
          option3 = MCQ_Easy_1[attempt - 1][3];
          option4 = MCQ_Easy_1[attempt - 1][4];
          correct_ans = MCQ_Easy_1[attempt - 1][5];
        }
        if (section_state == 2 || section_state == 3) {
          question = MCQ_Medium_1[attempt - 1][0];
          option1 = MCQ_Medium_1[attempt - 1][1];
          option2 = MCQ_Medium_1[attempt - 1][2];
          option3 = MCQ_Medium_1[attempt - 1][3];
          option4 = MCQ_Medium_1[attempt - 1][4];
          correct_ans = MCQ_Medium_1[attempt - 1][5];
        }
        if (section_state == 4 || section_state == 5) {
          question = MCQ_Hard_1[attempt - 1][0];
          option1 = MCQ_Hard_1[attempt - 1][1];
          option2 = MCQ_Hard_1[attempt - 1][2];
          option3 = MCQ_Hard_1[attempt - 1][3];
          option4 = MCQ_Hard_1[attempt - 1][4];
          correct_ans = MCQ_Hard_1[attempt - 1][5];
        }
      }

      else if (attempt == 2) {
        if (section_state == 0 || section_state == 1) {
          question = MCQ_Easy_1[attempt - 1][0];
          option1 = MCQ_Easy_1[attempt - 1][1];
          option2 = MCQ_Easy_1[attempt - 1][2];
          option3 = MCQ_Easy_1[attempt - 1][3];
          option4 = MCQ_Easy_1[attempt - 1][4];
          correct_ans = MCQ_Easy_1[attempt - 1][5];
        }
        if (section_state == 2 || section_state == 3) {
          question = MCQ_Medium_1[attempt - 1][0];
          option1 = MCQ_Medium_1[attempt - 1][1];
          option2 = MCQ_Medium_1[attempt - 1][2];
          option3 = MCQ_Medium_1[attempt - 1][3];
          option4 = MCQ_Medium_1[attempt - 1][4];
          correct_ans = MCQ_Medium_1[attempt - 1][5];
        }
        if (section_state == 4 || section_state == 5) {
          question = MCQ_Hard_1[attempt - 1][0];
          option1 = MCQ_Hard_1[attempt - 1][1];
          option2 = MCQ_Hard_1[attempt - 1][2];
          option3 = MCQ_Hard_1[attempt - 1][3];
          option4 = MCQ_Hard_1[attempt - 1][4];
          correct_ans = MCQ_Hard_1[attempt - 1][5];
        }

      } else {
        if (section_state == 0 || section_state == 1) {
          question = MCQ_Easy_1[attempt - 1][0];
          option1 = MCQ_Easy_1[attempt - 1][1];
          option2 = MCQ_Easy_1[attempt - 1][2];
          option3 = MCQ_Easy_1[attempt - 1][3];
          option4 = MCQ_Easy_1[attempt - 1][4];
          correct_ans = MCQ_Easy_1[attempt - 1][5];
        }
        if (section_state == 2 || section_state == 3) {
          question = MCQ_Medium_1[attempt - 1][0];
          option1 = MCQ_Medium_1[attempt - 1][1];
          option2 = MCQ_Medium_1[attempt - 1][2];
          option3 = MCQ_Medium_1[attempt - 1][3];
          option4 = MCQ_Medium_1[attempt - 1][4];
          correct_ans = MCQ_Medium_1[attempt - 1][5];
        }
        if (section_state == 4 || section_state == 5) {
          question = MCQ_Hard_1[attempt - 1][0];
          option1 = MCQ_Hard_1[attempt - 1][1];
          option2 = MCQ_Hard_1[attempt - 1][2];
          option3 = MCQ_Hard_1[attempt - 1][3];
          option4 = MCQ_Hard_1[attempt - 1][4];
          correct_ans = MCQ_Hard_1[attempt - 1][5];
        }
      }
    } else if (world_no == 1 && sect_no == 2) {
      if (attempt == 1) {
        question = 'Which of the following is used in Analysis?';
        option1 = 'State Machine Diagram';
        option2 = 'Dialog Map';
        option3 = 'Activity Diagram';
        option4 = 'All';
        correct_ans = '4';
      } else if (attempt == 2) {
        question = 'Attempt 2';
        option1 = '1';
        option2 = '2';
        option3 = '3';
        option4 = '4';
        correct_ans = '3';
      } else {
        question = 'Attempt 3';
        option1 = '1';
        option2 = '2';
        option3 = '3';
        option4 = '4';
        correct_ans = '3';
      }
    } else if (world_no == 1 && sect_no == 3) {
      if (attempt == 1) {
        question = 'Which is the Presentation Layer?';
        option1 = 'Boundary Classes';
        option2 = 'Control Classes';
        option3 = 'Entity Classes';
        option4 = 'None';
        correct_ans = '1';
      } else if (attempt == 2) {
        question = 'Attempt 2';
        option1 = '1';
        option2 = '2';
        option3 = '3';
        option4 = '4';
        correct_ans = '3';
      } else {
        question = 'Attempt 3';
        option1 = '1';
        option2 = '2';
        option3 = '3';
        option4 = '4';
        correct_ans = '3';
      }
    } else if (world_no == 1 && sect_no == 4) {
      if (attempt == 1) {
        question = 'Which is NOT a content of SRS?';
        option1 = 'Functional Requirements';
        option2 = 'Code';
        option3 = 'Product Description';
        option4 = 'Data Dictionary';
        correct_ans = '2';
      } else if (attempt == 2) {
        question = 'Attempt 2';
        option1 = '1';
        option2 = '2';
        option3 = '3';
        option4 = '4';
        correct_ans = '3';
      } else {
        question = 'Attempt 3';
        option1 = '1';
        option2 = '2';
        option3 = '3';
        option4 = '4';
        correct_ans = '3';
      }
    } else if (world_no == 1 && sect_no == 5) {
      if (attempt == 1) {
        question = 'Which of the following are a part of Specification?';
        option1 = 'Analysis';
        option2 = 'Architecture';
        option3 = 'SRS';
        option4 = 'All';
        correct_ans = '4';
      } else if (attempt == 2) {
        question = 'Attempt 2';
        option1 = '1';
        option2 = '2';
        option3 = '3';
        option4 = '4';
        correct_ans = '3';
      } else {
        question = 'Attempt 3';
        option1 = '1';
        option2 = '2';
        option3 = '3';
        option4 = '4';
        correct_ans = '3';
      }
    } else if (world_no == 99 && sect_no == 99) {
      question =
          'Which of the following is NOT a strength of Layered Architecture?';
      option1 = 'Low Coupling';
      option2 = 'Concurrency';
      option3 = 'Extensibility';
      option4 = 'Reusability';
      correct_ans = '2';
    } else if (world_no == 99 && sect_no == 100) {
      question = 'Which of the following is a Behavorial design pattern?';
      option1 = 'Factory Method';
      option2 = 'Facade';
      option3 = 'Bridge';
      option4 = 'Observer';
      correct_ans = '4';
    } else if (world_no == 99 && sect_no == 101) {
      question = 'Which of the following words should NOT be used in a SRS?';
      option1 = 'Effective';
      option2 = 'Applicable';
      option3 = 'Must';
      option4 = 'Shall';
      correct_ans = '1';
    }
    List<String> mcq = [
      question,
      option1,
      option2,
      option3,
      option4,
      correct_ans
    ];
    return mcq;
  }
}
