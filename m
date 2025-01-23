Return-Path: <linux-kbuild+bounces-5549-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97621A19D38
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jan 2025 04:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BBE016C387
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jan 2025 03:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A693B2BB;
	Thu, 23 Jan 2025 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BNCDlgWR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22A335280
	for <linux-kbuild@vger.kernel.org>; Thu, 23 Jan 2025 03:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737602268; cv=none; b=j/eH9LPfPxIfyvgDbWStNR2XOf5Buh3Zj1jefwR6rnzQDASYS35SJ/Cg80VgJfhKnBNV1RaGNV0I+KHKiWEV8UlfXNImoGkzsWzA0dy8K+wwMQ0BLo4HddKMz6Y7kbAWiMEOajjbASz9xghDar5utexlhvd8CjLiNiNYqB8jms8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737602268; c=relaxed/simple;
	bh=LoZ24LDHCMkiRgQF7grVTqyM789vNtixibi4AfHB3ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e2xxrhWFMv/Rh9WcEeOXwg5mmJj+2JdcBs0jQLSwqNSv+dONhsw83tvkrny/NzQgGm8EOyvGQfBTYL3bSsY6www2N9NlNEtiRLYWxaThR/CNY+18CEYv6iOzRioef5ZyAd3od4imKZLbAjBa1MWMn9HHXoD6zkDVunNnZM690pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BNCDlgWR; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2161eb95317so6120845ad.1
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 19:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737602265; x=1738207065; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb1dQ0E63aBFcwViVcuk+RodzWEGNhIOogsy9MiuvXQ=;
        b=BNCDlgWRKmtYDl1U6RtWgxAUTlncUH0pxqcCseBILxBbDHF8pavrFNdQG0U5JNRUOx
         3LQkEwRPrynDQH2x33ouL/m5MR8c5DFirY8C326wiWCCYGsC3Of96RIv5f+DLlSuvmSR
         bSj8sUdM4JVx6lsXxU7HDQsjdB3+KxE48/ogqhdxixHOVlPgm6MZOCIRO1VHpnwz3Cq1
         3vQDR3zbcbOE3YrOPYNHHcqqj0Iu+p82jj7wH57mTVnvkbSUIqcG3SzMe+uE2VCrWDme
         zP1khN/Yblc9ZpaqwHtsqSrQ3CDyzjCLAQU+t9ek7Kl9YGJC+gEHhk7AEJyrbWZst9NQ
         DVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737602265; x=1738207065;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yb1dQ0E63aBFcwViVcuk+RodzWEGNhIOogsy9MiuvXQ=;
        b=c3EDXLPuKDaqGn8RFnU/qv/Oi91XAehkI6G7TJHTPsATiFKWf/ZRzvfDDLSMdyPBQi
         gzjI9MPpJhaZlE6s8H8zVK94w0dyHXX2hwxjKpu0s3PHs6Ybr38EcQo2MSan4Fkf4q7U
         WREyW+LKpetAHeeIpFcOhGJPv9HCNf/roLcpajfd3rwTacsE7Ezanuyzl1zV+l7oWaq2
         gg2NVc2cryFovtKOp0GI8b15geD0kQO2GGPVTzOP5IFwPEV+UDLeKIJosLa+oXUT7oG1
         cW8Hj5rXF9yVIzHNn59gP5JENNWSNVYCqL0AxrdYj4VSXnBvoJrR3foTkKXN8O9wDWzF
         5y3g==
X-Gm-Message-State: AOJu0YwJx70rvetitIoOT3Ph/E/PXO8v0X7JXzt4/HgdLWyGqS8VIyml
	iwJkhvA6oPdwpQrCt310orgA1SJpHf3ZdQoXtDUEktXBtB9xNhbUzrzy8XeOcGw=
X-Gm-Gg: ASbGncvlHYz6rbJfw9/qWzGNkSy+NFoo0rBAGkWI5mRXrodOmUSsRRA89PXXsRFFARx
	A0BsR1a2Nu5RMW9PuWO9SOrzKF3h6aLj86NirKZB89qPTSZPJWiVdoxOiSNmaecGZA9b29UlqHE
	YbY/t/Ca0YmuDbz3BZFlk8mSyUKYGVgWsrDJ12IAzA3RU5a/688r38FIiX0ocwf1i7LutAhaa+t
	Jy6JAfkBSeAe8rqMQc41wD1SfT3A885cjcHGD/AH1sVnOSVNDf7/q4R74wT2wRVZ4BgZSSTN/bb
	cXvCsYYVoIkqj3sjVHjW
X-Google-Smtp-Source: AGHT+IFU8PrWDhmlR2RUaT4va/OltWFBDSc2Qwfem7VSPUU1EII1LshhjGhI4Z+xmhDWHCjoruyIEw==
X-Received: by 2002:a17:903:2286:b0:21b:b3c9:3908 with SMTP id d9443c01a7336-21c35577cb7mr388491215ad.34.1737602264864;
        Wed, 22 Jan 2025 19:17:44 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d4027fcsm102659955ad.214.2025.01.22.19.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 19:17:43 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Jan 2025 19:17:26 -0800
Subject: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAMW0kWcC/x3MQQqAIBBA0avIrBPGiYq6SkRYTjUbC60IwrsnL
 d/i/xciB+EInXoh8C1Rdp9hCgXzZv3KWlw2EFKFhkjHM8gxXt4zO3Z6tlNDbWkQqxpydARe5Pm
 H/ZDSBx/D79dgAAAA
X-Change-ID: 20250122-strip_unneeded-cab729310056
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=LoZ24LDHCMkiRgQF7grVTqyM789vNtixibi4AfHB3ig=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rELRd6OlwDL75cs6XcO+HgyYYdr2Pmn9B71Lp0teTXZ
 d45n33fd5SyMIhxMciKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjCRwIWMDPdz5m4O8Wv5VDVl
 Z0nHitsH2X4wZx6c8YpB3++ar4rqtA8Mf3g5l024NiGA6dLd5e7Mi0/o/7f82RsYOb3jgvFBxvg
 0YR4A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

On riscv, kernel modules end up with a significant number of local
symbols. This becomes apparent when compiling modules with debug symbols
enabled. Using amdgpu.ko as an example of a large module, on riscv the
size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
(--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
(--strip-debug), and 20MB (--strip-unneeded).

Use --strip-unneeded instead of --strip-debug to strip modules so
decrease the size of the resulting modules. This is particularly
relevant for riscv, but also marginally aids other architectures.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 scripts/Makefile.modinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index f97c9926ed31b2b14601ff7773a2ea48b225628b..c22f35f6b9db3cac3923b9e787b219f752570642 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -80,7 +80,7 @@ quiet_cmd_install = INSTALL $@
 ifdef INSTALL_MOD_STRIP
 
 ifeq ($(INSTALL_MOD_STRIP),1)
-strip-option := --strip-debug
+strip-option := --strip-unneeded
 else
 strip-option := $(INSTALL_MOD_STRIP)
 endif

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250122-strip_unneeded-cab729310056
-- 
- Charlie


