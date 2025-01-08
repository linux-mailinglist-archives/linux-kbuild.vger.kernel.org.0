Return-Path: <linux-kbuild+bounces-5398-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1C7A05BBC
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 13:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36DE33A5D1D
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 12:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552CD1F9F7D;
	Wed,  8 Jan 2025 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lXv3FJ6n";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J1guJe8x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC27D1F8AD3;
	Wed,  8 Jan 2025 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339688; cv=none; b=gCII4AbQaTgK4d5+xEOtSe9ai1bG398Wi1OjDAr3Tsu68MW7uuboVf3PrG1HQSyQtSED+u5x5E3qxBVMIRynv7aqcH/l5bEq0oKBNxvz0QHAHTHE6WyrcQb8j2cZ3faIF2UtGSyBhf+UT/YOuE1he1wPRAd9EmF5NmY9AUOnm9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339688; c=relaxed/simple;
	bh=mfRXr8X6hivXNLW5/+JavOgTmHO5jVioJNhZARGBpyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIbQ7j/1ySi8E8YgTG7f4JuiWB9tL/2e82Vtknij74gYTPXPvcNLjPH+dcwVFYDad8LXQJ8NxQq8AvRD01O3fuIlfx/wHzzOwD1vmmIKRjdda2UViq2Ynw/bghpI3+serzOhKrOx8P3hM27z5mADSUEaY70OpuIM2ejilXOHIEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lXv3FJ6n; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J1guJe8x; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736339685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/p4ELp2/ZQmNrcsyqgwATapI6kF52rb6hc0Ubjr/Ss=;
	b=lXv3FJ6nUJRL/cAQwYGVEaHJcAhLhkLOm5mfKM7+qInIpVWMdQtiCuERDssFvUfO2DXNbw
	ILC6nQVgjTY6y9k9PhFnMIsd+1JsHkwSS+SdPv2M5TnDNiEWyBgPtxj4vM4/lvb1WLbz4y
	c0bjJEzCNv/wWHuirA4Idy1u2Lp1DRqZMul/G/VyQ3RRwfANTFFvSNoRYRA77r23Gy6f/q
	sK0skwHOpvOeQc8JwGPCONWHb6JMscWwxREE+MCWacJ2xYAtMPr4mBIbvuuUanUo19hZ8f
	ULq3G0hgPu45i3M1seh3IOFifhC4g/CsNx6/G1nUE8lqvDTf2N7J+Xg4IDnlJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736339685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/p4ELp2/ZQmNrcsyqgwATapI6kF52rb6hc0Ubjr/Ss=;
	b=J1guJe8xouSvY/ETMM6e2El5iuQ0BV2qygAi6IVyz/cguP8MuyWd8ANRLOZr2u3N9F3wbI
	Uoi2GbUiswPpgaCg==
Date: Wed, 08 Jan 2025 13:34:29 +0100
Subject: [PATCH 2/2] diffconfig: add verification mode
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250108-diffconfig-validate-v1-2-4b3d8ee489da@linutronix.de>
References: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de>
In-Reply-To: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736339682; l=2426;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mfRXr8X6hivXNLW5/+JavOgTmHO5jVioJNhZARGBpyQ=;
 b=b8mG9u6Xs1Xky0fkxtSVpI5EzRWpUCk3B3hvtSdwkEP4J2R/tbhguCiiEyb6gG/lqIIEEpHF2
 ZQvHYv8YRsBAwUyOchueNmeRvrB+/VrKEhD+uV4gF9nVL8D8tROiwuJ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

When creating kconfig files from defconfig files or snippets some items
from the reference config may be silently omitted when dependency
constraints are not met.
Manual validation is necessary to make sure that the expected items are
present in the new configuration. As the constraints can change over
time, this validation has to be repeated.
Extend the diffconfig script with a validation mode that can be used to
perform those validation easily and in an automated manner.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/diffconfig | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/scripts/diffconfig b/scripts/diffconfig
index 43f0f3d273ae7178086f03038780ba103fd9970b..95cb0282f6db2873ef32804d361ef6db8a7bc8ce 100755
--- a/scripts/diffconfig
+++ b/scripts/diffconfig
@@ -24,6 +24,10 @@ Changed items show the old and new values on a single line.
 If -m is specified, then output will be in "merge" style, which has the
 changed and new values in kernel config option format.
 
+If -v is specified, then diffconfig will validate that config2 is a superset of
+of config1. Only items from config1 not in config2 are printed.
+If items are missing from config2 diffconfig will exit with code 2.
+
 If no config files are specified, .config and .config.old are used.
 
 Example usage:
@@ -77,6 +81,11 @@ def show_diff():
         merge_style = 1
         sys.argv.remove("-m")
 
+    validate = 0
+    if "-v" in sys.argv:
+        validate = 1
+        sys.argv.remove("-v")
+
     argc = len(sys.argv)
     if not (argc==1 or argc == 3):
         print("Error: incorrect number of arguments or unrecognized option")
@@ -123,11 +132,15 @@ def show_diff():
         print_config("->", config, a[config], b[config])
         del b[config]
 
-    # now print items in b but not in a
-    # (items from b that were in a were removed above)
-    new = sorted(b.keys())
-    for config in new:
-        print_config("+", config, None, b[config])
+    if not validate:
+        # now print items in b but not in a
+        # (items from b that were in a were removed above)
+        new = sorted(b.keys())
+        for config in new:
+            print_config("+", config, None, b[config])
+
+    if validate and (old or changed):
+        sys.exit(2)
 
 def main():
     try:

-- 
2.47.1


