Return-Path: <linux-kbuild+bounces-10716-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKV4J7R5cGktYAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10716-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 08:01:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4145952818
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 08:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9D719627EFA
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 11:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14711426EA7;
	Tue, 20 Jan 2026 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="U4A+uOHu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F721426D26;
	Tue, 20 Jan 2026 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910150; cv=none; b=GF62y5M2rwrtHWOQl69pseCRu6H5EqVlwGdJ7htcomqQBE/QUPjFsbyTqYOuCYg9HHRQbAD6iNoshetM6yjyAgUHmo68hepOsjA3Uqko5NlfwfPT12tgs1IJS0nRRF2tjb7PtnYiZifE1wM2lKAbxOpVBlSVVPX+00XGG45/DRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910150; c=relaxed/simple;
	bh=Th3sKvwarQGiGkATSt8SwerBpRF0rch7/VQ2w8JJx58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Chx0bDEELDKshpmaXxaC+CpjDs/p7m6Bi4H9M845lR1sfEFIIzjNCmhcBjZ6OJnuHvSMI1majJMdtBrngcg9zogbTIzN7U7KX4NE10cYODZYW8/+Dd4GkGZSEKRoBTtoYXLLkTNNqSNghnDOZqjGKOtRO8K1K3DDSgH5tfiv1bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=U4A+uOHu; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id F1D87200BF;
	Tue, 20 Jan 2026 12:55:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 305301FA5F5;
	Tue, 20 Jan 2026 12:55:43 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id XlXMuus1YpQD; Tue, 20 Jan 2026 12:55:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 539151FA828;
	Tue, 20 Jan 2026 12:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 539151FA828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768910142;
	bh=mrKJ1t+v6kBR56XzilwCkJ0QgGrOaHh/FXUhLzq/HbE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=U4A+uOHuBw1yBwjiJW/qx8obyA75uCZAKtSOCCw03R1GWtMAf1Y3+0iz2MI2QqxpK
	 S+ShAu9aVr8uprE/dxbSM8tCKaWRyFx/hM3nnZwYQN8eWO0e/qEMMA5oiWM5MXqPJt
	 k0DMNvRkF5STizFj2t1m15GSaUMJCTVgedLYFFhwk7as/PRzl+1f5HUTGx4C/0DL5g
	 Ufue6ixfvZgn/8X4OQkMDjAFvjnJ+zwy3VznRaCchbOO2DYvDCst1AJV1DJAij4gjm
	 hosp65sSqLAN1DrXLSbNaSzekWCMgqtlAGLSI2Ab7/a+49Ipt3yIzZ3fk7aywOTCk2
	 dXQT95efrnATw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id KVcoCFslJDyv; Tue, 20 Jan 2026 12:55:42 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id EA59D1FA5F5;
	Tue, 20 Jan 2026 12:55:41 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v2 08/14] tools/sbom: add shared SPDX elements
Date: Tue, 20 Jan 2026 12:53:46 +0100
Message-Id: <20260120115352.10910-9-luis.augenstein@tngtech.com>
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
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[tngtech.com,quarantine];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10716-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[tngtech.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4145952818
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement shared SPDX elements used in all three documents.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 tools/sbom/sbom/config.py                     | 25 +++++++++++++++
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  5 ++-
 .../sbom/spdx_graph/shared_spdx_elements.py   | 32 +++++++++++++++++++
 3 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 tools/sbom/sbom/spdx_graph/shared_spdx_elements.py

diff --git a/tools/sbom/sbom/config.py b/tools/sbom/sbom/config.py
index 0985457c3cae..9278e2be7cb2 100644
--- a/tools/sbom/sbom/config.py
+++ b/tools/sbom/sbom/config.py
@@ -3,6 +3,7 @@
=20
 import argparse
 from dataclasses import dataclass
+from datetime import datetime
 from enum import Enum
 import os
 from typing import Any
@@ -52,6 +53,9 @@ class KernelSbomConfig:
     write_output_on_error: bool
     """Whether to write output documents even if errors occur."""
=20
+    created: datetime
+    """Datetime to use for the SPDX created property of the CreationInfo=
 element."""
+
     spdxId_prefix: str
     """Prefix to use for all SPDX element IDs."""
=20
@@ -150,6 +154,16 @@ def _parse_cli_arguments() -> dict[str, Any]:
=20
     # SPDX specific options
     spdx_group =3D parser.add_argument_group("SPDX options", "Options fo=
r customizing SPDX document generation")
+    spdx_group.add_argument(
+        "--created",
+        default=3DNone,
+        help=3D(
+            "The SPDX created property to use for the CreationInfo eleme=
nt in "
+            "ISO format (YYYY-MM-DD [HH:MM:SS]).\n"
+            "If not provided the last modification time of the first roo=
t output "
+            "is used. (default: None)"
+        ),
+    )
     spdx_group.add_argument(
         "--spdxId-prefix",
         default=3D"urn:spdx.dev:",
@@ -195,6 +209,16 @@ def get_config() -> KernelSbomConfig:
     fail_on_unknown_build_command =3D not args["do_not_fail_on_unknown_b=
uild_command"]
     write_output_on_error =3D args["write_output_on_error"]
=20
+    if args["created"] is None:
+        created =3D datetime.fromtimestamp(os.path.getmtime(os.path.join=
(obj_tree, root_paths[0])))
+    else:
+        try:
+            created =3D datetime.fromisoformat(args["created"])
+        except ValueError:
+            raise argparse.ArgumentTypeError(
+                f"Invalid date format for argument '--created': '{args['=
created']}'. "
+                "Expected ISO format (YYYY-MM-DD [HH:MM:SS])."
+            )
     spdxId_prefix =3D args["spdxId_prefix"]
     prettify_json =3D args["prettify_json"]
=20
@@ -218,6 +242,7 @@ def get_config() -> KernelSbomConfig:
         debug=3Ddebug,
         fail_on_unknown_build_command=3Dfail_on_unknown_build_command,
         write_output_on_error=3Dwrite_output_on_error,
+        created=3Dcreated,
         spdxId_prefix=3DspdxId_prefix,
         prettify_json=3Dprettify_json,
     )
diff --git a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py b/tools/sbom=
/sbom/spdx_graph/build_spdx_graphs.py
index bb3db4e423da..9c47258a31c6 100644
--- a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
@@ -1,18 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only OR MIT
 # Copyright (C) 2025 TNG Technology Consulting GmbH
=20
-
+from datetime import datetime
 from typing import Protocol
=20
 from sbom.config import KernelSpdxDocumentKind
 from sbom.cmd_graph import CmdGraph
 from sbom.path_utils import PathStr
 from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
+from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
=20
=20
 class SpdxGraphConfig(Protocol):
     obj_tree: PathStr
     src_tree: PathStr
+    created: datetime
=20
=20
 def build_spdx_graphs(
@@ -33,4 +35,5 @@ def build_spdx_graphs(
     Returns:
         Dictionary of SPDX graphs
     """
+    shared_elements =3D SharedSpdxElements.create(spdx_id_generators.bas=
e, config.created)
     return {}
diff --git a/tools/sbom/sbom/spdx_graph/shared_spdx_elements.py b/tools/s=
bom/sbom/spdx_graph/shared_spdx_elements.py
new file mode 100644
index 000000000000..0c83428f4c70
--- /dev/null
+++ b/tools/sbom/sbom/spdx_graph/shared_spdx_elements.py
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass
+from datetime import datetime
+from sbom.spdx.core import CreationInfo, SoftwareAgent
+from sbom.spdx.spdxId import SpdxIdGenerator
+
+
+@dataclass(frozen=3DTrue)
+class SharedSpdxElements:
+    agent: SoftwareAgent
+    creation_info: CreationInfo
+
+    @classmethod
+    def create(cls, spdx_id_generator: SpdxIdGenerator, created: datetim=
e) -> "SharedSpdxElements":
+        """
+        Creates shared SPDX elements used across multiple documents.
+
+        Args:
+            spdx_id_generator: Generator for creating SPDX IDs.
+            created: SPDX 'created' property used for the creation info.
+
+        Returns:
+            SharedSpdxElements with agent and creation info.
+        """
+        agent =3D SoftwareAgent(
+            spdxId=3Dspdx_id_generator.generate(),
+            name=3D"KernelSbom",
+        )
+        creation_info =3D CreationInfo(createdBy=3D[agent], created=3Dcr=
eated.strftime("%Y-%m-%dT%H:%M:%SZ"))
+        return SharedSpdxElements(agent=3Dagent, creation_info=3Dcreatio=
n_info)
--=20
2.34.1


