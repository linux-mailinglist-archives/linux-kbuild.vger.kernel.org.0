Return-Path: <linux-kbuild+bounces-10669-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7515DD39F13
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 07:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80EFC306B1D3
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 06:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5842827F75F;
	Mon, 19 Jan 2026 06:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="OSJr87t8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0952228689A;
	Mon, 19 Jan 2026 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805365; cv=none; b=XwH/L/V2sATwUw3Yolw0KfSMVLfP8WHTDTkuB5iXyClLzft+JZcAYxOR+Q3EeAbEN8KtvOsCWwAGJaCHrdWz+2bkIEQBmTx0DURRJpViqKPTid8NT6uggmg6BN6Od9ON1dGRgf2hikFZk1tBoSsleArz61kGzs1VEwGYcboj4KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805365; c=relaxed/simple;
	bh=wE2egxl+P+LQHKD2q0ScJeBgub4DlH2FyCUOD3uGnzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iwNr74lym4JzQCS2z6/XgyBuYEpBx96QYLU29bEv9wjGqSjuZAOgq//ZYeIj8lf8hF8oNbL/Bdn2V5QOi/p7Prg00KlxzZnYvqnkoeTL6HJPic+M4xm5aKg/i3GktxVLlIrS4jixZ/9bmR0tuQMwmhVuVoThz5V2awqf7R9Spvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=OSJr87t8; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 175BC200C2;
	Mon, 19 Jan 2026 07:49:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id D82CA1FA842;
	Mon, 19 Jan 2026 07:49:08 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 4o_uqGg3Xv0x; Mon, 19 Jan 2026 07:49:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 24AC21FA802;
	Mon, 19 Jan 2026 07:49:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 24AC21FA802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768805348;
	bh=yKbFPUoQJ6lMyGQDHWoBufZwuN/d2ZS8cIq1pLFBAzw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=OSJr87t8XVcmXtMp6fkYSmZY4fIWr5ewOCNIZ0nKKnfs8CmjTFIgWigoizwQ8t370
	 c2uV6plnSZy5QScsvuzsSMpZc6Pb3BkL+wEF9iaZuz2fniTBvr9fWE9y9va0jUV1YZ
	 HQAwVl/1Mlv73asTExrhSYOM+6n5/q+BlULhW9OeW3YTx46BHwt4ZeuQ1ydkrgjRwx
	 BcdYQwdKpnvjrTor49ZWF3XaZCGm1rhCZoLrNOSEKMu5QLJvbPwqJDwBhpQJbUUwvD
	 YWbmUCQZ/+G9bL6olUPChF1750etr8d20AxilWBF61UABGeSUuRhACJf2MxXNppUh2
	 E64evlRtJqWVw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 6gDqmfUnw9AM; Mon, 19 Jan 2026 07:49:08 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id BAA3C1FA64F;
	Mon, 19 Jan 2026 07:49:07 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 14/14] tools/sbom: Add unit tests for SPDX-License-Identifier parsing
Date: Mon, 19 Jan 2026 07:47:31 +0100
Message-Id: <20260119064731.23879-15-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119064731.23879-1-luis.augenstein@tngtech.com>
References: <20260119064731.23879-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
index 000000000..e69de29bb
diff --git a/tools/sbom/tests/spdx_graph/test_kernel_file.py b/tools/sbom=
/tests/spdx_graph/test_kernel_file.py
new file mode 100644
index 000000000..bc44e7a97
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


