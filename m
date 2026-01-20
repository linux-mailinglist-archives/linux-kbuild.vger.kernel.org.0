Return-Path: <linux-kbuild+bounces-10721-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL1dEVVEcGnXXAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10721-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 04:13:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB2650489
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 04:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BBE9E52AE9A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 11:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85270427A1F;
	Tue, 20 Jan 2026 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="hXjAFRkq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E614279F7;
	Tue, 20 Jan 2026 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910157; cv=none; b=ITa5fsNF+Y6xU1fzjx6Ag2rSq+cbPIBVV1AF7mMPIM5x/F2QTBgQASAxV3t22IPR8goYDj69uwHRZREjTEoV0k85K9wPJdieNbZmYqtrDeOCQ1jle4pyQ8OGceEXEGpf5udYfzssMECnAuU7JPin6CTm4gKI1fVFJu3lMp9b5Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910157; c=relaxed/simple;
	bh=ifK6y7ESTkLRQ3A93vdqh2szgwDr9S74b2hXw6gK29A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k8zvSw7Yw3ZFRsRBlW4gZEKSrc0CJR/wdnh8MfRhsfm+xeTwqlUA7afLll98Wi9fscRb7df7R2wNaSOQqjQLSCbUArZAbu8QqT8C1x+ZFdjc7s9PK7zayjCJ0qhDACDuPW+hCQYHGDXd4UYjJjmqTzTIVnf1MM1nuSm/tfgUTDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=hXjAFRkq; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id D84DD200C4;
	Tue, 20 Jan 2026 12:55:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 9F4881FA862;
	Tue, 20 Jan 2026 12:55:51 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Or5V73aH_Vxr; Tue, 20 Jan 2026 12:55:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 015611FA85C;
	Tue, 20 Jan 2026 12:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 015611FA85C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768910151;
	bh=gWg1ozqnV38gDPTbJjaTTr/2ExUrF6zZXVvlJpEkHhU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=hXjAFRkqsN7fIwMd2qz4TEUAEOaxgPPq+S4ehXwyUpwDsTrhY7aT07OhNeAX/WMn7
	 1B+e4wv8zTiSJqbNc53eVCKR5JBPy43YNOa/tjJcXxIpgPF/+JlVkU8geMD3v/nd/3
	 qeo2TjyzAX3Ey02yxGOCfHT+TOjxMtkXKLTM9zgWtKd0AIH9oyTUWEWgpExj4SFu56
	 b6UyfqAhOtRWqKdVjzmggZyj7x+NHmzldOPfLUW/6TV1Lkb3Z+kuPzhVhSKGxiwb+V
	 SIwBZW1+fzqkXDkNTUAlz7BF0tA7a+M2NFyQUAsQbZi11r9lJ+3YzThXlrh2jM1lcy
	 SOAkweK4zXNLw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Og4_mdQlQuuH; Tue, 20 Jan 2026 12:55:50 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 95BDD1FA560;
	Tue, 20 Jan 2026 12:55:50 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v2 14/14] tools/sbom: add unit tests for SPDX-License-Identifier parsing
Date: Tue, 20 Jan 2026 12:53:52 +0100
Message-Id: <20260120115352.10910-15-luis.augenstein@tngtech.com>
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
	TAGGED_FROM(0.00)[bounces-10721-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,tmpdir.name:url];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: DDB2650489
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


