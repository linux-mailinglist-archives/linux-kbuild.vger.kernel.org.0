Return-Path: <linux-kbuild+bounces-13067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFaXKU/P/GlhTwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13067-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 19:43:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3DB4ED03E
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 19:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40F7D3081CCF
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2026 17:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A3E45BD7B;
	Thu,  7 May 2026 17:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="S/rVZRRm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEDD44E044;
	Thu,  7 May 2026 17:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778175546; cv=none; b=E2w1PQh0c/kqDgnS0AEGfI7H456Ca1qD0MVWMQcc7KMwcQbrWIFhsCUVtq/8jBg41tw+m1mYS4DTC9pQ45YwbnvxQWzV48S0NHolWqVwTa9XmMuhm7sG3YY6XCB54+jnao4XfABCMQ62p+fn/QQqZap7L3BrmOggCohtJMNf+JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778175546; c=relaxed/simple;
	bh=KnmQ5Va53gemB2mWrT5gLpkkZDQ1HvA01KYV4YEbrZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXfonwIfVvjYpFP7m7klVrAYdVmA4jyN+PrwjEp2veeWnsSIo+r4rqloxym4QaXBfLe1mqsCzXrgcF4LrX3zEWKcG1RkbpanR1bwnWXjeP+3UQub/I/QghzwCtHu8cWet73SQMIul4iwLCiuenfPgLQOZNB7MY0/W63MxaCpug4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=S/rVZRRm; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 56FC9200CE;
	Thu,  7 May 2026 19:39:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 185731FB106;
	Thu,  7 May 2026 19:39:03 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 6USikIAVb2xS; Thu,  7 May 2026 19:39:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 1A2561FB1AB;
	Thu,  7 May 2026 19:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 1A2561FB1AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1778175542;
	bh=S6EpWiM1JROEHvQju91DkLWdJQjslYBzzliaBnW70Iw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=S/rVZRRm5ArYrw9PiLS+S2to3H/j7zH1kTuNyp1BYJtx+DW0qlxaYcDOahXnaW5C/
	 rovp4c/Elpsld8z3/CisdQYfJkQIhRSDkLEkW5hA/gsqcc+m8WzbVIjunvLVUHXYZX
	 t/Py+QUTY7yTZF2kAjQfUVXB+AOSOuBNGAd8pGdQFHw/TkAPEbdDKsjm6JrtyMAm04
	 IO3GqtQ+AyuDCj6e15FosZMUWSuEjGcUxYvMHitOj1BEr9JOv2pWKLNP3qUfX6JT/I
	 vc8NEEMpRqjXjVa7yNB+YV9KjKKMTYWl9waddQc7jCfTjh03mdJkaNz2m16ypzUMjQ
	 DiNflKiM6b2XQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id uhChAWWvdd_4; Thu,  7 May 2026 19:39:02 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id AE38B1FB106;
	Thu,  7 May 2026 19:39:01 +0200 (CEST)
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
Subject: [PATCH v6 03/15] scripts/sbom: setup sbom logging
Date: Thu,  7 May 2026 19:38:15 +0200
Message-ID: <20260507173827.70949-4-luis.augenstein@tngtech.com>
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
X-Rspamd-Queue-Id: 0B3DB4ED03E
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
	TAGGED_FROM(0.00)[bounces-13067-lists,linux-kbuild=lfdr.de];
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

Add logging infrastructure for warnings and errors.
Errors and warnings are accumulated and summarized in the end.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom.py              | 24 ++++++++-
 scripts/sbom/sbom/__init__.py     |  0
 scripts/sbom/sbom/config.py       | 46 ++++++++++++++++
 scripts/sbom/sbom/sbom_logging.py | 90 +++++++++++++++++++++++++++++++
 4 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 scripts/sbom/sbom/__init__.py
 create mode 100644 scripts/sbom/sbom/config.py
 create mode 100644 scripts/sbom/sbom/sbom_logging.py

diff --git a/scripts/sbom/sbom.py b/scripts/sbom/sbom.py
index 9c2e4c7f17c..c7f23d6eb30 100644
--- a/scripts/sbom/sbom.py
+++ b/scripts/sbom/sbom.py
@@ -6,9 +6,31 @@
 Compute software bill of materials in SPDX format describing a kernel bu=
ild.
 """
=20
+import logging
+import sys
+import sbom.sbom_logging as sbom_logging
+from sbom.config import get_config
+
=20
 def main():
-    pass
+    # Read config
+    config =3D get_config()
+
+    # Configure logging
+    logging.basicConfig(
+        level=3Dlogging.DEBUG if config.debug else logging.INFO,
+        format=3D"[%(levelname)s] %(message)s",
+    )
+
+    # Report collected warnings and errors in case of failure
+    warning_summary =3D sbom_logging.summarize_warnings()
+    error_summary =3D sbom_logging.summarize_errors()
+
+    if warning_summary:
+        logging.warning(warning_summary)
+    if error_summary:
+        logging.error(error_summary)
+        sys.exit(1)
=20
=20
 # Call main method
diff --git a/scripts/sbom/sbom/__init__.py b/scripts/sbom/sbom/__init__.p=
y
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/scripts/sbom/sbom/config.py b/scripts/sbom/sbom/config.py
new file mode 100644
index 00000000000..c1ac9ad5737
--- /dev/null
+++ b/scripts/sbom/sbom/config.py
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import argparse
+from dataclasses import dataclass
+
+
+@dataclass
+class KernelSbomConfig:
+    debug: bool
+    """Whether to enable debug logging."""
+
+
+def _parse_cli_arguments(parser: argparse.ArgumentParser) -> dict[str, b=
ool]:
+    """
+    Parse command-line arguments using argparse.
+
+    Returns:
+        Dictionary of parsed arguments.
+    """
+    parser.add_argument(
+        "--debug",
+        action=3D"store_true",
+        default=3DFalse,
+        help=3D"Enable debug logs (default: False)",
+    )
+
+    args =3D vars(parser.parse_args())
+    return args
+
+
+def get_config() -> KernelSbomConfig:
+    """
+    Parse command-line arguments and construct the configuration object.
+
+    Returns:
+        KernelSbomConfig: Configuration object with all settings for SBO=
M generation.
+    """
+    parser =3D argparse.ArgumentParser(
+        description=3D"Generate SPDX SBOM documents for kernel builds",
+    )
+    args =3D _parse_cli_arguments(parser)
+
+    debug =3D args["debug"]
+
+    return KernelSbomConfig(debug=3Ddebug)
diff --git a/scripts/sbom/sbom/sbom_logging.py b/scripts/sbom/sbom/sbom_l=
ogging.py
new file mode 100644
index 00000000000..a9c9fcf3c5d
--- /dev/null
+++ b/scripts/sbom/sbom/sbom_logging.py
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import logging
+import inspect
+from typing import Literal
+
+
+class MessageLogger:
+    """Logger that prints the first occurrence of each message immediate=
ly
+    and keeps track of repeated messages for a final summary."""
+
+    messages: dict[str, list[str]]
+    repeated_logs_limit: int
+    """Maximum number of repeated messages of the same type to log befor=
e suppressing further output."""
+
+    def __init__(self, level: Literal["error", "warning"], repeated_logs=
_limit: int =3D 3) -> None:
+        self._level =3D level
+        self.messages =3D {}
+        self.repeated_logs_limit =3D repeated_logs_limit
+
+    def log(self, template: str, /, **kwargs: str) -> None:
+        """Log a message based on a template and optional variables."""
+        message =3D template
+        for key, value in kwargs.items():
+            message =3D message.replace("{" + key + "}", value)
+        if template not in self.messages:
+            self.messages[template] =3D []
+        if len(self.messages[template]) < self.repeated_logs_limit:
+            if self._level =3D=3D "error":
+                logging.error(message)
+            elif self._level =3D=3D "warning":
+                logging.warning(message)
+        self.messages[template].append(message)
+
+    def get_summary(self) -> str:
+        """Return summary of collected messages."""
+        if len(self.messages) =3D=3D 0:
+            return ""
+        summary: list[str] =3D [f"Summarize {self._level}s:"]
+        for msgs in self.messages.values():
+            for i, msg in enumerate(msgs):
+                if i < self.repeated_logs_limit:
+                    summary.append(msg)
+                    continue
+                summary.append(
+                    f"... (Found {len(msgs) - i} more {'instances' if (l=
en(msgs) - i) !=3D 1 else 'instance'} of this {self._level})"
+                )
+                break
+        return "\n".join(summary)
+
+
+_warning_logger: MessageLogger
+_error_logger: MessageLogger
+
+
+def warning(msg_template: str, /, **kwargs: str) -> None:
+    """Log a warning message."""
+    _warning_logger.log(msg_template, **kwargs)
+
+
+def error(msg_template: str, /, **kwargs: str) -> None:
+    """Log an error message including file, line, and function context."=
""
+    frame =3D inspect.currentframe()
+    caller_frame =3D frame.f_back if frame else None
+    info =3D inspect.getframeinfo(caller_frame) if caller_frame else Non=
e
+    if info:
+        msg_template =3D f'File "{info.filename}", line {info.lineno}, i=
n {info.function}\n{msg_template}'
+    _error_logger.log(msg_template, **kwargs)
+
+
+def summarize_warnings() -> str:
+    return _warning_logger.get_summary()
+
+
+def summarize_errors() -> str:
+    return _error_logger.get_summary()
+
+
+def has_errors() -> bool:
+    return len(_error_logger.messages) > 0
+
+
+def init() -> None:
+    global _warning_logger, _error_logger
+    _warning_logger =3D MessageLogger("warning")
+    _error_logger =3D MessageLogger("error")
+
+
+init()
--=20
2.43.0


