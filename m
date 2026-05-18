Return-Path: <linux-kbuild+bounces-13234-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHOMAvmvCmog5wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13234-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:21:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E335669CB
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 188E83004CA1
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 06:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA74A30C161;
	Mon, 18 May 2026 06:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="MER7hYVp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0FD3DE42A;
	Mon, 18 May 2026 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085287; cv=none; b=BCXy+igLglIN23KXacn4Mk4/VShwuRHtdZJJ6jRCnMYYz8jRsRGv7BZCLZR5qEV3WYqdEXPVpX3PhkOzYLqzhsFTHZ96FfpbgoVCbs0JHewqIUiPTUVL/SzqvlEmOOCoV/vl0q3kz4Ma1uc2AeH9bispT1NJt5r6K6dJvhkTfUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085287; c=relaxed/simple;
	bh=1Z++A3nRDYD9UP7Wt03B49EDM9XW017brqFXjmxp5q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlRNTCBONaw1pua5BtqHMd+i91RoEBwkyhleklGEGWxP7O1Ox4d2pL3YOSsEgRJDYOSnbr+TtIXS4LumdvQNWXVBU9L86innWtuFcM5lfPNUWjJjKeDSBUDVl+Yt6A2vNedbJTckfOfjNGE+jEk4K9hJfpexbViBkCunuvQSvik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=MER7hYVp; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 1A720200C6;
	Mon, 18 May 2026 08:21:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 5B8A11FACCB;
	Mon, 18 May 2026 08:21:17 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 19SU_emGhFsG; Mon, 18 May 2026 08:21:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id EF5351FACD3;
	Mon, 18 May 2026 08:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz EF5351FACD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1779085272;
	bh=kZR3+eOUXTBU3uvJc4K4Tw0EwAJF/430ifQ+oDuSjfA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MER7hYVpa68NH9keWgoXTN25wHy1NU7Ezz5CD1e7DqwnOnQHQUw+taTmMyxzWWG11
	 Lb5tD/NdvbAwJDcGIupD0MOnDA4X74IIb2hxsFM5Bumyga5PtCi74sUkXE6ExjgQNv
	 GhOJEFUm1DbfPNfZrbPHV7XOoEZjmVZqlHJU0ESuudjvbynrxHSkweRFBcH2XesdAt
	 m55kDhYQk+BUu+nK7f4gTUjYL24TVQ67mlBD2JnB4LDwC+mwP9eK29oZ9swyN0WUZn
	 zNWxuFS2t12YAXYjYF9X52RFrIP3Xgks/F/e2Wx5Lpylw/ZzRJzH9h+WFKlsa4bbG+
	 9L7qwHqCpeFlw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id acckYvwFT0Q5; Mon, 18 May 2026 08:21:11 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 9B5B31FACCB;
	Mon, 18 May 2026 08:21:11 +0200 (CEST)
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
Subject: [PATCH v7 03/15] scripts/sbom: setup sbom logging
Date: Mon, 18 May 2026 08:20:50 +0200
Message-ID: <20260518062102.2051814-4-luis.augenstein@tngtech.com>
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
X-Rspamd-Queue-Id: 15E335669CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13234-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
 scripts/sbom/sbom.py              | 26 ++++++++-
 scripts/sbom/sbom/__init__.py     |  0
 scripts/sbom/sbom/config.py       | 46 +++++++++++++++
 scripts/sbom/sbom/sbom_logging.py | 94 +++++++++++++++++++++++++++++++
 4 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 scripts/sbom/sbom/__init__.py
 create mode 100644 scripts/sbom/sbom/config.py
 create mode 100644 scripts/sbom/sbom/sbom_logging.py

diff --git a/scripts/sbom/sbom.py b/scripts/sbom/sbom.py
index 9c2e4c7f17c..3bd466720b0 100644
--- a/scripts/sbom/sbom.py
+++ b/scripts/sbom/sbom.py
@@ -6,9 +6,33 @@
 Compute software bill of materials in SPDX format describing a kernel bu=
ild.
 """
=20
+import logging
+import sys
+import sbom.sbom_logging as sbom_logging
+from sbom.config import get_config
+
+
+def _exit_with_summary(write_output_on_error: bool =3D False) -> None:
+    warning_summary =3D sbom_logging.summarize_warnings()
+    error_summary =3D sbom_logging.summarize_errors()
+    if warning_summary:
+        logging.warning(warning_summary)
+    if error_summary:
+        logging.error(error_summary)
+        sys.exit(1)
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
+    _exit_with_summary(config.write_output_on_error)
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
index 00000000000..fbc53cc77ef
--- /dev/null
+++ b/scripts/sbom/sbom/sbom_logging.py
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import logging
+import inspect
+from typing import Literal
+
+
+MessageTemplate =3D str
+
+
+class MessageLogger:
+    """Logger that suppresses repeated messages and stores a summary of =
all logged messages."""
+
+    _messages: dict[MessageTemplate, list[str]]
+    _message_counts: dict[MessageTemplate, int]
+    _repeated_logs_limit: int
+    """Maximum number of repeated messages of the same type to log befor=
e suppressing further output."""
+
+    def __init__(self, level: Literal["error", "warning"], repeated_logs=
_limit: int =3D 3) -> None:
+        self._level =3D level
+        self._messages =3D {}
+        self._message_counts =3D {}
+        self._repeated_logs_limit =3D repeated_logs_limit
+
+    def log(self, template: MessageTemplate, /, **kwargs: str) -> None:
+        """Log a message based on a template and optional variables. Exa=
mple: `log("Missing {path}", path=3Dstr(p))`."""
+        message =3D template
+        for key, value in kwargs.items():
+            message =3D message.replace("{" + key + "}", value)
+        if template not in self._messages:
+            self._messages[template] =3D []
+            self._message_counts[template] =3D 0
+        self._message_counts[template] +=3D 1
+        if self._message_counts[template] <=3D self._repeated_logs_limit=
:
+            if self._level =3D=3D "error":
+                logging.error(message)
+            elif self._level =3D=3D "warning":
+                logging.warning(message)
+            self._messages[template].append(message)
+
+    def get_summary(self) -> str:
+        if len(self._messages) =3D=3D 0:
+            return ""
+        summary: list[str] =3D [f"Summarize {self._level}s:"]
+        for template, messages in self._messages.items():
+            for message in messages:
+                summary.append(message)
+            n_suppressed_messages =3D self._message_counts[template] - s=
elf._repeated_logs_limit
+            if n_suppressed_messages > 0:
+                instances =3D "instance" if n_suppressed_messages =3D=3D=
 1 else "instances"
+                summary.append(f"... (Found {n_suppressed_messages} more=
 {instances} of this {self._level})")
+        return "\n".join(summary)
+
+    def has_messages(self) -> bool:
+        return len(self._message_counts) > 0
+
+
+_warning_logger: MessageLogger
+_error_logger: MessageLogger
+
+
+def warning(msg_template: MessageTemplate, /, **kwargs: str) -> None:
+    _warning_logger.log(msg_template, **kwargs)
+
+
+def error(msg_template: MessageTemplate, /, **kwargs: str) -> None:
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
+    return _error_logger.has_messages()
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


