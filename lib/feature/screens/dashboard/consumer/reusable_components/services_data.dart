import 'package:yell/feature/model/consumer/service_model.dart';

class ServicesData {
  static List<Service> getAllServices() {
    return [
      Service(id: '1', title: 'Plumber', icon: '🚰', category: 'Home'),
      Service(id: '2', title: 'Electrician', icon: '⚡', category: 'Home'),
      Service(id: '3', title: 'AC Repair', icon: '❄️', category: 'Home'),
      Service(id: '4', title: 'Carpenter', icon: '🪚', category: 'Home'),
      Service(id: '5', title: 'Painter', icon: '🎨', category: 'Home'),
      Service(id: '6', title: 'Cleaner', icon: '🧹', category: 'Home'),

      Service(id: '7', title: 'Car Wash', icon: '🚗', category: 'Auto'),
      Service(id: '8', title: 'Mechanic', icon: '🔧', category: 'Auto'),
      Service(id: '9', title: 'Driver', icon: '🚘', category: 'Transport'),
      Service(id: '10', title: 'Bike Repair', icon: '🏍️', category: 'Auto'),
      Service(id: '11', title: 'Car Rental', icon: '🚙', category: 'Transport'),

      Service(id: '12', title: 'Sabzi Wala', icon: '🥬', category: 'Grocery'),
      Service(id: '13', title: 'Kirana Store', icon: '🛒', category: 'Grocery'),
      Service(id: '14', title: 'Medical Store', icon: '💊', category: 'Health'),
      Service(id: '15', title: 'Milk Delivery', icon: '🥛', category: 'Grocery'),
      Service(id: '16', title: 'Bakery', icon: '🍞', category: 'Food'),
      Service(id: '17', title: 'Butcher', icon: '🥩', category: 'Food'),

      // 👨‍🍳 FOOD & COOKING
      Service(id: '18', title: 'Cook', icon: '👨‍🍳', category: 'Food'),
      Service(id: '19', title: 'Catering', icon: '🍽️', category: 'Food'),
      Service(id: '20', title: 'Tiffin Service', icon: '🍱', category: 'Food'),

      // 💇 PERSONAL CARE
      Service(id: '21', title: 'Salon', icon: '💇', category: 'Beauty'),
      Service(id: '22', title: 'Barber', icon: '✂️', category: 'Beauty'),
      Service(id: '23', title: 'Spa/Massage', icon: '💆', category: 'Beauty'),
      Service(id: '24', title: 'Laundry', icon: '👕', category: 'Home'),
      Service(id: '25', title: 'Dry Clean', icon: '🧥', category: 'Home'),
      Service(id: '26', title: 'Tailor', icon: '🧵', category: 'Fashion'),

      // 🏢 OFFICE & BUSINESS
      Service(id: '27', title: 'Photocopy', icon: '🖨️', category: 'Office'),
      Service(id: '28', title: 'Printing', icon: '📄', category: 'Office'),
      Service(id: '29', title: 'Packers & Movers', icon: '📦', category: 'Office'),
      Service(id: '30', title: 'CCTV Install', icon: '📹', category: 'Security'),
      Service(id: '31', title: 'Locksmith', icon: '🔐', category: 'Security'),

      // 🎓 EDUCATION & TUTORING
      Service(id: '32', title: 'Home Tutor', icon: '📚', category: 'Education'),
      Service(id: '33', title: 'Qari Sahib', icon: '📖', category: 'Education'),
      Service(id: '34', title: 'Computer Repair', icon: '💻', category: 'Tech'),
      Service(id: '35', title: 'Mobile Repair', icon: '📱', category: 'Tech'),

      // 🎉 EVENTS & ENTERTAINMENT
      Service(id: '36', title: 'Event Planner', icon: '🎉', category: 'Events'),
      Service(id: '37', title: 'Photographer', icon: '📸', category: 'Events'),
      Service(id: '38', title: 'DJ/Music', icon: '🎵', category: 'Events'),

      // 🏋️ FITNESS & HEALTH
      Service(id: '39', title: 'Gym Trainer', icon: '💪', category: 'Fitness'),
      Service(id: '40', title: 'Yoga Trainer', icon: '🧘', category: 'Fitness'),
      Service(id: '41', title: 'Doctor at Home', icon: '👨‍⚕️', category: 'Health'),
      Service(id: '42', title: 'Lab Test at Home', icon: '🩺', category: 'Health'),

      // 🐾 PET CARE
      Service(id: '43', title: 'Pet Grooming', icon: '🐶', category: 'Pets'),
      Service(id: '44', title: 'Veterinarian', icon: '🐱', category: 'Pets'),

      // 🪴 GARDEN & OUTDOOR
      Service(id: '45', title: 'Gardener', icon: '🌿', category: 'Garden'),
      Service(id: '46', title: 'Landscaping', icon: '🏡', category: 'Garden'),
      Service(id: '47', title: 'Waterproofing', icon: '🛡️', category: 'Home'),
      Service(id: '48', title: 'Glass/Mirror Fix', icon: '🪞', category: 'Home'),

      // 📱 DIGITAL SERVICES
      Service(id: '49', title: 'Website Making', icon: '🌐', category: 'Tech'),
      Service(id: '50', title: 'Social Media Manager', icon: '📱', category: 'Tech'),
    ];
  }
}