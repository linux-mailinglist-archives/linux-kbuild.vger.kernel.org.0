Return-Path: <linux-kbuild+bounces-11108-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBj2F4Kci2k3XAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11108-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 22:00:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E5A11F388
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 22:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38CBB31092C5
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 20:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6102336EE3;
	Tue, 10 Feb 2026 20:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="EPAk+EP4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8A333A014;
	Tue, 10 Feb 2026 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756925; cv=none; b=a2nyurH097e/URY9h3wYDiGB5qGwUzLO7G8mkRbubAB10CZe0QK6YbZqrmWgh9yVkR9N3gzxqUibJUdYFD3+lJEv/6XH6hHUs+u6OdR/ify0wCibsbtjZ+V1m00xc7WEU0VFp1DZ5LHtAQUd8sURtjQeK8BOXeA7xvzThuYGGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756925; c=relaxed/simple;
	bh=5x5waVse3tSvVripzd0yWwPSq+1Z39SIzqtoezMhMwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bNV0Umplc07ad7EOsYrrLEeu9kuY9l9A7gLyeO1flj5VXUP6NxMuWJ3bcHq9LMFv7vHff8VEl0aQS6JhNVpko9h3NoN7obnvwHBfXwHzv3uHyau9HEfzYjeHojPNkw4xN9cUnf2HjJgDM0TgpE1oOILhkbx9ZyTnDgyEKWqvhGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=EPAk+EP4; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 710583FAEF;
	Tue, 10 Feb 2026 21:55:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id A7F3D1FA8D7;
	Tue, 10 Feb 2026 21:55:17 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 1EjEgBR7Buza; Tue, 10 Feb 2026 21:55:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 194C01FA925;
	Tue, 10 Feb 2026 21:55:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 194C01FA925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1770756917;
	bh=oIEaG5ZBOhP3e+jbeuwA3cpCoO8A03lc8tHeOFnkyII=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=EPAk+EP4qvFEzELsBtqedvlP+Nr8vJoUkhZ6V2/Y3c0MeuY9xc1NiSB7BiTRipxJe
	 w6OktUhwfVDLXuAeDN0IF4OUKdnINU2wTa9CjNT33ur4ep1POTZct0BHD7+Sehukjw
	 RRR7e9bM2BVHdMMKtSo7kR+WULt3jdmH9XUpVV/QaczSPOHDg2etXp1eclj3A32mLa
	 6hYudnIywb2V47nJpwHyJy4xzZY/xoL/GzMCT/tTfy+/wFGwu/Pfr3h3EHFWKMzKlG
	 A82miMvda97AfX8hMcN5P4yYHv5q7AZleqhoCwdss6+exA3MnOt2psZE5G9SnC5niW
	 yOMDfRuEcz4DQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id l_L7JfDxi3y7; Tue, 10 Feb 2026 21:55:16 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id A84B61FA8D7;
	Tue, 10 Feb 2026 21:55:16 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 09/15] scripts/sbom: add shared SPDX elements
Date: Tue, 10 Feb 2026 21:54:18 +0100
Message-Id: <20260210205424.11195-10-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210205424.11195-1-luis.augenstein@tngtech.com>
References: <20260210205424.11195-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-11108-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:mid,tngtech.com:dkim,tngtech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[tngtech.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B3E5A11F388
X-Rspamd-Action: no action

Implement shared SPDX elements used in all three documents.

Assisted-by: Claude Sonnet 4.5
Assisted-by: GLM-4.7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom/config.py                   | 25 +++++++++++++++
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  5 ++-
 .../sbom/spdx_graph/shared_spdx_elements.py   | 32 +++++++++++++++++++
 3 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 scripts/sbom/sbom/spdx_graph/shared_spdx_elements.py

diff --git a/scripts/sbom/sbom/config.py b/scripts/sbom/sbom/config.py
index 0985457c3cae..9278e2be7cb2 100644
--- a/scripts/sbom/sbom/config.py
+++ b/scripts/sbom/sbom/config.py
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
diff --git a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py b/scripts/=
sbom/sbom/spdx_graph/build_spdx_graphs.py
index bb3db4e423da..9c47258a31c6 100644
--- a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
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
diff --git a/scripts/sbom/sbom/spdx_graph/shared_spdx_elements.py b/scrip=
ts/sbom/sbom/spdx_graph/shared_spdx_elements.py
new file mode 100644
index 000000000000..0c83428f4c70
--- /dev/null
+++ b/scripts/sbom/sbom/spdx_graph/shared_spdx_elements.py
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


