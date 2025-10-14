Return-Path: <linux-kbuild+bounces-9116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C590BD7806
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 07:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02F0340438A
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 05:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558D73054FB;
	Tue, 14 Oct 2025 05:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BsXh9Tkb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3zaGBp6V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39BE3054D0;
	Tue, 14 Oct 2025 05:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760421355; cv=none; b=WJs8uWYhxWzM+eGOaovdtJ3lURie/hjD2Hn/B+jopVhXb1YUV5qoDBZQBQbW8mO2jmwwTP9l1xkwE8oVzMmXqBwyps8669eVr+EMpcwsjSbAl38Ea3Q7t4la7CF8vduqcbOuCcAQBVleH1CLevdmESLDyxP74kOaElwRgwlg1uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760421355; c=relaxed/simple;
	bh=hoR2jjOaF3S8iXnoB94AT92D4vYm7OkfmPq4E+/SnfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NYiMEi5JbYg38137HEVgbcOZhu8SgDo1sjDLQtrvEpeOQBczXm2r5kWQsON5lnXzjjkt37X38I/sRhu8kXiR+ZMkr5oUGjMAzZQR2FnJv58ft1RpARN8RSmcWqlHcIjXY2r5etuNvTWNiPPr4J7rXH6iCTN1WUIVGIerrL4nud0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BsXh9Tkb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3zaGBp6V; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760421352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L5slOWCojrdN2NgvTuR7SqkB/n+qNChHFbvrfsO6TvE=;
	b=BsXh9TkbTotGSw9QPLSBVHjVrYuyhMXUs1bde2BRB1PSfsunUqjc0cSn1tNcdy9jsMJzj2
	fx2/rJar8cXdYSqKuvQQcU5o/yJx3JAxJehi+flYHOm4LFS5KQ5I/ZtkCjE2OWpY9jL7hJ
	pAWIe6QjPECu8l/jIhjVIPkGW/fXazcFoKKE/5kTXgW5foKm3HZfQtEcWj8/jOS+NICRFo
	4gIhlKdprptczZxFW+M8klSJMvwpfzcdCUijozCbWxlMOMxJznCkzci/gSZEOy27qGS1dB
	PmMY+K/dpTtZEXoSaJE/K8yamz3wFdVKj6IRg2GMAHxmzEt9cYCth9R1cHmkQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760421352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L5slOWCojrdN2NgvTuR7SqkB/n+qNChHFbvrfsO6TvE=;
	b=3zaGBp6Vpc3OYMLvBK4RR70d92MLiBhXtbAg5WDrbhcw7EYp/cKgwOxSvhdGTODRjcjfhJ
	mIPztmtfyDvr03Bg==
Date: Tue, 14 Oct 2025 07:55:32 +0200
Subject: [PATCH] kbuild: uapi: reuse KBUILD_USERCFLAGS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-uapi-usercflags-v1-1-c162f9059c47@linutronix.de>
X-B4-Tracking: v=1; b=H4sIANPl7WgC/x3MQQqEMAxA0atI1gbaiDh4FXGRauIERaWlIoh3n
 zLLv3j/gSTRJEFfPRDlsmTHXsLXFUxf3hdBm0sDOWq98w2uIds2Y+bTMBc86cZLQlYNRMTqPh0
 UfEZRu//jYXzfH26Ql/toAAAA
X-Change-ID: 20251013-kbuild-uapi-usercflags-affb222af087
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760421350; l=1661;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hoR2jjOaF3S8iXnoB94AT92D4vYm7OkfmPq4E+/SnfA=;
 b=zGx10ekYJhYywPMh5GcjBXrr4HD4P83p+2CFbvPWa2E5TayIuX8hb0HPr37bA//8N/30essd/
 icPw1SRWwCoA+u77fe0Gd/1CXmxD3QFfJPNjpus9aQdxi9c3++SF+sg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The toplevel Makefile already provides the compiler flags necessary to
build userspace applications for the target.

Make use of them instead of duplicating the logic.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 usr/include/Makefile | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 61a7dd4fc05f004d785c64c0019ad846c84719d5..d8a508042fed315401ed689e0839af249c4b31c8 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -6,16 +6,9 @@
 #
 # -std=c90 (equivalent to -ansi) catches the violation of those.
 # We cannot go as far as adding -Wpedantic since it emits too many warnings.
-UAPI_CFLAGS := -std=c90 -Wall -Werror=implicit-function-declaration
+UAPI_CFLAGS := -std=c90 -Werror=implicit-function-declaration
 
-# In theory, we do not care -m32 or -m64 for header compile tests.
-# It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64.
-UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
-
-# USERCFLAGS might contain sysroot location for CC.
-UAPI_CFLAGS += $(USERCFLAGS)
-
-override c_flags = $(UAPI_CFLAGS) -Wp,-MMD,$(depfile) -I $(obj) -I $(srctree)/usr/dummy-include
+override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile) -I $(obj) -I $(srctree)/usr/dummy-include
 
 # The following are excluded for now because they fail to build.
 #

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-kbuild-uapi-usercflags-affb222af087

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


