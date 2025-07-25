Return-Path: <linux-kbuild+bounces-8170-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB84EB11FD1
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 16:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 617457BA388
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 14:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A6F1F91C7;
	Fri, 25 Jul 2025 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SHsKMy4W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1892B19E99F
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753452629; cv=none; b=TE8zawM6ah0UkHMR/Ck5ReezzlLY2J7DUAjrm0+0Jh8c//uhwy10KSCZ6X6vYCDNCFZeBtEV4qQOCROhHafHRL9oS9CFpEc+6TOBcpU7wx/PRolCPPTw5pY4JDsjFh22j1JJ/BTGEmpsAeAtDmT/QVBjQbuEmgn4YnPAyquZDHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753452629; c=relaxed/simple;
	bh=XXwJERhTFmbWjCdF0fhV0tx9/bF8PCxbGdYEPIf/O3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjTMVAMiX/5J1CZaRZZap6EyMlNN6RjV9OXIONpZB91Nnbjhge31Z3n8kLulBoJsxQspEls42S01V09hVR+x/SqLemgFLfBEu1lTl5bhfT1+By4Z+RAslVOfEu0u8XbWZybJiBSpQCnEx6B0lkEcsNx4qnHekugCP2XpI8TgJPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=SHsKMy4W; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1565047b3a.2
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753452625; x=1754057425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf/mOhm/oVbqNLjepUkvAGKUCLK5QqEVSdfRhcGCSHg=;
        b=SHsKMy4WYL1r4bQ+4ZRJdxoomTxGIAq3YxVM+WeUAfmYwSd3UPYPx1ZNnPAXlRJw1+
         7+YSTZeorZqqEpTYk3kZ9wzWE0tLO29169fOStE1chrqaaNpjr28/zaWTjkAWqLDjSJt
         fd3z1GZENrwiM3iLb2OQhpx+N1GTKXMRRTdoVU2ZOm4+/A19LWiOe7C3iyzlRfhvdrqs
         ZwrHUhmvonlh/fbJJQx03R9U4YJ6aQDGygfQSOHmw26rld/b5eOj5M1T/RTh3R+wQG8P
         1obIwJZloKCNiHdVKG/pGEfRSnrjBjKmV9Ed4Ksgq74a7Tyc8fSx9xU+EYlyQrAmUB+V
         gbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753452625; x=1754057425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf/mOhm/oVbqNLjepUkvAGKUCLK5QqEVSdfRhcGCSHg=;
        b=UNKfAcmfPUP7MAa/uvD1zG6Nev0qGFynDjMGcEFsCLx6S+RrtLqIRHNz9bcjqd/yKf
         V/N1osQUjjcmHRQbsFfb58nOXX/AKlRBavtpxs3TxWbU0+SGvhTmmv+8tC038zwk1k/y
         CyWpjAjm8Ftp/GXpv4g+PRZ60x8Fc3N55Y3SmTo+k1dCKo90TIQWbDKU41lsOeq4URVO
         T1UHSWeJUYTNF1iGOgF2jFwGZ3Yzq3skRnb0cg7O8EfOhNtpCr9eTA7At4pbibcyOCB8
         Vy0Jxi2SBV43gaCXeOnOSv1uG1DacYIllCMRV64EkhBLFvRrPur+fqtmxGfdrio7Ze5Z
         X9IA==
X-Forwarded-Encrypted: i=1; AJvYcCUgLO9KcOxqMhhmuVzuKSt3x6n8mkFIPP5L3cRZh4w2qVmN18YlYiHoS5TPuu65qQJWjH/B6b2jzaCiRl8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmff1+WVTjCT7AidebhMkd76pYqwuILGN8PAv1/pd7Ln0cYJrm
	Q8/MLCpsLnvLSeVM0lc1aBQpEFGcyrRqZZQqM6uHuL8vVR9oXwF/Buv4/xslvVzMUcw=
X-Gm-Gg: ASbGnctqGhdAIP6uqQJ99RCRg3vv9NLZtJECDUALzeEZ4KDWtd0rofYSC8PsSGW/Fzz
	HM8Iacx90R3pXYTXWyIByvGAvxLiZw+kOpGzNXcOzwx92c0TUGzXryZCKWcm8+blLek72NPt136
	71iJNc5wb/P7dOT97fa/3qECwxZEJv9xbUOdyvMcWfZDJuy7R1hx3Az28Zn7iEfYjOauLqvjt5T
	KbZuKtU/HEnc0DJDw5afcqFox/x7t0DkZ+8+ZiWxtjAoljQ/vGCNnqIcIanh5ykPAmsaADkKFZN
	01uZCB4LZUr9jyAgmsAbTc3wCdvbIoykGGQcBBubjZEhz10L+y2G6wvZjJPxSK+8DHHC3+9ohz4
	GMhPuaUdtmnKsjAk/5gBCb0b+IFb4yiY2IhlmeatWbWs=
X-Google-Smtp-Source: AGHT+IHNN/h9IcORot4a3xhdjrHaAp7ln5/qPNI4g6XxmpxQs89n8kgWy8jMRw30pgwpyInfWpB5eg==
X-Received: by 2002:a05:6a00:1142:b0:749:456:4082 with SMTP id d2e1a72fcca58-76335849218mr3090044b3a.1.1753452625116;
        Fri, 25 Jul 2025 07:10:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b0615d7fsm3945846b3a.105.2025.07.25.07.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:10:24 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:10:21 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, andrew@sifive.com, ved@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
Message-ID: <aIOQTSVNkC1RztDW@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
 <2ba0c09d-2783-4dce-a889-06e16abbde61@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2ba0c09d-2783-4dce-a889-06e16abbde61@canonical.com>

On Fri, Jul 25, 2025 at 08:13:29AM +0200, Heinrich Schuchardt wrote:
>On 25.07.25 01:36, Deepak Gupta wrote:
>>SYM_* macros are used to define assembly routines. In this patch series,
>>re-define those macros in risc-v arch specific include file to include
>>a landing pad instruction at the beginning. This is done only when the
>>compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
>>
>>TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
>>support.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>>diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
>>index 9e88ba23cd2b..162774b81158 100644
>>--- a/arch/riscv/include/asm/linkage.h
>>+++ b/arch/riscv/include/asm/linkage.h
>>@@ -6,7 +6,49 @@
>>  #ifndef _ASM_RISCV_LINKAGE_H
>>  #define _ASM_RISCV_LINKAGE_H
>>+#ifdef __ASSEMBLY__
>>+#include <asm/assembler.h>
>>+#endif
>>+
>>  #define __ALIGN		.balign 4
>>  #define __ALIGN_STR	".balign 4"
>>+#ifdef __riscv_zicfilp
>>+/*
>>+ * A landing pad instruction is needed at start of asm routines
>>+ * re-define macros for asm routines to have a landing pad at
>>+ * the beginning of function. Currently use label value of 0x1.
>
>Your code below uses label value 0 which disables tag checking. As 
>long as we don't have tool support for calculating function hashes 
>that is an appropriate approach.
>

Yes I made the fix at other place where function prototype was determined
to be static (see `call_on_irq_stack` in entry.S)

In this patch, it wasn't possible.

>%s/Currently use label value of 0x1./Label value 0x0 disables tag checking./
>

Thanks its lingering from earlier. Will fix it.

>Best regards
>
>Heinrich
>
>>+ * Eventually, label should be calculated as a hash over function
>>+ * signature.
>>+ */
>>+#define SYM_FUNC_START(name)				\
>>+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_NOALIGN(name)			\
>>+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_LOCAL(name)			\
>>+	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
>>+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_WEAK(name)			\
>>+	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
>>+	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
>>+	lpad 0;
>>+
>>+#define SYM_TYPED_FUNC_START(name)				\
>>+	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#endif
>>+
>>  #endif /* _ASM_RISCV_LINKAGE_H */
>>
>

