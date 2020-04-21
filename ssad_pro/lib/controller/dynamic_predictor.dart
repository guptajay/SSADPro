class DynamicPrediction
{
  int dynamicprediction(int section_state, int result)
  {
    int prediction;
    if(section_state ==5 && result ==1)
      section_state =5;
    if(section_state ==0 && result==0)
      section_state=0;

    else if(result == 1)
      section_state++;

    else if(result ==0)
      section_state--;

//    if(section_state==0 || section_state==1)
//      prediction =0;
//
//    else if(section_state==2 || section_state==3)
//      prediction=1;
//
//    else if(section_state==4 || section_state==5)
//      prediction=2;

    return section_state;

  }
}