/// 工作流页面示例

import 'package:flutter/material.dart';

enum WorkflowStep {
  step1,
  step2,
  step3,
  completed,
}

class WorkflowScreen extends StatefulWidget {
  const WorkflowScreen({super.key});

  @override
  _WorkflowScreenState createState() => _WorkflowScreenState();
}

class _WorkflowScreenState extends State<WorkflowScreen> {
  WorkflowStep _currentStep = WorkflowStep.step1;

  void _nextStep() {
    setState(() {
      if (_currentStep == WorkflowStep.step1) {
        _currentStep = WorkflowStep.step2;
      } else if (_currentStep == WorkflowStep.step2) {
        _currentStep = WorkflowStep.step3;
      } else if (_currentStep == WorkflowStep.step3) {
        _currentStep = WorkflowStep.completed;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workflow Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Step: $_currentStep',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            if (_currentStep == WorkflowStep.step1)
              Text('Step 1 Content'),
            if (_currentStep == WorkflowStep.step2)
              Text('Step 2 Content'),
            if (_currentStep == WorkflowStep.step3)
              Text('Step 3 Content'),
            if (_currentStep == WorkflowStep.completed)
              Text('Workflow Completed'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _nextStep,
              child: Text('Next Step'),
            ),
          ],
        ),
      ),
    );
  }
}
