Return-Path: <linux-kbuild+bounces-13245-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /UlOBUiwCmpO5wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13245-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:23:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3259D566A40
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF42B300939D
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 06:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC363E00A4;
	Mon, 18 May 2026 06:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="QOya4Cdf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C763890E2;
	Mon, 18 May 2026 06:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085305; cv=none; b=hAjdsOtFvy4NsnnPptPnu7whBtekTQCdMT2X8VKbC5NG4xt3HUNPrIdnSVRrS/f4S6En7NVSehTdB+/nBvjv3iWoH1CjrGg8JF2/EkZEgKye6Om3uSLShULZrd/NlfaPtmytFfSPIzjks6hxmBcrvFmptni3DiTrn/8Kdi0Z/VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085305; c=relaxed/simple;
	bh=bdItrdgPyiTB3vWGzgQeGi3b8ybVRDHiRyFx0UTZtJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIbEZJxAo8gGwMJIk19DC0kZMKyDjOqo52xFgG/UR1Q4UcyszxGxmyKiwB8iTRB43iLdHb2WlcJ8+rcecu4Djd7WmuoAErCeK9C0jwiwoH7u+D8d9RHHgOe8Gl0XmW3O+87oj08JjXSVfXtHQW5mfTK/PeGHhwbbD63BkXhZGIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=QOya4Cdf; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 39A44200CD;
	Mon, 18 May 2026 08:21:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 0CEFE1F8989;
	Mon, 18 May 2026 08:21:31 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id OmGHK_MbeaCO; Mon, 18 May 2026 08:21:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 668421FAD23;
	Mon, 18 May 2026 08:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 668421FAD23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1779085290;
	bh=FD6c3aam+X5MsDPR+uNQsdOzwvzHC15J+0Psqfwx3og=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QOya4Cdfk7OIkay1YU08etboNEx0ZNCdXqQgQuMrZSqGcKPxpEu5cm9imvoNW72Sh
	 wgyyJo6IDle7B2CsyHDASNDPiJe8wYP20Ku50FwzisxtG/gwSciVNIKJSlTHsziuFc
	 2acgooF0Ns42J59DTp7poAJDQq7JG0WYffEbYVGysrjp14X8Bql1yckym3x3/NJp78
	 sZ52zxE5ZrGo3URZWVm0sHhbZs8xpH7uIMAjHtBZTW+pE9tMC4TfOO79QnvUeBiRFK
	 lbOfPtgWOsoMBj1LAxOSg28XXLpJAfxDrEcYP+kcjH5f4U5aQ3Lsr3wDaHFJsQ/MwF
	 Iqq9lBhoQ302Q==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id EUmYUuGJIfnU; Mon, 18 May 2026 08:21:30 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 0CC2B1FAD21;
	Mon, 18 May 2026 08:21:30 +0200 (CEST)
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
Subject: [PATCH v7 15/15] scripts/sbom: add unit tests for SPDX-License-Identifier parsing
Date: Mon, 18 May 2026 08:21:02 +0200
Message-ID: <20260518062102.2051814-16-luis.augenstein@tngtech.com>
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
X-Rspamd-Queue-Id: 3259D566A40
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
	TAGGED_FROM(0.00)[bounces-13245-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:email,tngtech.com:mid,tngtech.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tmpdir.name:url];
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

Verify that SPDX-License-Identifier headers at the top of source files
are parsed correctly.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/tests/spdx_graph/__init__.py     |  0
 .../sbom/tests/spdx_graph/test_kernel_file.py | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 scripts/sbom/tests/spdx_graph/__init__.py
 create mode 100644 scripts/sbom/tests/spdx_graph/test_kernel_file.py

diff --git a/scripts/sbom/tests/spdx_graph/__init__.py b/scripts/sbom/tes=
ts/spdx_graph/__init__.py
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/scripts/sbom/tests/spdx_graph/test_kernel_file.py b/scripts/=
sbom/tests/spdx_graph/test_kernel_file.py
new file mode 100644
index 00000000000..35a63a768ba
--- /dev/null
+++ b/scripts/sbom/tests/spdx_graph/test_kernel_file.py
@@ -0,0 +1,35 @@
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
+            ("# SPDX-License-Identifier: GPL-2.0-only", "GPL-2.0-only"),
+            ("#!/bin/bash\n# SPDX-License-Identifier: GPL-2.0-only", "GP=
L-2.0-only"),
+            ("/* SPDX-License-Identifier: GPL-2.0-or-later OR MIT */", "=
GPL-2.0-or-later OR MIT"),
+            ("/* SPDX-License-Identifier: Apache-2.0 */\n extra text", "=
Apache-2.0"),
+            ("<!-- SPDX-License-Identifier: GPL-2.0 -->", "GPL-2.0"),
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


