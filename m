Return-Path: <linux-kbuild+bounces-4653-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 850A49C4E57
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 06:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173EA1F2606A
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 05:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C472209F2C;
	Tue, 12 Nov 2024 05:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qH4ebDfP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A6D1B86E4
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Nov 2024 05:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731389952; cv=none; b=DsK3oLbI8RR1dY3q5/bqSAQPDBfH5mos1/so+BkHuJojZdqgf0TcxS1/ANXqhOAoH/sqEzDJl4bnP0wpGYE1P7dg5BnbMwQ5zp/cX2lLeZbRETleH8BR1SlbEAZ/mcOtgdwqLhUX0Tzf+j0utGrwIUTUEiBFrs9hKXbq822miZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731389952; c=relaxed/simple;
	bh=uPqiSb8byFUHmsowxYv/8nM0c5ourBGwRMRpZWMY6HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1seALFjnh//LTLyM0wqRi7r9RoEv7ErqK8uaZwz03Cbd9IODBotTYDGID5I4Jj3uObl5xO8hu1kEIRqxmJ/vfxnUhj7oFoIYsfPSy4cv41TrJcQ3V1+sYqvO+z9dVAAnBF3AyNs/LKgHFXgqoLOLAuOYRjDZL/vY6UIZdVg/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qH4ebDfP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c87b0332cso76635ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Nov 2024 21:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731389950; x=1731994750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55eFBaAwUzqb5NuE4EUBIHlElwP7vcU1g64jX0opSSs=;
        b=qH4ebDfP6ijqYgnuViO6dxQZ1g5HT0JMc6WfG7oeyAReFbvJmPewjIBI8zXgjP12n+
         4hR9BaHgXwuLNsunJ7vWkt0k/ogRKxc3zsmX7NVYWuYuZ2JaIM5aLJPd8D78F7JSBQ2X
         MM1Ns9wop/HsMXVq6O3WgJwiLbvoHYqY74xSb2TO9FPOUZ9Q1bXtHQAB73/he06JPma9
         BznC2rCQHEHPJtyUtzRUkYwsf5GpSMDYQeIN2RHOlhciQVSTVJPAAOYyyEEuP2iFV/XK
         1Gd67jbVXblgwcBEyxfrMjiwPyPwPFoNGeoiFcD6BArPXaHGzD7GNKr2grz5bmSL51uP
         VjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731389950; x=1731994750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55eFBaAwUzqb5NuE4EUBIHlElwP7vcU1g64jX0opSSs=;
        b=egg39uolLBFxEdCEbJIYjFnt5fvCpExhvn++m6eHeuP2EH9UyudhHnLULQYMd6/GM6
         ZDl5YRcmqGBNJQIfhmJU4a3WmcwiGz+uj5KpXDmAdESVgtt93fWHj+ITMqHG1ugRPd2+
         iYVaObdqfLPN1YF1cSTU3x3Bp4tnaX4whuunzif8Qn3ksspQSXXJHV3bPTn4GbDiILWO
         W3nywPWOVbuWr+rGHuNBaliuE/3vlvse131lm3xgKAGepUoGrKcaoBA1dHsLTLt1mTpH
         HlDvVmLF714dRp15qfDiHod16vgl+UhjbxAej3cUSGkNFeIcgu+mIBaNlH7yWSWj70nX
         NHrw==
X-Forwarded-Encrypted: i=1; AJvYcCW9gYPtXFWp+aTeAOXIjjkxIQj8DflDP3lVKaDa6Ov+h9CXW+aZ26HdX3Pijm+L0aXzQpxwT4O2PGkOgk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47K2jVLOFl7U2gYzds/zS9fu5Pdhxz2/DKog1LVOtsu2DVojJ
	OCPfQd2WJAGpA44aqVp+4JhaPl+cL/6LcDiqWNiTIgvup5nINvgmGDbiTFIEZBRAlvDMbKbhOIF
	P5qefkEZZes3fcjJbi7BPS/2VmaUGTXLdKHOj
X-Gm-Gg: ASbGncsgFK4OmSGWsccTq3N9Sb31I+AIdN7Rvt3ZovhAObL289g7+2fi6RyCk6qmJnx
	D/HrCboge4wBPcHo0aaRpuR0fvcpFq+Kg1eiyaNNufQhH0YG62IVWY4C8XJk=
X-Google-Smtp-Source: AGHT+IFsphJ8eFdvWIvqWQJAgfm/UGMVMERlMSqtsqzVfe10VnOKJwtxRF+0T1N3Dqc2Vm4wT9mbQhx6mGE7tRGz4Fc=
X-Received: by 2002:a17:902:d2cc:b0:1fc:548f:6533 with SMTP id
 d9443c01a7336-211ace77d55mr809315ad.3.1731389949340; Mon, 11 Nov 2024
 21:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-4-xur@google.com>
 <44193ca7-9d31-4b58-99cc-3300a6ad5289@gmail.com> <CAF1bQ=ShjoEQZGPjDoy_B6wZdD_jr-RevVXwEDPA_-o-Ba0Omg@mail.gmail.com>
 <e7cd2746-0ad8-452f-aa12-e3a37e8a9288@gmail.com> <CAF1bQ=SYeeKLUTfbqw-KH1rHJCj_CfJBuk+mZUrnnb7aDjRV2A@mail.gmail.com>
In-Reply-To: <CAF1bQ=SYeeKLUTfbqw-KH1rHJCj_CfJBuk+mZUrnnb7aDjRV2A@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 11 Nov 2024 21:38:57 -0800
Message-ID: <CAF1bQ=R18HLC2vjCGj+M=VYidrVzz3RT=U8cckXgpgrxc0kG0Q@mail.gmail.com>
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

I compared the System.map files from Klara Modin. The linker script is
doing what I expected: relocating the unlikely executed functions to the
beginning of the .text section.

However, the problem is with the _stext symbol. It belongs to the
.text section, so
it is positioned after the unlikely (or hot) functions. But it really
needs to be
the start of the text section.

I checked all vmlinux.lds.S in arch/, I found that most archs
explicitly assign _stext to the same address as _text, with the
following 3 exceptions:
  arch/sh/kernel/vmlinux.lds.S
  arch/mips/kernel/vmlinux.lds.S
  arch/sparc/kernel/vmlinux.lds.S

Note that we already partially handled arch/sparc/kernel/vmlinux.lds.S
for sparc64.
But we need to handle sparc32 also.

Additionally, the boot/compressed/vmlinux.lds.S also the TEXT_TEXT
template. However,
I presume these files do not generate the .text.unlikely. or
.text.hot.* sections.

I sent the following patch to Klara because I don't have an
environment to build and test.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.=
S
index 9ff55cb80a64..5f130af44247 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -61,6 +61,7 @@ SECTIONS
        /* read-only */
        _text =3D .;      /* Text and read-only data */
        .text : {
+               _stext =3D .;
                TEXT_TEXT
                SCHED_TEXT
                LOCK_TEXT
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

If Klara confirms the fix, I will send the patch for review.

Thanks,

-Rong


On Mon, Nov 11, 2024 at 2:39=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> In the new System.map, we have:
> ffffffff81112400 T _stext
>
> This looks wrong. It should point to the beginning of the text, like
> ffffffff81100400 T _stext
>
> I'll do some debugging on this.
>
> -Rong
>
> On Mon, Nov 11, 2024 at 1:32=E2=80=AFPM Klara Modin <klarasmodin@gmail.co=
m> wrote:
> >
> > On 2024-11-11 21:43, Rong Xu wrote:
> > > Thanks for reporting this issue!
> > >
> > > I'm assuming your kernel build enables dead code elimination and
> > > uses the --ffunction-sections compiler flag. Without this patch, all
> > > the functions
> > > -- I think there are only .text.unlikely.* and .text.* are grouped
> > > together in the
> > > final vmlinux. This patch modifies the linker script to place
> > > .text.unlikely.* functions
> > >   before .text.* functions. I've examined arch/mips/kernel/vmlinux.ld=
s.S, and
> > > haven't found any obvious issue.
> > >
> > > Can you send me the following?
> > > (1) the kernel build command
> > > (2) System.map without the patch
> > > (3) System.map with the patch
> > >
> > > Best regards,
> > >
> > > -Rong
> > >
> > I don't set -ffunction-sections explicitly but it seems to be used when
> > I look at the .cmd files. The build command is nothing fancy, I just se=
t
> > ARCH=3Dmips CROSS_COMPILE=3Dmips64-unknown-linux-gnuabin32- and build w=
ith
> > make -j24.
> >
> > I've attached the System.map, built on next-20241111 as well as it with
> > this series reverted.
> >
> > Regards,
> > Klara Modin

