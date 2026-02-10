Return-Path: <linux-kbuild+bounces-11109-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO4XO5ubi2k3XAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11109-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:56:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3621211F2CE
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7656F30252A8
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 20:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC51336ED2;
	Tue, 10 Feb 2026 20:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="PGe4GVtk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2427633ADAC;
	Tue, 10 Feb 2026 20:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756933; cv=none; b=EqZ9GA5JqiEgIt0T4MCQ+cYsyBgggjGMKgh10GJeLKOUnum0dCBITZqC4Tq9DQcYgX7cXVGa5nGnF45UgvpLpn7NfWTyRbyTqwfEqa0cFrAPlsdR5YVPVH+SyRcLBAbL1oT1O50xjAXfvCXWtjve80dR0z5oIB2m8kflOuQ4gUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756933; c=relaxed/simple;
	bh=Ce6sWTyg81ZRywYW45LOnLNnzCpK3GGoh1IkDG8w24s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JeJ1HPhqmrvV0Snc77PQsDT62HihCwAXzrrRs/bfzu3l+HanpACCoX0KDroz2FUDNSMqRxMWcMDaucZ/0RzBoScRoeW3fcBC0849btfAlHt4O8T1XpK135zT4priVLsjTdRcR7Eo6BMVpM7XgExLFUOc79s4An9dNkjw1BaUPuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=PGe4GVtk; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 817DB3FAEF;
	Tue, 10 Feb 2026 21:55:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 59B991FA988;
	Tue, 10 Feb 2026 21:55:26 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id BegcMqPp27n4; Tue, 10 Feb 2026 21:55:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id B0E181FA999;
	Tue, 10 Feb 2026 21:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz B0E181FA999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1770756925;
	bh=hw8dmkijKnfaTahwf1R8zAdQumTaUWJ0O7rHZJ1xD6M=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=PGe4GVtkMrLQUthufpZ/pH7bvoXfRkTFreZK1CSrM0YWKCmnXYxGDzKBZQamxGVX6
	 M6Ix5yHkBFvNo9fAbuNZfCsZSMlgpCa3N2ViybIGLo/qMhbIF8ws+SRMuNhAx4QE8r
	 aNp/XLlmlGOBGe0z3PlQT5PGmIg0nZVj+mfhbV7QzAEJKjLW20jiwUJZiqP2hFscsd
	 zSvDsK00NoZbnG2u5iY7ecPoiKkcPHoXIR1GWPefnaAj+Au3Zj57UhvCC4eoGZKucY
	 Yt1b23dPVNdf/ngUg6x5vemT4LZhSj7uyrf/6Nh4tNVAZ3ArtttAGllF+K8vmvzsG7
	 3OzhVPtpWBUog==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id r8UFfWlfEwfs; Tue, 10 Feb 2026 21:55:25 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 2CD3B1FA988;
	Tue, 10 Feb 2026 21:55:25 +0100 (CET)
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
Subject: [PATCH 15/15] scripts/sbom: add unit tests for SPDX-License-Identifier parsing
Date: Tue, 10 Feb 2026 21:54:24 +0100
Message-Id: <20260210205424.11195-16-luis.augenstein@tngtech.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11109-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tngtech.com:mid,tngtech.com:dkim,tngtech.com:email,tmpdir.name:url];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3621211F2CE
X-Rspamd-Action: no action

Verify that SPDX-License-Identifier headers at the top of source files
are parsed correctly.

Assisted-by: Claude Sonnet 4.5
Assisted-by: GLM-4.7
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
index 000000000000..e69de29bb2d1
diff --git a/scripts/sbom/tests/spdx_graph/test_kernel_file.py b/scripts/=
sbom/tests/spdx_graph/test_kernel_file.py
new file mode 100644
index 000000000000..bc44e7a97d2a
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
2.34.1


