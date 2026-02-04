import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  String _gender = 'male';
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  double? _bmrResult;

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _calculateBMR() {
    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);
    final age = double.tryParse(_ageController.text);

    if (weight == null || height == null || age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบถ้วน')),
      );
      return;
    }

    double bmr;
    if (_gender == 'male') {
      // สำหรับผู้ชาย: BMR = 66 + (13.7 x น้ำหนัก) + (5 x ส่วนสูง) – (6.8 x อายุ)
      bmr = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
    } else {
      // สำหรับผู้หญิง: BMR = 665 + (9.6 x น้ำหนัก) + (1.8 x ส่วนสูง) – (4.7 x อายุ)
      bmr = 665 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
    }

    setState(() {
      _bmrResult = bmr;
    });
  }

  void _resetForm() {
    _weightController.clear();
    _heightController.clear();
    _ageController.clear();
    setState(() {
      _bmrResult = null;
      _gender = 'male';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('คำนวณ BMR'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gender Selection
            const Text(
              'เลือกเพศ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('ชาย'),
                    value: 'male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('หญิง'),
                    value: 'female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Weight Input
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'น้ำหนัก (กิโลกรัม)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.scale),
              ),
            ),
            const SizedBox(height: 16),

            // Height Input
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'ส่วนสูง (เซนติเมตร)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.height),
              ),
            ),
            const SizedBox(height: 16),

            // Age Input
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'อายุ (ปี)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.cake),
              ),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _calculateBMR,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'คำนวณ BMR',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Reset Button
            OutlinedButton(
              onPressed: _resetForm,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('รีเซ็ต'),
            ),
            const SizedBox(height: 32),

            // Result Display
            if (_bmrResult != null) ...[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Column(
                  children: [
                    const Text(
                      'ผลการคำนวณ BMR',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${_bmrResult!.toStringAsFixed(2)} cal/day',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'แคลอรี่ที่ร่างกายต้องการต่อวัน',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
