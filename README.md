# Partie 2 : Dashboard & Business Insights
📊 Dashboard Looker : [ici](https://lookerstudio.google.com/u/1/reporting/10f67ddd-d9ba-4b15-9682-2ff7282af8c0/page/p_r9lan4c80d)

## Recommandation stratégique
### Problème principale détecté : 
❌ ~70 % d'événements (shifts/rests) sont "orphelins", (que nous ne pouvons rattacher à des locations), sous-estime le nombre d'employés facturables et donc le revenu consumption. 
⚠️ Les chiffres présentés constituent alors une borne basse.

L'analyse de l'impact de la migration du modèle à prix fixe (legacy) vers la tarification à la consommation révèle un manque à gagner croissant.
Alors que le MRR consumption stagne autour de 9.1K€–9.6K€/mois sur la période observée, le MRR legacy théorique progresse régulièrement pour atteindre 16K€ en mai 2024, soit un delta négatif d'environ −7K€ €/mois. Ce décalage s'accentue mois après mois : le nouveau modèle était encore favorable en août 2023 (+765 €), mais la tendance s'est inversée dès septembre 2023 pour ne jamais se rétablir.

Ce phénomène s'explique principalement par la très faible activité enregistrée par location : 151 des 152 établissements sont classés « micro » (0–5 employés facturables) en mai 2024, et le taux moyen d'inactivité des locations est de 87% sur la période. Autrement dit, la majorité des établissements génère un revenu plancher de 60 €/mois sans consommation réelle.

## Actions recommandées
### 1. Améliorer la récolte de donnée. 
Avant toute décision stratégique sur le pricing, il est indispensable de résoudre le problème des événements orphelins. Sans cette correction, toute comparaison legacy vs. consumption est biaisée à la baisse. Une collaboration avec l'équipe tech pour rattacher ces événements à leurs contrats respectifs permettrait de réévaluer le revenu consumption réel.

### 2. Activer les comptes à risque churn. 
Biaisé par le manque de donnée, mais à date, on observe des comptes comme Cluxxxxxxxxxx qui paient pour 29 locations sans activité chaque mois.
Ces comptes inactifs représentent un risque de churn élevé et devraient être priorisés par le Customer Success pour accompagner leur activation.
Un dashboard à destination des AMs pourrait permettre une meilleure compréhension de l'usage de l'outil par leur portefeuille de client. 
En parallèle, un système d'alerting pourrait être déployé pour cibler les comptes en fort risque de churn (basé sur l'activité).

### 3. Réévaluer la grille tarifaire si les données corrigées confirment la contraction. 
Si après correction/récupération de la donnée, le delta reste significativement négatif, il sera pertinent d'ajuster les prix de base par taille d'établissement ou les seuils de tranche pour rapprocher le nouveau modèle du revenu legacy, tout en conservant l'alignement prix/usage qui est l'objectif stratégique de la migration.

# Partie 1 : Questions
## Question 1 et 2 :
- Visible dans le dashboard Looker [ici](https://lookerstudio.google.com/u/1/reporting/10f67ddd-d9ba-4b15-9682-2ff7282af8c0/page/p_cecyl9280d)

## Question 3 - Qualité des données (bonus)
1.. Sur 109K events (shifts + rests), 76K (**≃70**%) ne sont pas rattachables à un contrat dans `user_contracts` :
- Shifts : 9 085 / 21 003 (43.3%)
- Rests : 66 589 / 87 909 (75.7%)

### Impact sur la facturation :
- Consumption pricing : les chiffres présentés sont une **borne basse** — le revenu réel serait plus élevé avec des données complètes *(plus de consommation)*

### Solution :
- Préférable : Communiquer auprès de la tech pour faire un rattrapage de la donnée
- À défaut : Utiliser 30% des évènements disponibles et rattachable à un contrat ! + ajout d’un test **not_null** dans la table **mart_planning_events** pour s’assurer de bien récupérer le **user_contract_id** (alerting sur la qualité de la donnée)

2. Sur 7.7K membres, 4.9K (**≃50**%) ne sont pas rattachables à un contrat dans `user_contracts` 

### **Impact sur la facturation :**
- Legacy pricing : les chiffres présentés sont également une **borne basse** — le revenu réel serait plus élevé avec des données complètes *(plus d’employés par établissement)*

**Solution :** 
- Préférable : Communiquer auprès de la tech pour faire un rattrapage de la donnée
- À défaut :  Ne considérer que les employés ayant un contrat rattachable à une location !
