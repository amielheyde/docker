# Docker container for ancient iDRAC console

Docker container running Mate desktop in Ubunut Xenial 16.04 and IcedTea plugin for web start.

Workarounds for permissions not granted to unsigned jars.

/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/java.security
jdk.jar.disabledAlgorithms=MD2, RSA keySize < 1024
