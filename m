Return-Path: <linux-kbuild+bounces-12756-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOk4L1hr2Wn5pQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12756-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:27:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4462C3DCE7F
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D234305D5D7
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEDE3DEAD2;
	Fri, 10 Apr 2026 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="Wna3Gjtl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F783DBD59;
	Fri, 10 Apr 2026 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856235; cv=none; b=YkL+afmtzDOIOveg7wJ2YxXwJK5dQwHogH8ZfX9TKWQKuzTpCrW5FXj9/+ZqarTxoj+MKlUhQGFZx158/yl6qGigN6hFdo6tg3dtuwbl6+f5SIzFDGNczeSr8TaI0gWkZNG+QLRfZJ6tnAEam6JZWmq7hxeohXrsq6EFpHrh+L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856235; c=relaxed/simple;
	bh=uZYAV5rnm6Bnjyl/V05Hj9AP/xVFRUlXDXUTZMCG3Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxncNURg9ALWr5jUkixMwX3mDox9RscjW+Ed/TCY5CjtuDz/BDWRmu8L16Zb8pTe+fxb4Qus8phmztnWkgFf/6wxDTpuZiq35oSciTtadzBi389LiBcIHSMI6fBlACmfRWkMWolfBtXyUHXjYg3Z3+ZjS8KVOfHEtU/sFy3t4IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=Wna3Gjtl; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id A45E53FAFA;
	Fri, 10 Apr 2026 23:23:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 7416C1FAEE8;
	Fri, 10 Apr 2026 23:23:49 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id VgiFCQK8SJGR; Fri, 10 Apr 2026 23:23:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id D54A21FAEBF;
	Fri, 10 Apr 2026 23:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz D54A21FAEBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1775856228;
	bh=jOd5RR3QdzyGzoaJEtl+35NCqPUWAP8mHCNjkzlpJ8k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Wna3GjtlykITPdvVP0Y1hJ3iIv/m2DuyWfECJj0eJOpgIKTRwDejTXMAl1u1Zkjpm
	 CmrX5c0alNpE2xY+/e7VmWKZwdaoFVHnmxSF6jazfRPQE3L0zMhviTNmTTs9rDwJLU
	 5AEZxoPdDD+mLafVP+MluEWcXgRPeMPXehkQcTu7hw1v+h3eMG2CH1+OL4HRVsHD8M
	 3KWcy/I9S5O940vc91KBxtpXqocC9l/rFRndTI5zuNambX3h2sFfvXowQkebmtGh4Z
	 b/wvcYfshj0aoNnmqEAloX4OG2o1d64Sr/SAYEsxI4twaRriouctRcDyWWDvEZD3Vl
	 6R31Hzvp6iuzw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Ipkj9F0JaNdE; Fri, 10 Apr 2026 23:23:48 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 76FE91FAEBD;
	Fri, 10 Apr 2026 23:23:48 +0200 (CEST)
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
Subject: [PATCH v5 15/15] scripts/sbom: add unit tests for SPDX-License-Identifier parsing
Date: Fri, 10 Apr 2026 23:22:55 +0200
Message-ID: <20260410212255.9883-16-luis.augenstein@tngtech.com>
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
	TAGGED_FROM(0.00)[bounces-12756-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tngtech.com:dkim,tngtech.com:email,tngtech.com:mid];
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
X-Rspamd-Queue-Id: 4462C3DCE7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Luis Augenstein <luis.augenstein@tngtech.com>

Verify that SPDX-License-Identifier headers at the top of source files
are parsed correctly.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/tests/spdx_graph/__init__.py     |  0
 .../sbom/tests/spdx_graph/test_kernel_file.py | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 scripts/sbom/tests/spdx_graph/__init__.py
 create mode 100644 scripts/sbom/tests/spdx_graph/test_kernel_file.py

diff --git a/scripts/sbom/tests/spdx_graph/__init__.py b/scripts/sbom/tes=
ts/spdx_graph/__init__.py
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/scripts/sbom/tests/spdx_graph/test_kernel_file.py b/scripts/=
sbom/tests/spdx_graph/test_kernel_file.py
new file mode 100644
index 00000000000..bc44e7a97d2
--- /dev/null
+++ b/scripts/sbom/tests/spdx_graph/test_kernel_file.py
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import unittest
+from pathlib import Path
+import tempfile
+from sbom.spdx_graph.kernel_file import _parse_spdx_license_identifier  =
# type: ignore
+
+
+class TestKernelFile(unittest.TestCase):
+    def setUp(self):
+        self.tmpdir =3D tempfile.TemporaryDirectory()
+        self.src_tree =3D Path(self.tmpdir.name)
+
+    def tearDown(self):
+        self.tmpdir.cleanup()
+
+    def test_parse_spdx_license_identifier(self):
+        # REUSE-IgnoreStart
+        test_cases: list[tuple[str, str | None]] =3D [
+            ("/* SPDX-License-Identifier: MIT*/", "MIT"),
+            ("// SPDX-License-Identifier: GPL-2.0-only", "GPL-2.0-only")=
,
+            ("/* SPDX-License-Identifier: GPL-2.0-or-later OR MIT */", "=
GPL-2.0-or-later OR MIT"),
+            ("/* SPDX-License-Identifier: Apache-2.0 */\n extra text", "=
Apache-2.0"),
+            ("int main() { return 0; }", None),
+        ]
+        # REUSE-IgnoreEnd
+
+        for i, (file_content, expected_identifier) in enumerate(test_cas=
es):
+            file_path =3D self.src_tree / f"file_{i}.c"
+            file_path.write_text(file_content)
+            self.assertEqual(_parse_spdx_license_identifier(str(file_pat=
h)), expected_identifier)
--=20
2.43.0


