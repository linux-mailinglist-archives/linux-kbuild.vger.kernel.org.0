Return-Path: <linux-kbuild+bounces-12753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEvBBstq2Wn5pQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12753-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:25:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEFA3DCE47
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43BD4303A5CD
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8585D3DBD50;
	Fri, 10 Apr 2026 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="FS8PtmUi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141DE2E62A9;
	Fri, 10 Apr 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856231; cv=none; b=gyOexS+PC+qpBxRmtwidMPAekKX6dUdzFqRwgy2Am4zZSvfyThM3Q3/V9hNjEwEQYOwA987yRFtazd+3Do/SJT2ZJNf5U1koIOgUJoCMx1OveQv/TDFHu1qz1vJrtOGlmOhZht/pkeLjEW4cvqHhmi6mAL/FrFi50UVyXikVitw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856231; c=relaxed/simple;
	bh=lABjwYOi3n2iLxXUWCXMquA1zQTBovKv5/Kwo8xvgkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwvkxA+ATLgNITt4u47UrYUWcvBSLIy99jKtqnLsa0scwjhvZxl99nQnE06Qlp3yp4d722ZUlU3TJlcZ8jm33gUOgpQ9Weu/z/qe+DC/YzAh46OFlCMlLV5sy9p+W93PdTa6VR+OqZ7+HI6ngfxIQfvNebJCU9zuT2nJxBCJnnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=FS8PtmUi; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 2721F3FAF2;
	Fri, 10 Apr 2026 23:23:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id F19D51FAE85;
	Fri, 10 Apr 2026 23:23:44 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id otlrQzJ1xMIN; Fri, 10 Apr 2026 23:23:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 0F2F61FADEA;
	Fri, 10 Apr 2026 23:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 0F2F61FADEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1775856224;
	bh=EA3FKzEACKJbVsDduo96T9LYjlM4DGeYd+GPWkSilyM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FS8PtmUiTOMG4Wyk2jNwLa6M/7z/2BGZbpnfFkGbamTVO6XoZteax+NyJtASoSIL6
	 O5D2UcQYMj9P713Lamb/LAXQm3eHkGFf4BZIUWF6PHCAJnJ31dl1DZGBMg3LVT6kPY
	 iqd7J7j6nYV1I9erfMQr0puR1T1E1PAH3T2GyxPHMHdlc1GbXTleGFozvi0sgA9FAz
	 7HWcz+7cEa6C1MJYup2mNFzP4WrgHswxIRESznyN9C4DMAOYPG/Cz5oslGqSUSS3og
	 AI37pr7AnTaauvgIPNdrakXiu2yvUDlmJkGoBr2WEQEiIJNd156uA6hRhZR1+I2T/d
	 2d3pDvyvh2KSQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id MaEmtQ1j_iiY; Fri, 10 Apr 2026 23:23:43 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id A482D1FAE85;
	Fri, 10 Apr 2026 23:23:43 +0200 (CEST)
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
Subject: [PATCH v5 11/15] scripts/sbom: add SPDX output graph
Date: Fri, 10 Apr 2026 23:22:51 +0200
Message-ID: <20260410212255.9883-12-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410212255.9883-1-luis.augenstein@tngtech.com>
References: <20260410212255.9883-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12753-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spdx.software:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tngtech.com:dkim,tngtech.com:email,tngtech.com:mid,spdx_id_generators.base:url];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6CEFA3DCE47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 279e3abd34c..286effedafb 100644
--- a/Makefile
+++ b/Makefile
@@ -2175,7 +2175,10 @@ quiet_cmd_sbom =3D GEN     $(sbom_targets)
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
index fa049f757cb..f47daaa7b8d 100644
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
@@ -159,6 +174,40 @@ def _parse_cli_arguments() -> dict[str, Any]:
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
@@ -203,6 +252,16 @@ def get_config() -> KernelSbomConfig:
         max([os.path.getmtime(os.path.join(obj_tree, root_path)) for roo=
t_path in root_paths])
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
+        with open(copying_path, "r") as f:
+            package_copyright_text =3D f.read()
     prettify_json =3D args["prettify_json"]
=20
     # Hardcoded config
@@ -227,6 +286,11 @@ def get_config() -> KernelSbomConfig:
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


