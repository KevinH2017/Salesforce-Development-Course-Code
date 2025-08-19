// Uses methods to calculate a person's fitness
public class Fitness {
    // Calculates a person's BMI
    public Decimal calculateBMI(Decimal weight, Decimal height) {
        Decimal bmi = weight / (height*height);
        return bmi;
    }

    // Caluclates a person's pace
    public Decimal calculatePace(Decimal distance, Decimal minutes) {
        Decimal pace = distance / (minutes/60);
        return pace;
    }
}