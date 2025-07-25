Return-Path: <linux-kbuild+bounces-8173-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BF2B12004
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 16:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A21A4E7072
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 14:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0C73234;
	Fri, 25 Jul 2025 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UiZK0K7r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84A11FDA61
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753453425; cv=none; b=E0EoPyUlQqB6sjNDvB6vZgMFTxSNrcQ4AWWd02bfkDbMrdBAyEWeHpPnAyNOYBhHEPCg9OTaJNywqg2Jlfhg52CB18hpmq/nKBXbry13IDyC1uX1BwU4uI3iPhAQ+nmmgSF6QBkah2PCi6QaTKgiyC/SwlRFJtxzb0m6dCvSmc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753453425; c=relaxed/simple;
	bh=jkFPROj39Gfs7ADWXQKZaWodssEllSDMoBNzseIfGr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkDqhJRRhCQNYpx+FNeABfVpRc53bogg5LvUD+UWolqnJEaL4GEYCDKlsU6+E58p5/9Lc6IulNKeGbdvGccAjaKYc2QM6D3bJ9dwbZ806vbswVsWdhu4z90zLB0fhrYetwbyc3ZMTrsf0VB5jFLb4emucLoKkmBuko0+ulMCZ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UiZK0K7r; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-236377f00a1so19738565ad.3
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753453423; x=1754058223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gskfuFSjcZ1f9NqzVyfbU+2SXj6gH6Vy4UjfTOJinxk=;
        b=UiZK0K7rwmWij3TIsldbg2RU0jaELX0ks0TsuWi9XoT1NTwaEyJXXcWWDZgzkZdUTV
         EEnimWIq3tCc+AudrMT/jjnirmNTlxn2plWyAtNz3a7AQAVkj1hXBT/ML3yuDHjpqfQL
         OLxUQ0JfxkfyzzAVHfUUYxADZnbEGacPKdlXP7wcQLQZkhrH3vlS4Z5c0xbuESvdiYnL
         otexsbr5oQqm2tqN2tmnCSGidKXf5K55/wYthZAHApzUc8yigF9NQul5SKQ/gSDdprIV
         G3mP2TkiyqAzGDNPcedg0KrtcZB3zR1pnG7NWEdcz5NRznUBZpbDseObWOTvAtdLpVaN
         AB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753453423; x=1754058223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gskfuFSjcZ1f9NqzVyfbU+2SXj6gH6Vy4UjfTOJinxk=;
        b=Nzr0iIcAHQK3a28nd3FzCm4x6xvj/9K9JOpyAL1wCaSaGAkyteOWjL1Vub/CVgqzkc
         gNiFR8OSKYLHVOrX0mcyvYELxa0vmCLEvpUmVWeGJZTVturPAZvNy+9x3r1HcACltR8U
         b/ib7KzKdZkUjAO9Rb1/LgcqcRSPFXyFfLO+mG19dK9VJoaN2JuWVUgBoylLKmlhjKAX
         vl67LPaHTZLUV0sllV9rGoQl6YwCGdumWP/D1mFb+jjKsRyLi9yO0QVs9b1TZpeL2e+u
         9QXqFkPb+DbCMlvEM7vwXZ2bhdACshx+ArbXjdhoMI7j87pS+xulBT9KdMAmcpBQshiG
         Qt1A==
X-Forwarded-Encrypted: i=1; AJvYcCX1K3vi1fALWaHVwlipBztKS7WJZIoFzqJXpGSfrpGNTd3FVq3x8SDLX4gb4OwWTiy02ldGomSRXYU1m8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/PIiAtb8b4GxnrHR5o5gOSiEKlosRBI8JG02aHbAFcWUiwK4k
	4BBLxjvg3E8OtAg54ERnvHDwiYDPvFFXM9qtV1t15E/zc/yF2h1/ExjXLECwY7XOM2U=
X-Gm-Gg: ASbGncuA0VC+JMsKK+NokGde8XOsw2E9iK1ubfnDuokcOkkzB2rVvoDnxE9UK3ND5UD
	MHv3UsUTEefnu8KmYyBkgkUuEqZftpbIKTBpp/5pFcv8Jj27y2SeERoiHDzXf3zHFLQSgyBv5C7
	ul25P0uGDPZsbVY8arJ1xDM8TwyOVClIfTlxxPVXmljPcKZ/+OS3fxNI9MK7Pv09EDzJYOXCW34
	hFLlFsNRSD9SgQx8UPA171XVVQS7n8huO6VipW7MgzGXAnanKJzvlIXf5xoOKOXKutDd0056GPu
	/u1awcQOvOy1YA331fie8HK5eX9tgaOfl94HqdSx4X7U9C+m8edopKMo0/Psinruql/A/UIMPT/
	SBX8ygbmrCHYBDmMESoJPVTFc46RxxYal
X-Google-Smtp-Source: AGHT+IHRz5CbRE8i2UjdGDZpkxqOW3JD/QQJLFQFs49c4cRaClHO120ReCkQeIjI0YUgC/xMTK32oQ==
X-Received: by 2002:a17:902:f252:b0:234:ed31:fc94 with SMTP id d9443c01a7336-23fb30bb5edmr15941955ad.26.1753453422841;
        Fri, 25 Jul 2025 07:23:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fb3f2a5a8sm13203045ad.94.2025.07.25.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:23:42 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:23:38 -0700
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
Subject: Re: [PATCH 11/11] riscv: Kconfig & Makefile for riscv kernel control
 flow integrity
Message-ID: <aIOTauktSYmw2LUV@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-11-04b8fa44c98c@rivosinc.com>
 <b50da4ef-53ca-4edf-bd74-f5e037a14f99@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b50da4ef-53ca-4edf-bd74-f5e037a14f99@canonical.com>

On Fri, Jul 25, 2025 at 01:26:44PM +0200, Heinrich Schuchardt wrote:
>On 25.07.25 01:37, Deepak Gupta wrote:
>>Defines `CONFIG_RISCV_KERNEL_CFI` and selects SHADOW_CALL_STACK
>>and ARCH_HAS_KERNEL_SHADOW_STACK both so that zicfiss can be wired up.
>>
>>Makefile checks if CONFIG_RISCV_KERNEL_CFI is enabled, then light
>>up zicfiss and zicfilp compiler flags. CONFIG_RISCV_KERNEL_CFI is
>>dependent on CONFIG_RISCV_USER_CFI. There is no reason for user to
>>not select support for user cfi while enabling for kernel.
>>
>>compat vdso don't need fcf-protection (toolchain lacks support).
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/Kconfig                     | 37 +++++++++++++++++++++++++++++++++-
>>  arch/riscv/Makefile                    |  8 ++++++++
>>  arch/riscv/kernel/compat_vdso/Makefile |  2 +-
>>  arch/riscv/kernel/vdso/Makefile        |  2 +-
>>  4 files changed, 46 insertions(+), 3 deletions(-)
>>
>>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>index 385c3d93e378..305ba5787f74 100644
>>--- a/arch/riscv/Kconfig
>>+++ b/arch/riscv/Kconfig
>>@@ -245,7 +245,7 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
>>  	depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C
>>  config HAVE_SHADOW_CALL_STACK
>>-	def_bool $(cc-option,-fsanitize=shadow-call-stack)
>>+	def_bool $(cc-option,-fsanitize=shadow-call-stack) || $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
>>  	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
>>  	depends on $(ld-option,--no-relax-gp)
>>@@ -864,6 +864,16 @@ config RISCV_ISA_ZICBOP
>>  	  If you don't know what to do here, say Y.
>>+config TOOLCHAIN_HAS_ZICFILP
>>+	bool
>>+	default y
>>+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp)
>>+
>>+config TOOLCHAIN_HAS_ZICFISS
>>+	bool
>>+	default y
>>+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
>>+
>>  config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>>  	def_bool y
>>  	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
>>@@ -1182,6 +1192,31 @@ config RISCV_USER_CFI
>>  	  space does not get protection "for free".
>>  	  default n.
>>+config RISCV_KERNEL_CFI
>>+	def_bool n
>>+	bool "hw assisted riscv kernel control flow integrity (kcfi)"
>>+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
>>+	depends on RISCV_USER_CFI
>>+	select ARCH_SUPPORTS_SHADOW_CALL_STACK
>>+	select SHADOW_CALL_STACK
>>+	select ARCH_HAS_KERNEL_SHADOW_STACK
>>+	help
>>+	  Provides CPU assisted control flow integrity to for riscv kernel.
>>+	  Control flow integrity is provided by implementing shadow stack for
>>+	  backward edge and indirect branch tracking for forward edge. Shadow
>>+	  stack protection is a hardware feature that detects function return
>>+	  address corruption. This helps mitigate ROP attacks. RISCV_KERNEL_CFI
>>+	  selects CONFIG_SHADOW_CALL_STACK which uses software based shadow
>>+	  stack but is unprotected against stray writes. Selecting RISCV_KERNEL_CFI
>>+	  will select CONFIG_DYNAMIC_SCS and will enable hardware assisted shadow
>>+	  stack protection against stray writes.
>
>Please, consider adding a blank line for better readability.

Noted. Will do.

>
>>+	  Indirect branch tracking enforces that all indirect branches must land
>>+	  on a landing pad instruction else CPU will fault. This enables forward
>>+	  control flow (call/jmp) protection in kernel and restricts all indirect
>>+	  call or jump in kernel to a landing pad instruction which mostly likely
>>+	  will be start of the function.
>>+	  default n
>
>For Linux distributions it is important that the same kernel can run 
>both on hardware both with and without CFI support. The description 
>provided does not help to understand if RISCV_KERNEL_CFI=y will result 
>in such a kernel. Please, enumerate the minimum set of extensions 
>needed for supporting a kernel built with RISCV_KERNEL_CFI=y. I guess 
>this will at least include Zimop.

Yes, it is expected anyone selecting this config is going to take this kernel to
a RVA23 hardware. RVA23 mandates zimop and thus shouldn't be an issue on such a
hardware. Anyone selecting this config and trying to run this kernel on hardware
prior to RVA23 will run into issues. I can add a comment here to highlight that.

I assume you wanted that awareness and goal is not maintain compat of same
kernel between RVA20 and RVA23 hardware, right?

>
>Best regards
>
>Heinrich
>
>>+
>>  endmenu # "Kernel features"
>>  menu "Boot options"
>>diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>>index 7128df832b28..6ef30a3d2bc4 100644
>>--- a/arch/riscv/Makefile
>>+++ b/arch/riscv/Makefile
>>@@ -61,8 +61,10 @@ else ifeq ($(CONFIG_LTO_CLANG),y)
>>  endif
>>  ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
>>+ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>  	KBUILD_LDFLAGS += --no-relax-gp
>>  endif
>>+endif
>>  # ISA string setting
>>  riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>>@@ -91,6 +93,12 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
>>  KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
>>  export KBUILD_BASE_ISA
>>+ifeq ($(CONFIG_RISCV_KERNEL_CFI),y)
>>+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFILP) := $(riscv-march-y)_zicfilp
>>+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFISS) := $(riscv-march-y)_zicfiss
>>+KBUILD_CFLAGS += -fcf-protection=full
>>+KBUILD_AFLAGS += -fcf-protection=full
>>+endif
>>  # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
>>  # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
>>  KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
>>diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
>>index 24e37d1ef7ec..552131bc34d7 100644
>>--- a/arch/riscv/kernel/compat_vdso/Makefile
>>+++ b/arch/riscv/kernel/compat_vdso/Makefile
>>@@ -69,4 +69,4 @@ quiet_cmd_compat_vdsold = VDSOLD  $@
>>  # actual build commands
>>  quiet_cmd_compat_vdsoas = VDSOAS  $@
>>-      cmd_compat_vdsoas = $(COMPAT_CC) $(a_flags) $(COMPAT_CC_FLAGS) -c -o $@ $<
>>+      cmd_compat_vdsoas = $(COMPAT_CC) $(filter-out -fcf-protection=full, $(a_flags)) $(COMPAT_CC_FLAGS) -c -o $@ $<
>>diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
>>index 2b528d82fa7d..7b1446b63ebc 100644
>>--- a/arch/riscv/kernel/vdso/Makefile
>>+++ b/arch/riscv/kernel/vdso/Makefile
>>@@ -17,7 +17,7 @@ ifdef CONFIG_VDSO_GETRANDOM
>>  vdso-syms += getrandom
>>  endif
>>-ifdef CONFIG_RISCV_USER_CFI
>>+ifneq ($(CONFIG_RISCV_USER_CFI), $(CONFIG_RISCV_KERNEL_CFI))
>>  CFI_MARCH = _zicfilp_zicfiss
>>  CFI_FULL = -fcf-protection=full
>>  endif
>>
>

