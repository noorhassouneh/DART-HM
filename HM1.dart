void main() {
  List<double> marks = [70, 50, 76.3, 88, 90, 60];
  int i = 0;
  
  do {
    switch (marks[i]) {
        
      case >90:
        print('A');
        break;
      case <90 && >80:
        print('B');
        break;
      case <80 && >70:
        print('C');
        break;
      case <70 && >60:
        print('D');
        break;
      case <60 && >50:
        print('F');
        break;
      default:
        print('Invalid mark');
    }
    i++;
  } while (i < marks.length);
}
