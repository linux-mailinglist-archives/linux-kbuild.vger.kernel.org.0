Return-Path: <linux-kbuild+bounces-5765-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF366A36E6F
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 14:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41CDC1893C07
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 13:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D551ACECB;
	Sat, 15 Feb 2025 13:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVGl/8BU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA5E1A08B8
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739625466; cv=none; b=nJhu9iet+u9xlwKOf2Tw2yzEzmOcn4HXVtADH+0qJdEkk402KLtjHekb5FLDze95xwNkxamlmLp8Uom5ZEicSn7Cv3RV2KV8hSoSYICmG8ow8KWltsRQISZgR4UY3kyYvH3+JtasoySlvJqnyrR4kXvUFq9VrXTffBxII9EtG4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739625466; c=relaxed/simple;
	bh=DKMOzS871WD9BJFS19NydgkrDfk1vu7SOxWaxOYXzfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lugYWn9c2bRGiicX0UVTlzI2ZFS0zNWPFZw6gaR8m5XGn1zfis+GKosIN3lW6j+e2t/q6oAdJTSAhVilhTyht3MW5/Pi80yyHYJywxDaklAABVViamApTZniHTdJFzD5VwF2+Y/roVQxKkP+g808JvqdapsZAhYgrFvIp67gen4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LVGl/8BU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38da6a1a20bso379456f8f.1
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 05:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739625463; x=1740230263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGXmB4cgRj7i46AipgnBwCCKNXQmiHxqqe+OiiW6adI=;
        b=LVGl/8BUxnK3QhuGWpelbYdTp40jtgGS6U3Vsm8rGKV5MdZMcffnRsu3ukt5DixLWa
         qE+c2CxKez7Kk1OtydeH6u4TB917XXFBy77m8RZqfxCTuhJzON6wv+tqMGeIjx2nu+sa
         uTiq7X3vhUvWnlk+I6WGERCSdVgVFraRE+15PLNl9Jf9kipirnA6VplGGAyJiRQUYU62
         cR0ZNnlF2cpdOuGGrX0nY8kdELRKymLw0x+RkalXJqCWBgc6BZL7BMlRTE4CJrSItehn
         hJsVgya5PE3QyAc2x173F1dcFBMEmKn95XaI96a+AwnBkV3ImwRgXnkf5IZtj5vIEfZa
         iOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739625463; x=1740230263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGXmB4cgRj7i46AipgnBwCCKNXQmiHxqqe+OiiW6adI=;
        b=emRA7sVUtB4NzXeAs5H83xcfHOdQEILmErGE3hSjFUYgAsYjDqW3gddvKzVL/ylqFb
         0htPg3QR1hLWHk00UsqtGZyRzQw4p35tev8N4Ye+k3h7U8+dgL3HibexAT57kFudChIC
         6JzUhL7vsTCCWMG2P6t/V+njqPzCfZT/Ds7XK+3t6b/w/W0tpJZ5kuLs+Zh3T5nUb1x1
         p9xNk6xOVm6kLYx15sPbE+ONRv/0qYimYRXRD3QzFpADGWWc4m7Ma8uyd1ihvHBagUIJ
         0Av37eyZFttRUCz08Ian3MgiGGVchxFG9KkFAGWmlTRx7zEAW3o4+4R4ZuJ9KhBX0tgp
         0WNg==
X-Forwarded-Encrypted: i=1; AJvYcCU1+KPfM+iRItPfKb0svHgWe+gAUfGmVr3W/6s90Uv8A7hjXWJWW7m1wkaIZebpl7gAG3m+5Oo3llPYodM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpui02MOPU5RA2grQEKDeRYLH44wPPNILtDzVf1CJN5hFlo9Xh
	yglV7JXRhP/BgPCHGWPQYI/FNqgWkk1gg0gMK51v+utQm8JgyHMaBZx+t2sjc18=
X-Gm-Gg: ASbGncvXNjqgQZIcKR8YOTRkgm9A08WVRSMZJ79sTcJblyBR7opOLO2pbGdpfB3wz/Q
	7Vyi820A2+peXrOUumFIdnBGLtBMnBq75FFz/tYn2lLRx3VE4IWEi+UtNe0YIY6NGEvNKUlCg96
	D3nNj/YUVYFT6UY05m4ZHydtxCo31otkSrz7f1v6/q5oxqq1h6hbO8pIGn+ppQK+BrpcK/r91jn
	Br9mvVbRDXWRL9o8x++2yCXM88b4wHDCqMrLU8ZdPCk5PZOEjQWb/IuGxOQSEGgFnX4SkSzLr8Z
	HbtrN/9C1jMOch6jrPmUN2RkAKQpPQ==
X-Google-Smtp-Source: AGHT+IH7z2R9nNG93i2MZaB5NKPEWF7rlrwQLWbs/edrhlggOHxufJUOIdYz/d9/Z3xKUdvgy+nFkg==
X-Received: by 2002:a5d:6c66:0:b0:38a:888c:6785 with SMTP id ffacd0b85a97d-38f33f29377mr1138906f8f.6.1739625462851;
        Sat, 15 Feb 2025 05:17:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5eeesm7284499f8f.63.2025.02.15.05.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:17:42 -0800 (PST)
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
Subject: [PATCH v2] docs: kconfig: Mention IS_REACHABLE as way for optional dependency
Date: Sat, 15 Feb 2025 14:17:39 +0100
Message-ID: <20250215131739.220629-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several drivers express optional Kconfig dependency with FOO || !FOO,
but for many choices this is neither suitable (lack of stubs for !FOO
like in HWMON) nor really needed and driver can be built in even if FOO
is the module.  This is achieved with IS_REACHABLE, so move earlier
section from "imply" chapter to "Optional dependencies" and grow the
description.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Replace FOO->BAR
2. Instead of referencing earlier "imply", move the code here and add
   more text (Masahiro)
---
 Documentation/kbuild/kconfig-language.rst | 35 ++++++++++++++---------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 2619fdf56e68..9a8dff58b3af 100644
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
 
@@ -580,15 +570,32 @@ Some drivers are able to optionally use a feature from another module
 or build cleanly with that module disabled, but cause a link failure
 when trying to use that loadable module from a built-in driver.
 
-The most common way to express this optional dependency in Kconfig logic
-uses the slightly counterintuitive::
+There are two ways to express this optional dependency:
 
-  config FOO
+1. If pre-processor can discard entire optional code or module BAR does not
+   provide !BAR stubs then call can be guarded with IS_REACHABLE()::
+
+	foo_init()
+	{
+		if (IS_REACHABLE(CONFIG_BAR))
+			bar_register(&foo);
+		...
+	}
+
+   Drawback: this might lead to run-time debugging, when looking why
+   bar_register() was not called.
+
+2. Otherwise (and module BAR must provide all !BAR stubs) use the slightly
+   counterintuitive Kconfig syntax::
+
+     config FOO
 	tristate "Support for foo hardware"
 	depends on BAR || !BAR
 
 This means that there is either a dependency on BAR that disallows
-the combination of FOO=y with BAR=m, or BAR is completely disabled.
+the combination of FOO=y with BAR=m, or BAR is completely disabled.  Unlike
+IS_REACHABLE(), this option favors configuration-time debugging.
+
 For a more formalized approach if there are multiple drivers that have
 the same dependency, a helper symbol can be used, like::
 
-- 
2.43.0


