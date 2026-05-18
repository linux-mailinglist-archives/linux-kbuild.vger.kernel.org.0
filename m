Return-Path: <linux-kbuild+bounces-13239-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WESyOBGwCmog5wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13239-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:22:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B90F5669EF
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A26E6300602F
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 06:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52A23DFC62;
	Mon, 18 May 2026 06:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="ETI+wbnt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DE53DE427;
	Mon, 18 May 2026 06:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085296; cv=none; b=leYeqiElxU1tW4UY/m8tXj+nKiv1N0wm5fQKcBko19Ti0AiV468YZqD4vNjyZJGrTUrE6/m8EL7zEMsQzgkk+tbtKDUkKXMpIoYxQ7YNHeDKBtwN6ROAi8mCCfuOwjfv4kd2d71hy4rfDiBtEXmcoMS9WA4t1XOf5yupYXY3cpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085296; c=relaxed/simple;
	bh=W+c/gp0y77NyMS9iju1Tthh6XfsrWjfOveM/s+3V3a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5uqrTohEwODGdMpz8/dJcn1+1TpvjSyBOlCmxktxA53qI5UG/I/NlLhLAvmF3NteQzMFYN1wU9ZOxUhOGta1ThtVuOiCMbHYssYCO3CCzV/8RZFfud0TpWWKvtRlKmOwY/KG+30ykn0WVn38nwIiEipI49gwSU6pp7sRoBO5xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=ETI+wbnt; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 2DEEA200B9;
	Mon, 18 May 2026 08:21:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id EF0C01FAD21;
	Mon, 18 May 2026 08:21:24 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id H8KKDhh9pnzo; Mon, 18 May 2026 08:21:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 225201FAD23;
	Mon, 18 May 2026 08:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 225201FAD23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1779085281;
	bh=HkNqPgZi3l77KFdipEAjp9eOxi4kxYpMhOZ7S4aLkgA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ETI+wbntwdZPGRr5MNbKlPgHt+x6jOmsa3j/Rv0ZiPxYHSatG2XhkpTEVs+h4wpp3
	 KKvIOVSG8Ry5GDU+qaGol+uckA1+O1uCoX4pFQJs9T4Gz3hadVcFNKW32qR2JJmRTk
	 KmxjOBF43REiWEA3lmKXadJjEfgO9stM7YiEuX4cS6kCOh9c90razt9nQx1adVU0M1
	 Hr9eMlzpt9Vh4xL1u0ek+oL0VTqrgcZLAdK0GDUchT+1x/L4aqGK32nB5VGBtysFfp
	 wIWQM5Jzd9VnyFk++fp87nd3Le7nPz3Lok2qBCjz5MVrf7ABepV7v0IwY/rUnfoXg8
	 pCGTg3XVhJDZA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id TrVPdy-T6gZH; Mon, 18 May 2026 08:21:21 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id C0AF21FAD21;
	Mon, 18 May 2026 08:21:20 +0200 (CEST)
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
Subject: [PATCH v7 09/15] scripts/sbom: add shared SPDX elements
Date: Mon, 18 May 2026 08:20:56 +0200
Message-ID: <20260518062102.2051814-10-luis.augenstein@tngtech.com>
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
X-Rspamd-Queue-Id: 3B90F5669EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13239-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:email,tngtech.com:mid,tngtech.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
index 98c7d939364..b1dd30790f5 100644
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
@@ -195,6 +199,10 @@ def get_config() -> KernelSbomConfig:
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
@@ -218,6 +226,7 @@ def get_config() -> KernelSbomConfig:
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


