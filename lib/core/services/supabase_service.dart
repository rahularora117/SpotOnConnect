import '../core/models/app_user.dart';

class SupabaseService {
  SupabaseService._();

  static Future<void> init() async {
    // Add your Supabase initialize code here later.
    // Keep this file as the integration layer for auth, profile, chat, radar, activity.
  }

  static Future<void> saveProfile(AppUser profile) async {
    // Replace with Supabase insert/update later.
  }

  static Future<List<Map<String, dynamic>>> loadNearbyPeople() async {
    // Replace with Supabase query later.
    return [];
  }

  static Future<List<Map<String, dynamic>>> loadActivityFeed() async {
    // Replace with Supabase query later.
    return [];
  }
}