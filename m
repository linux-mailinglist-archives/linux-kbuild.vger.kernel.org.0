Return-Path: <linux-kbuild+bounces-8753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 373D4B47582
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 19:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 175444E0266
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 17:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBE32586C2;
	Sat,  6 Sep 2025 17:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIZhY3M7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C34253358;
	Sat,  6 Sep 2025 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179156; cv=none; b=dYY7DQyw6Kxqk67HoEMNTBXHJ0WeY3w9mTw2Q30juM7QZVLqAzhW1EWbFumOjLm9js8zV2BwWJGYmnGLBb3nU0V5M0Tz4GW8o+VJ2S+wPiRiA8eo/Tj1gQEkXV+M6HdGftzHOKJqE4Gz+48P2nvCROzdyPjU6k0N2rMfijm35CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179156; c=relaxed/simple;
	bh=oJqqZ46bs8ZJ+SRtiz+892yS5xxxhlbbYIO6nEc6HXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWkrN/SvMzYJpOfz9WgFNW38coWu7pS/4QERSQ+3gSkgDfnC9SP25Lx9a7CkjKJIXt4kBnn7kqPjy6elz6VSHrOwxx8+YK7p4ZPBX4eDaDdrw0C9vTTWXYt+lAif44qLRMn9RU097UcAfWgWFvtbM5OezpB41OT/Le3AhLvY8uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIZhY3M7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so1145514f8f.3;
        Sat, 06 Sep 2025 10:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179152; x=1757783952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcGjqzlEvwGIwrVgChgsqOwM/ch5h0ABA8uHnxnyHmk=;
        b=DIZhY3M7lg+udnO79WfVOuKY4Ui+UDwiir46dPsjdc0I1dq5pFbJD0WTXV0zPRPa0/
         IlsYiCCR3qA2Nc8zXO5FuNofQqCFsQTYL9sffsirl5iijxvUMtHkjkfVzKzHFloErlMN
         QDdOFM4lTNYBFUsNUnLWkGi9xS4kgZjuSgwFC5hjBL6qo6DZVPj/P4boKj7fFRUntgg1
         FYDYj9N0DoCjO6LcWhsPoXU3mJn957tF05LiNnZWJ8/WUMupc34DhVvQgmWJ14tZ5ZPs
         LfAH5J+oQ/6XPRheBW1crxiycFojRxk3RLQYaEVyd1CYdkESeYbSht/bYOoA1O17w3eb
         t9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179152; x=1757783952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcGjqzlEvwGIwrVgChgsqOwM/ch5h0ABA8uHnxnyHmk=;
        b=OCBOE2kTEsSvAMFdmE+5eXpFNLYWNpjTQvhQvT/LL/j697fCnGxJY9640/Afbxrsv8
         SUV5NQQkO9uX1XS3GbrRhcEO66A6ctz+yXiGgssqBvPnHJSOpz2q+LsvUbWw/ohlP344
         qdTWsQtvBvJQA5+uCqVUexOdNjVUcmb3KSq1SZv1hOwr1rwtRdG49/tjqZIzR8rH6jRZ
         OlfYbLTZmEv0AlFJ7kiYV6qPIYZu2nZkPCbF5xlYC26XzIQmlKHVD4FHef1PRE+oEfdo
         4ZMt5T03+jX9KW/2a0pzp/bBfTh24jjEfezSTug8uqetDagiqf4olWEnCo2qEnj4Y4cd
         RdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7Kaj95VHubmmUaEow/mwGF6HOOtYFPWoGrJT4faCbYc+E6R5FkZK5eA02aoeCTwKqxX8/Vrff/D7NYWMo@vger.kernel.org, AJvYcCUxgNZsCs7qITqILlYK/lcVtOwYzGam6vHhDQ/ji7qP+FnPjnZNbGWGzZ1pMWNsPz5GK8Vkurq2n3s=@vger.kernel.org, AJvYcCVXObaSm9BxCqA54zCPy75Ay6zC/sRBnutLLQrAvBO1P1i4Y+ugCIf4dncbGn9cUZNC1rvsZ5klBDDJv6KZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9B0QAeZnFjsKrqdu7geWB8nOjMz8GOY9d39PMsIjYoTcDOf+w
	XBMiutLsTNaRbWxV24nilxjkwOeZJq8PSV9ievWBbjb2Z24/1xetJqcBP92KoQPXsBYDul9o+nQ
	xdeZe5UaS/JrQBqnkA+uECOhy/pQ3Sd4=
X-Gm-Gg: ASbGnctShpLJk1rIV3akXvXvrT2MSgH2lfx2/qeJN/OYyroNXX04vxPVaA12zJCIZf/
	NQChB1KBfdL8+I258DpoKefqLfEy4ubirDHjyMdGw8fS64DR6SjXSAGksunRphJnW2UfZvECFRb
	SF9iwgD6OPnlur2KwlPsoshwhrSR9Q/ej3rNq0kQCN6DzNUlcYib5SMGuYi1HzEmBHSvxMtYyKY
	19bmXlE
X-Google-Smtp-Source: AGHT+IGoAJcJskVN5y7+9iEe/gHmEkEKOcbve64MMpOwOmuYU3dyMfGKr4WBo2d9j76/N40VbFSKqdY5ksrhgdwi1Ps=
X-Received: by 2002:a05:6000:420f:b0:3e3:5b4:dc1b with SMTP id
 ffacd0b85a97d-3e642027172mr2499354f8f.19.1757179152239; Sat, 06 Sep 2025
 10:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:19:01 +0200
X-Gm-Features: AS18NWCTNCapbXl_JpY4w398NCDrxjlYVkaeLQmKTOYiJH6ZL4Fo44ag69k2Lug
Message-ID: <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
Subject: Re: [PATCH v5 13/19] kasan: x86: Handle int3 for inline KASAN reports
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 10:30=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> Inline KASAN on x86 does tag mismatch reports by passing the faulty
> address and metadata through the INT3 instruction - scheme that's setup
> in the LLVM's compiler code (specifically HWAddressSanitizer.cpp).
>
> Add a kasan hook to the INT3 handling function.
>
> Disable KASAN in an INT3 core kernel selftest function since it can raise
> a false tag mismatch report and potentially panic the kernel.
>
> Make part of that hook - which decides whether to die or recover from a
> tag mismatch - arch independent to avoid duplicating a long comment on
> both x86 and arm64 architectures.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v5:
> - Add die to argument list of kasan_inline_recover() in
>   arch/arm64/kernel/traps.c.
>
> Changelog v4:
> - Make kasan_handler() a stub in a header file. Remove #ifdef from
>   traps.c.
> - Consolidate the "recover" comment into one place.
> - Make small changes to the patch message.
>
>  MAINTAINERS                   |  2 +-
>  arch/x86/include/asm/kasan.h  | 26 ++++++++++++++++++++++++++
>  arch/x86/kernel/alternative.c |  4 +++-
>  arch/x86/kernel/traps.c       |  4 ++++
>  arch/x86/mm/Makefile          |  2 ++
>  arch/x86/mm/kasan_inline.c    | 23 +++++++++++++++++++++++
>  include/linux/kasan.h         | 24 ++++++++++++++++++++++++
>  7 files changed, 83 insertions(+), 2 deletions(-)
>  create mode 100644 arch/x86/mm/kasan_inline.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 788532771832..f5b1ce242002 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13177,7 +13177,7 @@ S:      Maintained
>  B:     https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&pr=
oduct=3DMemory%20Management
>  F:     Documentation/dev-tools/kasan.rst
>  F:     arch/*/include/asm/*kasan*.h
> -F:     arch/*/mm/kasan_init*
> +F:     arch/*/mm/kasan_*
>  F:     include/linux/kasan*.h
>  F:     lib/Kconfig.kasan
>  F:     mm/kasan/
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index 1963eb2fcff3..5bf38bb836e1 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -6,7 +6,28 @@
>  #include <linux/kasan-tags.h>
>  #include <linux/types.h>
>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
> +#ifdef CONFIG_KASAN_SW_TAGS
> +
> +/*
> + * LLVM ABI for reporting tag mismatches in inline KASAN mode.
> + * On x86 the INT3 instruction is used to carry metadata in RAX
> + * to the KASAN report.
> + *
> + * SIZE refers to how many bytes the faulty memory access
> + * requested.
> + * WRITE bit, when set, indicates the access was a write, otherwise
> + * it was a read.
> + * RECOVER bit, when set, should allow the kernel to carry on after
> + * a tag mismatch. Otherwise die() is called.
> + */
> +#define KASAN_RAX_RECOVER      0x20
> +#define KASAN_RAX_WRITE                0x10
> +#define KASAN_RAX_SIZE_MASK    0x0f
> +#define KASAN_RAX_SIZE(rax)    (1 << ((rax) & KASAN_RAX_SIZE_MASK))
> +
> +#else
>  #define KASAN_SHADOW_SCALE_SHIFT 3

Putting this under else in this patch looks odd, we can move this part
to "x86: Make software tag-based kasan available".

> +#endif
>
>  /*
>   * Compiler uses shadow offset assuming that addresses start
> @@ -35,10 +56,15 @@
>  #define __tag_shifted(tag)             FIELD_PREP(GENMASK_ULL(60, 57), t=
ag)
>  #define __tag_reset(addr)              (sign_extend64((u64)(addr), 56))
>  #define __tag_get(addr)                        ((u8)FIELD_GET(GENMASK_UL=
L(60, 57), (u64)addr))
> +bool kasan_inline_handler(struct pt_regs *regs);
>  #else
>  #define __tag_shifted(tag)             0UL
>  #define __tag_reset(addr)              (addr)
>  #define __tag_get(addr)                        0
> +static inline bool kasan_inline_handler(struct pt_regs *regs)
> +{
> +       return false;
> +}
>  #endif /* CONFIG_KASAN_SW_TAGS */
>
>  static inline void *__tag_set(const void *__addr, u8 tag)
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.=
c
> index 2a330566e62b..4cb085daad31 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -2228,7 +2228,7 @@ int3_exception_notify(struct notifier_block *self, =
unsigned long val, void *data
>  }
>
>  /* Must be noinline to ensure uniqueness of int3_selftest_ip. */
> -static noinline void __init int3_selftest(void)
> +static noinline __no_sanitize_address void __init int3_selftest(void)
>  {
>         static __initdata struct notifier_block int3_exception_nb =3D {
>                 .notifier_call  =3D int3_exception_notify,
> @@ -2236,6 +2236,7 @@ static noinline void __init int3_selftest(void)
>         };
>         unsigned int val =3D 0;
>
> +       kasan_disable_current();
>         BUG_ON(register_die_notifier(&int3_exception_nb));
>
>         /*
> @@ -2253,6 +2254,7 @@ static noinline void __init int3_selftest(void)
>
>         BUG_ON(val !=3D 1);
>
> +       kasan_enable_current();
>         unregister_die_notifier(&int3_exception_nb);
>  }
>
> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> index 0f6f187b1a9e..2a119279980f 100644
> --- a/arch/x86/kernel/traps.c
> +++ b/arch/x86/kernel/traps.c
> @@ -912,6 +912,10 @@ static bool do_int3(struct pt_regs *regs)
>         if (kprobe_int3_handler(regs))
>                 return true;
>  #endif
> +
> +       if (kasan_inline_handler(regs))
> +               return true;
> +
>         res =3D notify_die(DIE_INT3, "int3", regs, 0, X86_TRAP_BP, SIGTRA=
P);
>
>         return res =3D=3D NOTIFY_STOP;
> diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
> index 5b9908f13dcf..1dc18090cbe7 100644
> --- a/arch/x86/mm/Makefile
> +++ b/arch/x86/mm/Makefile
> @@ -36,7 +36,9 @@ obj-$(CONFIG_PTDUMP)          +=3D dump_pagetables.o
>  obj-$(CONFIG_PTDUMP_DEBUGFS)   +=3D debug_pagetables.o
>
>  KASAN_SANITIZE_kasan_init_$(BITS).o :=3D n
> +KASAN_SANITIZE_kasan_inline.o :=3D n
>  obj-$(CONFIG_KASAN)            +=3D kasan_init_$(BITS).o
> +obj-$(CONFIG_KASAN_SW_TAGS)    +=3D kasan_inline.o
>
>  KMSAN_SANITIZE_kmsan_shadow.o  :=3D n
>  obj-$(CONFIG_KMSAN)            +=3D kmsan_shadow.o
> diff --git a/arch/x86/mm/kasan_inline.c b/arch/x86/mm/kasan_inline.c
> new file mode 100644
> index 000000000000..9f85dfd1c38b
> --- /dev/null
> +++ b/arch/x86/mm/kasan_inline.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/kasan.h>
> +#include <linux/kdebug.h>
> +
> +bool kasan_inline_handler(struct pt_regs *regs)
> +{
> +       int metadata =3D regs->ax;
> +       u64 addr =3D regs->di;
> +       u64 pc =3D regs->ip;
> +       bool recover =3D metadata & KASAN_RAX_RECOVER;
> +       bool write =3D metadata & KASAN_RAX_WRITE;
> +       size_t size =3D KASAN_RAX_SIZE(metadata);
> +
> +       if (user_mode(regs))
> +               return false;
> +
> +       if (!kasan_report((void *)addr, size, write, pc))
> +               return false;

Hm, this part is different than on arm64: there, we don't check the
return value.

Do I understand correctly that the return value from this function
controls whether we skip over the int3 instruction and continue the
execution? If so, we should return the same value regardless of
whether the report is suppressed or not. And then you should not need
to explicitly check for KASAN_BIT_MULTI_SHOT in the latter patch.

> +
> +       kasan_inline_recover(recover, "Oops - KASAN", regs, metadata, die=
);

Maybe name this is as kasan_die_unless_recover()?


> +
> +       return true;
> +}
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 54481f8c30c5..8691ad870f3b 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -663,4 +663,28 @@ void kasan_non_canonical_hook(unsigned long addr);
>  static inline void kasan_non_canonical_hook(unsigned long addr) { }
>  #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
>
> +#ifdef CONFIG_KASAN_SW_TAGS
> +/*
> + * The instrumentation allows to control whether we can proceed after
> + * a crash was detected. This is done by passing the -recover flag to
> + * the compiler. Disabling recovery allows to generate more compact
> + * code.
> + *
> + * Unfortunately disabling recovery doesn't work for the kernel right
> + * now. KASAN reporting is disabled in some contexts (for example when
> + * the allocator accesses slab object metadata; this is controlled by
> + * current->kasan_depth). All these accesses are detected by the tool,
> + * even though the reports for them are not printed.
> + *
> + * This is something that might be fixed at some point in the future.
> + */
> +static inline void kasan_inline_recover(
> +       bool recover, char *msg, struct pt_regs *regs, unsigned long err,
> +       void die_fn(const char *str, struct pt_regs *regs, long err))
> +{
> +       if (!recover)
> +               die_fn(msg, regs, err);
> +}
> +#endif
> +
>  #endif /* LINUX_KASAN_H */
> --
> 2.50.1
>

