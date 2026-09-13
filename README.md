# 🏫 Schul-Planer Pro 2026 (Raumverwaltung & Stundenplanung)

Eine plattformunabhängige Desktop-Applikation zur **vollständigen Administration von Schulbetrieben** (Jahrgangsstufen 5 bis 10). Die Software digitalisiert die Stundenplanung, verwaltet Raumbelegungen, steuert ein automatisiertes Vertretungsmanagement und bietet ein schreibgeschütztes, reaktives Portal für Lehrkräfte und Schüler.

Das System wurde im Rahmen einer 16-wöchigen Projektarbeit im **Informatik-Studium** entwickelt. Die Architektur basiert auf einer strikten Schichtenarchitektur mit einem **MVVM-Präsentationslayer** im Frontend und einer relationalen **JPA/Hibernate-Datenhaltung (PostgreSQL)** im Backend.

---

## 👥 Das Team & Projektaufteilung

Die Konzeption und Implementierung der Anwendung erfolgte in gleichwertiger Zusammenarbeit mit klarer Aufteilung der Verantwortungsbereiche:
* **Carlo Iuliano ([@Carlo2903](https://github.com/Carlo2903))** – Backend & Persistenzschicht: Relationales Datenbankdesign, ORM (Hibernate), Generic DAOs sowie die Implementierung der Geschäftslogik (`KonfliktService` und `VertretungsService`).
* **Ismail Hamoud** – Frontend & Client-Architektur: Requirements Engineering, UML-Spezifikation, Implementierung der Präsentationsschicht (JavaFX), MVVM-Strukturierung und Data-Binding.

> 💡 **Hinweis zum Mirror:** Das Projekt wurde kollaborativ im Repository von Carlo entwickelt: [**Zum Original-Repository**](https://github.com/Carlo2903/RaumVerwaltung). Bei diesem Repository handelt es sich um meinen persönlichen Mirror, um meine spezifischen Beiträge zur Client-Architektur für mein Portfolio unabhängig zu dokumentieren.

---

## 📸 Screenshots

<p align="center">
  <img width="500" alt="Login_Maske" src="https://github.com/user-attachments/assets/e9b2b240-a245-4a7d-add7-dafaa1d52ee3" />
  <br>
  <em>1. Authentifizierungsmaske im modernen Flat-Design mittels AtlantaFX-Framework.</em>
  <br><br><br>
  <img width="500" alt="Stundenplan_Editor" src="https://github.com/user-attachments/assets/57e8bdf5-5406-4074-84c1-70050e3d6dfe" />
  <br>
  <em>2. Interaktiver Stundenplan-Editor: Visuelles Abfangen von Doppelbelegungen (PlanungException) in Echtzeit.</em>
  <br><br><br>
  <img width="500" alt="Schueler_Portal" src="https://github.com/user-attachments/assets/140c1701-ca65-4670-8ab9-139232325616" />
  <br>
  <em>3. Schreibgeschütztes Schüler-Portal mit integriertem, ergonomischen Ampelsystem für Vertretungsstunden und Ausfälle.</em>
  
</p>

---

## 🚀 Meine Schwerpunkte im Projekt (Client-Architektur)

Meine Hauptverantwortlichkeit lag in der vollständigen Umsetzung der clientseitigen Präsentationsschicht:

* **UI-Design & Styling (JavaFX & AtlantaFX):** Gestaltung der grafischen Benutzeroberfläche nach aktuellen UI/UX-Standards. Einbindung des CSS-Frameworks *AtlantaFX*, um eine konsistente, ablenkungsfreie Oberfläche mit kurzen Klickwegen für den administrativen Betrieb zu realisieren.
* **MVVM-Entwurfsmuster & Data-Binding:** Architekturierung des Frontends nach dem Model-View-ViewModel-Muster. Ansichten (z. B. `StundenplanRasterView`) sind über Properties (z. B. `ObservableList`) direkt an das zugehörige ViewModel gekoppelt, wodurch sich Zustandsänderungen aus dem Backend reaktiv und ohne manuellen UI-Refresh spiegeln.
* **Rollenbasierte Maskenkonzeption & Sicherheit:** Clientseitige Absicherung des Rechtesystems. Während Administratoren vollen Zugriff auf die CRUD-Masken zur Stammdatenverwaltung haben, wird für Schüler und Lehrer ein schreibgeschütztes Dashboard geladen. Die administrativen Masken werden für diese Rollen aus Sicherheitsgründen gar nicht erst in den Arbeitsspeicher geladen.
* **Preloading-Mechanismen:** Implementierung von Daten-Vorlademechanismen (z. B. automatisches Vorladen der Wochenansicht im Schülerview), um spürbare Ladeverzögerungen beim Wechsel zwischen den Tabs zu verhindern.

---

## 🧠 Technische Herausforderungen & "Lessons Learned"

### 1. Thread-Synchronisation im UI (JavaFX Application Thread)
* **Problem:** Da alle UI-Updates in JavaFX zwingend auf dem Single-Thread der *JavaFX Application Thread* laufen müssen, führten zeitintensive Datenaktualisierungen im Hintergrund schnell zu unprofessionellen "UI-Freezes".
* **Lösung:** Zur automatischen Aktualisierung der Pläne wurde ein `AutoRefreshService` auf Basis der JavaFX-Timeline entwickelt, der asynchrone Datenaktualisierungen mittels `Platform.runLater()` thread-sicher in die Warteschlange des UI-Threads einreiht. Dies verhinderte `NotOnFxApplicationThreadExceptions` und hielt die Oberfläche performant.

### 2. Verteiltes Integrationstesting via Software-Defined Network (SDN)
* **Problem:** Um die Kernfunktionen (wie den automatischen UI-Refresh im 30-Sekunden-Intervall) realitätsnah im Team zu testen, waren isolierte lokale Datenbankkopien nicht ausreichend.
* **Lösung:** Wir haben ein verschlüsseltes Peer-to-Peer-VPN über **ZeroTier** eingerichtet. Dadurch konnte ich von meinem Entwicklungsstandort aus direkt über eine virtuelle IP-Adresse auf die PostgreSQL-Datenbank auf dem Host-Rechner meines Teamkollegen zugreifen. Dies ermöglichte uns ein effizientes Integrationstesting unter echten Client-Server-Bedingungen ohne externe Hosting-Kosten.

---

## 🛠 Tech-Stack

* **Frontend:** Java (JDK 21), JavaFX (v21.0.6), AtlantaFX (v2.1.0)
* **Build-Tool:** Maven (inklusive Maven-Wrapper)
* **Backend & Persistenz (Carlos Part):** JPA / Hibernate (ORM), PostgreSQL
* **Netzwerkinfrastruktur:** ZeroTier One (SDN)

---

## ⚙️ Lokales Setup

1. **Repository klonen & Verzeichnis wechseln:**
   ```bash
   git clone https://github.com/isham002/RaumVerwaltung.git
   cd RaumVerwaltung
   ```

2. **PostgreSQL-Datenbank vorbereiten:**
   * Erstelle lokal eine leere Datenbank namens `schulverwaltung`.
   * Die Tabellenstrukturen werden beim ersten Start über die Hibernate-Konfiguration (`persistence.xml`) automatisiert generiert (`hbm2ddl.auto = update`).
   * Passe die JDBC-Verbindungsdaten in der entsprechenden Konfigurationsklasse an.

3. **Anwendung ausführen:**
   Das Projekt nutzt den integrierten Maven-Wrapper (`mvnw`), weshalb keine lokale Maven-Installation erforderlich ist:

   * **Windows:** `mvnw.cmd clean javafx:run`
   * **Mac / Linux:** `chmod +x mvnw && ./mvnw clean javafx:run`
