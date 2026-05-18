Return-Path: <linux-kbuild+bounces-13243-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPprMSuwCmog5wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13243-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:22:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 339E4566A23
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70E22301F4A1
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 06:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA67B3DFC92;
	Mon, 18 May 2026 06:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="JCA+TGVg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4D03DEAFC;
	Mon, 18 May 2026 06:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085303; cv=none; b=hUwC94DqnA0JwbsPyha8ywaGwXXutmQp5BuxrHvVT7KyU4CkxyHofRE44VMuFI4M+bxWXCimxNa7nJMsOnsF/p8r7vWhIopM41AL6XPd7+5PyC5gC+0qZVwS6qE9JREzVUdXmLSlet52N9KjLSFfnnDA5Mva/oG82hyQxvFPY8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085303; c=relaxed/simple;
	bh=b50ToFXRoxWRScu/nVpsrCRytSXn8cked0GlXqekENk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/PrUif9sxNj4ktD7Fkscr/Aiw62k9t2ZmNrI7qG9iMOLjJAfTx7ZZCoaG5cK8TOh50XCQhycG07tTEjij2Yff5thc9Z+pwlJBTOw6qZDRpqCwtAqAHCaTLYR/D1rBgyTQzQaVAIAEZzDyXkJNlyVKkIV2Vvo3UJTe8Oumj8h3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=JCA+TGVg; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 8C892200CB;
	Mon, 18 May 2026 08:21:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 51D841F89A8;
	Mon, 18 May 2026 08:21:25 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 2wcHQGMPHUWS; Mon, 18 May 2026 08:21:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 4769C1FACCB;
	Mon, 18 May 2026 08:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 4769C1FACCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1779085284;
	bh=zdzp9hvABx1s2HkSN8Ee7hXMOVVuxyPBI/EdI7HyFIw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JCA+TGVgqyzOQAXZulM6gG7kGTlKEl9OpDtZATACvu229PUleOBJSTwPsZRzvAvsY
	 PmMEy8CihWb1sY3m/N4uBgFYTyCdq6HkoiwdJ/339dTZ3UrmGHf28I3FGiRr5NXsuT
	 E7BPSeWTyz8u6tvB3y979yKmm5HGDJfbxZkly+ehyCTT1HDiTfsBhoz1Bpf+4J24AD
	 kdneGCN1LGCMhrlF0m8wxKHWR0g/DjjpYCdkGrwb4tweTKPfc///bG4DZGTTsR66MC
	 qTF2Mi8fWhNHjJwcXzkZFk2cb45jkrH8la1rantjQHYG/68DdezOKOLBv/inpfjlDS
	 GI6s7eaIEOalg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id JjyWTsNDfRec; Mon, 18 May 2026 08:21:24 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id DB8FB1F89A8;
	Mon, 18 May 2026 08:21:23 +0200 (CEST)
From: Luis <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v7 11/15] scripts/sbom: add SPDX output graph
Date: Mon, 18 May 2026 08:20:58 +0200
Message-ID: <20260518062102.2051814-12-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518062102.2051814-1-luis.augenstein@tngtech.com>
References: <20260518062102.2051814-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 339E4566A23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13243-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:email,tngtech.com:mid,tngtech.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,file.name:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[tngtech.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

From: Luis Augenstein <luis.augenstein@tngtech.com>

Implement the SPDX output graph which contains the distributable
build outputs and high level metadata about the build.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 Makefile                                      |   5 +-
 scripts/sbom/sbom/config.py                   |  64 ++++++
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  18 +-
 .../sbom/sbom/spdx_graph/spdx_output_graph.py | 187 ++++++++++++++++++
 4 files changed, 272 insertions(+), 2 deletions(-)
 create mode 100644 scripts/sbom/sbom/spdx_graph/spdx_output_graph.py

diff --git a/Makefile b/Makefile
index c121283231d..f88386c4db6 100644
--- a/Makefile
+++ b/Makefile
@@ -2213,7 +2213,10 @@ quiet_cmd_sbom =3D GEN     $(sbom_targets)
                      --obj-tree $(abspath $(objtree)) \
                      --roots-file "$(tmp-target)" \
                      --output-directory $(abspath $(objtree)) \
-                     --generate-spdx;
+                     --generate-spdx \
+                     --package-license "GPL-2.0 WITH Linux-syscall-note"=
 \
+                     --package-version "$(KERNELVERSION)" \
+                     --write-output-on-error;
 PHONY +=3D sbom
 sbom: $(notdir $(KBUILD_IMAGE)) include/generated/autoconf.h $(if $(CONF=
IG_MODULES),modules modules.order)
 	$(call cmd,sbom)
diff --git a/scripts/sbom/sbom/config.py b/scripts/sbom/sbom/config.py
index b1dd30790f5..6811f782943 100644
--- a/scripts/sbom/sbom/config.py
+++ b/scripts/sbom/sbom/config.py
@@ -59,6 +59,21 @@ class KernelSbomConfig:
     spdxId_prefix: str
     """Prefix to use for all SPDX element IDs."""
=20
+    build_type: str
+    """SPDX buildType property to use for all Build elements."""
+
+    build_id: str | None
+    """SPDX buildId property to use for all Build elements."""
+
+    package_license: str
+    """License expression applied to all SPDX Packages."""
+
+    package_version: str | None
+    """Version string applied to all SPDX Packages."""
+
+    package_copyright_text: str | None
+    """Copyright text applied to all SPDX Packages."""
+
     prettify_json: bool
     """Whether to pretty-print generated SPDX JSON documents."""
=20
@@ -154,6 +169,40 @@ def _parse_cli_arguments(parser: argparse.ArgumentPa=
rser) -> dict[str, Any]:
         default=3D"urn:spdx.dev:",
         help=3D"The prefix to use for all spdxId properties. (default: u=
rn:spdx.dev:)",
     )
+    spdx_group.add_argument(
+        "--build-type",
+        default=3D"urn:spdx.dev:Kbuild",
+        help=3D"The SPDX buildType property to use for all Build element=
s. (default: urn:spdx.dev:Kbuild)",
+    )
+    spdx_group.add_argument(
+        "--build-id",
+        default=3DNone,
+        help=3D"The SPDX buildId property to use for all Build elements.=
\n"
+        "If not provided the spdxId of the high level Build element is u=
sed as the buildId. (default: None)",
+    )
+    spdx_group.add_argument(
+        "--package-license",
+        default=3D"NOASSERTION",
+        help=3D(
+            "The SPDX licenseExpression property to use for the LicenseE=
xpression "
+            "linked to all SPDX Package elements. (default: NOASSERTION)=
"
+        ),
+    )
+    spdx_group.add_argument(
+        "--package-version",
+        default=3DNone,
+        help=3D"The SPDX packageVersion property to use for all SPDX Pac=
kage elements. (default: None)",
+    )
+    spdx_group.add_argument(
+        "--package-copyright-text",
+        default=3DNone,
+        help=3D(
+            "The SPDX copyrightText property to use for all SPDX Package=
 elements.\n"
+            "If not specified, and if a COPYING file exists in the sourc=
e tree,\n"
+            "the package-copyright-text is set to the content of this fi=
le. "
+            "(default: None)"
+        ),
+    )
     spdx_group.add_argument(
         "--prettify-json",
         action=3D"store_true",
@@ -204,6 +253,16 @@ def get_config() -> KernelSbomConfig:
         tz=3Dtimezone.utc,
     )
     spdxId_prefix =3D args["spdxId_prefix"]
+    build_type =3D args["build_type"]
+    build_id =3D args["build_id"]
+    package_license =3D args["package_license"]
+    package_version =3D args["package_version"] if args["package_version=
"] is not None else None
+    package_copyright_text: str | None =3D None
+    if args["package_copyright_text"] is not None:
+        package_copyright_text =3D args["package_copyright_text"]
+    elif os.path.isfile(copying_path :=3D os.path.join(src_tree, "COPYIN=
G")):
+        with open(copying_path, "r", encoding=3D"utf-8") as f:
+            package_copyright_text =3D f.read()
     prettify_json =3D args["prettify_json"]
=20
     # Hardcoded config
@@ -228,6 +287,11 @@ def get_config() -> KernelSbomConfig:
         write_output_on_error=3Dwrite_output_on_error,
         created=3Dcreated,
         spdxId_prefix=3DspdxId_prefix,
+        build_type=3Dbuild_type,
+        build_id=3Dbuild_id,
+        package_license=3Dpackage_license,
+        package_version=3Dpackage_version,
+        package_copyright_text=3Dpackage_copyright_text,
         prettify_json=3Dprettify_json,
     )
=20
diff --git a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py b/scripts/=
sbom/sbom/spdx_graph/build_spdx_graphs.py
index 0f95f99d560..2af0fbe6cdb 100644
--- a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
@@ -10,12 +10,18 @@ from sbom.path_utils import PathStr
 from sbom.spdx_graph.kernel_file import KernelFileCollection
 from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
 from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
+from sbom.spdx_graph.spdx_output_graph import SpdxOutputGraph
=20
=20
 class SpdxGraphConfig(Protocol):
     obj_tree: PathStr
     src_tree: PathStr
     created: datetime
+    build_type: str
+    build_id: str | None
+    package_license: str
+    package_version: str | None
+    package_copyright_text: str | None
=20
=20
 def build_spdx_graphs(
@@ -38,4 +44,14 @@ def build_spdx_graphs(
     """
     shared_elements =3D SharedSpdxElements.create(spdx_id_generators.bas=
e, config.created)
     kernel_files =3D KernelFileCollection.create(cmd_graph, config.obj_t=
ree, config.src_tree, spdx_id_generators)
-    return {}
+    output_graph =3D SpdxOutputGraph.create(
+        root_files=3Dlist(kernel_files.output.values()),
+        shared_elements=3Dshared_elements,
+        spdx_id_generators=3Dspdx_id_generators,
+        config=3Dconfig,
+    )
+    spdx_graphs: dict[KernelSpdxDocumentKind, SpdxGraph] =3D {
+        KernelSpdxDocumentKind.OUTPUT: output_graph,
+    }
+
+    return spdx_graphs
diff --git a/scripts/sbom/sbom/spdx_graph/spdx_output_graph.py b/scripts/=
sbom/sbom/spdx_graph/spdx_output_graph.py
new file mode 100644
index 00000000000..ff9b2c31fb0
--- /dev/null
+++ b/scripts/sbom/sbom/spdx_graph/spdx_output_graph.py
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass
+import os
+from typing import Protocol
+from sbom.environment import Environment
+from sbom.path_utils import PathStr
+from sbom.spdx.build import Build
+from sbom.spdx.core import DictionaryEntry, NamespaceMap, Relationship, =
SpdxDocument
+from sbom.spdx.simplelicensing import LicenseExpression
+from sbom.spdx.software import File, Package, Sbom
+from sbom.spdx.spdxId import SpdxIdGenerator
+from sbom.spdx_graph.kernel_file import KernelFile
+from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
+from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
+
+
+class SpdxOutputGraphConfig(Protocol):
+    obj_tree: PathStr
+    src_tree: PathStr
+    build_type: str
+    build_id: str | None
+    package_license: str
+    package_version: str | None
+    package_copyright_text: str | None
+
+
+@dataclass
+class SpdxOutputGraph(SpdxGraph):
+    """SPDX graph representing distributable output files"""
+
+    high_level_build_element: Build
+
+    @classmethod
+    def create(
+        cls,
+        root_files: list[KernelFile],
+        shared_elements: SharedSpdxElements,
+        spdx_id_generators: SpdxIdGeneratorCollection,
+        config: SpdxOutputGraphConfig,
+    ) -> "SpdxOutputGraph":
+        """
+        Args:
+            root_files: List of distributable output files which act as =
roots
+                of the dependency graph.
+            shared_elements: Shared SPDX elements used across multiple d=
ocuments.
+            spdx_id_generators: Collection of SPDX ID generators.
+            config: Configuration options.
+
+        Returns:
+            SpdxOutputGraph: The SPDX output graph.
+        """
+        # SpdxDocument
+        spdx_document =3D SpdxDocument(
+            spdxId=3Dspdx_id_generators.output.generate(),
+            profileConformance=3D["core", "software", "build", "simpleLi=
censing"],
+            namespaceMap=3D[
+                NamespaceMap(prefix=3Dgenerator.prefix, namespace=3Dgene=
rator.namespace)
+                for generator in [spdx_id_generators.output, spdx_id_gen=
erators.base]
+                if generator.prefix is not None
+            ],
+        )
+
+        # Sbom
+        sbom =3D Sbom(
+            spdxId=3Dspdx_id_generators.output.generate(),
+            software_sbomType=3D["build"],
+        )
+
+        # High-level Build elements
+        config_source_element =3D KernelFile.create(
+            absolute_path=3Dos.path.join(config.obj_tree, ".config"),
+            obj_tree=3Dconfig.obj_tree,
+            src_tree=3Dconfig.src_tree,
+            spdx_id_generators=3Dspdx_id_generators,
+            is_output=3DTrue,
+        ).spdx_file_element
+        high_level_build_element, high_level_build_element_hasOutput_rel=
ationship =3D _high_level_build_elements(
+            config.build_type,
+            config.build_id,
+            config_source_element,
+            spdx_id_generators.output,
+        )
+
+        # Root file elements
+        root_file_elements: list[File] =3D [file.spdx_file_element for f=
ile in root_files]
+
+        # Package elements
+        package_elements =3D [
+            Package(
+                spdxId=3Dspdx_id_generators.output.generate(),
+                name=3D_get_package_name(file.name),
+                software_packageVersion=3Dconfig.package_version,
+                software_copyrightText=3Dconfig.package_copyright_text,
+                comment=3Df"Architecture=3D{arch}" if (arch :=3D Environ=
ment.ARCH() or Environment.SRCARCH()) else None,
+                software_primaryPurpose=3Dfile.software_primaryPurpose,
+            )
+            for file in root_file_elements
+        ]
+        package_hasDistributionArtifact_file_relationships =3D [
+            Relationship(
+                spdxId=3Dspdx_id_generators.output.generate(),
+                relationshipType=3D"hasDistributionArtifact",
+                from_=3Dpackage,
+                to=3D[file],
+            )
+            for package, file in zip(package_elements, root_file_element=
s)
+        ]
+        package_license_expression =3D LicenseExpression(
+            spdxId=3Dspdx_id_generators.output.generate(),
+            simplelicensing_licenseExpression=3Dconfig.package_license,
+        )
+        package_hasDeclaredLicense_relationships =3D [
+            Relationship(
+                spdxId=3Dspdx_id_generators.output.generate(),
+                relationshipType=3D"hasDeclaredLicense",
+                from_=3Dpackage,
+                to=3D[package_license_expression],
+            )
+            for package in package_elements
+        ]
+
+        # Update relationships
+        spdx_document.rootElement =3D [sbom]
+
+        sbom.rootElement =3D [*package_elements]
+        sbom.element =3D [
+            config_source_element,
+            high_level_build_element,
+            high_level_build_element_hasOutput_relationship,
+            *root_file_elements,
+            *package_elements,
+            *package_hasDistributionArtifact_file_relationships,
+            package_license_expression,
+            *package_hasDeclaredLicense_relationships,
+        ]
+
+        high_level_build_element_hasOutput_relationship.to =3D [*root_fi=
le_elements]
+
+        output_graph =3D SpdxOutputGraph(
+            spdx_document,
+            shared_elements.agent,
+            shared_elements.creation_info,
+            sbom,
+            high_level_build_element,
+        )
+        return output_graph
+
+
+def _get_package_name(filename: str) -> str:
+    """
+    Generates a SPDX package name from a filename.
+    Kernel images (bzImage, Image) get a descriptive name, others use th=
e basename of the file.
+    """
+    KERNEL_FILENAMES =3D ["bzImage", "Image"]
+    basename =3D os.path.basename(filename)
+    return f"Linux Kernel ({basename})" if basename in KERNEL_FILENAMES =
else basename
+
+
+def _high_level_build_elements(
+    build_type: str,
+    build_id: str | None,
+    config_source_element: File,
+    spdx_id_generator: SpdxIdGenerator,
+) -> tuple[Build, Relationship]:
+    build_spdxId =3D spdx_id_generator.generate()
+    high_level_build_element =3D Build(
+        spdxId=3Dbuild_spdxId,
+        build_buildType=3Dbuild_type,
+        build_buildId=3Dbuild_id if build_id is not None else build_spdx=
Id,
+        build_environment=3D[
+            DictionaryEntry(key=3Dkey, value=3Dvalue)
+            for key, value in Environment.KERNEL_BUILD_VARIABLES().items=
()
+            if value
+        ],
+        build_configSourceUri=3D[config_source_element.spdxId],
+        build_configSourceDigest=3Dconfig_source_element.verifiedUsing,
+    )
+
+    high_level_build_element_hasOutput_relationship =3D Relationship(
+        spdxId=3Dspdx_id_generator.generate(),
+        relationshipType=3D"hasOutput",
+        from_=3Dhigh_level_build_element,
+        to=3D[],
+    )
+    return high_level_build_element, high_level_build_element_hasOutput_=
relationship
--=20
2.43.0


