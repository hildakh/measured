export enum FrequencyValue {
  ONCE_DAILY = 1,
  TWICE_DAILY = 2,
  ONCE_WEEKLY = 0.142857
}

export const FrequencyLabel: Record<FrequencyValue, string> = {
  [FrequencyValue.ONCE_DAILY]: 'Once Daily',
  [FrequencyValue.TWICE_DAILY]: 'Twice Daily',
  [FrequencyValue.ONCE_WEEKLY]: 'Once Weekly'
}

export type Frequency = {
  name: string;
  value: FrequencyValue;
}

export type Dosage = {
  id: number;
  amount: string;
  default_duration: number;
  frequency: string;
  unit_price: number;
}

export type Medication = {
  id: number;
  created_at: string;
  dosages?: Dosage[];
  name: string;
  updated_at?: string;
}

export type SelectedMedication = {
  medication: Medication;
  dosage: Dosage;
  duration: number;
}

export type Prescription = {
  id: number;
  items: SelectedMedication[],
  total_cost: number;
  budget: number;
}