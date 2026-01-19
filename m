Return-Path: <linux-kbuild+bounces-10668-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F3ED39F11
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 07:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 611983199287
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 06:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DE1280329;
	Mon, 19 Jan 2026 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="B0XiSrXF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C931428850C;
	Mon, 19 Jan 2026 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805360; cv=none; b=hnCVSsb1QF36t3Ec5PkYsiR/McnSIgl4CaEpXTi+StDKmbWozdwTT8dpS1F1jbWhouHIrccu74dK39SSEYIjxPHo5mz0HWfOlnZ/GHsOc4uD3PL1w0+1fTe6YpdqSHGQqQa5grBiR+78iPoblVVJ5/nPFlv/1mNRJXjbUUgb4wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805360; c=relaxed/simple;
	bh=T4yQv5WonCV16YvQRu/6sc5dnpOur+Cogr6n1oAbios=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iZhrzJtVnQuiR+TKvkXwGtoud/MkSxwK8j+cq11EYO8HUsOAgKhpffCNW7ljce73deo6om2CR4vIcsIXbyfGknGbt7B8npnzE9Qo3+xk9zMP8tCOrH/EZ23BII3AY2aluepfobPowSZeo7BQImAIpKI4wSuKiNlAytWUQ5VLDzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=B0XiSrXF; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 84F07200C9;
	Mon, 19 Jan 2026 07:49:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id C4D231FA83C;
	Mon, 19 Jan 2026 07:49:04 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id t8Rg2EEJ4eDE; Mon, 19 Jan 2026 07:49:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id A2EF51FA864;
	Mon, 19 Jan 2026 07:49:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz A2EF51FA864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768805343;
	bh=XUPc7uJmjGCankcXm7q45VjnscG8k0ODi128UZnWtrs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=B0XiSrXFzc+UREUeTIZ7CqsYgnSMzYdrZT2ZSZTvfgBOJyxQwFzBUhtbLkedlbJjC
	 E9mK/9kMG1kg41XyhtPB2C4tcyE5UG5/Cl7RVTORmf/g5yGDcPlsAJwpcJVP1Aj1d2
	 3YIwLswKT6RVXAr6Jkxxb51+PIG3p+NxCVeBII46oHWO/x0adBvkzU3V6RmJsI8py7
	 U7M0wKblNuILOQuaS6W/cu8ZQ+VIS8sQSoktSBoNLS5HMEmbo23SIKdCySWH1iQrmR
	 YNg46rQgaA1638m8TMZFdoDQfBQQZR/Y5SKugNR9GuA7jmLg7NxbxljWGfHpqyEKjd
	 rhdxgmgvLzOnw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 2uOWCbM-saqz; Mon, 19 Jan 2026 07:49:03 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 31CA81FA83C;
	Mon, 19 Jan 2026 07:49:03 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 11/14] tools/sbom: add SPDX source graph
Date: Mon, 19 Jan 2026 07:47:28 +0100
Message-Id: <20260119064731.23879-12-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119064731.23879-1-luis.augenstein@tngtech.com>
References: <20260119064731.23879-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Implement the SPDX source graph which contains all source files
involved during the build, along with the licensing information
for each file.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |   8 ++
 .../sbom/sbom/spdx_graph/spdx_source_graph.py | 126 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 tools/sbom/sbom/spdx_graph/spdx_source_graph.py

diff --git a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py b/tools/sbom=
/sbom/spdx_graph/build_spdx_graphs.py
index 2af0fbe6c..a61257a90 100644
--- a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
@@ -10,6 +10,7 @@ from sbom.path_utils import PathStr
 from sbom.spdx_graph.kernel_file import KernelFileCollection
 from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
 from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
+from sbom.spdx_graph.spdx_source_graph import SpdxSourceGraph
 from sbom.spdx_graph.spdx_output_graph import SpdxOutputGraph
=20
=20
@@ -54,4 +55,11 @@ def build_spdx_graphs(
         KernelSpdxDocumentKind.OUTPUT: output_graph,
     }
=20
+    if len(kernel_files.source) > 0:
+        spdx_graphs[KernelSpdxDocumentKind.SOURCE] =3D SpdxSourceGraph.c=
reate(
+            source_files=3Dlist(kernel_files.source.values()),
+            shared_elements=3Dshared_elements,
+            spdx_id_generators=3Dspdx_id_generators,
+        )
+
     return spdx_graphs
diff --git a/tools/sbom/sbom/spdx_graph/spdx_source_graph.py b/tools/sbom=
/sbom/spdx_graph/spdx_source_graph.py
new file mode 100644
index 000000000..16176c4ea
--- /dev/null
+++ b/tools/sbom/sbom/spdx_graph/spdx_source_graph.py
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass
+from sbom.spdx import SpdxIdGenerator
+from sbom.spdx.core import Element, NamespaceMap, Relationship, SpdxDocu=
ment
+from sbom.spdx.simplelicensing import LicenseExpression
+from sbom.spdx.software import File, Sbom
+from sbom.spdx_graph.kernel_file import KernelFile
+from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
+from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
+
+
+@dataclass
+class SpdxSourceGraph(SpdxGraph):
+    """SPDX graph representing source files"""
+
+    @classmethod
+    def create(
+        cls,
+        source_files: list[KernelFile],
+        shared_elements: SharedSpdxElements,
+        spdx_id_generators: SpdxIdGeneratorCollection,
+    ) -> "SpdxSourceGraph":
+        """
+        Args:
+            source_files: List of files within the kernel source tree.
+            shared_elements: Shared SPDX elements used across multiple d=
ocuments.
+            spdx_id_generators: Collection of SPDX ID generators.
+
+        Returns:
+            SpdxSourceGraph: The SPDX source graph.
+        """
+        # SpdxDocument
+        source_spdx_document =3D SpdxDocument(
+            spdxId=3Dspdx_id_generators.source.generate(),
+            profileConformance=3D["core", "software", "simpleLicensing"]=
,
+            namespaceMap=3D[
+                NamespaceMap(prefix=3Dgenerator.prefix, namespace=3Dgene=
rator.namespace)
+                for generator in [spdx_id_generators.source, spdx_id_gen=
erators.base]
+                if generator.prefix is not None
+            ],
+        )
+
+        # Sbom
+        source_sbom =3D Sbom(
+            spdxId=3Dspdx_id_generators.source.generate(),
+            software_sbomType=3D["source"],
+        )
+
+        # Src Tree Elements
+        src_tree_element =3D File(
+            spdxId=3Dspdx_id_generators.source.generate(),
+            name=3D"$(src_tree)",
+            software_fileKind=3D"directory",
+        )
+        src_tree_contains_relationship =3D Relationship(
+            spdxId=3Dspdx_id_generators.source.generate(),
+            relationshipType=3D"contains",
+            from_=3Dsrc_tree_element,
+            to=3D[],
+        )
+
+        # Source file elements
+        source_file_elements: list[Element] =3D [file.spdx_file_element =
for file in source_files]
+
+        # Source file license elements
+        source_file_license_identifiers, source_file_license_relationshi=
ps =3D source_file_license_elements(
+            source_files, spdx_id_generators.source
+        )
+
+        # Update relationships
+        source_spdx_document.rootElement =3D [source_sbom]
+        source_sbom.rootElement =3D [src_tree_element]
+        source_sbom.element =3D [
+            src_tree_element,
+            src_tree_contains_relationship,
+            *source_file_elements,
+            *source_file_license_identifiers,
+            *source_file_license_relationships,
+        ]
+        src_tree_contains_relationship.to =3D source_file_elements
+
+        source_graph =3D SpdxSourceGraph(
+            source_spdx_document,
+            shared_elements.agent,
+            shared_elements.creation_info,
+            source_sbom,
+        )
+        return source_graph
+
+
+def source_file_license_elements(
+    source_files: list[KernelFile], spdx_id_generator: SpdxIdGenerator
+) -> tuple[list[LicenseExpression], list[Relationship]]:
+    """
+    Creates SPDX license expressions and links them to the given source =
files
+    via hasDeclaredLicense relationships.
+
+    Args:
+        source_files: List of files within the kernel source tree.
+        spdx_id_generator: Generator for unique SPDX IDs.
+
+    Returns:
+        Tuple of (license expressions, hasDeclaredLicense relationships)=
.
+    """
+    license_expressions: dict[str, LicenseExpression] =3D {}
+    for file in source_files:
+        if file.license_identifier is None or file.license_identifier in=
 license_expressions:
+            continue
+        license_expressions[file.license_identifier] =3D LicenseExpressi=
on(
+            spdxId=3Dspdx_id_generator.generate(),
+            simplelicensing_licenseExpression=3Dfile.license_identifier,
+        )
+
+    source_file_license_relationships =3D [
+        Relationship(
+            spdxId=3Dspdx_id_generator.generate(),
+            relationshipType=3D"hasDeclaredLicense",
+            from_=3Dfile.spdx_file_element,
+            to=3D[license_expressions[file.license_identifier]],
+        )
+        for file in source_files
+        if file.license_identifier is not None
+    ]
+    return ([*license_expressions.values()], source_file_license_relatio=
nships)
--=20
2.34.1


