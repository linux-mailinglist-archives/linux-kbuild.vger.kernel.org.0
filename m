Return-Path: <linux-kbuild+bounces-3894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4576498F5DB
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 20:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6745D1C21A90
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 18:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25051AB500;
	Thu,  3 Oct 2024 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2HsVzdta"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525261A705F
	for <linux-kbuild@vger.kernel.org>; Thu,  3 Oct 2024 18:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727979146; cv=none; b=sX7FBOucY4is9AVDifxnQRuVV6euGM8TTIzf9x5SJxULpfIplj8cQxWI+Tf3+2vF7m9AYoxQKLFy1mh9AkaTCv2C0ApwPfmwsGFq1YMw2KNHXnIcwtRSz3EzSta3vZ3F0xo7pAV1l/xNE3jA5vZh8FD1AsYCO2r9NGJvMRGncH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727979146; c=relaxed/simple;
	bh=5a2tijohiLVme4B81WJKwbCbxlmvbAe8DVOHQqZRmVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGitM2WoWS97ifHQygQKBiaFztM2mqWShlrW1E8k7xfktYvr58vzhSK79bnaS/QDVbcPjlSjGotNjQ3o0U3mMKSnHRSTGJlBKqR694gqGaMh1L/ZTnq9slhOOhPbhXACx8UuO73VsUGKrHeCIm5cUhcJRQ/4/Reg3ZGVXP/wcw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2HsVzdta; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20b40c7fd8eso25135ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Oct 2024 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727979145; x=1728583945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syNQyjz3hsStKfZP5tLeqIERuCdmwlRMJEaOyM/R5+k=;
        b=2HsVzdtalQm463KtDqrTPgIaa/Gbl/w/KTlTyADp9NyEKSDLqXzU1+OloFQnKMjbze
         l/rcXhl71sOAkYxGjydZIO/V3pbGTkwniD6VsH8EkWgrrr4LqCtlwBntH7k/pk4v8a4F
         OLaiaWOgj6DfDis5EWthmt5fjk7qLVZ7BbdReZFdSCRqK6j1xFJznD3VYq5BmXSqU7bV
         x0wXUqxUdoPtRh68oTIqXeyYilp6E2p6Nnbz0xpv/JCguU3X3YZUdV3k3ucFmOgAZQ9T
         XjrCVFwdwF48BqD4guaUiCiTuOv2bQLfxN1q96PNVt88SNVHJH8yQlEHvMv5cdgFb3mC
         allg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727979145; x=1728583945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syNQyjz3hsStKfZP5tLeqIERuCdmwlRMJEaOyM/R5+k=;
        b=th/YsgZWwJ6wXbxcVgdD9tMx3ewUm5n5ia1afcsTOkOYDZj3ft/Wp43NGU42WQMKD3
         p2wi/YBVL8qn7xrSzh0i78XlKwYRQrK9Vc+Cbb61zoYu6j/0V5CLPKbKhQFsKTTtRIlR
         GWC4nTLdlLX9mvpLWUWDgZIn10NbKJMAL7Gg7pU0N8PBS76WFV4Gc76bbgUY2IbfMheU
         jZt+0hFc51Mvvh4fxb2xX0iVRJ4WYF6STO+U/N5CuKVq1NFemJgSHzRJDPkmrSqESSrV
         72EXTo97R0/lGKUBtURt26MrHz42JrqRi/6v1r2VuinAiaAO8V5CBxcn+svkL7b+9BvT
         gAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8bo5YDFmvlsSA3qs4LRZiJzf15QwLUt9LTHeKS+xquevuvAAaEi6kFQPePfY0/fTY5TIkg7uA/d83x6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFMSSw7oqatWe48nUPbTG3K87Rvzh81J1OW50STHsBCXxGMnXn
	yKshtwIPHvmxUkl3NniyKxSpeQRTmO4NYNForTGEiglFjPsHLvoWHTy2lCQ6dJl5WjJ5hGuiAdq
	CLiNsXjZQpZqxZ1QaGDANRIYIzlj/w6wv1okO
X-Google-Smtp-Source: AGHT+IH5yghVliv8i5uMVnyYn/6sNZ6wwE1O58ua+GMRxVeV0bDpveNuEgjNhVoacK3O8EaGvYqh0OWpeboBBbQa/co=
X-Received: by 2002:a17:902:f681:b0:20b:a6f5:2770 with SMTP id
 d9443c01a7336-20bff35cf7amr46035ad.6.1727979144391; Thu, 03 Oct 2024 11:12:24
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-4-xur@google.com>
 <20241003154320.GX5594@noisy.programming.kicks-ass.net>
In-Reply-To: <20241003154320.GX5594@noisy.programming.kicks-ass.net>
From: Rong Xu <xur@google.com>
Date: Thu, 3 Oct 2024 11:12:10 -0700
Message-ID: <CAF1bQ=TTfjh1UukJNZ2bbovagXFmS3i78=ALwDt+qfVe3wr7Vg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] Change the symbols order when --ffuntion-sections
 is enabled
To: Peter Zijlstra <peterz@infradead.org>
Cc: Han Shen <shenhan@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	David Li <davidxl@google.com>, Krzysztof Pszeniczny <kpszeniczny@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, x86@kernel.org, 
	"Xin Li (Intel)" <xin@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In principle, I don't see a problem using the new order unconditionally.

This new ordering of sections (.text.unlikely, .text.hot, then .text)
differs from the typical user-space ordering when no link-script is
used. Usually, the order is .text, .text.hot, and then .text.unlikely
(when -z keep-text-section-prefix is used).

However, for normal kernel builds that don't use FDO (iFDO and
AutoFDO), this change has minimal impact. This is because the
.text.unlikely section is very small, containing only functions
specifically annotated as cold by the user.

When using FDO, either with iFDO or AutoFDO, this new section ordering
(.text.unlikely, .text.hot, then .text) should be used. These builds
should enable -ffunction-sections and use the new order for
function-level grouping.

This new ordering also affects the placement of ASan and TSan code.
While I expect that this change won't cause issues for them, sanitizer
developers should confirm this.

We've tested this new ordering with iFDO (PGO), AutoFDO, and standard
non-FDO builds. But I think more extensive testing is needed before
using it unconditionally.

-Rong

On Thu, Oct 3, 2024 at 8:43=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Wed, Oct 02, 2024 at 04:34:02PM -0700, Rong Xu wrote:
> > When the -ffunction-sections compiler option is enabled, each function
> > is placed in a separate section named .text.function_name rather than
> > putting all functions in a single .text section.
> >
> > However, using -function-sections can cause problems with the
> > linker script. The comments included in include/asm-generic/vmlinux.lds=
.h
> > note these issues.:
> >   =E2=80=9CTEXT_MAIN here will match .text.fixup and .text.unlikely if =
dead
> >    code elimination is enabled, so these sections should be converted
> >    to use ".." first.=E2=80=9D
> >
> > It is unclear whether there is a straightforward method for converting
> > a suffix to "..". This patch modifies the order of subsections within t=
he
> > text output section when the -ffunction-sections flag is enabled.
> > Specifically, it repositions sections with certain fixed patterns (for
> > example .text.unlikely) before TEXT_MAIN, ensuring that they are groupe=
d
> > and matched together.
> >
> > Note that the limitation arises because the linker script employs glob
> > patterns instead of regular expressions for string matching. While ther=
e
> > is a method to maintain the current order using complex patterns, this
> > significantly complicates the pattern and increases the likelihood of
> > errors.
>
> Is there a down-side to using the new order unconditionally?

