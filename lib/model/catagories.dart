enum Catagories {
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology,
}

enumCatagriestoString(Catagories catagories) {
  switch (catagories) {
    case Catagories.business:
      return "business";
    case Catagories.entertainment:
      return "entertainment";
    case Catagories.general:
      return "general";
    case Catagories.health:
      return "health";
    case Catagories.science:
      return "science";
    case Catagories.sports:
      return "sports";
    case Catagories.technology:
      return "technology";
  }
}
