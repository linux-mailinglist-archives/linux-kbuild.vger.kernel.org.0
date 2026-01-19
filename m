Return-Path: <linux-kbuild+bounces-10678-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57627D3A7C2
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 13:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 155E33005198
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 12:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B41B35970F;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrZ4TFb5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09B63191C0;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824317; cv=none; b=Gkgio5OftQnnZD+S+ihbt+c55bAsvlDMh3SmfuV9C1glBl42GDf0GXvaGraSoGJvMw0qlds79WFTg3fjji9izfSZWed+UGwAgyFIlraGlJWixEGQpKEzNuy/djjBrntM1FkDaeGMhkurLi0Ast/+vErEpnu9TGDerVBz/gSAzG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824317; c=relaxed/simple;
	bh=TCIDBeqflVUFZ2smOAiTOF7w3v48ieHVeu+24TcmIW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BVFyWDHB3IaIwjTg3yhygkWzxnLYhsWL1x7qEMhUu9nyh1QLIAd7WmlaTqc5qdc3TMvG13BsMHF3Zhx7VcVN8DNVxWO1jDsovB8QgzfOk+KSeukmApQeOnaINr8GeFu7Ins+weJ0BG3Uw5hHE4YifBXWqI9/8rjCF4imBxko/sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rrZ4TFb5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40E4C19423;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768824316;
	bh=TCIDBeqflVUFZ2smOAiTOF7w3v48ieHVeu+24TcmIW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rrZ4TFb55NBcQyz3r9dSGrbzyc93ALw8HLjSdIbiQiKxwrPzwkbPYYztDh/t1fe6i
	 N6hLzFNJDGsTuCw68zIlJPrHVoPqgB8zSKfTVkhwwIgA/IVZgTlDUZXuJG8XqTjInB
	 M+f4+jo1tAROBOT0wGoZmRjGVrHU+pCrHNazu8koRPZESU6rkp6YoW3uYtRAGV4LKM
	 sZxSWsBykwWQVLGc7x9c/FrtQleMkYPaBAq5bJ23wlpLvjHsMoBGABq9cFj4oLRmVy
	 61qxK7cXUiJ9WjxJ32QvCZGZGtcSfB5nvQhnp5KIusrKBJB3Ao/IhBNKgJwuSwsC0n
	 71LKmPEN5K/jQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vho0Q-00000001ZjA-3CpT;
	Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/9] docs: kdoc: fix logic to handle unissued warnings
Date: Mon, 19 Jan 2026 13:04:56 +0100
Message-ID: <95109a6585171da4d6900049deaa2634b41ee743.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Changeset 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently discarded")
didn't properly addressed the missing messages behavior, as
it was calling directly python logger low-level function,
instead of using the expected method to emit warnings.

Basically, there are two methods to log messages:

- self.config.log.warning() - This is the raw level to emit a
  warning. It just writes the a message at stderr, via python
  logging, as it is initialized as:

    self.config.log = logging.getLogger("kernel-doc")

- self.config.warning() - This is where we actually consider a
  message as a warning, properly incrementing error count.

Due to that, several parsing error messages are internally considered
as success, causing -Werror to not work on such messages.

While here, ensure that the last ignored entry will also be handled
by adding an extra check at the end of the parse handler.

Fixes: 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently discarded")
Closes: https://lore.kernel.org/linux-doc/20260112091053.00cee29a@foz.lan/
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 35 ++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index a9a37519145d..c03505889dc2 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -295,7 +295,7 @@ class KernelEntry:
 
     # TODO: rename to emit_message after removal of kernel-doc.pl
     def emit_msg(self, ln, msg, *, warning=True):
-        """Emit a message"""
+        """Emit a message."""
 
         log_msg = f"{self.fname}:{ln} {msg}"
 
@@ -448,18 +448,37 @@ class KernelDoc:
 
         self.config.log.debug("Output: %s:%s = %s", dtype, name, pformat(args))
 
+    def emit_unused_warnings(self):
+        """
+        When the parser fails to produce a valid entry, it places some
+        warnings under `entry.warnings` that will be discarded when resetting
+        the state.
+
+        Ensure that those warnings are not lost.
+
+        .. note::
+
+              Because we are calling `config.warning()` here, those
+              warnings are not filtered by the `-W` parameters: they will all
+              be produced even when `-Wreturn`, `-Wshort-desc`, and/or
+              `-Wcontents-before-sections` are used.
+
+              Allowing those warnings to be filtered is complex, because it
+              would require storing them in a buffer and then filtering them
+              during the output step of the code, depending on the
+              selected symbols.
+        """
+        if self.entry and self.entry not in self.entries:
+            for log_msg in self.entry.warnings:
+                self.config.warning(log_msg)
+
     def reset_state(self, ln):
         """
         Ancillary routine to create a new entry. It initializes all
         variables used by the state machine.
         """
 
-        #
-        # Flush the warnings out before we proceed further
-        #
-        if self.entry and self.entry not in self.entries:
-            for log_msg in self.entry.warnings:
-                self.config.log.warning(log_msg)
+        self.emit_unused_warnings()
 
         self.entry = KernelEntry(self.config, self.fname, ln)
 
@@ -1741,6 +1760,8 @@ class KernelDoc:
                         # Hand this line to the appropriate state handler
                         self.state_actions[self.state](self, ln, line)
 
+            self.emit_unused_warnings()
+
         except OSError:
             self.config.log.error(f"Error: Cannot open file {self.fname}")
 
-- 
2.52.0


