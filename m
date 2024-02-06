Return-Path: <linux-kbuild+bounces-848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62984B331
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Feb 2024 12:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 372FE1C240DC
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Feb 2024 11:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7854A12E1DC;
	Tue,  6 Feb 2024 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vq4Z37rB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEBD131730
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Feb 2024 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707217760; cv=none; b=h4f8CdlmnHPGbTMES1fsCk1inNCMU325dK637f+H/JjS72yU6w+jmkRvRfmu6nRL+34fqU9mzhD9Q4JAk61AHdFwvmJQxVYMkGaWnMbiYk7o7xHvw2IMhKI9tLWI1AiSft9Hx9oikbtQFSFUSQDYiIFPfbY4yEpfEGnzwOmpKI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707217760; c=relaxed/simple;
	bh=I88T9DtBs60ZimAuUeMEtUlCdBG0kCHidolckOt/nWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIW0OoAbpjPJH4ELAGTeRa4MX7JKd7u+jFPhBK+a22C4kLib5pnd4LgXRj06ccjzv73SBdM4kkOMEbzbGT4H80zxZDv5prqtRq1LesV1+5Db14d5u/5I9hyclXl4Q3ISQuF+H8dVWh2AbWhSiwGxYMUynhMAHFx5tBTGI8qv0zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vq4Z37rB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d958e0d73dso3924865ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2024 03:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707217758; x=1707822558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OK82JrlJXMGwOCPdhn7BsC/hEWZwW73rbUs1KIvU8rY=;
        b=Vq4Z37rBi7PL1kQKcFf5EBnXkTg86f0AJmrk8NUN+WFmvNSwKyZyerIbB9plgJatLB
         jPx14d6FO390Lryg6xenrONBlC9PM6QNUWzxXIrTNJQPtrQjI9WBXVm0+7CQQm1eurx7
         PW6Hn9cNE5IliOA0uQuEI/mRydkzsb+8mJFUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707217758; x=1707822558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OK82JrlJXMGwOCPdhn7BsC/hEWZwW73rbUs1KIvU8rY=;
        b=JNlVKtOqHV12ANGErrGuaeYzl8bBlKFlfXm5EWL3XNSrslTJ21/XqiZ0TRh/xs+QgM
         IZB7XcVk1vv++FYGG0mGHawds6d1QiycJxQdCpQPD+wEWNymZhSrF0Jd9+FC/o16Xpca
         js38zCsdC9Bq2WI3R4f6nNZF7+mP/xknChM5dM/le6XDaS5OLn/TY9+1EpHqnaThXlnH
         wMbLMUAbxqZbvUEvqJSGlcmTAC62a7xZqaoqXYOurW4Rv7X2oBAXbv0pj1sn7Y22eL7q
         YgWfOQoGAUvhZ7oWivGBr/rcfuan4UoqKjRtgM63y1burt0iaD4LovWWkJjZ29EDJeHK
         Wo+w==
X-Gm-Message-State: AOJu0Yw200pvhUljDEM5ylF+mbEvnq/vPeNSyIEJUUOKUktGkoCrySp6
	OW7NcpXI3TILijk1NuLwTvmUSVAjY1Na1a3bJAFgt9nwdK0D9Bg+pv3H10oUPw==
X-Google-Smtp-Source: AGHT+IFZOORfXrMbTTsX7WOw0KRZQzimHM7fgRlgvyzAFriEdNiFMl7FCCdJQtXf34fHOtXX6s7WRw==
X-Received: by 2002:a17:903:25d4:b0:1d9:803a:8b0b with SMTP id jc20-20020a17090325d400b001d9803a8b0bmr1488044plb.33.1707217758211;
        Tue, 06 Feb 2024 03:09:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWD41BFbjj/gA9nr3hzGLWEWc28wGikJIa+U3DfYEG0+mhZav6ryva2TaZi/PuT+gDRDu3oPFfGLLauKK2I3iwCMOOkLmbqbllaBeIcb7Jfztp+AIIejdbl7TaDPuKZyAJU3Zi5oI6VCIuOR0uSOxs55kiSlmmhTdpw4iWIbnlbmzKnAeeNTRVdyMD7WLOMTJAfzFjLt4dlDx2gWwQ0SSli+08lhSJDOfaZFkSyqEAt9idPS4K9IBA0bgPei7tlmp98i5xFYyFtsvuMAFsnGwbcitjdhkSk+JjhPwTXPc+Cak+xGP930Q9GxgzYqvrScLmRHHswhkoOXiHfz4WS4FJoAGCXIak+7iFyl0/WnvOkBBnM3i6klYaN+gxVw2oLmoaLby9mJ7FioFHl3o/t9zZ+56J3jOuURB9oveQrlghN2XOHfRIUQQik1XssosFvbH2oCK4J8AIOnScjPQLuVjEoogGC0ZFii3Y9DUS2TkzP3HEy2L0NKH9YVD7LfyD6xOJJw93kac5+ZT1HEJ3MaTAhCkQKaaY/KQ8THpgBgZI=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c14500b001d9557f6c04sm1567758plj.267.2024.02.06.03.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 03:09:17 -0800 (PST)
Date: Tue, 6 Feb 2024 03:09:17 -0800
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Hao Luo <haoluo@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3] ubsan: Reintroduce signed overflow sanitizer
Message-ID: <202402060308.0FF75100@keescook>
References: <20240205093725.make.582-kees@kernel.org>
 <67a842ad-b900-4c63-afcb-63455934f727@gmail.com>
 <202402050457.0B4D90B1A@keescook>
 <CANpmjNMiMuUPPPeOvL76V9O-amx9uyKZYtOf5Q2b73v8O_xHWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNMiMuUPPPeOvL76V9O-amx9uyKZYtOf5Q2b73v8O_xHWw@mail.gmail.com>

On Mon, Feb 05, 2024 at 02:10:26PM +0100, Marco Elver wrote:
> On Mon, 5 Feb 2024 at 13:59, Kees Cook <keescook@chromium.org> wrote:
> >
> > On Mon, Feb 05, 2024 at 01:54:24PM +0100, Andrey Ryabinin wrote:
> > >
> > >
> > > On 2/5/24 10:37, Kees Cook wrote:
> > >
> > > > ---
> > > >  include/linux/compiler_types.h |  9 ++++-
> > > >  lib/Kconfig.ubsan              | 14 +++++++
> > > >  lib/test_ubsan.c               | 37 ++++++++++++++++++
> > > >  lib/ubsan.c                    | 68 ++++++++++++++++++++++++++++++++++
> > > >  lib/ubsan.h                    |  4 ++
> > > >  scripts/Makefile.lib           |  3 ++
> > > >  scripts/Makefile.ubsan         |  3 ++
> > > >  7 files changed, 137 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> > > > index 6f1ca49306d2..ee9d272008a5 100644
> > > > --- a/include/linux/compiler_types.h
> > > > +++ b/include/linux/compiler_types.h
> > > > @@ -282,11 +282,18 @@ struct ftrace_likely_data {
> > > >  #define __no_sanitize_or_inline __always_inline
> > > >  #endif
> > > >
> > > > +/* Do not trap wrapping arithmetic within an annotated function. */
> > > > +#ifdef CONFIG_UBSAN_SIGNED_WRAP
> > > > +# define __signed_wrap __attribute__((no_sanitize("signed-integer-overflow")))
> > > > +#else
> > > > +# define __signed_wrap
> > > > +#endif
> > > > +
> > > >  /* Section for code which can't be instrumented at all */
> > > >  #define __noinstr_section(section)                                 \
> > > >     noinline notrace __attribute((__section__(section)))            \
> > > >     __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage \
> > > > -   __no_sanitize_memory
> > > > +   __no_sanitize_memory __signed_wrap
> > > >
> > >
> > > Given this disables all kinds of code instrumentations,
> > > shouldn't we just add __no_sanitize_undefined here?
> >
> > Yeah, that's a very good point.
> >
> > > I suspect that ubsan's instrumentation usually doesn't cause problems
> > > because it calls __ubsan_* functions with all heavy stuff (printk, locks etc)
> > > only if code has an UB. So the answer to the question above depends on
> > > whether we want to ignore UBs in "noinstr" code or to get some weird side effect,
> > > possibly without proper UBSAN report in dmesg.
> >
> > I think my preference would be to fail safe (i.e. leave in the
> > instrumentation), but the intent of noinstr is pretty clear. :P I wonder
> > if, instead, we could adjust objtool to yell about cases where calls are
> > made in noinstr functions (like it does for UACCESS)... maybe it already
> > does?
> 
> It already does, see CONFIG_NOINSTR_VALIDATION (yes by default on x86).

This is actually a reason to not include the ubsan disabling in
__noinstr_section just to see what ends up in there so we can fix it
immediately....

-- 
Kees Cook

