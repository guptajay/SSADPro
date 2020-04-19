class GenerateFIB {
  List<String> question(int world_no, int sect_no, int attempt) {
    String question = '';
    String answer = '';
    if (world_no == 1 && sect_no == 1) {
      if (attempt == 1) {
        question = '______ is a problem domain glossary';
        answer = 'data dictionary';
      } else if (attempt == 2) {
        question = 'Attempt 2';
        answer = 'data dictionary';
      } else {
        question = 'Attempt 3';
        answer = 'data dictionary';
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
