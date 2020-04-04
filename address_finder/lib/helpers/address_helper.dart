class AddressHelper {
  static const Map<String, String> LABELS = {
    'cep': 'CEP',
    'street': 'Logradouro',
    'complement': 'Complemento',
    'neighborhood': 'Bairro',
    'city': 'Cidade',
    'state': 'Estado',
    'ibge': 'IBGE',
    'unity': 'Unidade',
    'gia': 'GIA',
  };

  static getLabels(String key) {
    return LABELS[key] ?? null;
  }
}
