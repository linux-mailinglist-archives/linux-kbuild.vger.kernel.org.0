Return-Path: <linux-kbuild+bounces-7168-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B39ABD981
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 15:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9797175096
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 13:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0611A2387;
	Tue, 20 May 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeB9wu5v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E380F8BEC;
	Tue, 20 May 2025 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748003; cv=none; b=uW149tapRmZTFRcJWkmV/0RJyRW5J3hEJqD0qwjlMGRuJ+PiwQTLvXMzdbSGBD2KbFL0+I1VDtBa66jquED9PX+M8Xxzeixp/rlHZmccbqqr6JjXbOANmxk2HRBErkAC9aAMYHLrfOGUXhHw2ck9gjIN1Lk+Esp7xr8QNeIMGFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748003; c=relaxed/simple;
	bh=hcqt6eZBGihUCfmwzVKOQS5DiA0cgTfveFjb6FGh0AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+hjRTBpy03TAT8x/N8vwKBVbWee6NwAR35gtcMNaDabCvuml5vbgOeSad5mEX2VvlOKTWHbG1ZJnGH4qexLiAx1UJ5aErl83qn/YCdC2bkJexKu0xn1LxDs8PZQEw1MMRMBwRkRR5yfSlIvwwclZzYsJ6x/T/PYnZt7OKQbr5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeB9wu5v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE631C4CEEF;
	Tue, 20 May 2025 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747748002;
	bh=hcqt6eZBGihUCfmwzVKOQS5DiA0cgTfveFjb6FGh0AA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aeB9wu5v9brlBWlXZj5OgJdERjIs97QsvnMwDUCy7ZAE6mbkLjP8/1CuwfgwIPm6b
	 NYib1TSTuNnM0nzEeaOhi9g6POrRmuCm7IiV+PJqNDMcqcidKa8rdS//BvEm89BHi5
	 YSnBQ+xFMfPNbLvH3fHKC+Go2GYn2R3et8Za+Juw/jlBVXwE8/M+OZ6mVXbSjO64hM
	 sWsqPPNcFx/CfRF+EILwqSGcLge0dIkc6R6lPEuxKkHZD2ZdHFR9lct6mEhwrwAArh
	 qRUryuH5UDKN9prDXyBRaS3OJ2eLGNzlgQhlmcNPw8rBs16l1P6oRSLr3Z0MxaZEE6
	 iaybZW0q8APNw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1uHN5r-00000006n8R-1We9;
	Tue, 20 May 2025 15:33:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	Kees Cook <kees@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] docs: kerneldoc.py: add try/except blocks for kernel-doc class errors
Date: Tue, 20 May 2025 15:33:08 +0200
Message-ID: <064bac2f462c13f56154891d8f3fb788db94f325.1747747695.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747747695.git.mchehab+huawei@kernel.org>
References: <cover.1747747695.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Replicate the same behavior as what's done with kernel-doc.pl:
continue building docs even when there are exceptions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kerneldoc.py | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 314479718a01..4de667d4d95b 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -278,14 +278,27 @@ class KernelDocDirective(Directive):
 
         node = nodes.section()
 
-        kfiles.parse(**self.parse_args)
-        filenames = self.parse_args["file_list"]
+        try:
+            kfiles.parse(**self.parse_args)
+            filenames = self.parse_args["file_list"]
+            msgs = kfiles.msg(**self.msg_args, filenames=filenames)
 
-        for filename, out in kfiles.msg(**self.msg_args, filenames=filenames):
+        except Exception as e:  # pylint: disable=W0703
+            logger.warning("kernel-doc '%s' processing failed with: %s" %
+                           (cmd_str(cmd), str(e)))
+
+        for filename, out in msgs:
             if self.verbose >= 1:
                 print(cmd_str(cmd))
 
-            ret = self.parse_msg(filename, node, out, cmd)
+            try:
+                ret = self.parse_msg(filename, node, out, cmd)
+
+            except Exception as e:  # pylint: disable=W0703
+                logger.warning("kernel-doc '%s' processing failed with: %s" %
+                               (cmd_str(cmd), str(e)))
+                return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
+
             if ret:
                 return ret
 
-- 
2.49.0


