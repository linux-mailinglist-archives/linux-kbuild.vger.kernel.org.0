Return-Path: <linux-kbuild+bounces-12754-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIBXEPRq2Wn5pQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12754-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:26:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 917793DCE4F
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DC57304C120
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379173DD507;
	Fri, 10 Apr 2026 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="cN3B5SKS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FCC3D9DA3;
	Fri, 10 Apr 2026 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856232; cv=none; b=YY143r5qnvDToHi3XrVPyb7IrlXobLJ4WwH9CGrUKElAAYgAhe+L4kpeIDyKcp1qkHMwYGPixVd88sV30hmp66LNtVJBIPUjLWON3kbry9FMsY+Y/x3PYzNBDJKF6IcI0fE6QLW5tcRGEK5EgTQBFH6zAm/5Q/ohVUEvdjyIBI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856232; c=relaxed/simple;
	bh=Ch66c5/FbvtSTmeTrypzv3E/FSr9HWXTwjwWx/c4BQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QgL8HlKoEORqe0RJrLNlLf0IlIIhaLOLIUnhF20aWzEMQQ0TG2+z1xMsBxkyNmn5ViIgru152pu0CGW3za1VdWWLbHyyiQGLjgM/x3BAMftAXP9asVxb7WignUzCWLfEmEOfa8LCCKH6hXiEVn048gGbwelLBYh5cr0VoEsqwtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=cN3B5SKS; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id EBBEF3FAF3;
	Fri, 10 Apr 2026 23:23:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id D44771FAE85;
	Fri, 10 Apr 2026 23:23:45 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 6zl2srHTWAwF; Fri, 10 Apr 2026 23:23:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 3A7B61FADEA;
	Fri, 10 Apr 2026 23:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 3A7B61FADEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1775856225;
	bh=dWA9kM+iNrKX2E168kWuLAwgVjwsWv/1z02ZEkLTBTg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cN3B5SKSxfetN0om9NMa8fL0S+sMOHpfBbafS5dXOayWbfF8+t7i6yCGIBbKBLINW
	 LESj1Xw1QBRZOwpgbYPRQqwYywpkauldTKHs5HEQZIS4MW9NjvFEFPagG91ov4z2B5
	 wpeH6oB4faRZg18kRd+Ge5ZvizEC4hUFKm6svea6XfYV7BQaiTxrgs0GvXSBXP8kWV
	 97M4rYGSX0HdABhWJrr59GXmlPQz0s6hVKS2vaYen71r+283znQkAFBxBx6BWwMNUw
	 YBNVgo+HP3BMvHsSWKcq4d6omUtLNnbiH7CZThg5W7vvg3hyOr/BV95OsmCE/LwgYB
	 YqWKgI4JlJ98g==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id W03xgSH900rL; Fri, 10 Apr 2026 23:23:45 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id D373C1FAEB7;
	Fri, 10 Apr 2026 23:23:44 +0200 (CEST)
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
Subject: [PATCH v5 12/15] scripts/sbom: add SPDX source graph
Date: Fri, 10 Apr 2026 23:22:52 +0200
Message-ID: <20260410212255.9883-13-luis.augenstein@tngtech.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12754-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spdx_id_generators.base:url,spdx.software:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tngtech.com:dkim,tngtech.com:email,tngtech.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 917793DCE4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Luis Augenstein <luis.augenstein@tngtech.com>

Implement the SPDX source graph which contains all source files
involved during the build, along with the licensing information
for each file.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |   8 ++
 .../sbom/sbom/spdx_graph/spdx_source_graph.py | 126 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 scripts/sbom/sbom/spdx_graph/spdx_source_graph.py

diff --git a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py b/scripts/=
sbom/sbom/spdx_graph/build_spdx_graphs.py
index 2af0fbe6cdb..a61257a905f 100644
--- a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
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
diff --git a/scripts/sbom/sbom/spdx_graph/spdx_source_graph.py b/scripts/=
sbom/sbom/spdx_graph/spdx_source_graph.py
new file mode 100644
index 00000000000..16176c4ea5e
--- /dev/null
+++ b/scripts/sbom/sbom/spdx_graph/spdx_source_graph.py
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
2.43.0


