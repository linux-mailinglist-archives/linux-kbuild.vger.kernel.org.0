Return-Path: <linux-kbuild+bounces-13073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPRMEYLP/GlhTwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13073-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 19:44:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9362C4ED05B
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 19:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6D2E309C312
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2026 17:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A49A466B5E;
	Thu,  7 May 2026 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="RGQ4D/+Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E154534A9;
	Thu,  7 May 2026 17:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778175580; cv=none; b=gYp19/EU4BpxfnU9+y23xEu0rt3tMZRg+SXnVd3l+7qbNXTlLFMxBAiKCT3oqfgg6DCihzUa4Sax3Ct7PfVqdm64Os1fBDGwSimFYfTHzXSvG5txJRJ1y3AOqAxCBxe/yDOnLkd7LBWRGhyicSlEvjvNpSEhAo6S0NjaDRlEb0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778175580; c=relaxed/simple;
	bh=cdRztSwxc8I775C/1QAYULbwpZXUwib/MHNRzqgEySY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXVBbHal+0EvHBom7j6EatjpBg0Vd6/cCf2YJ1i3fq/CnY32deY3DntvW5QdNee4v5otJmBSKDwd3RtDcPqqexNw8UQjW7zyyLXWJV56ck4msYO6jaZ125XGVQuwmEBxgMIJYQXfH0/uvw4rtnKH+rFMye6Tot/2fSiNj8UP9zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=RGQ4D/+Q; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 034B7200BA;
	Thu,  7 May 2026 19:39:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id E15551FB0E6;
	Thu,  7 May 2026 19:39:36 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id rkSPutSGD58S; Thu,  7 May 2026 19:39:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 438781FB1B4;
	Thu,  7 May 2026 19:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 438781FB1B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1778175576;
	bh=vMG5RivO+qoZMuj4DPg+YTtwPyy/V/IJj1uOSEOne6M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RGQ4D/+Q43dGLGRvYOHTRzhaq1+LnfXOgqJ4D2hjoMOhsQ2pmMBR88nOI7QcHSjPW
	 s8KHtvW/GIGHJMwvA1ljOf7tUPUf5+KrQCnWz+hGpYbiSe67pnc5G96ahDEY3x1H9e
	 aEfASa67DiOTNW9QODoEZwdwyPbUm0dMXCVs0KdLCPz7x586pNzYGbNQofOuX3DA2U
	 S3cUROkweaugxLMxOkqJLE6rFa+f/wQEHLrj2DLfHbGl2aaDyRZU0QaF1qYpJPZOOa
	 Kq/aSuAvhpQp3sCMLCli2hT2JNj1mLWggr6ueTrA4RrRHwpzvNUU5MGI6AGlZbYgYS
	 8DNpEyuvabELg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ctFI2YrhgjVc; Thu,  7 May 2026 19:39:36 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id E61021FB0E6;
	Thu,  7 May 2026 19:39:35 +0200 (CEST)
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
Subject: [PATCH v6 09/15] scripts/sbom: add shared SPDX elements
Date: Thu,  7 May 2026 19:38:21 +0200
Message-ID: <20260507173827.70949-10-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507173827.70949-1-luis.augenstein@tngtech.com>
References: <20260507173827.70949-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9362C4ED05B
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
	TAGGED_FROM(0.00)[bounces-13073-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:email,tngtech.com:mid,tngtech.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Action: no action

From: Luis Augenstein <luis.augenstein@tngtech.com>

Implement shared SPDX elements used in all three documents.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom/config.py                   |  9 ++++++
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  5 ++-
 .../sbom/spdx_graph/shared_spdx_elements.py   | 32 +++++++++++++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 scripts/sbom/sbom/spdx_graph/shared_spdx_elements.py

diff --git a/scripts/sbom/sbom/config.py b/scripts/sbom/sbom/config.py
index 4cbe6f567f1..280e287e8f5 100644
--- a/scripts/sbom/sbom/config.py
+++ b/scripts/sbom/sbom/config.py
@@ -3,6 +3,7 @@
=20
 import argparse
 from dataclasses import dataclass
+from datetime import datetime, timezone
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
@@ -196,6 +200,10 @@ def get_config() -> KernelSbomConfig:
     fail_on_unknown_build_command =3D not args["do_not_fail_on_unknown_b=
uild_command"]
     write_output_on_error =3D args["write_output_on_error"]
=20
+    created =3D datetime.fromtimestamp(
+        max([os.path.getmtime(os.path.join(obj_tree, root_path)) for roo=
t_path in root_paths]),
+        tz=3Dtimezone.utc,
+    )
     spdxId_prefix =3D args["spdxId_prefix"]
     prettify_json =3D args["prettify_json"]
=20
@@ -219,6 +227,7 @@ def get_config() -> KernelSbomConfig:
         debug=3Ddebug,
         fail_on_unknown_build_command=3Dfail_on_unknown_build_command,
         write_output_on_error=3Dwrite_output_on_error,
+        created=3Dcreated,
         spdxId_prefix=3DspdxId_prefix,
         prettify_json=3Dprettify_json,
     )
diff --git a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py b/scripts/=
sbom/sbom/spdx_graph/build_spdx_graphs.py
index bb3db4e423d..9c47258a31c 100644
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
index 00000000000..115e8778a46
--- /dev/null
+++ b/scripts/sbom/sbom/spdx_graph/shared_spdx_elements.py
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass
+from datetime import datetime, timezone
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
eated.astimezone(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"))
+        return SharedSpdxElements(agent=3Dagent, creation_info=3Dcreatio=
n_info)
--=20
2.43.0


