import 'package:flutter/material.dart';

class Company {
  final String image, title, location, rating, aboutus, recommendation;
  final int id, hour;
  final double price;
  Company({
    this.id = 0,
    this.image = '',
    this.title = '',
    this.location = '',
    this.rating = '',
    this.aboutus = '',
    this.price = 0,
    this.hour = 0,
    this.recommendation = '',
  });
}

List<Company> companies = [
  Company(
      id: 1,
      image: 'asset/images/logoservice_1.png',
      title: "Maju Jaya Sdn. Bhd.",
      location: 'Seri Kembangan, Selangor',
      rating: '4.6/5',
      price: 30,
      aboutus:
          'At Maju Jaya, we are a family-owned and operated business that has been providing top-quality cleaning services for 5 years. We use eco-friendly products, and provide customized cleaning services that suits our customer needs. Our team is trained and bonded to handle any cleaning task, while our mission is to leave our customers space spotless and satisfied.',
      hour: 3,
      recommendation: 'Specialist for enterprise company and home cleaning'),
  Company(
      id: 2,
      image: 'asset/images/logoservice_2.png',
      title: "Washee Washee",
      location: 'Bukit Serdang, Selangor',
      rating: '4.8/5',
      price: 28,
      aboutus:
          'Welcome to Washee Washee, where we take pride in providing the highest level of cleaning services for homes and businesses. Our team of experienced and professional cleaners use only the best eco-friendly products to ensure your space is spotless and safe. We work closely with our customers to provide personalized and flexible cleaning solutions that meet their unique needs.',
      hour: 3,
      recommendation: 'Recommended for big house cleaning such as Bungalow'),
  Company(
    id: 3,
    image: 'asset/images/logoservice_3.png',
    title: 'Dust & Dash Ent.',
    location: 'Sri Serdang, Selangor',
    rating: '4.3/5',
    price: 27,
    aboutus:
        'At Dust & Dash, we are dedicated to providing top-quality cleaning services for homes and businesses. Our team of professional cleaners is committed to making your life easier with eco-friendly products and techniques. Thank you for choosing us to take care of your cleaning needs.',
    hour: 4,
    recommendation: 'Expertise in small enterprise and home cleaning',
  ),
  Company(
      id: 4,
      image: 'asset/images/logoservice_4.png',
      title: "KitaCuci",
      location: 'Balakong, Selangor',
      rating: '4.2/5',
      price: 25,
      aboutus:
          'At KitaCuci, we provide professional cleaning services for homes and businesses. Our experienced team uses eco-friendly products to ensure a safe and thorough cleaning. We work with our customers to meet their specific needs and offer flexible scheduling. Our goal is to provide the best cleaning services to help improve the overall well-being of our customers space.',
      hour: 2,
      recommendation: 'Suitable for apartment and condominium'),
  Company(
      id: 5,
      image: 'asset/images/logoservice_5.png',
      title: "Time N Tidy",
      location: 'Taman Equine, Selangor',
      rating: '4.5/5',
      price: 25,
      aboutus:
          'We at Time N Tidy are a professional cleaning service that provides a wide range of cleaning services for homes and businesses. Our team of skilled and dedicated cleaners use advanced equipment and green cleaning products to provide a thorough and safe cleaning experience that leaves our customers satisfied.',
      hour: 4,
      recommendation: 'Recommended for small house cleaning such as terrace'),
];

class Company2 {
  final String image, title, location, rating, aboutus, recommendation;
  final int id, hour;
  final double price;
  Company2({
    this.id = 0,
    this.image = '',
    this.title = '',
    this.location = '',
    this.rating = '',
    this.aboutus = '',
    this.price = 0,
    this.hour = 0,
    this.recommendation = '',
  });
}

// List<Company> bestChoiceCompanies = [
//   Company(
//       id: 1,
//       image: 'asset/images/logoservice_2.png',
//       title: "Washee Washee",
//       location: 'Bukit Serdang, Selangor',
//       rating: '4.8/5',
//       price: 28,
//       aboutus:
//           'Welcome to Washee Washee, where we take pride in providing the highest level of cleaning services for homes and businesses. Our team of experienced and professional cleaners use only the best eco-friendly products to ensure your space is spotless and safe. We work closely with our customers to provide personalized and flexible cleaning solutions that meet their unique needs.',
//       hour: 3,
//       recommendation: 'Recommended for big house cleaning such as Bungalow'),
//   Company(
//       id: 2,
//       image: 'asset/images/logoservice_1.png',
//       title: "Maju Jaya Sdn. Bhd.",
//       location: 'Seri Kembangan, Selangor',
//       rating: '4.6/5',
//       price: 30,
//       aboutus:
//           'At Maju Jaya, we are a family-owned and operated business that has been providing top-quality cleaning services for 5 years. We use eco-friendly products, and provide customized cleaning services that suits our customer needs. Our team is trained and bonded to handle any cleaning task, while our mission is to leave our customers space spotless and satisfied.',
//       hour: 3,
//       recommendation: 'Specialist for enterprise company and home cleaning'),
//   Company(
//       id: 3,
//       image: 'asset/images/logoservice_5.png',
//       title: "Time N Tidy",
//       location: 'Taman Equine, Selangor',
//       rating: '4.5/5',
//       price: 25,
//       aboutus:
//           'We at Time N Tidy are a professional cleaning service that provides a wide range of cleaning services for homes and businesses. Our team of skilled and dedicated cleaners use advanced equipment and green cleaning products to provide a thorough and safe cleaning experience that leaves our customers satisfied.',
//       hour: 4,
//       recommendation: 'Recommended for small house cleaning such as terrace'),
//   Company(
//     id: 4,
//     image: 'asset/images/logoservice_3.png',
//     title: 'Dust & Dash Ent.',
//     location: 'Sri Serdang, Selangor',
//     rating: '4.3/5',
//     price: 27,
//     aboutus:
//         'At Dust & Dash, we are dedicated to providing top-quality cleaning services for homes and businesses. Our team of professional cleaners is committed to making your life easier with eco-friendly products and techniques. Thank you for choosing us to take care of your cleaning needs.',
//     hour: 4,
//     recommendation: 'Expertise in small enterprise and home cleaning',
//   ),
//   Company(
//       id: 5,
//       image: 'asset/images/logoservice_4.png',
//       title: "KitaCuci",
//       location: 'Balakong, Selangor',
//       rating: '4.2/5',
//       price: 25,
//       aboutus:
//           'At KitaCuci, we provide professional cleaning services for homes and businesses. Our experienced team uses eco-friendly products to ensure a safe and thorough cleaning. We work with our customers to meet their specific needs and offer flexible scheduling. Our goal is to provide the best cleaning services to help improve the overall well-being of our customers space.',
//       hour: 2,
//       recommendation: 'Suitable for apartment and condominium'),
// ];
