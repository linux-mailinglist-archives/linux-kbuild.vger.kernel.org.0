Return-Path: <linux-kbuild+bounces-10671-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C2CD39F2B
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 07:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D931D30275BA
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 06:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9523425C804;
	Mon, 19 Jan 2026 06:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="MaeLGTl8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD27229D280;
	Mon, 19 Jan 2026 06:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805925; cv=none; b=aewvFSGG4an8NecyvLJ9wVve/RibThfPufnTPGHdxcB/NMDGdp7rOxN7zeL8tX3GyJnZwSf6D0CJ4JTgbB938awFB25osfIy3rAtksqqXdHtVSRa3XD5MSEeQHu8fD4uKIZ9C/GOIAmjothWHVLcm2BAWypaFPx2bGmwt6Vruco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805925; c=relaxed/simple;
	bh=wTC0+x6QXEbXwGhOLgdIRJa0yIHS+kIDtCmuIeiAPmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cGD3ZwtK4jiB9soQc7WKpodpxME3Lb0VJR5eXk4PNr+KfmIhBmBncAPppzVF47P6cRckY4xf/XmMaSRjbanSFsU0tbN+/jIrmTy6VT0y7m66nQgOAuTTR4TuSK2n5VgFl3AcY+IBwkqCfbOpC2JQk9w/O5+WueWkYz2CDk2nPpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=MaeLGTl8; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 292E2200B2;
	Mon, 19 Jan 2026 07:48:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id ED2F61FA449;
	Mon, 19 Jan 2026 07:48:46 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Mk93uAMyeQDQ; Mon, 19 Jan 2026 07:48:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 48F001F88B3;
	Mon, 19 Jan 2026 07:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 48F001F88B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768805326;
	bh=zUME5+3eZh3XmKL1BuZ+Jbx5qS5yPG5qvVyJ9q+K3Yo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=MaeLGTl89HXrbl+Gt/6U8k4HtxrqAZq+m1B85CIo+ctXGmZNqdUm5Up3aGn/Kv4xK
	 DcW/ObMlPhnw+NMZszQ3/uQogwcqS6p69X8ZPGD67VbK0QQZBUUmCNLctxYpcAHL/v
	 H1JtvfFBCQ1c9SB9cT33DdKLnX+uprWKJRq3XsUaGTO9TNow0L6rt37Kcc9lKd5nzD
	 ccEOoYeUjp12ukag1CDW6Qk5eutW4WzwUuEomxmQryTVikvqKSEjrDpnaoMVnXCMnL
	 4L9YNs9fG56SP2kd4MbikhNE7yLa+TmkvQkb1aOAd35zntUZOoHsBOB26iWDgXJlW1
	 ZRTpnhyKGcLHg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id R3U1S6aP2eRq; Mon, 19 Jan 2026 07:48:46 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id F094D1FA449;
	Mon, 19 Jan 2026 07:48:45 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 02/14] tools/sbom: setup sbom logging
Date: Mon, 19 Jan 2026 07:47:19 +0100
Message-Id: <20260119064731.23879-3-luis.augenstein@tngtech.com>
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

Add logging infrastructure for warnings and errors.
Errors and warnings are accumulated and summarized in the end.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 tools/sbom/sbom.py              | 24 ++++++++-
 tools/sbom/sbom/__init__.py     |  0
 tools/sbom/sbom/config.py       | 47 ++++++++++++++++++
 tools/sbom/sbom/sbom_logging.py | 88 +++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 tools/sbom/sbom/__init__.py
 create mode 100644 tools/sbom/sbom/config.py
 create mode 100644 tools/sbom/sbom/sbom_logging.py

diff --git a/tools/sbom/sbom.py b/tools/sbom/sbom.py
index 9c2e4c7f1..c7f23d6eb 100644
--- a/tools/sbom/sbom.py
+++ b/tools/sbom/sbom.py
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
diff --git a/tools/sbom/sbom/__init__.py b/tools/sbom/sbom/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/tools/sbom/sbom/config.py b/tools/sbom/sbom/config.py
new file mode 100644
index 000000000..3dc569ae0
--- /dev/null
+++ b/tools/sbom/sbom/config.py
@@ -0,0 +1,47 @@
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
+def _parse_cli_arguments() -> dict[str, bool]:
+    """
+    Parse command-line arguments using argparse.
+
+    Returns:
+        Dictionary of parsed arguments.
+    """
+    parser =3D argparse.ArgumentParser(
+        description=3D"Generate SPDX SBOM documents for kernel builds",
+    )
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
+    # Parse cli arguments
+    args =3D _parse_cli_arguments()
+
+    debug =3D args["debug"]
+
+    return KernelSbomConfig(debug=3Ddebug)
diff --git a/tools/sbom/sbom/sbom_logging.py b/tools/sbom/sbom/sbom_loggi=
ng.py
new file mode 100644
index 000000000..3460c4d84
--- /dev/null
+++ b/tools/sbom/sbom/sbom_logging.py
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import logging
+import inspect
+from typing import Any, Literal
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
+    def log(self, template: str, /, **kwargs: Any) -> None:
+        """Log a message based on a template and optional variables."""
+        message =3D template.format(**kwargs)
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
+def warning(msg_template: str, /, **kwargs: Any) -> None:
+    """Log a warning message."""
+    _warning_logger.log(msg_template, **kwargs)
+
+
+def error(msg_template: str, /, **kwargs: Any) -> None:
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
2.34.1


