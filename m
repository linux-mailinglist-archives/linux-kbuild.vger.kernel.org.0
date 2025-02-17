Return-Path: <linux-kbuild+bounces-5794-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5915CA381BF
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 12:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28EEE16EB89
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 11:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805D7218AB9;
	Mon, 17 Feb 2025 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sPFMBWWt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2ED217730
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2025 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739791920; cv=none; b=TOOz9xodNMTRul9mqxJvYa4aKXRyNQ+3E0TMsiYCMlHUnF0HxISoEvIUeDaSZM9O0miWGmFKiqa2ELCe2jBNHJ/rbWtv2ZtpsAFAkOWlTSt0Z4uElU03ji9VX2JJCSnesK4Et3W/OAxpMqk36cyN3SG95gBduRx0Ad/62bpPao8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739791920; c=relaxed/simple;
	bh=+hLWA2hCnKT5kulKutuWGIx2zEUObNyrhqOjKdPI9nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VeOv8NQYzjeDxQLFaIOdwyck/spbNVnC6fzrbhRK9xm7XUjYfMMyVnaKxMNLSb9dTgjUrqWxSgE88YNNJ3RUmV6XZN0Z2QrROjvrT9+lI3acdWwhhLLAg0xjnB0GxQny/6V6JQOVaxBFVvuuqF8vNCgNgB9ZBHhUilN7wCP7tlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sPFMBWWt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso600237a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2025 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739791917; x=1740396717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKimg4pzOrqaPAD9ALPNCd7JMmdFnSaV4akqnAMH+aM=;
        b=sPFMBWWt8A9jgcuPvG4ovrehKfJc/Fn+3Q4YXus57fEYgun1t0bARqoIcFf8d2i/0S
         ocB9QKSy8JXld2eC9BTFlbAhG2BPE5hbXYGFpClB1EscXBesRrF9PB3+OYS9bA4HbkBF
         aUReJKMYYZlrXNp4OLMJSQ7c09L8AA/w03fd/J3Ql7tuTisIuvuSaae20B/unvGLaRI2
         DgWZbyEv5fIHKZ5iNMu3vpuc/B90hqdCE32Z642LcetDEC0NMcgkOae8OpAmrAEEZ6mx
         y5F1KdSr08CGljLMrgwYZLnyG/16irMovSAFpQgq/+43kpD4twTyFmajOhmfTj/Gnbx7
         PITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739791917; x=1740396717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKimg4pzOrqaPAD9ALPNCd7JMmdFnSaV4akqnAMH+aM=;
        b=d41zcPhC6Ug6b0+lODER5ZrWeKj2Lnkr/KvWGd0QuV/TWC5/7JKanFRqgu16eoG10P
         iQo//augsEGr3RQJqC3OMoyhOrfEV9RaLL4LuZmeNUmLSOnJE8WCiNoemqVeubC/RS1g
         sgLvspuhu+I3Ve2/sDonPO+iT69bZHcXOXWKffHZ2pL+UX5ICpqNQmJfaFVm97d/eCtB
         2PhiWDuc2F/EtJoyHT8+7dGcqL5MzvAQTeq/zd7WgsvPcP16X2ynb1IshSP/XgQ1SqAU
         GcJMmzRUPcgMrZ/q3oTsj30+R86SCSy3guXXXB+q+fCOsqjm53sW/5TZ7y/w9YEMYg5t
         K9fg==
X-Forwarded-Encrypted: i=1; AJvYcCWBZUZFHBibeLqpT7+7MEl/hNcYLKDQBpUeetPCq6V0n0Jougrb/nRFfim9uhe9xAkh72ocLYZFMP2WI7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+XBc/e7NvyhsGfRlL1sCu/u3ICOWAigSGzEpv95A1ewVOFwlX
	7JaoIu61iSYTsP0zpVlvUNduJ04PMlHaMcHblTUJlmzx7Numa9gpgIqWgQr3tJ8=
X-Gm-Gg: ASbGncvvs/aT2ER5dhcWgC7ZfPXYZOhn2Hgp9Z55auCCCShvBjAUq1t30jFCM/BTeZP
	b57HXp5Yc6C8V61Q8pv3eWcgR4jmm2cfDBK8I6aaTvmTl3in2q1ibC/s3w7pZfkmPz0Q1b0Jhlr
	gMpzQKyFzNF7rdpAMSfcDH9Uia/Rv/cOfZbMyGHjEf6OvuSMgzfw55+gYcAjmaauMwwsB1XPj3u
	spr0yavcomcCLPm4GJESkx/DlQxSTKF3doahp/sh+OOYQUm5CS3LFl0bLDAUhbd0yaPO0SRUM3W
	2MZ2nukjZXKi/SFKx3hO+z8kfMB8Ag==
X-Google-Smtp-Source: AGHT+IF187xjpbv8MjESEcHWSW3tQgy/oCc4RlywDfwrTREL9mIvbOFSssZRofy6CqOFM+/0HK3Tag==
X-Received: by 2002:a17:907:d8b:b0:ab6:58e4:4fec with SMTP id a640c23a62f3a-abb7093370fmr369717266b.3.1739791916663;
        Mon, 17 Feb 2025 03:31:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb1e1bef3esm554323866b.146.2025.02.17.03.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 03:31:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3] docs: kconfig: Mention IS_REACHABLE as way for optional dependency
Date: Mon, 17 Feb 2025 12:31:53 +0100
Message-ID: <20250217113153.161476-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several drivers express optional Kconfig dependency with FOO || !FOO,
but for many choices this is not suitable: lack of stubs for !FOO
like in HWMON.  Describe the second, less favorable way of optional
dependency with IS_REACHABLE by moving the code from "imply" chapter to
"Optional dependencies".

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Significant rewrite to mark IS_REACHABLE as less favorable.

Changes in v2:
1. Replace FOO->BAR
2. Instead of referencing earlier "imply", move the code here and add
   more text (Masahiro)
---
 Documentation/kbuild/kconfig-language.rst | 29 ++++++++++++++---------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 2619fdf56e68..c8c20a34525e 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -194,16 +194,6 @@ applicable everywhere (see syntax).
   ability to hook into a secondary subsystem while allowing the user to
   configure that subsystem out without also having to unset these drivers.
 
-  Note: If the combination of FOO=y and BAZ=m causes a link error,
-  you can guard the function call with IS_REACHABLE()::
-
-	foo_init()
-	{
-		if (IS_REACHABLE(CONFIG_BAZ))
-			baz_register(&foo);
-		...
-	}
-
   Note: If the feature provided by BAZ is highly desirable for FOO,
   FOO should imply not only BAZ, but also its dependency BAR::
 
@@ -588,7 +578,9 @@ uses the slightly counterintuitive::
 	depends on BAR || !BAR
 
 This means that there is either a dependency on BAR that disallows
-the combination of FOO=y with BAR=m, or BAR is completely disabled.
+the combination of FOO=y with BAR=m, or BAR is completely disabled.  The BAR
+module must provide all the stubs for !BAR case.
+
 For a more formalized approach if there are multiple drivers that have
 the same dependency, a helper symbol can be used, like::
 
@@ -599,6 +591,21 @@ the same dependency, a helper symbol can be used, like::
   config BAR_OPTIONAL
 	def_tristate BAR || !BAR
 
+Much less favorable way to express optional dependency is IS_REACHABLE() within
+the module code, useful for example when the module BAR does not provide
+!BAR stubs::
+
+	foo_init()
+	{
+		if (IS_REACHABLE(CONFIG_BAR))
+			bar_register(&foo);
+		...
+	}
+
+IS_REACHABLE() is generally discouraged, because the code will be silently
+discarded, when CONFIG_BAR=m and this code is built-in.  This is not what users
+usually expect when enabling BAR as module.
+
 Kconfig recursive dependency limitations
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.43.0


