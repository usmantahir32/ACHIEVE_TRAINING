import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:training/utils/size_config.dart';

class HelloWorldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Article'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*4),
            child: Column(
              children: const [
                HtmlWidget(""""<!DOCTYPE html>
                  <html>
                  
                  <head>
             <img src="https://getmymettle.com/cdn/shop/articles/Workout_Routines.jpg?v=1690289382&width=1000?v=1690289382&width=1000" alt="Split Routine Example" width="400" height="200">
                  </head>
                  
                  <body>
              <header>
            <h1>Effective Workout Routines for Building Muscle and Strength</h1>
            <p>By John Fitness Enthusiast</p>
              </header>
                  
              <article>
            <h2>Introduction</h2>
            <p>Building muscle and strength is a goal for many individuals who frequent the gym. It requires a well-structured workout routine that combines resistance training, proper nutrition, and consistency. In this article, we'll explore effective workout routines that can help you achieve your muscle and strength-building goals.</p>
                  
            <h2>1. Strength Training</h2>
            <p>Strength training is the foundation of any muscle-building workout routine. It involves lifting weights or using resistance to challenge your muscles. Key principles of strength training include:</p>
            <ul>
              <li>Compound exercises like squats, deadlifts, bench presses, and overhead presses.</li>
              <li>Progressive overload – gradually increasing the weight you lift over time.</li>
              <li>Adequate rest between sets to allow muscle recovery.</li>
            </ul>
                  
            <h2>2. Split Routines</h2>
            <p>Split routines are popular among bodybuilders and advanced lifters. They involve targeting specific muscle groups on different days of the week. Common split routines include:</p>
            <ul>
              <li>Push-Pull-Legs (PPL)</li>
              <li>Upper Body-Lower Body</li>
              <li>Chest and Triceps / Back and Biceps</li>
            </ul>
            <img src="https://media.istockphoto.com/id/496522298/photo/standing-dumbbell-split-squat-workout.jpg?s=612x612&w=0&k=20&c=OS4cQUcr2LZD_fZG1ecfrvw2xz6_zVn1IpiVuz1ZZzU=" alt="Split Routine Example" width="400" height="300">
                  
            <h2>3. Full-Body Workouts</h2>
            <p>Full-body workouts are great for beginners and individuals with limited time. They target all major muscle groups in a single session. Key points for full-body workouts:</p>
            <ul>
              <li>Perform compound exercises to maximize muscle engagement.</li>
              <li>Workout 3-4 times per week with adequate rest between sessions.</li>
            </ul>
            <img src="https://hips.hearstapps.com/hmg-prod/images/muscular-male-athlete-doing-push-ups-exercises-royalty-free-image-1658157868.jpg?crop=1xw:0.84296xh;center,top&resize=1200:*" alt="Full-Body Workout Example" width="400" height="300">
                  
            <h2>4. Nutrition</h2>
            <p>Nutrition is a crucial component of muscle and strength building. Your diet should include:</p>
            <ul>
              <li>Protein-rich foods like lean meats, fish, eggs, and dairy products.</li>
              <li>Complex carbohydrates for energy, such as whole grains, sweet potatoes, and brown rice.</li>
              <li>Healthy fats from sources like nuts, avocados, and olive oil.</li>
              <li>Adequate calorie intake to support muscle growth.</li>
            </ul>
                  
            <h2>5. Recovery and Rest</h2>
            <p>Recovery and rest are often underestimated. To maximize gains, you should:</p>
            <ul>
              <li>Get 7-9 hours of quality sleep per night.</li>
              <li>Include rest days in your workout routine to allow muscles to repair and grow.</li>
              <li>Consider stretching, yoga, or foam rolling to reduce muscle soreness and improve flexibility.</li>
            </ul>
                  
            <img src="https://assets.sweat.com/shopify_articles/images/000/002/012/original/ActiveRecoveryIdeascccb401ddb83ffe6f91ffa2b5b6b634e.jpg?1630048176" alt="Recovery and Rest" width="400" height="300">
                  
            <h2>Conclusion</h2>
            <p>Effective workout routines for building muscle and strength combine resistance training, proper nutrition, and adequate rest. Remember that consistency is key, and it's important to track your progress to make necessary adjustments to your routine. Always consult with a fitness professional or trainer if you're unsure about your workout plan. With dedication and the right approach, you can achieve your muscle and strength-building goals.</p>
              </article>
                  
              <footer>
            <p>&copy; 2023 Fitness Enthusiast Magazine</p>
              </footer>
                  </body>
                  
                  </html>
                  """),
              ],
            ),
          ),
        ),
      );
}
