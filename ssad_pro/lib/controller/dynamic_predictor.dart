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

    return section_state;

  }
}