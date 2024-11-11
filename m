Return-Path: <linux-kbuild+bounces-4646-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B99C4718
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 21:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86A5E28C673
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 20:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F4C1B5338;
	Mon, 11 Nov 2024 20:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="th4JP1D9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81811AFB35
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Nov 2024 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731357850; cv=none; b=e+q4t7BbFvfjVnACfZq/bdOM6YvF9VElyz9yRaqIQ4qyBW7D0M5YdgAE3IEDsENae8paAcKRH1Tm0e90dFxVNGW6Cui2PNO8DqAWVviLH6uplD/9H/qQYGdlMWcS45cCB8yFmvaOQyEmgaCS7JGLtg56LuqVN2XF6bjaVv710WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731357850; c=relaxed/simple;
	bh=pu1bE2oQyz4PIzvOKsfMnSgcPR/vFs7LU5lLf0wlKVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+ZbuA4LiwJWZJk3LBAn2ULW2enYQ+sEx/5sMeFUcQj7MzkIMKXOaMFJwA/hu+V9mAJCDuLft6dg3jK8eUZfUf58mm7exnABcx3pAgBSuObZXct7HuGwADDRcyMJc540JOrFPvOmYAryeAJOoG0A95luQnW2wcBDTuCZaiaLD0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=th4JP1D9; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-460a8d1a9b7so1531cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Nov 2024 12:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731357847; x=1731962647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJ6uFcLfCmrIfQWM4xw2qYGBJMJQRq1denWE0S9O56A=;
        b=th4JP1D92CK3cfrjBEFzfpzxnrBrwJZUBTJIbHXzUfJkZ5RmdqnaEnn+3K2ZvNLqgs
         qIIr9Yos1Y8AxPSEJCov1/XvepIiV2VZqbMykG2K3XF7pK3pK/7wYXHBqrYHX9/hkMZI
         Jb0krIPMLBExfk3O6+Jgj0vVk/61RghT0qh8e42Mz033A/k3DaWdTAvZDVs131T/ZLrD
         kvTMZhmeIDKunUCd1VqnGp6t0zvRAk9QHiUFaRPHYuDBL3kEJooHwZFEKrguq4PLkNBi
         B0vbK/mloWngKj8P4pPBx53Exj761aTLx4+FOLhKsQ+bet60Tcid9Uu2JTfvizeEI+jl
         uIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731357847; x=1731962647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJ6uFcLfCmrIfQWM4xw2qYGBJMJQRq1denWE0S9O56A=;
        b=OxzyoiGofn1rPrKvoGU19HPVZ0RGzzmEX1NkUKIZWDNxCgKPyCSg5BqhTk1mNHhxX2
         8GM6uDV1oBPRph1yAypXNEeyX7gMo+3+7x3TrL5CGcU3WmpwCV0Paqz/I56bunUOhJ6y
         0t9npmb/IqIaoRZ+eJHDQZXe58bFUJrGxZX/vf2gzwHFmMxMRvFSULFcMfpsKmiOVuYL
         20LZ7eGNsGJReV2HdckNy7tTKBRGk1jF0qhpzBAj4gjJMGnsGHKrjYI49ZpdJhtYBplb
         UE0DSVTOC36038f8HeS4mk3+1ZBtt8e0x0HuZ7ZBSoHqD/uy5M1bO/xebXUv+yE8czqT
         GvBg==
X-Forwarded-Encrypted: i=1; AJvYcCX/MgLa3V4cjHZEBGIueTFwn/TWnJMv0XK09OoUot9VX3qlgZwrkvrNgRut75btpEzM2yh7cnHcdk7qiyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7H8DQ0aAeH+iX3EdoZdiGvS2QItfiac68WjwN7DGqZmfcgtSy
	YW5oLwRghLd01KXlzybQINrBJApIvB0xUCmkUqNFRZJYdT3MsP1V2V9gd9AdSFGh96oSE4MsWec
	l2rz1Eq3jvuqoWOwkEyed/QGXHoLa3nekMIu7
X-Gm-Gg: ASbGncv8lbwPTZTg37q3CSpry4dJvGsmy2WHz5YI8V8FhJu01XOi/GnSsh/NAQTAgcv
	qpOs0hawUeqByGUKoRcFf9DFSFVbHqbbrNSMugrhkRe4jXWCoMXdlA6JnDMNiMA==
X-Google-Smtp-Source: AGHT+IHN/VTkEzYYSUDWzDF6ttzYMfgpvSZeOr4oSBlM+xWBr13kyerRjwvS3iVYPd8P6qhTDE91E+q+P0S+4DZZ1Yw=
X-Received: by 2002:ac8:57cb:0:b0:462:c961:ab88 with SMTP id
 d75a77b69052e-4633f2ba6b3mr499291cf.13.1731357846333; Mon, 11 Nov 2024
 12:44:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-4-xur@google.com>
 <44193ca7-9d31-4b58-99cc-3300a6ad5289@gmail.com>
In-Reply-To: <44193ca7-9d31-4b58-99cc-3300a6ad5289@gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 11 Nov 2024 12:43:54 -0800
Message-ID: <CAF1bQ=ShjoEQZGPjDoy_B6wZdD_jr-RevVXwEDPA_-o-Ba0Omg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] Adjust symbol ordering in text output section
To: Klara Modin <klarasmodin@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Maksim Panchenko <max4bolt@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Yabin Cui <yabinc@google.com>, Krzysztof Pszeniczny <kpszeniczny@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, Stephane Eranian <eranian@google.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for reporting this issue!

I'm assuming your kernel build enables dead code elimination and
uses the --ffunction-sections compiler flag. Without this patch, all
the functions
-- I think there are only .text.unlikely.* and .text.* are grouped
together in the
final vmlinux. This patch modifies the linker script to place
.text.unlikely.* functions
 before .text.* functions. I've examined arch/mips/kernel/vmlinux.lds.S, an=
d
haven't found any obvious issue.

Can you send me the following?
(1) the kernel build command
(2) System.map without the patch
(3) System.map with the patch

Best regards,

-Rong

On Sat, Nov 9, 2024 at 7:39=E2=80=AFAM Klara Modin <klarasmodin@gmail.com> =
wrote:
>
> Hi,
>
> On 2024-10-26 07:14, Rong Xu wrote:
> > When the -ffunction-sections compiler option is enabled, each function
> > is placed in a separate section named .text.function_name rather than
> > putting all functions in a single .text section.
> >
> > However, using -function-sections can cause problems with the
> > linker script. The comments included in include/asm-generic/vmlinux.lds=
.h
> > note these issues.:
> >    =E2=80=9CTEXT_MAIN here will match .text.fixup and .text.unlikely if=
 dead
> >     code elimination is enabled, so these sections should be converted
> >     to use ".." first.=E2=80=9D
> >
> > It is unclear whether there is a straightforward method for converting
> > a suffix to "..".
> >
> > This patch modifies the order of subsections within the text output
> > section. Specifically, it repositions sections with certain fixed patte=
rns
> > (for example .text.unlikely) before TEXT_MAIN, ensuring that they are
> > grouped and matched together. It also places .text.hot section at the
> > beginning of a page to help the TLB performance.
> >
> > Note that the limitation arises because the linker script employs glob
> > patterns instead of regular expressions for string matching. While ther=
e
> > is a method to maintain the current order using complex patterns, this
> > significantly complicates the pattern and increases the likelihood of
> > errors.
> >
> > This patch also changes vmlinux.lds.S for the sparc64 architecture to
> > accommodate specific symbol placement requirements.
>
> With this patch (622240ea8d71a75055399fd4b3cc2b190e44d2e2 in
> next-20241108) my Edgerouter 6P hangs on boot (Cavium Octeon III,
> mips64, running in big endian). It's using device tree passed from the
> vendored u-boot (attached in case it's relevant).
>
> Disabling dead code elimination does not fix the issue.
>
> Please let me know if there's anything else you need.
>
> Regards,
> Klara Modin
>
> >
> > Co-developed-by: Han Shen <shenhan@google.com>
> > Signed-off-by: Han Shen <shenhan@google.com>
> > Signed-off-by: Rong Xu <xur@google.com>
> > Suggested-by: Sriraman Tallam <tmsriram@google.com>
> > Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
> > Tested-by: Yonghong Song <yonghong.song@linux.dev>
> > Tested-by: Yabin Cui <yabinc@google.com>
> > Change-Id: I5202d40bc7e24f93c2bfb2f0d987e9dc57dec1b1
> > ---
> >   arch/sparc/kernel/vmlinux.lds.S   |  5 +++++
> >   include/asm-generic/vmlinux.lds.h | 19 ++++++++++++-------
> >   2 files changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/sparc/kernel/vmlinux.lds.S b/arch/sparc/kernel/vmlinu=
x.lds.S
> > index d317a843f7ea9..f1b86eb303404 100644
> > --- a/arch/sparc/kernel/vmlinux.lds.S
> > +++ b/arch/sparc/kernel/vmlinux.lds.S
> > @@ -48,6 +48,11 @@ SECTIONS
> >       {
> >               _text =3D .;
> >               HEAD_TEXT
> > +             ALIGN_FUNCTION();
> > +#ifdef CONFIG_SPARC64
> > +             /* Match text section symbols in head_64.S first */
> > +             *head_64.o(.text)
> > +#endif
> >               TEXT_TEXT
> >               SCHED_TEXT
> >               LOCK_TEXT
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vm=
linux.lds.h
> > index eeadbaeccf88b..fd901951549c0 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -553,19 +553,24 @@
> >    * .text section. Map to function alignment to avoid address changes
> >    * during second ld run in second ld pass when generating System.map
> >    *
> > - * TEXT_MAIN here will match .text.fixup and .text.unlikely if dead
> > - * code elimination is enabled, so these sections should be converted
> > - * to use ".." first.
> > + * TEXT_MAIN here will match symbols with a fixed pattern (for example=
,
> > + * .text.hot or .text.unlikely) if dead code elimination or
> > + * function-section is enabled. Match these symbols first before
> > + * TEXT_MAIN to ensure they are grouped together.
> > + *
> > + * Also placing .text.hot section at the beginning of a page, this
> > + * would help the TLB performance.
> >    */
> >   #define TEXT_TEXT                                                   \
> >               ALIGN_FUNCTION();                                       \
> > +             *(.text.asan.* .text.tsan.*)                            \
> > +             *(.text.unknown .text.unknown.*)                        \
> > +             *(.text.unlikely .text.unlikely.*)                      \
> > +             . =3D ALIGN(PAGE_SIZE);                                  =
 \
> >               *(.text.hot .text.hot.*)                                \
> >               *(TEXT_MAIN .text.fixup)                                \
> > -             *(.text.unlikely .text.unlikely.*)                      \
> > -             *(.text.unknown .text.unknown.*)                        \
> >               NOINSTR_TEXT                                            \
> > -             *(.ref.text)                                            \
> > -             *(.text.asan.* .text.tsan.*)
> > +             *(.ref.text)
> >
> >
> >   /* sched.text is aling to function alignment to secure we have same

