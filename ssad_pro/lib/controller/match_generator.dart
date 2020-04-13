class GenerateMatch {
  List<String> question(int world, int section) {
    String question1 = '';
    String question2 = '';
    String question3 = '';
    String question4 = '';
    String option1 = '';
    String option2 = '';
    String option3 = '';
    String option4 = '';

    if (world == 1 && section == 1) {
      question1 = 'Verifiable';
      question2 = 'Traceability';
      question3 = '<<include>>';
      question4 = 'Non-functional requirements';
      option1 = 'Specific';
      option2 = 'Use Case Diagram';
      option3 = 'Usability';
      option4 = 'Tracking';
    } else if (world == 1 && section == 2) {
      question1 = 'User Interface';
      question2 = 'ref';
      question3 = 'FSM';
      question4 = 'Activity Diagram';
      option1 = 'Dialog Map';
      option2 = 'Boundary Class';
      option3 = 'Dynamic Model';
      option4 = 'Sequence Diagram';
    } else if (world == 1 && section == 3) {
      question1 = 'Architecture';
      question2 = 'Minimise Coupling';
      question3 = 'Database';
      question4 = 'Logic';
      option1 = 'Conceptual Model';
      option2 = 'Bottom Layer';
      option3 = 'Layered';
      option4 = 'Control Class';
    } else if (world == 1 && section == 4) {
      question1 = 'Customer';
      question2 = 'Unambiguous';
      question3 = 'Feasible';
      question4 = 'Template';
      option1 = 'IEEE';
      option2 = 'Implementable';
      option3 = '1 interpretation';
      option4 = 'Writes SRS';
    } else if (world == 1 && section == 5) {
      question1 = 'Emphasises talk links';
      question2 = 'Inheritance';
      question3 = 'Uses Temporarily';
      question4 = 'Extends';
      option1 = 'Dependency';
      option2 = 'Optional Functionality';
      option3 = 'Communication Diag.';
      option4 = 'Generalization';
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
