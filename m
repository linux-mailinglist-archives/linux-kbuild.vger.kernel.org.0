Return-Path: <linux-kbuild+bounces-9914-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C15C5C948B5
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Nov 2025 00:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D38653A6501
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Nov 2025 23:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CD1247DE1;
	Sat, 29 Nov 2025 23:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7ayhB0a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167CC13A86C
	for <linux-kbuild@vger.kernel.org>; Sat, 29 Nov 2025 23:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764457248; cv=none; b=svzVnKexKFkfkutyxanf0ZbrllRSmIld6qprP1qOx8LABWr7kXa7CX83ixh+D5OGrlcaA5iGHqcNd3bpUqCPDc1dMpMUQOOxp0SqKJXYRo0lTiinemfwqyY7mFIH5qaA1C9kMZSeoRvlpHxEhOtyxiK1UltCul9Vf2MxsHCEVw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764457248; c=relaxed/simple;
	bh=ahbrlVHUyjKynsmUn0eg1wukhIGIxV/YCSxXPxWxPkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQ7klfFrUCRcOZeZW+60SrVAemA4socw+XyglLNq2Shg1PPjUb5oWT1ru2DNXWeiFhO4Bo+Rxx9xsDBP5GDgw6uFZKumuyW83MrEVZC9JLJR5JU/DF3WnsLE8YEDhrGLcv7SNIwYkbTT5TwJsbfykJilnkfkEcGEi9/DFuHhXZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7ayhB0a; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so5631168a12.1
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Nov 2025 15:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764457245; x=1765062045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7abD6XH4eHcxEiWpbo/4uwSFXjdFhqX7mjZwLL/Fl0=;
        b=a7ayhB0a8mVesvDqyRPRfbj1qe5w2GyPPN0KTnT0F08k6+kCSI2gBADzePtfn/h//m
         EbiyixkVPtyiLEjuxSW2SrgTzw1DsjZbsU9Kff0xrpWmR06aaslxioPuT7Gqn9mqgSVE
         mzE2+ZQCFFUh4/vORTyqyTJ4SpwAG66swkMrIHXbo1U9lCx5oSkvw+7HPscncaVevLvz
         DNFi6eXZmzLa+2wGh63XhZNuSvGvfg6Ma3eg9uTKZtmZLIloEfUiAYy3Hx3a/stjxfl7
         VPTYzWDYkFPqKS7iOZm8mV4u9bsxfK/5cq0/LTDdBhDtICz32Ek6NlTMzpCq4qCefmQt
         shzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764457245; x=1765062045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o7abD6XH4eHcxEiWpbo/4uwSFXjdFhqX7mjZwLL/Fl0=;
        b=Dje75hVeUwCYJvFC2+4lQnhRdJIdIwConephuMFSXJK20soze3/MJ8uiW8LkPjeexa
         enO9e4mqXahif/IC3Uzqb2uny6qL39fVRzjoaw8IUefFk60Lr+z3zVBMask0WHgGawFr
         89WxaymChPkAl8ecshhLjtLCGHQ/WaDvcm2oMgtYcDsMAQfNnYPGa8ffgewAW1E9V+AZ
         bQPF9fWOJJ10zEHrzQI+FW92/picjBrnmQ+hrUUfoV3OvEEIiyXx6nV8JlAa9dze5ho+
         u5h44LztckGUa7c/lTOoXIgnTeKa6otvMHAkhEtsSQIuw0V6/EX7aFRfasQtyVusbgoE
         ZGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTK+nSmJ0/8gHGqpzXu0uEbwH4upkmRqYqwStXtqAJ7hI3SZM3a5tiFlR+HfWvLoRudvtEdnN3oERxUBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNCBmjZ9RI4wX5GfzyCIaizvilQH8XV2STCPbJ/gTUZhl3MZno
	J/BrEtDkMQ1Onk0qR3ekWYqR1bK2yi6EOr69H42KMelqa1TQw1bF9CIvX2d/TMWYkTGujQ7d241
	8qQVvpBqMxA7orOPm3ysZxBvSh4EnprA=
X-Gm-Gg: ASbGncsbSJfs8xRq4GRh2oYf8M8jdn6IZKa6Y3HHQMLa0cRRuFESmp49aXy+EzfB5m7
	9bSphZQsNsibwdJA+1UZxXe7uPybPMkwZuEgEVGl5OnB8RJ+KctVsYkUFUbaMsdcBR4Itw7MACr
	l5M3fj0aTeJ1Faa/vJL6DfmSVPRX7x85VzI+YCCVNR3yaa5gP4QoSsax+FzvA0Dt8LPDePqu2nr
	kh8pId+evCIJToBShruQC/i8rB1ejcDm7bUZOGquJ87SxzBcyw1pa2vsPqn3oJikwuzy66Q
X-Google-Smtp-Source: AGHT+IFraZxIxArC6ZRLXa5g7OneQiuIwggV1ggNXIteOyfynnk9uYcAtUhHJonNAod2bu5yo5u0XI1eptsrAOVctRM=
X-Received: by 2002:a05:6402:50d2:b0:633:d0b7:d6d2 with SMTP id
 4fb4d7f45d1cf-645eb2a9007mr18043484a12.18.1764457245181; Sat, 29 Nov 2025
 15:00:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121100044.282684-1-thuth@redhat.com> <20251121100044.282684-2-thuth@redhat.com>
In-Reply-To: <20251121100044.282684-2-thuth@redhat.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 30 Nov 2025 00:00:33 +0100
X-Gm-Features: AWmQ_bkDTkRArCOJtRA_LXcLs7nIqPHlR48Siu-A5cxKCr76Y6aVmGcQU7u8Tko
Message-ID: <CA+=Fv5SPuYyZ2ASzz3oVMCRQNP-G+0pbW58o32ryXrm_RBfqSA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] alpha: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 the alpha headers
To: Thomas Huth <thuth@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 11:10=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:
>
> From: Thomas Huth <thuth@redhat.com>
>
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
>
> This is a completely mechanical patch (done with a simple "sed -i"
> statement).
>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  arch/alpha/include/asm/console.h     | 4 ++--
>  arch/alpha/include/asm/page.h        | 4 ++--
>  arch/alpha/include/asm/pal.h         | 4 ++--
>  arch/alpha/include/asm/thread_info.h | 8 ++++----
>  4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/co=
nsole.h
> index 088b7b9eb15ae..1cabdb6064bbe 100644
> --- a/arch/alpha/include/asm/console.h
> +++ b/arch/alpha/include/asm/console.h
> @@ -4,7 +4,7 @@
>
>  #include <uapi/asm/console.h>
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  extern long callback_puts(long unit, const char *s, long length);
>  extern long callback_getc(long unit);
>  extern long callback_open_console(void);
> @@ -26,5 +26,5 @@ struct crb_struct;
>  struct hwrpb_struct;
>  extern int callback_init_done;
>  extern void * callback_init(void *);
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>  #endif /* __AXP_CONSOLE_H */
> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.=
h
> index 5ec4c77e432e0..d2c6667d73e9e 100644
> --- a/arch/alpha/include/asm/page.h
> +++ b/arch/alpha/include/asm/page.h
> @@ -6,7 +6,7 @@
>  #include <asm/pal.h>
>  #include <vdso/page.h>
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>
>  #define STRICT_MM_TYPECHECKS
>
> @@ -74,7 +74,7 @@ typedef struct page *pgtable_t;
>  #define PAGE_OFFSET            0xfffffc0000000000
>  #endif
>
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>
>  #define __pa(x)                        ((unsigned long) (x) - PAGE_OFFSE=
T)
>  #define __va(x)                        ((void *)((unsigned long) (x) + P=
AGE_OFFSET))
> diff --git a/arch/alpha/include/asm/pal.h b/arch/alpha/include/asm/pal.h
> index db2b3b18b34c7..799a64c051984 100644
> --- a/arch/alpha/include/asm/pal.h
> +++ b/arch/alpha/include/asm/pal.h
> @@ -4,7 +4,7 @@
>
>  #include <uapi/asm/pal.h>
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>
>  extern void halt(void) __attribute__((noreturn));
>  #define __halt() __asm__ __volatile__ ("call_pal %0 #halt" : : "i" (PAL_=
halt))
> @@ -183,5 +183,5 @@ qemu_get_vmtime(void)
>         return v0;
>  }
>
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>  #endif /* __ALPHA_PAL_H */
> diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/as=
m/thread_info.h
> index 4a4d00b37986e..98ccbca64984c 100644
> --- a/arch/alpha/include/asm/thread_info.h
> +++ b/arch/alpha/include/asm/thread_info.h
> @@ -4,14 +4,14 @@
>
>  #ifdef __KERNEL__
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  #include <asm/processor.h>
>  #include <asm/types.h>
>  #include <asm/hwrpb.h>
>  #include <asm/sysinfo.h>
>  #endif
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  struct thread_info {
>         struct pcb_struct       pcb;            /* palcode state */
>
> @@ -44,7 +44,7 @@ register struct thread_info *__current_thread_info __as=
m__("$8");
>
>  register unsigned long *current_stack_pointer __asm__ ("$30");
>
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>
>  /* Thread information allocation.  */
>  #define THREAD_SIZE_ORDER 1
> @@ -110,7 +110,7 @@ register unsigned long *current_stack_pointer __asm__=
 ("$30");
>         put_user(res, (int __user *)(value));                           \
>         })
>
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  extern void __save_fpu(void);
>
>  static inline void save_fpu(void)
> --
> 2.51.1
>

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

