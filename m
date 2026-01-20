Return-Path: <linux-kbuild+bounces-10718-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM+dJPlhcGkVXwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10718-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 06:19:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 081BF516DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 06:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2236C846F57
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 11:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AB9426ECE;
	Tue, 20 Jan 2026 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="A2oOMuAM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC51426D3D;
	Tue, 20 Jan 2026 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910153; cv=none; b=CSF+/h/AB/eJ0Kz43k3+g/Yt1KQim8V22CHZGrL7zSArl5F/c7SeG8EhvtLVL5IUDP8f4czi6j8u+wyv8WjF5vC8a3ClrEL42qJk127gxPWg/rKTsUMlyokTaP2GWp7X1gD7bbDcS8byq9CT7YBkx3ic9ygh1ZOFQc+OrXnMGlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910153; c=relaxed/simple;
	bh=cFNZRlIxT/34gp+dzxMA1w3STtnbLv+SCBygP3i6rMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hM1Sex6fYY1CJ56zjhL0xK463XNXpxhrZ5zdyq6nazik6o115kcoKTNBfaTvBlXvOpapRQNBCyAhJdX/xzDOiYkhoXGTu7kQmLoqU3I/6/ESnhNpEaiRWCMwT34iZwEzUOFm8+bXobtNb9okzzm/du5PjOrK/CVV4uH7iw0nozI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=A2oOMuAM; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id B6B7B200B2;
	Tue, 20 Jan 2026 12:55:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 355971FA449;
	Tue, 20 Jan 2026 12:55:47 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ovEz3oV8YOwl; Tue, 20 Jan 2026 12:55:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 7FE361FA560;
	Tue, 20 Jan 2026 12:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 7FE361FA560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768910146;
	bh=dZL1JaPMNMR+B1ET/+Ix+NpqGkk7K7L1IuuIEqfp/f0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=A2oOMuAMbnWoQi4tFoGMUker/jTyA7a9G8V8N6yMs3z6gFPKbO4el2yzkLkTeTItu
	 tbOkQGTIm9phgot6Yy54kqcuOrkJml8xjrCCktUvunLcbyDhoty1nFrWHnZ5mH/bF1
	 M63WH5SmUh76Obn9IaWQDCxtylKhvpwE8e91QXSYpWdghcmuDQiLf/EoB5lkKY0Zs8
	 WRZp7B7deVdJU6DPCxlEGDVLtsgcNtabzjS2VuX8UeCtsr1E/p2x4zjzkwMCZWEYsv
	 upT/MWYk7iOYy5kSo5xJQi/rHnZHVNb3vKEwSM2uCavO5ZrsFWaVFybM8304xa3Wd/
	 UyKRdDNixGDTA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id wyCT5BUBUI9x; Tue, 20 Jan 2026 12:55:46 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 2916E1FA7BC;
	Tue, 20 Jan 2026 12:55:46 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v2 11/14] tools/sbom: add SPDX source graph
Date: Tue, 20 Jan 2026 12:53:49 +0100
Message-Id: <20260120115352.10910-12-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120115352.10910-1-luis.augenstein@tngtech.com>
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tngtech.com:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[tngtech.com,quarantine];
	TAGGED_FROM(0.00)[bounces-10718-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 081BF516DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 2af0fbe6cdbe..a61257a905f3 100644
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
index 000000000000..16176c4ea5ee
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


