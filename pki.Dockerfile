FROM corda/enterprise-pkitool:1.5.9-zulu-openjdk8u382 as build
FROM public.ecr.aws/amazonlinux/amazonlinux:2 as main

RUN yum -y install wget java-1.8.0-openjdk && yum clean all

RUN mkdir -p /pki-tool-jar
COPY --from=build /opt/cenm/bin/pkitool.jar /pki-tool-jar/
COPY --from=build /opt/cenm/bin/bcp*.jar /pki-tool-jar/

CMD ["/bin/bash"]