class GenerateFIB {
  List<String> question(int world_no, int sect_no) {
    String question = '';
    String answer = '';
    if (world_no == 1 && sect_no == 1) {
      question = '______ is a problem domain glossary';
      answer = 'data dictionary';
    } else if (world_no == 1 && sect_no == 2) {
      question = 'A ______ is a stable condition of a system';
      answer = 'state';
    } else if (world_no == 1 && sect_no == 3) {
      question = '______ layer has entity classes';
      answer = 'presentation data';
    } else if (world_no == 1 && sect_no == 4) {
      question = 'SRS is called Software _______ Specification';
      answer = 'requirement';
    } else if (world_no == 1 && sect_no == 5) {
      question = 'Sequence diagram is a ________ model';
      answer = 'dynamic';
    }
    List<String> fib = [question, answer];
    return fib;
  }
}
