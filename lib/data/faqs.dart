import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FAQs extends StatelessWidget {

  static List faqList = [
    {
      "ques":"What is a Coronavirus ?",
      "ans":"Coronaviruses are a large family of viruses which may cause illness in animals or humans.  In humans, several coronaviruses are known to cause respiratory infections ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS). The most recently discovered coronavirus causes coronavirus disease COVID-19."
    },
    {
      "ques":"What is a COVID-19 ?",
      "ans":"COVID-19 is the infectious disease caused by the most recently discovered coronavirus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019. COVID-19 is now a pandemic affecting many countries globally."
    },
    {
      "ques":"What are the symptoms of COVID-19 ?",
      "ans":"The most common symptoms of COVID-19 are fever, dry cough, and tiredness. Other symptoms that are less common and may affect some patients include aches and pains, nasal congestion, headache, conjunctivitis, sore throat, diarrhea, loss of taste or smell or a rash on skin or discoloration of fingers or toes. These symptoms are usually mild and begin gradually. Some people become infected but only have very mild symptoms.\n\nMost people (about 80%) recover from the disease without needing hospital treatment. Around 1 out of every 5 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart and lung problems, diabetes, or cancer, are at higher risk of developing serious illness.  However, anyone can catch COVID-19 and become seriously ill.  People of all ages who experience fever and/or  cough associated with difficulty breathing/shortness of breath, chest pain/pressure, or loss of speech or movement should seek medical attention immediately. If possible, it is recommended to call the health care provider or facility first, so the patient can be directed to the right clinic."
    },
    {
      "ques":"How does COVID-19 spreads ?",
      "ans":"People can catch COVID-19 from others who have the virus. The disease spreads primarily from person to person through small droplets from the nose or mouth, which are expelled when a person with COVID-19 coughs, sneezes, or speaks. These droplets are relatively heavy, do not travel far and quickly sink to the ground. People can catch COVID-19 if they breathe in these droplets from a person infected with the virus.  This is why it is important to stay at least 1 meter) away from others. These droplets can land on objects and surfaces around the person such as tables, doorknobs and handrails.  People can become infected by touching these objects or surfaces, then touching their eyes, nose or mouth.  This is why it is important to wash your hands regularly with soap and water or clean with alcohol-based hand rub.\n\nWHO is assessing ongoing research on the ways that COVID-19 is spread and will continue to share updated findings."
    },
    {
      "ques":"Can COVID-19 be caught from a person who has no symptoms ?",
      "ans":"COVID-19 is mainly spread through respiratory droplets expelled by someone who is coughing or has other symptoms such as fever or tiredness. Many people with COVID-19 experience only mild symptoms. This is particularly true in the early stages of the disease. It is possible to catch COVID-19 from someone who has just a mild cough and does not feel ill.\n\nSome reports have indicated that people with no symptoms can transmit the virus. It is not yet known how often it happens. WHO is assessing ongoing research on the topic and will continue to share updated findings."
    },
    {
      "ques":"What should I do if I have come in close contact with someone who has COVID-19 ?",
      "ans":"To self-quarantine means to separate yourself from others because you have been exposed to someone with COVID-19 even though you, yourself, do not have symptoms.During self-quarantine you monitor yourself for symptoms.  The goal of the self-quarantine is to prevent transmission.  Since people who become ill with COVID-19 can infect people immediately self-quarantine can prevent some infections from happening.\n\n ~ In this case:\n> Have a large, well-ventilated single room with hand hygiene and toilet facilities"
    "\n> If this is not available place beds at least 1 metre apart.\n> Keep at least 1-metre distance from others, even from your family members.\n> Monitor your symptoms daily.\n> Self-quarantine for 14 days, even if you feel healthy.\n> If you develop difficulty breathing, contact your healthcare provider immediately – call them first if possible."
    "\n> Stay positive and energized by keeping in touch with loved ones by phone or online, and by exercising yourself at home.\n\nHowever, if you live in an area with malaria or dengue fever it is important that you do not ignore symptoms of fever.  Seek medical help.  When you attend the health facility wear a mask if possible, keep at least 1 metre distant from other people and do not touch surfaces with your hands. If it is a child who is sick help the child stick to this advice."
    },
    {
      "ques":"What is the difference between self-isolation, self-quarantine and distancing ?",
      "ans":"Quarantine means restricting activities or separating people who are not ill themselves but may have been exposed to COVID-19. The goal is to prevent spread of the disease at the time when people just develop symptoms..\n\nIsolation means separating people who are ill with symptoms of COVID-19 and may be infectious to prevent the spread of the disease."
          "\n\nPhysical distancing means being physically apart. WHO recommends keeping at least 1-metre distance from others. This is a general measure that everyone should take even if they are well with no known exposure to COVID-19."
    },
    {
      "ques":"What dos it mean to self-isolate ?",
      "ans":"Self-isolation is an important measure taken by those who have COVID-19 symptoms to avoid infecting others in the community, including family members.\n\n"
      "Self-isolation is when a person who is experiencing fever, cough or other COVID-19 symptoms stays at home and does not go to work, school or public places. This can be voluntarily or based on his/her health care provider’s recommendation. However, if you live in an area with malaria or dengue fever it is important that you do not ignore symptoms of fever. Seek medical help. When you attend the health facility wear a mask if possible, keep at least 1 metre distant from other people and do not touch surfaces with your hands. If it is a child who is sick help the child stick to this advice.\n\n"
      "If you do not live in an area with malaria or dengue fever please do the following:\n\n"
      "-  If a person is in self-isolation, it is because he/she is ill but not severely ill (requiring medical attention)\n\n"
      "-> have a large, well-ventilated with hand-hygiene and toilet facilities\n"
      "-> If this is not possible, place beds at least 1 metre apart\n"
      "-> Keep at least 1 metre from others, even from your family members\n"
      "-> Monitor your symptoms daily\n"
      "-> Isolate for 14 days, even if you feel healthy\n"
      "-> If you develop difficulty breathing, contact your healthcare provider immediately – call them first if possible\n"
      "-> Stay positive and energized by keeping in touch with loved ones by phone or online, and by exercising yourself at home."
    },
    {
      "ques":"Can I catch COVID-19 from my pet or other animals ?",
      "ans":"Several dogs and cats (domestic cats and tigers) in contact with infected humans have tested positive for COVID-19. In addition, ferrets appear to be susceptible to the infection. In experimental conditions, both cats and ferrets were able to transmit infection to other animals of the same species. However, there is no evidence that these animals can transmit the disease to humans and spread COVID-19. COVID-19 is mainly spread through droplets produced when an infected person coughs, sneezes, or speaks.\n\n"
          "Minks raised in farms have also been detected with the virus. Most likely, they have been infected by farm workers. In a few instances, the minks that were infected by humans have transmitted the virus to other people. These are the first reported cases of animal-to-human transmission.\n\n"
          "It is still recommended that people who are sick with COVID-19 and people who are at risk limit contact with companion and other animals. When handling and caring for animals, basic hygiene measures should always be implemented. This includes hand washing after handling animals, their food or supplies, as well as avoiding kissing, licking or sharing food."
    },
    {
      "ques":"How long does the virus survive on surfaces ?",
      "ans":"The most important thing to know about coronavirus on surfaces is that they can easily be cleaned with common household disinfectants that will kill the virus. Studies have shown that the COVID-19 virus can survive for up to 72 hours on plastic and stainless steel, less than 4 hours on copper and less than 24 hours on cardboard.\n\n"
          "As, always clean your hands with an alcohol-based hand rub or wash them with soap and water. Avoid touching your eyes, mouth, or nose."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 4),
        child: ListView.builder(
            itemCount: faqList.length,
            itemBuilder: (context, int index)
            {
              return Card(
                elevation: 20,
                child: ExpansionTile(
                  leading: Icon(MdiIcons.headQuestionOutline, color: Colors.redAccent.shade200,),
                  title: Text(faqList[index]['ques'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(15),
                        child: Text(faqList[index]['ans'],style: TextStyle(fontSize: 15), textAlign: TextAlign.justify)
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
