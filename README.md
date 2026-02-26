# Recommandation stratégique
## Problème principale détecté : 
❌ ~70 % d'événements (shifts/rests) sont "orphelins", (que nous ne pouvons rattacher à des locations), sous-estime le nombre d'employés facturables et donc le revenu consumption. 
⚠️ Les chiffres présentés constituent alors une borne basse.

L'analyse de l'impact de la migration du modèle à prix fixe (legacy) vers la tarification à la consommation révèle un manque à gagner croissant.
Alors que le MRR consumption stagne autour de 9.1K€–9.6K€/mois sur la période observée, le MRR legacy théorique progresse régulièrement pour atteindre 16K€ en mai 2024, soit un delta négatif d'environ −7K€ €/mois. Ce décalage s'accentue mois après mois : le nouveau modèle était encore favorable en août 2023 (+765 €), mais la tendance s'est inversée dès septembre 2023 pour ne jamais se rétablir.

Ce phénomène s'explique principalement par la très faible activité enregistrée par location : 151 des 152 établissements sont classés « micro » (0–5 employés facturables) en mai 2024, et le taux moyen d'inactivité des locations est de 87% sur la période. Autrement dit, la majorité des établissements génère un revenu plancher de 60 €/mois sans consommation réelle.

# Actions recommandées
## 1. Améliorer la récolte de donnée. 
Avant toute décision stratégique sur le pricing, il est indispensable de résoudre le problème des événements orphelins. Sans cette correction, toute comparaison legacy vs. consumption est biaisée à la baisse. Une collaboration avec l'équipe tech pour rattacher ces événements à leurs contrats respectifs permettrait de réévaluer le revenu consumption réel.

## 2. Activer les comptes à risque churn. 
Biaisé par le manque de donnée, mais à date, on observe des comptes comme Cluxxxxxxxxxx qui paient pour 29 locations sans activité chaque mois.
Ces comptes inactifs représentent un risque de churn élevé et devraient être priorisés par le Customer Success pour accompagner leur activation.
Un dashboard à destination des AMs pourrait permettre une meilleure compréhension de l'usage de l'outil par leur portefeuille de client. 
En parallèle, un système d'alerting pourrait être déployé pour cibler les comptes en fort risque de churn (basé sur l'activité).

## 3. Réévaluer la grille tarifaire si les données corrigées confirment la contraction. 
Si après correction/récupération de la donnée, le delta reste significativement négatif, il sera pertinent d'ajuster les prix de base par taille d'établissement ou les seuils de tranche pour rapprocher le nouveau modèle du revenu legacy, tout en conservant l'alignement prix/usage qui est l'objectif stratégique de la migration.