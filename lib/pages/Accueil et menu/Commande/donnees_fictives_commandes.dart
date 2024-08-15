class Commande {
  final String id;
  final String nomRestaurant;
  final List<String> articles;
  final double prixTotal;
  late final String statut;
  late final String? lieuLivraison;
  late final String? dateLivraison;
  late final String? tempsLivraison;
  late final String? nomLivreur;
  late final String? numeroLivreur;
  late final String? numeroLivraison;

  Commande({
    required this.id,
    required this.nomRestaurant,
    required this.articles,
    required this.prixTotal,
    required this.statut,
    this.lieuLivraison,
    this.dateLivraison,
    this.tempsLivraison,
    this.nomLivreur,
    this.numeroLivreur,
    this.numeroLivraison,
  });
}

List<Commande> commandes = [
  Commande(
    id: '001',
    nomRestaurant: 'Eric Kayser',
    articles: ['Burger', 'Frites', 'Soda'],
    prixTotal: 24.0,
    statut: 'Confirmée',
    lieuLivraison: 'Avenue des Champs-Élysées',
    dateLivraison: '2024-08-12',
    tempsLivraison: '14:00',
    nomLivreur: 'Jean Dupont',
    numeroLivreur: '0654321987',
    numeroLivraison: 'LIV001',
  ),
  Commande(
    id: '002',
    nomRestaurant: 'Kook',
    articles: ['Pâtes', 'Salade'],
    prixTotal: 30.0,
    statut: 'En attente',
    lieuLivraison: 'Rue de la Paix',
    dateLivraison: '2024-08-13',
    tempsLivraison: '12:30',
    nomLivreur: 'Marie Curie',
    numeroLivreur: '0687654321',
    numeroLivraison: 'LIV002',
  ),
  Commande(
    id: '003',
    nomRestaurant: 'O Poeta',
    articles: ['Pizza', 'Vin'],
    prixTotal: 35.0,
    statut: 'Non confirmée',
    lieuLivraison: 'Boulevard Saint-Germain',
    dateLivraison: '2024-08-14',
    tempsLivraison: '19:00',
    nomLivreur: 'Jacques Rousseau',
    numeroLivreur: '0678912345',
    numeroLivraison: 'LIV003',
  ),
  Commande(
    id: '004',
    nomRestaurant: 'Facebook',
    articles: ['Sushi', 'Thé'],
    prixTotal: 28.0,
    statut: 'Confirmée',
    lieuLivraison: 'Place Vendôme',
    dateLivraison: '2024-08-12',
    tempsLivraison: '15:00',
    nomLivreur: 'Vincent Van Gogh',
    numeroLivreur: '0698765432',
    numeroLivraison: 'LIV004',
  ),
  Commande(
    id: '005',
    nomRestaurant: 'Eric Kayser',
    articles: ['Steak', 'Purée de pommes de terre'],
    prixTotal: 45.0,
    statut: 'En attente',
    lieuLivraison: 'Avenue Montaigne',
    dateLivraison: '2024-08-13',
    tempsLivraison: '13:00',
    nomLivreur: 'Pablo Picasso',
    numeroLivreur: '0612345678',
    numeroLivraison: 'LIV005',
  ),
];
