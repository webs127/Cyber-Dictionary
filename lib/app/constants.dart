class AppConstants {
  static const String appJsondata  = '''[
    {
        "name": "Advanced Persistent Threat",
        "description": "In an APT attack, a threat actor uses the most sophisticated tactics and technologies to penetrate a high-profile network. APTs aim to stay ‘under the radar’ and explore the network while remaining undetected for weeks, months, and even years. APTs are most often used by nation-state threat actors wishing to cause severe disruption and damage to the economic and political stability of a country. They can be considered the cyber equivalent of espionage ‘sleeper cells’."
    },
    {
        "name": "Advanced Threat Protection",
        "description": "Advanced Threat Protection (ATP) are security solutions that defend against sophisticated malware or hacking attacks targeting sensitive data. Advanced Threat Protection includes both software and managed security services."
    },
    {
        "name": "Adware",
        "description": "Adware bombards users with endless ads and pop-up windows and causes a nuisance to the user experience. Adware can also pose a real danger to devices and the unwanted ads can include malware or redirect user searches to malicious websites that collect personal data about users. Adware programs are often built into freeware or shareware programs, where the adware operator collects an indirect fee for using the program. Adware programs usually do not show themselves in the system in any way. Adware programs seldom include a de-installation procedure, and attempts to remove them manually may cause the original carrier program to malfunction."
    },
    {
        "name": "Anti-Botnet",
        "description": "Anti-Botnet toold automatically generates botnet checks when a user browses a website. If a risk is detected, it sends back a warning message to the device. The most common anti-botnet solution is CAPTCHA (Completely Automated Public Turing test to tell Computers and Humans Apart)."
    },
    {
        "name": "Anti-Malware",
        "description": "Anti-Malware is a program designed to protect computers and networks against any threats or attacks from viruses such as adware, spyware, and any such other malicious programs."
    },
    {
        "name": "Anti-Phishing",
        "description": "Anti-Phishing protects users from fraudulent websites, often perfect replicas of legitimate websites, undetectable to the human eye. Protection is enforced by detecting fraudulent emails, and by blocking phishing websites."
    },
    {
        "name": "Anti-Virus",
        "description": "Anti-Virus solutions integrate the latest generation of virus detection technology to protect users from viruses, spyware, trojans, and worms that can infect equipment through email or internet browsing."
    },
    {
        "name": "Attack Vector",
        "description": "An Attack Vector is the collection of all vulnerable points by which an attacker can gain entry into the target system. Attack vectors include vulnerable points in technology as well as human behavior, skillfully exploited by attackers to gain access to networks. The growth of IoT devices and (Work from Home) have greatly increased the attack vector, making networks increasingly difficult to defend."
    },
    {
        "name": "Authentication",
        "description": "Authentication is the process of verifying the identity of a user or piece of information and the veracity of the information provided. In computing, it is the process of identifying a person or system with a username, password, etc. Authentication helps individuals and systems gain authorization based on their identity and prevent unauthorized access."
    },
    {
        "name": "Backdoor",
        "description": "Attackers use a Backdoor to gain access to a computer or a network. A programmer may bypass security steps and gain access to a computer through trapdoor programs, in the event of an attack on the computer system or networks. Attackers may also use such mechanisms to enter computers or networks without proper permission."
    },
    {
        "name": "Banker Trojan",
        "description": "A Banker Trojan is a malicious computer program that intercepts sensitive personal information and credentials for accessing online bank or payment accounts."
    },
    {
        "name": "Blacklist",
        "description": "Blacklist, Blocklist, or Denylist is a basic access control mechanism that allows elements such as email addresses, users, passwords, URLs, IP addresses, domain names, file hashes, etc. through the system, except those explicitly mentioned which are denied access."
    },
    {
        "name": "Bot",
        "description": "A Bot is a program that automates actions on behalf of an agent for some other program or person and is used to carry out routine tasks. Their use for malicious purposes includes spam distribution, credentials harvesting, and the launching of DDoS attacks"
    },
    {
        "name": "Botnet",
        "description": "A Botnet is a collection of compromised computers running malicious programs that are controlled remotely by a C&C (command & control) server operated by a cyber-criminal. Cybercriminals exercise remote control through automated processes (bots) in public IRC channels or websites. (Such websites may either be run directly by the ‘bot herder,’ or they may be legitimate websites that have been subverted for this purpose.)"
    },
    {
        "name": "Brute Force Attack",
        "description": "This is a method for guessing a password (or the key used to encrypt a message) that involves systematically trying a high volume of possible combinations of characters until the correct one is found. One way to reduce the susceptibility to a Brute Force Attack is to limit the number of permitted attempts to enter a password – for example, by allowing only three failed attempts and then permitting further attempts only after 15 minutes."
    },
    {
        "name": "Business Continuity Plan",
        "description": "A Business Continuity Plan is an organization’s playbook for how to operate in an emergency situation, like a massive cyberattack. The business continuity plan provides safeguards against a disaster and outlines the strategies and action plan on how to continue business as usual in the event of any large-scale cyber event."
    },
    {
        "name": "Business Disruption",
        "description": "The term Business Disruption refers to any interruption in the usual way that a system, process, or event works. Cyberattacks cause disruption to business operations and the associated risk of losses to the organization."
    },
    {
        "name": "BYOC",
        "description": "Bring Your Own Computer (BYOC) is a fairly recent enterprise computing trend by which employees are encouraged or allowed to bring and use their own personal computing devices to perform some or part of their job roles, specifically personal laptop computers."
    },
    {
        "name": "BYOD",
        "description": "Bring Your Own Device (BYOD) is a policy of the organization allowing, encouraging or requiring its employees to use their personal devices such as smartphones, Tablet PCs, and laptops for official business purposes and accessing enterprise systems and data."
    },
    {
        "name": "BYOL",
        "description": "Bring Your Own Laptop (BYOL) is a specific type of BYOC by which employees are encouraged or allowed to bring and use their own laptops to perform some or part of their job roles, including possible access to enterprise systems and data."
    },
    {
        "name": "CAPTCHA",
        "description": "A CAPTCHA (Completely Automated Public Turing test to tell Computers and Humans Apart) is a challenge-response test commonly used by websites to verify the user is a real human and not a bot. They can include simple arithmetic and questions about images, that bots have difficulty answering."
    },
    {
        "name": "Clickjacking",
        "description": "Clickjacking involves tricking someone into clicking on one object on a web page while they think they are clicking on another. The attacker loads a transparent page over the legitimate content on the web page so that the victim thinks they are clicking on a legitimate item when they are really clicking on something on the attacker’s invisible page. This way, the attacker can hijack the victim’s click for their own purposes. Clickjacking could be used to install malware, gain access to one of the victim’s online accounts, or enable the victim’s webcam."
    },
    {
        "name": "Clientless",
        "description": "Clientless refers to a program that is run entirely from the network, without requiring any installation of software on the endpoint device running the program. Code Injection is commonly used by malware to evade detection by antivirus and anti-malware programs by injecting malicious code into a legitimate process. This way the legitimate process serves as camouflage so all anti-malware tools can see running is the legitimate process and thus obfuscates the malicious code execution."
    },
    {
        "name": "COTS",
        "description": "Commercial off-the Shelf or Commercially Available off the Shelf (COTS) products are packaged solutions that are then adapted to satisfy the needs of the purchasing organization, rather than the commissioning of custom-made, or bespoke, solutions."
    },
    {
        "name": "Critical Infrastructure",
        "description": "Critical Infrastructure represents the fundamental systems of an organization that is important for its survival and where any threat to such basic systems would endanger the entire organization."
    },
    {
        "name": "Cryptojacking",
        "description": "Cryptojacking consists of hackers using the computing power of a compromised device to generate or “mine” cryptocurrency without the owner’s knowledge. Mining can be performed either by installing a malicious program on the target computer or through various kinds of fileless malware. Sometimes attackers take over part of the computer’s processing power when a page containing a special mining script is opened. Cryptojacking has been known to occur when viewing online ads or solving a CAPTCHA."
    },
    {
        "name": "Cyberbullying",
        "description": "Cyberbullying is the use of electronic means, primarily messaging and social media platforms, to bully and harass a victim. Cyberbullying has become a major problem, especially affecting young people, as it allows bullies to magnify their aggressive behavior, publicly ridicule victims on a large scale, and carry out damaging activities in a way that is difficult for parents and teachers to detect."
    },
    {
        "name": "Cybersecurity",
        "description": "Cybersecurity relates to processes employed to safeguard and secure assets used to carry information of an organization from being stolen or attacked. It requires extensive knowledge of possible threats such as viruses or other malicious objects. Identity management, risk management, and incident management form the crux of the cybersecurity strategies of an organization."
    }
]''';
}