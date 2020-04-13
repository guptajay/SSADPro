class GenerateMCQ {
  List<String> question(int world_no, int sect_no) {
    String question = '';
    String option1 = '';
    String option2 = '';
    String option3 = '';
    String option4 = '';
    String correct_ans = '';
    if (world_no == 1 && sect_no == 1) {
      question = 'Which of the following is not there in Elicitation?';
      option1 = 'Project Mission Statement';
      option2 = 'Review Requirements';
      option3 = 'Omit Requirements';
      option4 = 'Validate Requirements';
      correct_ans = '3';
    } else if (world_no == 1 && sect_no == 2) {
      question = 'Which of the following is used in Analysis?';
      option1 = 'State Machine Diagram';
      option2 = 'Dialog Map';
      option3 = 'Activity Diagram';
      option4 = 'All';
      correct_ans = '4';
    } else if (world_no == 1 && sect_no == 3) {
      question = 'Which is the Presentation Layer?';
      option1 = 'Boundary Classes';
      option2 = 'Control Classes';
      option3 = 'Entity Classes';
      option4 = 'None';
      correct_ans = '1';
    } else if (world_no == 1 && sect_no == 4) {
      question = 'Which is NOT a content of SRS?';
      option1 = 'Functional Requirements';
      option2 = 'Code';
      option3 = 'Product Description';
      option4 = 'Data Dictionary';
      correct_ans = '2';
    } else if (world_no == 1 && sect_no == 5) {
      question = 'Which of the following are a part of Specification?';
      option1 = 'Analysis';
      option2 = 'Architecture';
      option3 = 'SRS';
      option4 = 'All';
      correct_ans = '4';
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
