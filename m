Return-Path: <linux-kbuild+bounces-8144-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C05B114B7
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 01:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDFDB1CE3F0C
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 23:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E49246BA4;
	Thu, 24 Jul 2025 23:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LKj36f9m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D6246781
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400238; cv=none; b=g9OumShhaFzZUNO83pC1r5zUPMUFplZvVUfAJh6kCPEz7JvTlEs/RJ423jpoSoPIj0eRkbFBn+2vziRRkGwb1TwsSyMd47WtGDtq60FEX1EPYv0kmGEn9A+IX0GhFog3NhRiFyCSzqWgMcNYwZ37My5ajv6E7wY5wWr57cMm6TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400238; c=relaxed/simple;
	bh=DtTsCEflgrt1r4FC6hlq3qopTxtenPFkOWKMBZTbVcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sllCRRg2MdDIBDjVfz1EdCUYl69x/uRU0L7NolW90FF2l1TS4iRlg1pYlUhVsdu7bl0TEAD7zgeCpcCL1r9dRvm0Pp5gxDivjQzqLs/44uEHPeFWk7XwE1Y1lTP7AOcEQfXh+Jxqv9NcJCgzo8bvXXqLkPrNk3HEMKkbwq/u0AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=LKj36f9m; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234fcadde3eso20911555ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 16:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400236; x=1754005036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gkm+U+Z8JovOoe8ArAZBSUqCVEx3YFZYKLxHXbXYTzk=;
        b=LKj36f9mG5x4uG8H7VTSIGn2l5DqYTIyLWTNBgN5K2qZimuUo6yeujUlNneqT3xwED
         +hcW74ILu6rGOzfT3VYAmG/0oH/CBjGZoeR9Eu5HKo4aJbCtHzI1pGDlD0JVlkE9/uDT
         TzRdyc+3Wbw62gMeAR4AXRXUrlUPflE4IBlR4WPljxv2PgG8EQ2XKaESLfz9kAroW7Sq
         IP4g+WANALugGLmCAwouFOZPQPyqmhoC3V4cNmJVzTmyYOKtf/MliWhHWxTeFFS955ZP
         74ZEfcGS5rTDssuSw9wjzZOZMWxMetRF98OOxfxEcyIc4cFLrnb25ApW5zflwQyymq3u
         /9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400236; x=1754005036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gkm+U+Z8JovOoe8ArAZBSUqCVEx3YFZYKLxHXbXYTzk=;
        b=hYoHcWi5mOCu2VBaoq/SQ6jY+i4BhW1EvCII4kDJ6oCLkchLBVGerSx68kW4S1JBXZ
         aWHk15mR7lYYkBRHyVFnPYLihCf02PigEKwz6bTHa93PF8Ld8TQGZMxobHCF7cPqDfx9
         pSd2QfoGdUGZmyAJv8OJ5ZyNhVwKS+HVghkFu9WC7tW1oWzNm7wPJIreajT3G/pQIAnw
         aC4QYMn8Kp/W58u1LM5Y7pVkfe7uCt/96eXn1zNvIP2fwm8Qx0/hp5KqZr65HULQilh7
         ARg5iObIaksR3ODSodGDbmCuRDfsxyJScjC4jpOYY4cC6EqmagTquHa6Udk4xY5mHIi9
         cNzA==
X-Forwarded-Encrypted: i=1; AJvYcCUnqZRK6jHKP6mzopoCSgpDYG+h9vR7gqvpzgdfjUg4C/QEZJ2Dd62vYJ4YD/4YBK0ZC7AwRk0MUAn2kkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaiw4z8gpxjGTxABqBpM/zLu3S4b2uFEuv4Tq2JqXH6Bolup2L
	pe4ZSuBCK/rnRjBDef08tUybj3s6YRDjIFEHPyVZQWIca0rf+L2+xCzQYndl5Su1CL4=
X-Gm-Gg: ASbGnctM6koRcPt3DzM96Gfutm8nnWE38D7rdJNZ7Zlfn8rNH/SM+6Pt7GIdOJ0t5iX
	qtKeWFi+pPeBviRPWgEqexkBDnyxmONpvZDWyApiDt8DCpozjvtjaATzR10NPUETuCDcwfJbHAA
	btsrxD3QgDuxTL30GxU0ahJDhDO8F2A3ZLjyyTFnm1MQO/t6h8ClMXeCzNJPOVurrE4ZQJV34/U
	mjq+PpquYhFNh2p2rOLkROot3UKa/VCTWSQZSChK5HjkLHUcPN1yzM+ooeL9xmEof731OtUg6Xk
	wz1QJXPgz+5skmJDxgUbQ7zPX5wjAOa3ZnR2EkCZ4j5F8b5laQiU/WWR2p3zPkNOfJWfph9vvJu
	pjhInODN5SjLHJNwod9AHeKD2dY57pnnK
X-Google-Smtp-Source: AGHT+IH5SBpkVu16UrwUXGB277v+OXuJbFLj21IH8FU8jVfnMFq+cBM3PPB90wB16oPa9iIZanRWnA==
X-Received: by 2002:a17:903:24c:b0:234:9094:3fb1 with SMTP id d9443c01a7336-23f981afcb2mr126281075ad.35.1753400236613;
        Thu, 24 Jul 2025 16:37:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:16 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:58 -0700
Subject: [PATCH 05/11] riscv: enable landing pad enforcement
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Enables landing pad enforcement by invoking a SBI FWFT call.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  1 +
 arch/riscv/kernel/head.S        | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index e4d55126dc3e..e6a9fad86fae 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -536,6 +536,7 @@ void asm_offsets(void)
 	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
 	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
 	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_LANDING_PAD, SBI_FWFT_LANDING_PAD);
 	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
 #endif
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 9c99c5ad6fe8..59af044bf85c 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -185,6 +185,16 @@ secondary_start_sbi:
 1:
 #endif
 	scs_load_current
+
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_LANDING_PAD
+	li a1, 1 /* enable landing pad for supervisor */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall	/* check for error condition and take appropriate action */
+#endif
+
 	call smp_callin
 #endif /* CONFIG_SMP */
 
@@ -359,6 +369,15 @@ SYM_CODE_START(_start_kernel)
 #endif
 	scs_load_current
 
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_LANDING_PAD
+	li a1, 1 /* enable landing pad for supervisor */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall	/* check for error condition and take appropriate action */
+#endif
+
 #ifdef CONFIG_KASAN
 	call kasan_early_init
 #endif

-- 
2.43.0


