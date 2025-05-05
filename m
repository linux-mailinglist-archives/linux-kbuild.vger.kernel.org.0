Return-Path: <linux-kbuild+bounces-6941-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0156CAA9B55
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 20:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27A8316512A
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 18:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDBC26E15F;
	Mon,  5 May 2025 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3KrEznAy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2721B0F2C
	for <linux-kbuild@vger.kernel.org>; Mon,  5 May 2025 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469132; cv=none; b=uprcKmi66PnPvGEBNBDot5OmXwrit/kk12q8pIZvHOnKBsxSyOUR8moJ4wjcA+DUvpJFayuBr4l+SMfKPPjc+tfUQoprNNuj5OGRZoTYkuWPTHo5+dPgGVsIGgM351FFc1qkdwsfZ2b2B/bZgOtQQWhwUJBPbUIxMEfnY9IlfKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469132; c=relaxed/simple;
	bh=Llxn6P3yNGX+p+iXcZW9OKjTiI6ZeRsyDmIcIgvUVHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MC9jt4i/LdnquHhHMfzpDN4Y21FJTlUH/Vp49GcGBNYKjBmpYZL1dE0MnzLzwZjr+kNRbHDLE3abeDJV5Sw2+Av/oRor4ObsgNXxKHNmhVyowdpB3HZw6uzxM69NxFIKPI/Lk7tgdgsTISIZFJBAiOhu1fiaS7jH18I7vWJeuaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3KrEznAy; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so3919593137.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 May 2025 11:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746469128; x=1747073928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+HucxVqpGIDINeSE6fmLZw1CWi4pwr8swaylTY9CLM=;
        b=3KrEznAy0kX+I1AXDMh4tsepnuPNupOelH+DnvsIBXySJ4aiP9mvACSyLYGjbFRiwe
         bHJ/0uYgJwTGsXG5C1JJhvLGa9ucpEknzlUALz0muqQfGqkxcgjs5pv0ZJa5EZZIT8TM
         QRBK27dcHlqrn5JNB7Mnyz5nNH9LBXFOJU6ij3x/a9YHKP62cB4L7ewBTI4DR8v9zGDI
         BWqhYvzvy5xwgervT5FCDWeRd/+AjGyntLfLe0ncFvTLBVKD4oBrHjlx6Bi2Zpbb7KmT
         b1HrwDrKE02Onze/PVIbTL7ucE4mSVwGhAKapLqlcqcRZCENmZqb8erx879N9ZZq4muk
         Jt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746469128; x=1747073928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+HucxVqpGIDINeSE6fmLZw1CWi4pwr8swaylTY9CLM=;
        b=uEeG3WvF1LfR0w418E4ncpJU5LXQsI6EtykFRCsRLeHZjt2SOAFMoDpOnW6aQyiSQ0
         +DnVojVQM8TwEbGNMz6BN1crhHWG2H0UNvcf7h1z65ciBx33gQkwk3gecbWRtD3QtLj9
         tdp5/4j/p4M1zZWZNRxsM7WipQkEu2/zrQtbk1Qb5VX6Ttuq2rxp+7LXE/xIKL+zWGbX
         lZcHeWjupVC7WTtgYQp/F5uIjb/zZtdreF4Vn82hzG/fujqmz0XiTL2x5T3TohfS5vIp
         MkCBhopa6XrCp/Q5OepNVceJopAR4bTk4kN67YD/DyQfOQH7cPncTJh7v9S7XiL+J1JP
         rbmA==
X-Forwarded-Encrypted: i=1; AJvYcCWwdRqmcbu71HAzHDraJieFpZuOsDh2LucyKSejsVsdPQn7jHdy5TFI+N3jF8WQRaafFfhCiUrfKh5RGAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZfCbS+ZhhunoMqscMB7kpZVJXsjJs7xd3aA8B/0MvoYlWQ26Y
	t0a+NyvPaSHia6CIusJU1caCwCJ9j7/WegTogyVI9dpTJvs1T8pqEk9lQWkF2hReeTjGOsHFeuS
	d7CuPrpYg79/lSnCqQ4S8kBwlMWvWZ8TogGqu
X-Gm-Gg: ASbGncv4dYzjv4blTXyjjR9q3VSxgQ9gsB6Gz9hYjZW3xy70JxIhG+6Mp4k7m1B5BVY
	eSVb6YTnAzg7WFRMFxX1nT+6RdTgF0u2/oc3AfUpxyz57MS3QZ9uvFWUBhmhWhACs23AXMrrDAV
	n0V8NUcW/AFDzWSpPXlLipwIc8U6GDDDQ=
X-Google-Smtp-Source: AGHT+IH/iz9okaO1cuwqrJo1Rt3kARxWxf3EeTirkMuCQivHqoWZrf+JzbjS35sokHVGuLKGArF4jDrp3RM0JQB3qww=
X-Received: by 2002:a05:6102:3c8e:b0:4da:e6e1:c343 with SMTP id
 ada2fe7eead31-4db0c401beamr5914771137.23.1746469128196; Mon, 05 May 2025
 11:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503184001.make.594-kees@kernel.org> <20250503184623.2572355-3-kees@kernel.org>
 <CAFhGd8rGJcveDn4g1nS=tURe-uT1+PFm2EQeWpUrH_oy763yFg@mail.gmail.com>
In-Reply-To: <CAFhGd8rGJcveDn4g1nS=tURe-uT1+PFm2EQeWpUrH_oy763yFg@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 5 May 2025 11:18:34 -0700
X-Gm-Features: ATxdqUErCVMDsByK3bWIsvMoTcLY1TL44fldHiGpe0ueZmfJS819NKbT_lTgAuc
Message-ID: <CAFhGd8qL8ttBaPGH5Cx39MN46OgxsLSgqhWN4rwCwf9bn33NHg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] integer-wrap: Force full rebuild when .scl file changes
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 11:16=E2=80=AFAM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> On Sat, May 3, 2025 at 11:46=E2=80=AFAM Kees Cook <kees@kernel.org> wrote=
:
> >
> > Since the integer wrapping sanitizer's behavior depends on its associat=
ed
> > .scl file, we must force a full rebuild if the file changes. If not,
> > instrumentation may differ between targets based on when they were buil=
t.
> >
> > Generate a new header file, integer-wrap.h, any time the Clang .scl
> > file changes. Include the header file in compiler-version.h when its
> > associated feature name, INTEGER_WRAP, is defined. This will be picked
> > up by fixdep and force rebuilds where needed.
> >
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Justin Stitt <justinstitt@google.com>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nicolas Schier <nicolas.schier@linux.dev>
> > Cc: Marco Elver <elver@google.com>
> > Cc: Andrey Konovalov <andreyknvl@gmail.com>
> > Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> > Cc: <linux-kbuild@vger.kernel.org>
> > Cc: <kasan-dev@googlegroups.com>
> > Cc: <linux-hardening@vger.kernel.org>
> > ---
> >  include/linux/compiler-version.h | 3 +++
> >  scripts/Makefile.ubsan           | 1 +
> >  scripts/basic/Makefile           | 5 +++++
> >  3 files changed, 9 insertions(+)
> >
> > diff --git a/include/linux/compiler-version.h b/include/linux/compiler-=
version.h
> > index 69b29b400ce2..187e749f9e79 100644
> > --- a/include/linux/compiler-version.h
> > +++ b/include/linux/compiler-version.h
> > @@ -19,3 +19,6 @@
> >  #ifdef RANDSTRUCT
> >  #include <generated/randstruct_hash.h>
> >  #endif
> > +#ifdef INTEGER_WRAP
> > +#include <generated/integer-wrap.h>
> > +#endif
> > diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> > index 9e35198edbf0..653f7117819c 100644
> > --- a/scripts/Makefile.ubsan
> > +++ b/scripts/Makefile.ubsan
> > @@ -15,6 +15,7 @@ ubsan-cflags-$(CONFIG_UBSAN_TRAP)             +=3D $(=
call cc-option,-fsanitize-trap=3Dundefined
> >  export CFLAGS_UBSAN :=3D $(ubsan-cflags-y)
> >
> >  ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=3D  \
> > +       -DINTEGER_WRAP                                          \
> >         -fsanitize-undefined-ignore-overflow-pattern=3Dall        \
> >         -fsanitize=3Dsigned-integer-overflow                      \
> >         -fsanitize=3Dunsigned-integer-overflow                    \
> > diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
> > index dd289a6725ac..fb8e2c38fbc7 100644
> > --- a/scripts/basic/Makefile
> > +++ b/scripts/basic/Makefile
> > @@ -14,3 +14,8 @@ cmd_create_randstruct_seed =3D \
> >  $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
> >         $(call if_changed,create_randstruct_seed)
> >  always-$(CONFIG_RANDSTRUCT) +=3D randstruct.seed
> > +
> > +# integer-wrap: if the .scl file changes, we need to do a full rebuild=
.
> > +$(obj)/../../include/generated/integer-wrap.h: $(srctree)/scripts/inte=
ger-wrap-ignore.scl FORCE
> > +       $(call if_changed,touch)
> > +always-$(CONFIG_UBSAN_INTEGER_WRAP) +=3D ../../include/generated/integ=
er-wrap.h
>
> I'm not sure how this fake header stuff works to ensure builds deps
> are tracked properly but we do need scl files to be considered as part
> of complete builds, so:

As in, I'm sure it works but have personally never written or reviewed
a Makefile+generated header snippet like that before :)

>
> Acked-by: Justin Stitt <justinstitt@google.com>
>
> > --
> > 2.34.1
> >

