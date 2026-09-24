# 🏫 Schul-Planer Pro 2026 (Raumverwaltung & Stundenplanung)

Eine plattformunabhängige Desktop-Applikation zur Schulverwaltung, Stundenplanung und zum automatisierten Vertretungsmanagement (Jahrgangsstufen 5 bis 10). 

Das System wurde im Rahmen einer 16-wöchigen Projektarbeit im Informatik-Studium entwickelt. Der Fokus lag auf einer sauberen N-Tier-Architektur, der strikten Trennung von UI und Geschäftslogik sowie der Gewährleistung von Datenintegrität in einer relationalen Datenbank.

---

## 👥 Team & Architektur-Aufteilung

Die Konzeption und Implementierung erfolgte kollaborativ mit einer klaren Trennung der Architekturschichten:

* **Ismail Hamoud** – Frontend & Client-Architektur: Requirements Engineering, Implementierung der Präsentationsschicht (JavaFX / AtlantaFX), MVVM-Strukturierung und asynchrones Data-Binding.
* **Carlo Iuliano ([@Carlo2903](https://github.com/Carlo2903))** – Backend & Persistenz: Relationales Datenbankdesign, ORM (Hibernate), Generic-DAOs sowie die Implementierung der zentralen Domänenlogik (`KonfliktService` und `VertretungsService`).

> 💡 **Hinweis zum Mirror:** Das Projekt wurde kollaborativ entwickelt: [**Zum Original-Repository**](https://github.com/Carlo2903/RaumVerwaltung). Bei diesem Repository handelt es sich um meinen persönlichen Mirror, um meine spezifischen Beiträge zur Client-Architektur für mein Portfolio unabhängig zu dokumentieren.

---

## 📸 UI & Features

<p align="center">
  <img width="500" alt="Login_Maske" src="https://github.com/user-attachments/assets/e9b2b240-a245-4a7d-add7-dafaa1d52ee3" />
  <br>
  <em>1. Authentifizierungsmaske im Flat-Design (AtlantaFX).</em>
  <br><br><br>
 <img width="500" alt="Stundenplan_Editor" src="https://github.com/user-attachments/assets/57e8bdf5-5406-4074-84c1-70050e3d6dfe" />
  <br>
  <em>2. Interaktiver Stundenplan-Editor: Präventives Abfangen von Doppelbelegungen (PlanungException) in Echtzeit durch den KonfliktService.</em>
  <br><br><br>
 <img width="500" alt="Schueler_Portal" src="https://github.com/user-attachments/assets/140c1701-ca65-4670-8ab9-139232325616" />
  <br>
  <em>3. Schreibgeschütztes Schüler-Portal: Reagiert asynchron auf Updates im Backend und signalisiert Vertretungen visuell (Ampelsystem).</em>
</p>

---

## 🏗 Architektur & Design Patterns

* **Frontend (MVVM):** Reaktive Architektur mit JavaFX. Ansichten sind über Properties (`ObservableList`) an ViewModels gekoppelt. UI-Komponenten sind vollständig von der Domänenlogik entkoppelt.
* **Backend (N-Tier & ORM):** Strikte Schichtenarchitektur. Die Datenzugriffsschicht nutzt das **Generic-DAO-Pattern** in Kombination mit JPA/Hibernate zur Kapselung von SQL-Abfragen.
* **IT-Sicherheit:** Benutzerpasswörter werden kryptografisch per SHA-256 gehasht. Das Rollenkonzept (Admin, Lehrer, Schüler) verhindert das Laden administrativer CRUD-Masken auf Speicherebene, wenn der Nutzer nur über Lesezugriff verfügt (Security by Design).

---

## 🧠 Technische Herausforderungen & Implementierungsdetails

### 1. Asynchrone Thread-Synchronisation im UI
Zeitintensive Datenaktualisierungen dürfen den *JavaFX Application Thread* nicht blockieren. Zur automatisierten Aktualisierung der Stundenpläne wurde ein `AutoRefreshService` auf Basis der Java-Timeline implementiert. Dieser lagert Abfragen asynchron aus und reiht UI-Updates mittels `Platform.runLater()` thread-sicher in die Warteschlange ein. Dies verhindert `NotOnFxApplicationThreadException`-Fehler und garantiert eine hochperformante Benutzeroberfläche.

### 2. Verteiltes Integrationstesting via SDN (ZeroTier)
Um komplexe Kaskadierungseffekte (z. B. das Löschen einer Lehrkraft samt verknüpfter Vertretungsstunden) und den automatischen UI-Refresh realitätsnah zu testen, wurde ein verschlüsseltes Peer-to-Peer-VPN über **ZeroTier** eingerichtet. Dies ermöglichte ein effizientes Integrationstesting unter echten Client-Server-Bedingungen auf einer gemeinsamen PostgreSQL-Instanz ohne externe Hosting-Kosten.

### 3. ORM-Optimierung (N+1 Select Problem)
Das Ladeverhalten von Hibernate führte bei stark verknüpften Entitäten (Stunde, Lehrkraft, Raum) zunächst zu massiven Performance-Einbußen durch das N+1-Select-Problem. Durch gezieltes Refactoring der JPQL-Abfragen auf `LEFT JOIN FETCH` werden relationale Abhängigkeiten nun atomar und effizient in einem einzigen SQL-Statement geladen.

---

## 🛠 Tech-Stack

* **Frontend:** Java (JDK 21), JavaFX (v21.0.6), AtlantaFX (v2.1.0)
* **Backend:** JPA / Hibernate (ORM), PostgreSQL
* **Tools & Infrastruktur:** Maven (Wrapper), JUnit (Testing), ZeroTier One (SDN)

---

## ⚙️ Lokales Setup & Testing

### 📋 Voraussetzungen
* **Java JDK 21** muss installiert und in den Umgebungsvariablen (`JAVA_HOME`) gesetzt sein.
* **PostgreSQL** muss lokal installiert sein und als Dienst laufen.

### 🛠 Installation & Start

**1. Repository klonen:**
```bash
git clone https://github.com/isham002/RaumVerwaltung.git
cd RaumVerwaltung
```

**2. Datenbank initialisieren (PostgreSQL):**
Das System benötigt relationale Testdaten. Die Tabellenstrukturen und Dummy-Daten liegen im `database`-Ordner bereit.

* Erstelle lokal eine leere Datenbank namens `schulverwaltung`.
* Führe das Schema-Skript aus: `database/01_schema.sql`
* Spiele anschließend die Testdaten ein: `database/02_data.sql`
* Passe die JDBC-Verbindungsdaten (User/Passwort) in der Hibernate-Konfiguration an.
📍 **Pfad:** `src/main/resources/META-INF/persistence.xml`

**3. Automatisierte Tests ausführen (JUnit):**
Das Projekt nutzt den integrierten Maven-Wrapper. Führe die Unit-Tests der Domänenlogik über folgenden Befehl aus:

* **Windows:** `mvnw.cmd test`
* **Mac / Linux:** `./mvnw test`

**4. Anwendung starten:**
* **Windows:** `mvnw.cmd clean javafx:run`
* **Mac / Linux:** `./mvnw clean javafx:run`

### 🔑 Login-Daten für die Testumgebung

Um das rollenbasierte System direkt zu testen, sind im SQL-Skript (`02_data.sql`) folgende Dummy-Accounts hinterlegt (die Passwörter liegen in der DB als SHA-256 Hash vor):

* **Administrator:** Benutzername: `admin` | Passwort: `admin123`
* **Lehrkraft (Lesezugriff):** Benutzername: `krz` | Passwort: `lehrer123`
* **Schüler (Lesezugriff):** Benutzername: `5b` | Passwort: `schueler123`

---

## 📄 Lizenz

Dieses Projekt ist unter der MIT-Lizenz lizenziert. Weitere Details finden sich in der `LICENSE`-Datei.
