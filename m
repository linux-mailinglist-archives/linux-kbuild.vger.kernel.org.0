Return-Path: <linux-kbuild+bounces-9084-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB8ABCE941
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 23:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 149B8189E534
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 21:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC1B2F25EC;
	Fri, 10 Oct 2025 21:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oCHTud3U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76440302758
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 21:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130110; cv=none; b=E+8TS7VEZEzfmB8F20+2uoCI8D8PAxx74sqhrSIdl4irtWd8wK4SyFGayaaECl6IQ2rh1sUY9+s+2ouwNk71qt9R0iBJTdfJtUx0BupJxWLtVK0BAu2GtqfQzWVuTWjp14FNE/qxv+yBmzYbk7fDXtRXKBN1Lyyfgm0Fu5ldzUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130110; c=relaxed/simple;
	bh=A36UU5cjawCFn9zg3EVWTgnlfdvC+WA6eTuKIyjz598=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IZd5go9Rjld/TPB7jjT0K3K6owGhdlZW0dGRl+9XvbOej2YfNPlitXAEu7H7Vene3DvdJD3AdYXIl7wHprxyPh/AS9NjYZDVxRt8g4gGZkR5zHUhPM5htbC8pujfgsZe/TYHtxZJdHjKLMfbicFouvsqvzI0ibCY78CGQgL/C+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oCHTud3U; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-77f64c5cf62so3463599b3a.2
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 14:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760130108; x=1760734908; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4/DIS19FEQXbD2as28eCi3gphWED48d1Ubr/xwVaHs=;
        b=oCHTud3UJC9JdHSZOUUF5YHg9yq5j75dtPM7OB4SQmSpF8RLy11H+GOCCxMVU9I1hM
         pNECqfxrq4UeMv3MljkefS5azAtUiv5CXpfeDkw5gIFjT9oCiFwdMJK4VykApFV2uN+X
         kiGpGeon0y2O7uNh/ALiYZ8KprUts5of0Mz/zA5QPpt9kJhIBA1H1g/PlmRAnL+X6lDw
         i70FPcAJZE5LLG/tMKI9Tik4Lr+BbDvCV5k4crifRPeBhN3tI2pO3iUye12dDWM95Qn8
         kqr5qSKNdZajUxfaj5jNT1lK1mf9//9J8GsAd4c51+vMcL9lTlb701qMSDqTg4TT7f3x
         p4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760130108; x=1760734908;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4/DIS19FEQXbD2as28eCi3gphWED48d1Ubr/xwVaHs=;
        b=VTaabMARfg4I3nP+tOnK9dq0Jdv3xlO0XmouwhoUMh+fB/GXdvnQjhAG+V4bc9+Tdp
         Ay8hOJzVxRZVDaNs21dqW1yk1czk8Qbk/lJAH3GV5RxvJmSGaQGbUlqrPcP80zwWzPGH
         gex6pO1VO2iV3ogyGqOxPoQ++ayofdF5WAh3UNMHltXI/mGavFma9qrLs4/rQFbuNJrz
         78NbthtdcHKKFf4qFf9bQJjDVGkzhGURK7bi34KrdWJqg9AKp2W0LG48Cd/KfC6mcfwb
         heo8g7ZF5RwfOxYDPKDLFCB+bG8LSvCcqep2yqOPSVDfUQhc1O4jfHvlRMjW1YkIIy5P
         eDCQ==
X-Gm-Message-State: AOJu0YyDtG0y1SCk8WO7+PnDKJxcwEjEfcgezEJkh3xRqNKWIsZ5H/Pn
	yRFAYdPCKyn8lOxu8RgFs/m/D5AfkjTO8sK2bbg+bJ+Dx2w1q9JcRr0ICoV4E/VzPB7GuA==
X-Google-Smtp-Source: AGHT+IEtMBLg0Ov+r6OYaa4ihcCMD48GJCeyOSHqGaacD/e1SfaXFjuFV7CxscQBzB2FYKZBslyQNH4=
X-Received: from pge21.prod.google.com ([2002:a05:6a02:2d15:b0:b55:a4b:fe47])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3386:b0:251:43f5:cad4
 with SMTP id adf61e73a8af0-32da80bb8f5mr17111428637.10.1760130107536; Fri, 10
 Oct 2025 14:01:47 -0700 (PDT)
Date: Fri, 10 Oct 2025 21:01:34 +0000
In-Reply-To: <20251010210134.2066321-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251010210134.2066321-1-xur@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010210134.2066321-4-xur@google.com>
Subject: [PATCH 4/4] kbuild: Add config to assert profile accuracy for
 aggressive optimization
From: xur@google.com
To: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Han Shen <shenhan@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, Yabin Cui <yabinc@google.com>, 
	Sriraman Tallam <tmsriram@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

Adds a build config to AutoFDO to assert that the generated profile
accurately represents the intended workload. This enables Clang to
perform more aggressive optimizations.

Signed-off-by: Rong Xu <xur@google.com>
---
 arch/Kconfig             | 11 +++++++++++
 scripts/Makefile.autofdo |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index ebe08b9186adc..6fdc676cb0fe4 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -886,6 +886,17 @@ config AUTOFDO_CLANG
 
 	  If unsure, say N.
 
+config AUTOFDO_PROFILE_ACCURATE
+	bool "Assert AutoFDO profile is accurate (EXPERIMENTAL)"
+	depends on AUTOFDO_CLANG
+	help
+	  This option asserts that the AutoFDO profile (specified
+	  in CLANG_AUTOFDO_PROFILE) is collected from a representative
+	  workload, allowing the Clang compiler to perform more
+	  aggressive optimizations.
+
+	  If unsure, say N.
+
 config ARCH_SUPPORTS_PROPELLER_CLANG
 	bool
 
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 5bcfcef273745..36abeae2accdc 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -11,6 +11,9 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+ifdef CONFIG_AUTOFDO_PROFILE_ACCURATE
+  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-accurate
+endif
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
-- 
2.51.0.740.g6adb054d12-goog


