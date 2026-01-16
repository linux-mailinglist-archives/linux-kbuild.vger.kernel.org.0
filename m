Return-Path: <linux-kbuild+bounces-10603-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D8AD297A1
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 01:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A09330392A9
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 00:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357CE311954;
	Fri, 16 Jan 2026 00:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kgLp2JaC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4130FF26
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 00:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768525190; cv=none; b=mtHW0bDp3iC4tUhp55dPqFMdavhXyS33bXRbjhIzEnCH5L9pGGWL7YwLhYWlNIuwHNCAp2RJlt3MUysRBxrbC5U4GUgOiYkTs+MIGikhsDzN24nTPqwoP9BcO4a4qjgcuRx3FI3XitLrPnKAPaAAWJU71rY0c8dFCyOn2sHiT2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768525190; c=relaxed/simple;
	bh=sswrjQ8EExX8Ejn+hiBAAzKCMUulX0bAX3V3v+aCP3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2asDUUs/3JC8OzjmlDLiwjGazNizCSflOctVd/lm6aqaqwSLASfchDGoIuYcfpzlTu98mU7313ZwZ1Y652Zo/vCz3qTXa8S4rFA5WqVzQB/Ao6iQtaSIxQ85c39LC7outif6HtQQY8FyOXPWCFzJyDlt49gj5G98xrjtdNz7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kgLp2JaC; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7ffbf4284dso200135966b.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jan 2026 16:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768525185; x=1769129985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zwo6Ubytkm4NaoKO/41U838fyGRUNTBhuW6qdGo2Ks=;
        b=kgLp2JaCp05hJMm0h5v0/dE5chH0w2dj6uevCFTG35gBRqmQwSNSAlsnV4AfShvDIV
         KJLiz0cLNXB/GVlQfNUWWIlBFtXoOnDR7ln0Xnnm9wJnk/dQD/3K1jDLF6Kam9ywpyEK
         bEkJjDKpn7eWdGkbiCgGv66mf/Mvx9bNPpdDlwJTWdYqHx+tZ5ZYAa8c8RcU7C/B1MRV
         GngHAl8ChgUifZQXT0DV9R6axFctRPaHSafx7kOs5AfgVOkOiu6HzlQ+2ZnTkPb/dUBh
         dBjdgdZmzgx2V41oqLSvQxvWlSRfOv6HLJ2PxVlifBcPEjlEY4vWKjsPrfzDUN7n0CSm
         Pnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525185; x=1769129985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zwo6Ubytkm4NaoKO/41U838fyGRUNTBhuW6qdGo2Ks=;
        b=Z4hk/GE8TmOLGmiWiq0KUYy4wgo2AAyJs0ds4tq6YQqhfyA07IhUYBp3XmlRcSQHla
         p5UVvbjFxfbWD3IGDAYo5dV//ohC3NzE9y01wrJ5YgKY82pv4tY/phH3unykdcMStfur
         cncNV6biR5gq2j57k+HEr9ZA4B5PQM6eXOiavzfTdOGAmvxmG/eAfOAeoE+z3rzubLlw
         GWyUQwpcto7Kx9jkjFaoW4TJsDeuPEalQHbtEsJJM6W7cDCznu+WchVLsNmNHjKu7u3q
         da+icrApFfO8JTwpdvAEzp+CzLtviEAS08A6nTouXM8xQ90i6qcwp+DWN7edLJRIDGAz
         eAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Fc+bJDGQqFZUhRNobWNm0JOohjO4JH8YjyuBagnF1o49vyKj6J22edSy8wlBCk14m0G4KhGehaidCEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT75Ba/OmlnT+/5dZ5gQs8BxjIbQEEPwV+ue76aEdfmG3IvbtQ
	6KVLK8HjCC2FdwpU20pySI2abC/wbUz+2YQM3vu7WU8kRfaMoOhhrGDLoj8wjNKBtNQ0f3XQlkk
	WzDWbmAsysg1raG55MaxZH5DRqLl7906eybaHRyg=
X-Gm-Gg: AY/fxX6Y6X777qE5+cBnzTgHmBIn2LUUfk3y7QfhePqSdzPwUMXTs2XWJT1SkWOnAdi
	1Hh3nQGYoFxht1LaTU426IJsGM55Jk6qWUqa8R78MoVowhZi3S03JULWekHOsi5SWhjHJ8Ej97z
	HgweVjdwAWLDNH5CtzeJETxd3pGgeL+xHrYV/vjXvTAeycCL+J7z5+nhPUubmm1p0qYnQTsxaFH
	ExLreNTeaBZSU9//1z5bxjE1xDrtZ13OlcUH0zyxr4vQpza3LJ+A2yOSu/w6Q+Bd0ABSF5HrK3S
	RpPa1keoN+WtxAMzDsRq9nnVVki0qnjv4g3OIAeTt1wDO+A=
X-Received: by 2002:a17:907:981:b0:b80:3fc4:37bd with SMTP id
 a640c23a62f3a-b8792d3bc65mr118920866b.7.1768525184982; Thu, 15 Jan 2026
 16:59:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121195504.1661783-1-morbo@google.com> <20260114193716.1740684-1-morbo@google.com>
 <202601141956.A798BFF@keescook>
In-Reply-To: <202601141956.A798BFF@keescook>
From: Bill Wendling <morbo@google.com>
Date: Thu, 15 Jan 2026 16:59:28 -0800
X-Gm-Features: AZwV_Qi7dJY7T3WLRN4EQzetqOSzw93u9VRGgifQybmb4sr3sTd_O24GMALwMT4
Message-ID: <CAGG=3QWmQL_ctqm=hnyTUgJgCDswC91agV=y8FBy8Eqte1VFyA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 8:00=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Jan 14, 2026 at 07:36:47PM +0000, Bill Wendling wrote:
> > Introduce __counted_by_ptr(), which works like __counted_by(), but for
> > pointer struct members.
> >
> > struct foo {
> >       int a, b, c;
> >       char *buffer __counted_by_ptr(bytes);
> >       short nr_bars;
> >       struct bar *bars __counted_by_ptr(nr_bars);
> >       size_t bytes;
> > };
> >
> > Because "counted_by" can only be applied to pointer members in very
> > recent compiler versions, its application ends up needing to be distinc=
t
> > from flexibe array "counted_by" annotations, hence a separate macro.
> >
> > Note that Clang's support for "void *" members will be in version 22.
> > So, when using Clang, you'll need to wait until its release before usin=
g
> > the feature with "void *". No such restriction applies to GCC's version
> > 16.
>
> I think to keep operational parity, we should limit counted_ptr on Clang
> to version 22 then, otherwise we'll have problems using it on void *.
>
> > This is a reworking of Kees' previous patch [1].
>
> Thanks for this!
>
> >
> > Link: https://lore.kernel.org/all/20251020220118.1226740-1-kees@kernel.=
org/ [1]
> > Co-developed-by: Kees Cook <kees@kernel.org>
>
> This needs to be followed by my S-o-b, I think? checkpatch.pl ought to
> check this.
>
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> > Cc: Justin Stitt <justinstitt@google.com>
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Heiko Carstens <hca@linux.ibm.com>
> > Cc: Marc Herbert <Marc.Herbert@linux.intel.com>
> > Cc: Uros Bizjak <ubizjak@gmail.com>
> > Cc: Tejun Heo <tj@kernel.org>
> > Cc: Jeff Xu <jeffxu@chromium.org>
> > Cc: "Michal Koutn=C3=BD" <mkoutny@suse.com>
> > Cc: Shakeel Butt <shakeel.butt@linux.dev>
> > Cc: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
> > Cc: John Stultz <jstultz@google.com>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Cc: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Brian Gerst <brgerst@gmail.com>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > Cc: llvm@lists.linux.dev
> > ---
> > v3 - Replace the previous code with a modified version of Kees' previou=
s patch
> >      [1].
> >    - The question about the naming of the macro was considered, but we =
decided
> >      to keep the original naming (__counted_by_ptr), because it mirrors=
 the current
> >      macros like "__counted_by_{le,be}".
> > v2 - Add support for GCC.
> > ---
> >  Makefile                       |  6 ++++++
> >  include/linux/compiler_types.h | 18 +++++++++++++++++-
> >  include/uapi/linux/stddef.h    |  4 ++++
> >  init/Kconfig                   |  7 +++++++
> >  4 files changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 9d38125263fb..6b029f694bc2 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -952,6 +952,12 @@ KBUILD_CFLAGS    +=3D $(CC_AUTO_VAR_INIT_ZERO_ENAB=
LER)
> >  endif
> >  endif
> >
> > +ifdef CONFIG_CC_IS_CLANG
> > +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > +KBUILD_CFLAGS        +=3D -fexperimental-late-parse-attributes
> > +endif
> > +endif
> > +
> >  # Explicitly clear padding bits during variable initialization
> >  KBUILD_CFLAGS +=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
> >
> > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_ty=
pes.h
> > index d3318a3c2577..e597c814d60b 100644
> > --- a/include/linux/compiler_types.h
> > +++ b/include/linux/compiler_types.h
> > @@ -369,7 +369,7 @@ struct ftrace_likely_data {
> >   * Optional: only supported since clang >=3D 18
> >   *
> >   *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
> > - * clang: https://github.com/llvm/llvm-project/pull/76348
> > + * clang: https://clang.llvm.org/docs/AttributeReference.html#counted-=
by-counted-by-or-null-sized-by-sized-by-or-null
> >   *
> >   * __bdos on clang < 19.1.2 can erroneously return 0:
> >   * https://github.com/llvm/llvm-project/pull/110497
> > @@ -383,6 +383,22 @@ struct ftrace_likely_data {
> >  # define __counted_by(member)
> >  #endif
> >
> > +/*
> > + * Runtime track number of objects pointed to by a pointer member for =
use by
> > + * CONFIG_FORTIFY_SOURCE and CONFIG_UBSAN_BOUNDS.
> > + *
> > + * Optional: only supported since gcc >=3D 16
> > + * Optional: only supported since clang >=3D 21.1
>
> As I mention above, let's make this 22
>
> > + *
> > + *   gcc: https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.=
html
> > + * clang: https://github.com/llvm/llvm-project/pull/137250
>
> Oh, hm, did the docs for
> https://clang.llvm.org/docs/AttributeReference.html#counted-by-counted-by=
-or-null-sized-by-sized-by-or-null
> not get updated by the above PR? Docs should get added to LLVM for this
> so we can link to the same AttributeReference.html as above.
>
> And, actually, same question for GCC, now that I'm looking at this...
>
>
> > + */
> > +#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > +#define __counted_by_ptr(member)     __attribute__((__counted_by__(mem=
ber)))
> > +#else
> > +#define __counted_by_ptr(member)
> > +#endif
> > +
> >  /*
> >   * Optional: only supported since gcc >=3D 15
> >   * Optional: not supported by Clang
> > diff --git a/include/uapi/linux/stddef.h b/include/uapi/linux/stddef.h
> > index 9a28f7d9a334..111b097ec00b 100644
> > --- a/include/uapi/linux/stddef.h
> > +++ b/include/uapi/linux/stddef.h
> > @@ -72,6 +72,10 @@
> >  #define __counted_by_be(m)
> >  #endif
> >
> > +#ifndef __counted_by_ptr
> > +#define __counted_by_ptr(m)
> > +#endif
> > +
> >  #ifdef __KERNEL__
> >  #define __kernel_nonstring   __nonstring
> >  #else
> > diff --git a/init/Kconfig b/init/Kconfig
> > index fa79feb8fe57..dc27b998d111 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -143,6 +143,13 @@ config CC_HAS_COUNTED_BY
> >       # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
> >       default y if CC_IS_GCC && GCC_VERSION >=3D 150100
> >
> > +config CC_HAS_COUNTED_BY_PTR
> > +     bool
> > +     # supported since clang 21.1.0
> > +     default y if CC_IS_CLANG && CLANG_VERSION >=3D 210100
>
> Let's do 22
>
> > +     # supported since gcc 16.0.0
> > +     default y if CC_IS_GCC && GCC_VERSION >=3D 160000
> > +
> >  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
> >       def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring=
__)) =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
> >
> > --
> > 2.52.0.457.g6b5491de43-goog
> >
>
> Great! Once this is fixed up, I'll snag the other 2 patches from my
> original series too.
>
Should be corrected now. PTAL.

-bw

