Return-Path: <linux-kbuild+bounces-831-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6017C849B73
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Feb 2024 14:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC6AA1F23E02
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Feb 2024 13:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A221CD08;
	Mon,  5 Feb 2024 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bBdQmjDS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E343522EE0
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Feb 2024 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707138666; cv=none; b=FqiVp0TO0OF8+K2T8Yc6OfAIvYMJb4CBqrq8bhtWIhcMTKZtGCpcpOG0hul3og4avglzU5PfIFuO1S4OJvBwHwbAGVfUCg1OP26FJqxM/f/EmEMlMYwSVu+epIIC/gHASOjkY9RW3qoKqUXZfaGjX4eJSqewTYStPTi9404NlqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707138666; c=relaxed/simple;
	bh=8xEKAj/aIXoAnef6WCYeb1etalNTieAd05i+DkQi20o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5zVQYw6j77JQ5prIkyJQ3VilT4l7kLjoSGAijNWWnC2NEAWeLdnrJzj+DJt6LNfN6GnSHmhblavck8XpztrJAL9e8ym7scNrE+qNjMfY7xnyP+yqpwLub7HYnYTG9upqVPLApKw5hQuYY0yclcQTPUoEIH8m3RZi6jq1ygAy7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bBdQmjDS; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7d5bbbe5844so1902477241.0
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Feb 2024 05:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707138663; x=1707743463; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kgO66v67ga2hZ/fa1VFxPxUYTn/f70qrUJZfQyHF9yA=;
        b=bBdQmjDSnnkWD5f1QtQfnNPLrvNXSidpvjrE8+RIApgvH2HKizXXrMUh00mjc8DvCt
         0uWD3IiASEdE+OaouQPasLRBYGy7GPQS4VFIulh9aa7qBIGAlYT0lhbkaztXGVQmoi95
         nH3VQDKDQ45KtC9Q0GoNsinbGjpAIOT5KLcUVQTUSynRcODRAvBReUkh5EfK0isEGbC0
         ss1WFU3SRdB3YxF2LjxnnAbHp9a9cThGow+xNeDPZHBohqIHlQq8Ix0wlQdzjhzGOzsW
         dUSMCivz48FGXUHIAKWnF87ayITJSgWEyzxtoJwacYBDZZhKUvjPFWVpWfewdGzsh6qt
         BZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707138663; x=1707743463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgO66v67ga2hZ/fa1VFxPxUYTn/f70qrUJZfQyHF9yA=;
        b=QD5IuZO7nnBSqFgxG8N+fQ5LLdzbGct72sZRh09obqfhu96FObPUjhRUSfiOrKdntR
         VSHD51ezmeh1tDgHP5VrXuxQTrcfQHt99SilpIj8RdUuyC16bvPyd0UU2sJ9tR01TA5i
         37flIb862z4HUFS1gq7G4YHaicv4iTjHnmqIW1SPYJXlUjs6T5Kzu3YK5+QU1pDYJtPu
         6yI2r6Md8qkSUpyhqqYj3Ftw8sUGGXM2ilGPHJ+5gglT/PNAu7ryX3YxFVU7PCXWeIdv
         2XhzehEhKH5NpD9LkYJ7VKfPj87mOCkV9fb68GkQA7yl/zMIKELJ0+F6onVMVo3K9dRw
         bbdA==
X-Gm-Message-State: AOJu0Yzqkxh320QvuN3q6qYvnq9pYRI2t9knEAuxmCuoSc84def2R+cL
	P7iIn1Efw8Ii+a3IY5MIuKjGkztp/xua5yITBxDnd3Az8HaB7qFQnW+BSjjWNDDvv78PIHk6DGq
	iu7Vyj7Z8/TARwpfunGTi58VMuEe3PXPpWmGq
X-Google-Smtp-Source: AGHT+IGvWhOgVq5Sybn9CKaxdFweO8fp2yqczsb5Bclf6Z7TT13n+R/qBMPNOqS9yiUPSbnFy6IPYHjqSKy05FWL5Oc=
X-Received: by 2002:a05:6122:4d14:b0:4c0:1cc8:8819 with SMTP id
 fi20-20020a0561224d1400b004c01cc88819mr2759261vkb.5.1707138662522; Mon, 05
 Feb 2024 05:11:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205093725.make.582-kees@kernel.org> <67a842ad-b900-4c63-afcb-63455934f727@gmail.com>
 <202402050457.0B4D90B1A@keescook>
In-Reply-To: <202402050457.0B4D90B1A@keescook>
From: Marco Elver <elver@google.com>
Date: Mon, 5 Feb 2024 14:10:26 +0100
Message-ID: <CANpmjNMiMuUPPPeOvL76V9O-amx9uyKZYtOf5Q2b73v8O_xHWw@mail.gmail.com>
Subject: Re: [PATCH v3] ubsan: Reintroduce signed overflow sanitizer
To: Kees Cook <keescook@chromium.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Hao Luo <haoluo@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Feb 2024 at 13:59, Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Feb 05, 2024 at 01:54:24PM +0100, Andrey Ryabinin wrote:
> >
> >
> > On 2/5/24 10:37, Kees Cook wrote:
> >
> > > ---
> > >  include/linux/compiler_types.h |  9 ++++-
> > >  lib/Kconfig.ubsan              | 14 +++++++
> > >  lib/test_ubsan.c               | 37 ++++++++++++++++++
> > >  lib/ubsan.c                    | 68 ++++++++++++++++++++++++++++++++++
> > >  lib/ubsan.h                    |  4 ++
> > >  scripts/Makefile.lib           |  3 ++
> > >  scripts/Makefile.ubsan         |  3 ++
> > >  7 files changed, 137 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> > > index 6f1ca49306d2..ee9d272008a5 100644
> > > --- a/include/linux/compiler_types.h
> > > +++ b/include/linux/compiler_types.h
> > > @@ -282,11 +282,18 @@ struct ftrace_likely_data {
> > >  #define __no_sanitize_or_inline __always_inline
> > >  #endif
> > >
> > > +/* Do not trap wrapping arithmetic within an annotated function. */
> > > +#ifdef CONFIG_UBSAN_SIGNED_WRAP
> > > +# define __signed_wrap __attribute__((no_sanitize("signed-integer-overflow")))
> > > +#else
> > > +# define __signed_wrap
> > > +#endif
> > > +
> > >  /* Section for code which can't be instrumented at all */
> > >  #define __noinstr_section(section)                                 \
> > >     noinline notrace __attribute((__section__(section)))            \
> > >     __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage \
> > > -   __no_sanitize_memory
> > > +   __no_sanitize_memory __signed_wrap
> > >
> >
> > Given this disables all kinds of code instrumentations,
> > shouldn't we just add __no_sanitize_undefined here?
>
> Yeah, that's a very good point.
>
> > I suspect that ubsan's instrumentation usually doesn't cause problems
> > because it calls __ubsan_* functions with all heavy stuff (printk, locks etc)
> > only if code has an UB. So the answer to the question above depends on
> > whether we want to ignore UBs in "noinstr" code or to get some weird side effect,
> > possibly without proper UBSAN report in dmesg.
>
> I think my preference would be to fail safe (i.e. leave in the
> instrumentation), but the intent of noinstr is pretty clear. :P I wonder
> if, instead, we could adjust objtool to yell about cases where calls are
> made in noinstr functions (like it does for UACCESS)... maybe it already
> does?

It already does, see CONFIG_NOINSTR_VALIDATION (yes by default on x86).

