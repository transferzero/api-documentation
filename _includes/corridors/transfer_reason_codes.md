List of transfer reasons and corresponding `transfer_reason_code` are:

{% capture transfer_reason_codes %}
```
Sending money into my own account: personal_account
Donations and gifts: donations_and_gifts
Sending money to a friend, family member or any third party person: third_party_person_account
Mortgage repayments: mortgage_repayments
Business Travel Payments: business_travel_payments
Personal Travel Payments: personal_travel_payments
Tuition fees: tuition_fees
Commission and fees for financial services: financial_commission_fees
Proceeds for financial services charged for advice provided: financial_services_proceeds
Investment into property by a foreign individual: individual_property_investments
Investment by a foreign individual - other: other_investments
Investment into property by a foreign corporate entity: corporate_property_investments
Capital payments by immigrants: immigrants_capital_payments
Legal services: legal_services
Accounting services: accounting_services
Management consulting services: consulting_services
Public relation services: public_relation_services
Advertising & market research services: ads_and_market_research_services
Managerial services: managerial_services
Medical and dental services: medical_and_dental_services
Educational services: educational_services
Operational leasing: operational_leasing
Cultural and recreational services: cultural_and_recreational_services
Salary paid to South African Resident Temporarily Abroad: salary_resident_out_country
Salary paid to a non-resident employee in South Africa: salary_non_resident_in_country
Salary paid to a foreign national contract worker in South Africa: salary_contract_worker_in_country
Payments to social security schemes: social_security_schemes
Payments to charities and religious bodies: charities_and_religious_bodies
Donations and aid to Government: donations_and_aid_to_government
Donations and aid to private sector: donations_and_aid_to_private
Pensions: pensions
Annuities: annuities
Inheritances: inheritances
Alimony: alimony
Tax - Income tax: tax_income
Tax - VAT refunds: tax_vat_refunds
Tax - Other: tax_other
Insurance premiums (non life/short term): non_life_insurance_premiums
Insurance premiums (life): life_insurance_premiums
Dividends: dividends
Branch profits: branch_profits
Commission or brokerage: commision_or_brokerage
Rental: rental
Income earned abroad by a resident on an individual investment: individual_investment_income_from_abroad
Sale of shares: shares_sale
Sale of bonds: bonds_sale
Sale of money market instruments: money_market_instruments_sale
Repatriation of funds out of a foreign bank account: funds_repatriation_of_foreign_bank_account
Sale of mutual funds or collective investment schemes: mutual_funds_sale_or_collective_investment
Sale of overseas property: overseas_property_sale
Sale and repatriation of other investment: sale_and_repatriation_of_other_investment
Repatriation on instruction by the South African Reserve Bank: repatriation_south_african_reserve_bank_instruction
Loan made to a resident by a non-resident shareholder: resident_loan_from_non_resident_share_holder
Loan made to a resident by a non-resident third party: resident_loan_from_non_resident_third_party
Repayment by a South African living overseas of a loan granted by a resident: resident_loan_repayment_from_overseas_living_south_african
Repayment of a study loan: study_loan_repayment
Repayment of a shareholders loan: shareholders_loan_repayment
Repayment of a third party loan (excluding shareholders): third_party_loan_repayment
Repayment of a trade finance loan: trade_finance_loan_repayment
Proceeds received for research and development services: research_and_development_proceeds
Funding received for research and development: research_and_development_funding
Repairs and maintenance on machinery and equipment: machinary_and_equipment_repairs
Architectural, engineering and other technical services: architectural_engineering_technical_services
Agricultural, mining, waste treatment and depollution services: agrigultural_mining_waste_depollution_services
Proceeds for construction services: construction_services
Payments for telecommunication services: telecommunication_services
Payments for data, news related and news agency fees: data_news_agency_fees
Payments for passenger services - road: road_passenger_services
Payments for passenger services - rail: rail_passenger_services
Payments for passenger services - sea: sea_passenger_services
Payments for passenger services - air: air_passenger_services
Payments for freight services - road: road_freight_services
Payments for freight services - rail: rail_freight_services
Payments for freight services - sea: sea_freight_services
Payments for freight services - air: air_freight_services
Payments for postal and courier services - road: road_postal_and_courier_services
Payments for postal and courier services - rail: rail_postal_and_courier_services
Payments for postal and courier services - sea: sea_postal_and_courier_services
Payments for postal and courier services - air: air_postal_and_courier_services
Investment in listed shares: listed_shares_investment
Investment in non-listed shares: non_listed_shares_investment
Investment into money market instruments: money_market_instruments_investment
Investment into listed bonds: listed_bonds_investment
Investment into non-listed bonds: non_listed_bonds_investment
Rights assigned for licences to reproduce and/or distribute: reproduce_distribute_rights_license
Rights assigned for using patents and inventions (licensing): patents_and_investions_rights_license
Rights assigned for using patterns and designs (including industrial processes): patterns_and_designs_rights
Rights assigned for using copyrights: copyrights_rights
Rights assigned for using franchises and trademarks: franchises_and_trademarks_rights
Disposal of patents and inventions: patents_and_inventions_disposal
Disposal of patterns and designs (including industrial processes): patterns_and_designs_disposal
Disposal of copyrights: copyrights_disposal
Disposal of franchises and trademarks: franchises_and_trademarks_disposal
Sales of original manuscripts, sound recordings and films: sales_of_manuscripts_sound_recordings_films
Receipt of funds relating to the production of motion pictures, radio and television programs and musical recordings: funds_related_to_recording_productions
The outright selling of ownership rights of software: software_ownership_rights_sale
Computer-related services including maintenance, repair and consultancy: computer_services
Commercial sales of customised software and related licenses for use of customers: customised_software_sales
Commercial sales of non-customised software on physical media with periodic licence to use: non_customised_software_on_physical_media_periodic_licence_sale
Commercial sales of non-customised software provided on physical media with right to perpetual (ongoing) use: non_customised_software_on_pyisical_media_perpetual_use_sale
Commercial sales of non-customised software provided for downloading or electronically: non_customised_software_for_downloading_electronically_made_periodic_licence_salemade available with periodic license'
Commercial sales of non-customised software provided for downloading or electronically: non_customised_software_for_downloading_electronically_made_single_payment_salemade available with single payment'
Donations to SA Government for fixed assets: fixed_assets_donations_to_sa_government
Donations to corporate entities - fixed assets: fixed_assets_donations_to_corporate_entities
Disinvestment of property by a resident corporate entity: property_disinvestment_by_corporate_entity_resident
Proceeds for other business services not included elsewhere: other_business_services
Disinvestment by resident institutional investor - Collective Investment Scheme: institutional_investor_disinvestment
Payment for Government Services: government_services
```
{% endcapture %}

{% include language-tabbar.html prefix="xof-transfer-reason-codes" raw=transfer_reason_codes %}
