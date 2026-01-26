Return-Path: <linux-kbuild+bounces-10884-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOy2EpPCd2nckgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10884-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 20:37:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A082E8CA72
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 20:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C132A3067A2B
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 19:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21945286D63;
	Mon, 26 Jan 2026 19:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="mU69tfIY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76921286D4D;
	Mon, 26 Jan 2026 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769456139; cv=none; b=K2FfHubQu97A6ze/HNHpuJl3gNU04coTAcCjHmuFyN+4Zpo4uJvdVohobV2gCXH8RwIF9xHHaqQUjYNtT2JB6nawVomQFZl7XKopnLy6wGWqAUVI7cDHhWDM4eS+T/Uax+dC+zexcThzGuA/PCy+4zYeV3V1yybDGFdNNiXWm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769456139; c=relaxed/simple;
	bh=ifK6y7ESTkLRQ3A93vdqh2szgwDr9S74b2hXw6gK29A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aeTX9VW/RoYqKl8rAyXExemj1ts8ENhpKcBubdsBeK/mwrvWabyqTW+/VffNo+65bwyuVNMGCQ5axA5wI4dKqZBEhMHDTlAi9ItnmDb7fwsf6JHZ9eDo5Hw0tOvnctbEvCcOrTg15x9feePVZjGMCnX7PqFA/m7bcHEFo6MDvAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=mU69tfIY; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 29DBB3FAF2;
	Mon, 26 Jan 2026 20:35:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id E42901FA3D7;
	Mon, 26 Jan 2026 20:35:32 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id GdYr0lHnBxoo; Mon, 26 Jan 2026 20:35:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 5837F1FA7AF;
	Mon, 26 Jan 2026 20:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 5837F1FA7AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1769456132;
	bh=gWg1ozqnV38gDPTbJjaTTr/2ExUrF6zZXVvlJpEkHhU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=mU69tfIYqOq/woFcGbijqrxxJsebqDl1A+bx6FxZGIhHu606pAzJhSNe6YWOeK0Rn
	 ohuXJF9Nt36YqVCFF5H7HxtdhjYbjuAGUd5wxosTfl/UrA54kkBTyr1/qYMe8EY/Nc
	 FEnL8FtURuxUEihF+Gx1m0C6C9H3SOFqPijq+7uo/Ir+N8/ZTN/phZOwG3LLk1yWAJ
	 Im6Y8P0PvT23icxDUcY01UHlzdv9M9o+U+/JauQC39JhQbdxDth/8R1GkpM0PaPMJG
	 NuXtLl3swjfDphaS/FCTKWGGt7C0doiKbLeBETWGJaeUQU3gPkOGG9Lqy62zo0LYkp
	 y9IviNfdcsucA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 2-8IAOAy3KXv; Mon, 26 Jan 2026 20:35:32 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id E82EE1FA3D7;
	Mon, 26 Jan 2026 20:35:31 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v3 14/14] tools/sbom: add unit tests for SPDX-License-Identifier parsing
Date: Mon, 26 Jan 2026 20:33:04 +0100
Message-Id: <20260126193304.320916-15-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126193304.320916-1-luis.augenstein@tngtech.com>
References: <20260126193304.320916-1-luis.augenstein@tngtech.com>
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
	TAGGED_FROM(0.00)[bounces-10884-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:email,tngtech.com:dkim,tngtech.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tmpdir.name:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[tngtech.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A082E8CA72
X-Rspamd-Action: no action

Verify that SPDX-License-Identifier headers at the top of source files
are parsed correctly.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 tools/sbom/tests/spdx_graph/__init__.py       |  0
 .../sbom/tests/spdx_graph/test_kernel_file.py | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 tools/sbom/tests/spdx_graph/__init__.py
 create mode 100644 tools/sbom/tests/spdx_graph/test_kernel_file.py

diff --git a/tools/sbom/tests/spdx_graph/__init__.py b/tools/sbom/tests/s=
pdx_graph/__init__.py
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tools/sbom/tests/spdx_graph/test_kernel_file.py b/tools/sbom=
/tests/spdx_graph/test_kernel_file.py
new file mode 100644
index 000000000000..bc44e7a97d2a
--- /dev/null
+++ b/tools/sbom/tests/spdx_graph/test_kernel_file.py
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
2.34.1


