Return-Path: <linux-kbuild+bounces-8172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F09EB11FFB
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 16:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D5DA3A83D1
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 14:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9EE1E833D;
	Fri, 25 Jul 2025 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="3HvOJUQ9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88401E51EF
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753453232; cv=none; b=IOLZ73TE29HHIxP7/AleG5ds4BL613KJ8jq41BORpj2zMqdL9McFANEuaoOlsUR1x3qAA6nuQQ8Wly9CiEj8eTRY6WoGaz+3wJhu7hwPitcIDieQOgu0m4TWzpIUWv6XRPkGj8slr7eV5MtH50jT3OHSDKQrGyAe6rKCM4dV5qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753453232; c=relaxed/simple;
	bh=OMwltMTnROc0x20VCZdOnkOJGoE17eDxpOQAnZCwq0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMVFUo+0sxP1lFRcahIn/qsm8HrNPkZN4wRGssw7f9KlVr0PRiOsQLnjN+Wwex6IbBNLHKz3uVddyfEybVpcfDKPFgt2+AASd3yJOt70CePT86XMP1ocKAIaUwBsGiyGlPlaLP1/mFQd2sXVAbjt+1Hq15a4+Ubec6lQ27wU0vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=3HvOJUQ9; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b31d578e774so2296350a12.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 07:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753453230; x=1754058030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOelqn4iY/rsR6MxnRwx481vFltvLJp6wfVOt5IOJQo=;
        b=3HvOJUQ9f4idleQWGKNo3wrK3nMJOF41EhJf26jJ51axSr+erDLz7/5Tdj1XhqfwT1
         Xccw97DLPVj4BKW77gOd4fJUMtqDNESqtsae6dpIAIPXkqBNKexBsHoDptzKB3CLkZQ7
         uKKxIRm5L7d4X4hY5PtFtp5yQFshIe7dZF9/O/7a4V3T/PAzxrEOKWKmg4psVcEeZWHP
         WKbu2+AIRHIUYdtt7RnAsStYE0fcP9Q1c6z+yuqubR2SIEaHNBx/bCD8b1rCMZOiaGrA
         0Vtf5cp9f32tut+cwaDaLK/HfsIypqgeFoooPQVPwXJBVNep7bJdsfQ3W5413WZgEtkD
         I2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753453230; x=1754058030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOelqn4iY/rsR6MxnRwx481vFltvLJp6wfVOt5IOJQo=;
        b=ec3JeQZP5LtF9QJCyWs7imjOggNg4aVCKbA3yzTxnRdTPCy/Q1jQqgZnlWtlaEFPSC
         uVqerjXt0RmDL0QRfm0OrNZk33ucnVX14eX4OKyZNvnqQvucdqtkGeTQwkqZWLlgCPRX
         j9nv1kAJNDZUxSXMupXe8vFGWdnjzYK1mQ7uZM1a/6yVpshCuKFi9D/12dzmxsavpGzk
         SRRGd/vWk5n/jg9EEFQat3IBvZmyDwXe+jqTO+Id+4w6HPmAW7W9zliNvVxrBBm2yaUu
         Oe550PYB8ywYVsCr6JqQrYoYgz6k+cWeW0mwM/13JPrdgR+Quff8Y32ZcUlUnx8BXQO0
         GfEA==
X-Forwarded-Encrypted: i=1; AJvYcCX80/nQmDNMhdG9AoXNTgfUuHEdogAUypQdn3j3E4NJ+PqeyDTrkjTa2+HNn4ThxcQUz5ha5r/rytEy4R8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOpPU0HixJvP6YeSyzM4eqoHJnRbtjKl9Tq8wW0XLqZGEOxE6
	jmlkzhoJWKJfk5peDYLZ8AS5kNCIw3NF2WCkUW3PR/kCeL24vTAUAiteZTAoV7PnW/4=
X-Gm-Gg: ASbGnct20G6oQkfGC6B3mPwmqmBmzB5EVgq+OcjsNpdzDdZ5LdPlCCWVGAN4/B4slFc
	g6CnsZkjDzlPlSLYWZsc4nzW+xG/uMVe3/1vd4Du2d0P/Z7sULXQcv6P1Mz+EO1KWCw2RGtzFC/
	mgFc66kROi7OnyeSVeKj2jgBweeyVegXoObU1YxZ5d/1FEHzvxoC2ylvejh0HDvzXpFj7jKi/WB
	4PwU7L44z89uFY+QpxEZrP/CXtotQ9uFSd2C8eyhaRsmWrc8oF5x04yXZ8dC1r9pb6YNRIl9pd5
	uYay05l6QEIy0xhCWZZkuPK4lHgrYWmg8XmaRy+RBN7dXeRvBV2zFHa2fuxAZ7hMfpsV/FmlgHz
	svs1HnjYU1UOFMxZbYw636BqQ+YLN77y0X7/ZBddYZis=
X-Google-Smtp-Source: AGHT+IFnToE7Y9m/LQB1LHyZJTXUY15A+gO23FToLy9nHc/JxiCSxR6k0MWES+brycAIrDFP11y4GQ==
X-Received: by 2002:a17:90b:5407:b0:310:c8ec:4192 with SMTP id 98e67ed59e1d1-31e662e8312mr8688402a91.10.1753453230029;
        Fri, 25 Jul 2025 07:20:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e60a61628sm2176473a91.1.2025.07.25.07.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:20:29 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:20:26 -0700
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
Subject: Re: [PATCH 05/11] riscv: enable landing pad enforcement
Message-ID: <aIOSqskb_hBAqjIt@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
 <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>

On Fri, Jul 25, 2025 at 08:33:46AM +0200, Heinrich Schuchardt wrote:
>On 25.07.25 01:36, Deepak Gupta wrote:
>>Enables landing pad enforcement by invoking a SBI FWFT call.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/kernel/asm-offsets.c |  1 +
>>  arch/riscv/kernel/head.S        | 19 +++++++++++++++++++
>>  2 files changed, 20 insertions(+)
>>
>>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>>index e4d55126dc3e..e6a9fad86fae 100644
>>--- a/arch/riscv/kernel/asm-offsets.c
>>+++ b/arch/riscv/kernel/asm-offsets.c
>>@@ -536,6 +536,7 @@ void asm_offsets(void)
>>  	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
>>  	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
>>  	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
>>+	DEFINE(SBI_FWFT_LANDING_PAD, SBI_FWFT_LANDING_PAD);
>>  	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
>>  #endif
>>  }
>>diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>>index 9c99c5ad6fe8..59af044bf85c 100644
>>--- a/arch/riscv/kernel/head.S
>>+++ b/arch/riscv/kernel/head.S
>>@@ -185,6 +185,16 @@ secondary_start_sbi:
>>  1:
>>  #endif
>>  	scs_load_current
>>+
>>+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
>>+	li a7, SBI_EXT_FWFT
>>+	li a6, SBI_EXT_FWFT_SET
>>+	li a0, SBI_FWFT_LANDING_PAD
>>+	li a1, 1 /* enable landing pad for supervisor */
>>+	li a2, SBI_FWFT_SET_FLAG_LOCK
>>+	ecall	/* check for error condition and take appropriate action */
>>+#endif
>>+
>>  	call smp_callin
>>  #endif /* CONFIG_SMP */
>>@@ -359,6 +369,15 @@ SYM_CODE_START(_start_kernel)
>>  #endif
>>  	scs_load_current
>>+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
>>+	li a7, SBI_EXT_FWFT
>>+	li a6, SBI_EXT_FWFT_SET
>>+	li a0, SBI_FWFT_LANDING_PAD
>>+	li a1, 1 /* enable landing pad for supervisor */
>
>The SBI specification calls BIT(0) "LOCK".
>Shouldn't we define a constant for the lock bit instead of using a 
>magic value?

See below `li a2, SBI_FWFT_SET_FLAG_LOCK`.

"li a1, 1 /* enable landing pad for supervisor */>" --> this is enabling.
Had we done "li a1, 0 /* enable landing pad for supervisor */" --> this is
asking firmware to disable the feature (turn off the bit in menvcfg CSR)

>Best regards
>
>Heinrich
>
>>+	li a2, SBI_FWFT_SET_FLAG_LOCK
>>+	ecall	/* check for error condition and take appropriate action */
>>+#endif
>>+
>>  #ifdef CONFIG_KASAN
>>  	call kasan_early_init
>>  #endif
>>
>

