class BiomarkerEntity {
  final String id;
  final String name;
  final double value;
  final double goal;
  final double score;
  final String state;
  final String unit;

  BiomarkerEntity(this.id, this.name, this.value, this.goal, this.score,
      this.state, this.unit);
}
