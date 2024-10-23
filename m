Return-Path: <linux-kbuild+bounces-4272-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F20779AD03D
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61F0284AF5
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73211CCB3A;
	Wed, 23 Oct 2024 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kQPEtFQl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BF61CB326
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700670; cv=none; b=soqCK3qt3wUl/4Lp9iH8lwQXjna8Fz9mc7OC6GZn9DZD6S/dZ2MexFl4EdLd6HVNEy0EUPSuxjbmJEoDwIqStN6tgQAHsy5TUWrS/1vaWveoryHjpCi9nU/3QOlVp4MQRbuQj9yvknFMFAF2Xs94rev0A1ynGp8nSrXvjvsgsKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700670; c=relaxed/simple;
	bh=pVwawjEv+bQna+TOyVmWLFrZU2pYiQZj6lUOy1p+DLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZNpRHaFSRRoE+WS/Zvkl2kv2qvJqSU2xemTuXEF8XDgOWl/nwAQdxrT/1NIoq3sMqaVEn/v0sVfI5eKuKjihyAir4qxzM2NqLsFrcImyu169Z+92V1UOjD0fHGCRCqj00s7XUjwmGfKjGii5d7ZTLfSIPANB9jq1pnZwgUJJkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kQPEtFQl; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-460a8d1a9b7so276541cf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729700668; x=1730305468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K3v255rwxrb6Xkn/WhIR8L6tyWLq3uTtuFWFOaL4e4=;
        b=kQPEtFQl8SVSZOUnfG5nuxQ4FRWblcF9Li/GR4dlNwmIggc4Spvn2H5hUJ8Qlp2tPE
         a/vYjA6ItZZknrkxTivK6qnM5ehJSw5OmKLkWiNM6KYW151lVRDDjFZ/2woJLJv+x7p2
         idAcUHirNNCEMW8wC5YutkquXsN02K5BPx5SKiI1ukolxSp8yPkOUstmeT4bqckG+5dx
         TKYPFhAeLalIvPJVqEetPLXovB6+hYR/1oxDVd+4A7COaogF2l3uwQ/udLV0y564pSmi
         g2Q/wY8TUuXs5hvJ2ZPFLjIa38T646MDsnmMWPQ0lZWgMQ4uJO767Ms2mtw1mEQh5rPD
         QzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700668; x=1730305468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3K3v255rwxrb6Xkn/WhIR8L6tyWLq3uTtuFWFOaL4e4=;
        b=WRuXKaJWVgK541IEpp2eBNUsNObM9Bi3JFvsUlpA5qWZOOFD+txOtFOBdOqQMmvSIM
         Fi0ssDfD4pvbHlpi4/B83lnyuXCpxMjqubFM3CShyEa9gFUc8gpfiQ15QPwnn7xipPx8
         fPajhMko313et9K+LlhNqAp4+u+uA8FVBQP9Qe1nix1fsxPv6t1POfJAm6xQZCKTK9A2
         adnloegJnQqE9bDtrX8qYRGytmPIMbV5fKA7wYknWBYWPmNfsJnFDf9oGjVdy+XdSx8p
         rJaOAJb4y8/GsCtcRkz+9cg6qdIPLzCZJ3iWYo6HnI/2J7DWe8RMziSdgmYhLMGnz6Fh
         11sQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1OgJkcDR2OP93tOyCjUmdmsJQaACIW59OfdIgeYSZnzJkg3TnbA7UPPEyLWB6jml7Z1gOZvRu5jJkhf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySN4bLIPn+HRPG4hCGHOsve166R0eN2F6otU2MGsVTdrDhth4b
	iAW2bqvFr6TR1bqDlv+rAJWxWGjGL01Ea3Lu5p4SsqCQE8zcpsyzePrETi15j58IQ/KJerRntG0
	ye0G3bR5h+PSIPkUO0dHV0acCP2bAp+ygWqJm
X-Google-Smtp-Source: AGHT+IH2imFVE/wFvhmVSrl3gRKWK7JMCBWJZCpQm7LLKLkfCbOmNxarfGKGqSg3+1hZSos8edhUHSKaLAIboEsXkAs=
X-Received: by 2002:a05:622a:56:b0:460:49fd:6db0 with SMTP id
 d75a77b69052e-4612220c175mr534981cf.29.1729700667272; Wed, 23 Oct 2024
 09:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-6-xur@google.com>
 <CAK7LNAQ0RwJYkCXHj8QMH3sqXgY2LBTiYV8HnKD8oANB8Bb+Yg@mail.gmail.com>
 <CAF1bQ=RuLmO9S1W6ofmgVQZR7pBqR3iN7gCuUO2TkwGQwM76Kw@mail.gmail.com> <CAK7LNASB8WZACuQyQQWvjfODTHTrPrbWBNrP0nsMQkQhDr+Pug@mail.gmail.com>
In-Reply-To: <CAK7LNASB8WZACuQyQQWvjfODTHTrPrbWBNrP0nsMQkQhDr+Pug@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 23 Oct 2024 09:24:15 -0700
Message-ID: <CAF1bQ=Q78Xr-ByjOYVVinCHtqSaMyVfHjHWgvPqN7+j3XTyGuA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] AutoFDO: Enable machine function split
 optimization for AutoFDO
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:50=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Tue, Oct 22, 2024 at 8:28=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > On Sun, Oct 20, 2024 at 8:18=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Tue, Oct 15, 2024 at 6:33=E2=80=AFAM Rong Xu <xur@google.com> wrot=
e:
> > > >
> > > > Enable the machine function split optimization for AutoFDO in Clang=
.
> > > >
> > > > Machine function split (MFS) is a pass in the Clang compiler that
> > > > splits a function into hot and cold parts. The linker groups all
> > > > cold blocks across functions together. This decreases hot code
> > > > fragmentation and improves iCache and iTLB utilization.
> > > >
> > > > MFS requires a profile so this is enabled only for the AutoFDO buil=
ds.
> > > >
> > > > Co-developed-by: Han Shen <shenhan@google.com>
> > > > Signed-off-by: Han Shen <shenhan@google.com>
> > > > Signed-off-by: Rong Xu <xur@google.com>
> > > > Suggested-by: Sriraman Tallam <tmsriram@google.com>
> > > > Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
> > > > ---
> > > >  include/asm-generic/vmlinux.lds.h | 6 ++++++
> > > >  scripts/Makefile.autofdo          | 2 ++
> > > >  2 files changed, 8 insertions(+)
> > > >
> > > > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generi=
c/vmlinux.lds.h
> > > > index ace617d1af9b..20e46c0917db 100644
> > > > --- a/include/asm-generic/vmlinux.lds.h
> > > > +++ b/include/asm-generic/vmlinux.lds.h
> > > > @@ -565,9 +565,14 @@ defined(CONFIG_AUTOFDO_CLANG)
> > > >                 __unlikely_text_start =3D .;                       =
       \
> > > >                 *(.text.unlikely .text.unlikely.*)                 =
     \
> > > >                 __unlikely_text_end =3D .;
> > > > +#define TEXT_SPLIT                                                =
     \
> > > > +               __split_text_start =3D .;                          =
       \
> > > > +               *(.text.split .text.split.[0-9a-zA-Z_]*)           =
     \
> > > > +               __split_text_end =3D .;
> > > >  #else
> > > >  #define TEXT_HOT *(.text.hot .text.hot.*)
> > > >  #define TEXT_UNLIKELY *(.text.unlikely .text.unlikely.*)
> > > > +#define TEXT_SPLIT
> > > >  #endif
> > >
> > >
> > > Why conditional?
> >
> > The condition is to ensure that we don't change the default kernel
> > build by any means.
> > The new code will introduce a few new symbols.
>
>
> Same.
>
> Adding two __split_text_start and __split_text_end markers
> do not affect anything. It just increases the kallsyms table slightly.
>
> You can do it unconditionally.

Got it.

>
>
>
> >
> > >
> > >
> > > Where are __unlikely_text_start and __unlikely_text_end used?
> >
> > These new symbols are currently unreferenced within the kernel source t=
ree.
> > However, they provide a valuable means of identifying hot and cold
> > sections of text,
> > and how large they are. I think they are useful information.
>
>
> Should be explained in the commit description.

Will explain the commit message.

>
>
>
> --
> Best Regards
> Masahiro Yamada

