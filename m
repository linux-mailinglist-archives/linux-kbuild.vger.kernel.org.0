Return-Path: <linux-kbuild+bounces-5757-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A6DA36DCA
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 12:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46F3F1895EC1
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 11:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6085D1A83F2;
	Sat, 15 Feb 2025 11:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pfaB/H/9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFB01A5B95
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739619749; cv=none; b=L83sX4WOY43Qrs0c6hxaXD7eZmx36LMNsCmI4oexMWjYS32ZHInG+ufMH80iU65Oaw+L37UzEH+1oU7NH7D19ojcrTG/alGjD0k2sXlWOGdDljHDzxy8TmtB66Fu8fgeVnDrDQ4Ya4Rx4QagP2qHif/lYrR/8Pq9L8ugC3W5rD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739619749; c=relaxed/simple;
	bh=jlEMrtSuczn3fzzoK0xcr40k7TWs77qzuwIsfCAKNZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QWaxkQCvTjnwxkiGBWBbZTRAMFcawc75pt1mGzGEcMWyUOivE+BsnZxdVUZSDZ3/ks5zVe4oNUjRs3QbN8iTCM8mobmUr6hXSIboltiDKsLWWBmO1O4PPjLF54DeW5FBTCNueM8qNCGwODPKJFVOfTg5cpIuz7jP3ElRwuHovjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pfaB/H/9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso385858a12.2
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 03:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739619746; x=1740224546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J/9aiwr25oAJ3edH5d9HAj7m2t+5rjX23Aj4vPngA6s=;
        b=pfaB/H/9WBoSSrCcsGBA5+FGpJFd4TqfOqqacNP//cZ+ITb0gs1XmRhFwj6qqfMWTn
         NGfVpuCBVVZIXEQPqwAd4HaRxRT6Fp75iXVrx3c5oFYxnamaR8FwJtxL7uPHpyrD9MIN
         p5pcCBrRcgRnCj5vkPcogpUteE0NpEivaezFdleHjDZLB7Q+rWsB8QwKKkV1Tj6efoP4
         SNAJ4PayvBPf6bhQokH0fRVFknsMgCyZg2pPLHnXb2f2hmVEp1bNMBHgdnfW2IyJbUQY
         zubGLmLJX9Lu/ZLGIHQ1t+P/cZArHCsNwTOQGaIxgZMCBL1KjvJikSRjqsl8liUOYk1e
         hoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739619746; x=1740224546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/9aiwr25oAJ3edH5d9HAj7m2t+5rjX23Aj4vPngA6s=;
        b=uUW1a55KErIfFlcK7pqYayY0Cd2Q98PPCWuJmVLaIyv3bw6h8U4+8KvrInslWLxHCD
         LKEj81t8pcphvJ6hu0TJGgEC/axN9beSYpkzBaOfQK34Vb0a4oueQY9YzIMtykn51rjS
         0WUTx5EwoTjvv40AcTAQZeE/jh37H2OehSpLyvYGIkm/stlhOyocYn+qRa0OX4CKk6Y7
         7FOlQtD3/Z20UQLwak5/JdR8YU3nX3VnJtVYaX2BiuBVLM2neulEamwjUCasGn0tk4al
         cyxbAvzEgZgu5vO5YRaJgEEAmhmNbDFTHgKV2CxQa6RFmGKNNGRHqibJmnSQSkqdktBz
         /7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUNCq/I3882FqciBsdidxtbgGPVMfeZSlED+jfQvhr3vibZD0dvHrGoFPCIU10XErswhcDCtnmnxulLL+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbhCZjI5r1qYLEsBWAWeEHRbfdsyBKF5SxFYrLRG8bhHd0pVAY
	Xi7RpUbeJLfd3rZpCNLIbp0QQtfX6ZODqaAumkdqfE22aVMEw/NVKG+g059naJQ=
X-Gm-Gg: ASbGncuvzU9paUXH4Lk9Cl1UGMwMm4FQXlTyq8iAkY4RMgPA61XCed/K6inXnX/vK//
	Z5NtsMi73axr6jlDMzeZLl/L2Eois1+ihdDX8h4sycXm+uaYLXxj9/3feDa9Bif7w3y73jfA1QN
	HHc7TYaexf0nZh6pb9y/u600gf8ZuqGDu9E2a7i3V6FhCuK+hTlRbfmARgEOKJQxFclpZwZqVHV
	ip3v6qmoX8q2yo/w4UqNm5IWqGshBNKejRkb4cUaHgrmdNN/t5Cp1L3WLMx01bv6HgCw4U48Cs8
	sjQv2OcPN/8c2G5w1UANYUH3pUu09A==
X-Google-Smtp-Source: AGHT+IHUivwWZ3VEikRDrRYHKU+IYVIYHCuZ3UwvO0EOUSMr15+9iT2JsZ91Gm5M8EVhs19uFDlv4g==
X-Received: by 2002:a17:907:9716:b0:ab3:8bcc:3d97 with SMTP id a640c23a62f3a-abb70ab8c13mr102363266b.5.1739619745715;
        Sat, 15 Feb 2025 03:42:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53231e10sm517697266b.35.2025.02.15.03.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:42:25 -0800 (PST)
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
Subject: [PATCH] docs: kconfig: Mention IS_REACHABLE as way for optional dependency
Date: Sat, 15 Feb 2025 12:42:23 +0100
Message-ID: <20250215114223.140688-1-krzysztof.kozlowski@linaro.org>
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
is the module.  This is achieved with IS_REACHABLE, so provide cross
reference to it.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/kbuild/kconfig-language.rst | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 2619fdf56e68..66248294a552 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -194,6 +194,8 @@ applicable everywhere (see syntax).
   ability to hook into a secondary subsystem while allowing the user to
   configure that subsystem out without also having to unset these drivers.
 
+.. _is_reachable:
+
   Note: If the combination of FOO=y and BAZ=m causes a link error,
   you can guard the function call with IS_REACHABLE()::
 
@@ -580,10 +582,15 @@ Some drivers are able to optionally use a feature from another module
 or build cleanly with that module disabled, but cause a link failure
 when trying to use that loadable module from a built-in driver.
 
-The most common way to express this optional dependency in Kconfig logic
-uses the slightly counterintuitive::
+There are two ways to express this optional dependency:
 
-  config FOO
+1. If pre-processor can discard entire optional code or module FOO does not
+   provide !FOO stubs then in the C code :ref:`IS_REACHABLE<is_reachable>`
+
+2. Otherwise (and module FOO must provide all !FOO stubs) use the slightly
+   counterintuitive Kconfig syntax::
+
+     config FOO
 	tristate "Support for foo hardware"
 	depends on BAR || !BAR
 
-- 
2.43.0


