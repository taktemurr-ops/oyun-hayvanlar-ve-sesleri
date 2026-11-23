import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hayvanlar_ve_sesleri/oyun_hayvanlar_ve_sesleri.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hayvanlarConfig.title.length, 33);
    expect(hayvanlarConfig.tagline.length, 33);
    for (final s in hayvanlarConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hayvanlarConfig.gameId, hayvanlarId);
    expect(hayvanlarRules.gameId, hayvanlarId);
    expect(hayvanlarConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hayvanlarRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hayvanlarId, optionalMechanics: hayvanlarRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hayvanlarRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
