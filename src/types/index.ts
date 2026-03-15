export type UserRole = "admin" | "vet" | "emp";

export interface User {
  username: string;
  name: string;
  lastname: string;
  age: number | null;
  roles: UserRole[];
}

export interface SessionUser {
  username: string;
  role: UserRole;
}

export interface Habitat {
  id: number;
  name: string;
  image_url: string | null;
}

export interface Animal {
  id: number;
  prenom: string;
  race: string;
  habitat_id: number;
  diet: string | null;
  description: string | null;
  characteristics: string | null;
  image_url: string | null;
  species: string | null;
  lifespan: string | null;
  size_weight: string | null;
  gestation: string | null;
  natural_habitat: string | null;
  native_region: string | null;
  lifestyle: string | null;
  distinctive_features: string | null;
  habitat_name?: string;
}

export interface Service {
  id: number;
  name: string;
  description: string;
  price: number;
  availability_schedule: string | null;
  image_url: string | null;
}

export interface Review {
  id: number;
  visitor_name: string;
  review: string;
  rating: number;
  review_date: string;
  approved: boolean;
}

export interface VetReport {
  report_id: number;
  animal_id: number;
  vet_username: string;
  report_date: string;
  health_status: string;
  treatment: string | null;
  weight_at_checkup: number | null;
  follow_up_date: string | null;
  habitat_comments: string | null;
  animal_name?: string;
  vet_name?: string;
}

export interface FeedingRecord {
  record_id: number;
  animal_id: number;
  meal_preparation: string;
  weight: number | null;
  feeding_time: string;
  animal_name?: string;
}

export interface Booking {
  id: number;
  visitor_username: string;
  service_id: number;
  booking_date: string;
  status: string;
  visitor_name?: string;
  service_name?: string;
}

export interface ContactSubmission {
  id: number;
  name: string;
  email: string;
  phone: string | null;
  subject: string | null;
  message: string;
  created_at: string;
}

export interface AnimalClick {
  id: number;
  animal_id: number;
  click_count: number;
  animal_name: string;
  first_click: string;
  last_click: string;
}
