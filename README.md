# zakk-OS

**Nasce per curiosità, cresce grazie alla condivisione e non prende ordini da nessuno.**

## ⚠️ NON È PER TUTTI. VERSIONE SPERIMENTALE. SOLO UEFI.

**Versione: 0.2 Alpha 3 — Experimental**

zakk-OS è una distribuzione Linux sperimentale basata su **Debian 13 Trixie (AMD64)**, con desktop **Cinnamon**.

È un progetto personale nato per costruire un sistema essenziale, personalizzabile e orientato all'homelab e ai futuri esperimenti con **intelligenza artificiale locale**. Non promette di rivoluzionare Linux e non pretende di sostituire le distribuzioni consolidate.

**Non è una distribuzione stabile e non è destinata all'uso in produzione.**

## Screenshot

### Desktop Cinnamon

![Desktop zakk-OS con tema scuro e dock Plank](screenshots/desktop.png)

### Applicazioni e strumenti

| Menu applicazioni | Strumenti di amministrazione |
|:--:|:--:|
| [![Menu di zakk-OS](screenshots/menu_app1.png)](screenshots/menu_app1.png) | [![Menu amministrazione](screenshots/menu_app2.png)](screenshots/menu_app2.png) |

| Resources: monitoraggio del sistema | MintUpdate: aggiornamenti |
|:--:|:--:|
| [![Resources](screenshots/resources.png)](screenshots/resources.png) | [![MintUpdate](screenshots/mintupdate.png)](screenshots/mintupdate.png) |

### Gestione software e installazione

| MintInstall con Flathub | Calamares: installazione completata |
|:--:|:--:|
| [![MintInstall](screenshots/mintinstall.png)](screenshots/mintinstall.png) | [![Calamares](screenshots/calamares.png)](screenshots/calamares.png) |

*Gli screenshot qui sopra provengono dai test della versione **0.2 Alpha 2**; non sono nuove acquisizioni della Alpha 3.*

## Caratteristiche della 0.2 Alpha 3

- Base **Debian 13 Trixie**, architettura **AMD64**.
- Desktop **Cinnamon** personalizzato, tema scuro e dock **Plank**.
- Avvio e installazione **esclusivamente UEFI**; BIOS Legacy/CSM non supportato.
- Installazione grafica tramite **Calamares**.
- Repository Debian con componenti `main`, `contrib`, `non-free` e `non-free-firmware`, oltre a **Trixie Backports**.
- Kernel Linux **7.2.11** dai backports nella build Alpha 3 testata.
- **Firefox ESR** come browser preinstallato, al posto di Ecosia.
- Gestione software con **MintInstall**, Flatpak/Flathub e aggiornamenti tramite **MintUpdate**.
- Stack audio con **PipeWire**, **WirePlumber**, compatibilità PulseAudio/ALSA e utility ALSA.
- Pacchetto **xdg-user-dirs** per le directory standard dell'utente.
- **Resources** per il monitoraggio del sistema.
- **Nemo**, **VLC**, **FFmpeg**, **gThumb**, **LocalSend** e altre utility essenziali.
- Interfaccia preconfigurata in italiano.

La disponibilità di un pacchetto nella configurazione di build non garantisce la compatibilità di ogni funzione con qualsiasi hardware.

## Installazione

**ATTENZIONE: SOLO UEFI. BIOS Legacy NON supportato.**

1. Scaricare la ISO: **[zakk-OS 0.2 Alpha 3](https://zakkos.it/download/zakk-OS_0.2_alpha3.iso)** (2.203.779.072 byte).
2. Scaricare il **[file SHA256](https://zakkos.it/download/zakk-OS_0.2_alpha3.iso.sha256)** e verificare l’integrità con `sha256sum -c zakk-OS_0.2_alpha3.iso.sha256`.
3. Avviare la ISO in modalità UEFI, preferibilmente in una macchina virtuale o su un PC dedicato ai test.
4. Avviare l'installatore Calamares e seguire le indicazioni sullo schermo.

**L'installazione può cancellare definitivamente i dati sul disco di destinazione. Fare un backup prima di iniziare.**

Non utilizzare zakk-OS Alpha 3 come unico sistema su cui conservare dati importanti.

## Hardware e test

### Prove delle versioni precedenti

- **VirtualBox** con avvio UEFI.
- **AMD Ryzen 5 3500X + NVIDIA RTX 2060 SUPER**: configurazione riportata nei test della Alpha 2.

### Test eseguiti su Alpha 3

- Piattaforma **Intel X79 / Xeon**, scheda video **NVIDIA GeForce GTX 1650**.
- Installazione opzionale del driver **NVIDIA Open 595.112.07** su kernel **7.2.11+deb13-amd64**.
- Compilazione del modulo con DKMS, passaggio **DKMS 3.2.2 → 3.4.4**, ricompilazione e reinstallazione del modulo.
- Riavvio e utilizzo di Cinnamon/Xorg con il driver NVIDIA attivo.
- Benchmark e prova di carico GPU completati senza blocchi evidenti nei test effettuati.

**Importante:** NVIDIA Open 595 **non è incluso nella ISO base**. È stato installato successivamente sulla macchina di test mediante repository NVIDIA. Questi risultati riguardano la configurazione provata e **non certificano** compatibilità generale, stabilità a lungo termine o aggiornamenti futuri del kernel.

## Problemi noti e limiti

- Distribuzione **Alpha**: possono esserci bug, crash e regressioni.
- Compatibilità hardware non ancora verificata su un insieme ampio di PC.
- Il driver **Nouveau** può presentare problemi con alcune GPU NVIDIA; i test riusciti con NVIDIA Open non eliminano questo rischio.
- I driver NVIDIA alternativi devono essere installati separatamente, dopo aver verificato il supporto della specifica GPU.
- Supporto a dispositivi Wi-Fi, firmware particolari e periferiche meno comuni ancora da verificare caso per caso.
- Il ciclo di aggiornamento verso **un nuovo kernel** con ricompilazione automatica DKMS non è ancora stato validato in questa campagna di test.
- La ricostruzione della ISO dal solo checkout Git non è ancora garantita: alcuni componenti richiedono staging esterno.

## Funzionalità future (non incluse come funzioni complete della Alpha 3)

- **zakk-OS Root**, pannello di controllo in Rust/GTK4.
- Installazione guidata dei driver grafici.
- Gestione opzionale di **Ollama** e strumenti per l'AI locale.
- Installazione opzionale di **Open WebUI** e **ComfyUI**.
- Ulteriori prove su hardware reale e perfezionamento della procedura di build.

## Sorgenti e compilazione

Il progetto è costruito con Debian **`live-build`**. Il repository contiene configurazioni, script e personalizzazioni della distribuzione.

I Flatpak eventualmente predisposti tramite staging, le cache, gli alberi temporanei di compilazione e le ISO generate **non sono versionati nel repository Git**.

**La ricostruzione integrale della ISO a partire dal solo repository non è ancora garantita**, perché alcuni passaggi di staging non sono completamente automatizzati.

Per informazioni sui pacchetti esterni, consultare `manifests/`.

I componenti di terze parti restano soggetti alle rispettive licenze.

## Avvertenze

Questa versione può contenere errori, crash, problemi di compatibilità e funzionalità incomplete. È destinata a prove e sperimentazione, non ad attività critiche o sistemi di produzione.

zakk-OS è un progetto indipendente, **non affiliato** a Debian, Linux Mint, NVIDIA o agli altri progetti utilizzati.

---

**Nasce per curiosità, cresce grazie alla condivisione e non prende ordini da nessuno.**

**… e non dimenticate che son cazzi vostri.**
