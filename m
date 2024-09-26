Return-Path: <linux-kbuild+bounces-3814-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9E6987927
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 20:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EC4E1C22916
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 18:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6DB172BD5;
	Thu, 26 Sep 2024 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DK/5vjrI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE06F16B38B
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Sep 2024 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727375854; cv=none; b=sn4mTnVrkfWBhNYkq8CXJoHiJuNJjb34DSdw2I8tdN1xsJWou7pM6K59/5iU+IODKAKWOhT94ja0uD2ukbIUCYkf+q800xzSOwZldKQS/sJD59HsYTvgQLMZZZ+FmVCC/zC+JegFK4qWOAc93wZWttNZu1bUIc+oBjwTwZfiDPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727375854; c=relaxed/simple;
	bh=qge/ypv3jnq9WkpUdpRE7x8QIIC6GXWB3609FUVVm8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Shqhxa5flmNrqOcD0/ptLV44995lV6sqUQ93VS5fn79tHaWPBqQMPxfQx3cdSeMl7ZD/mjSUd3cA8kQ4LWH4c3qzjyP0X7WfJW3k/+SQL2wYVB8xTThX64CFE5Lm29fNfPbG64FuCqHowMSYRn0ltez7Qs1rXXJSwv/NSmWmFNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DK/5vjrI; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4581cec6079so44451cf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Sep 2024 11:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727375851; x=1727980651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajD7HYLuvBx8/17wWfxPAMem46iIj42I6Vl0LQ86WrE=;
        b=DK/5vjrINJRnrkXe3JMVA2ku6szcsEliriK+KN8cQY3FpVMsbmkmycPY56xGBQItSL
         ibQ8Z4uWK2pii2zWS0HA9AvCc3tUU6f55c8CJsAUyr2P+V24XWfOk5qxTuNr8gTdVeAG
         x5iBsYiAvvRILVTxnokzS5OItpWcLnvsXYagWT4afcqtVcjguOGRzwv9xWM9TpJQtw/g
         R7GAGqOMJ0L1BhaNT8Zd6JCryyMjnjiurgWIZ3DNj5Ou4wRTBxpWcVhZct60XRUdUHUd
         snIJaR8UJpEE6aNpdTRZQytK0yRCi+AlJrLfGWVwDi/JdZMdmluvcKTnmRWBDcGpDn6P
         c6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727375851; x=1727980651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajD7HYLuvBx8/17wWfxPAMem46iIj42I6Vl0LQ86WrE=;
        b=PBxw2OezSlFfR4Ma6fI1jes7uXj8NigL6EAdCZhf5wHJMmf0nq9MBXVbZnrheMefYx
         OjXbbSYJrOVXKuR8KKQt8p3kJ5e3u7rMpMiooXSvoy3fvPkw+MSaLTsYWO1c0RDhf8KU
         /fk9wqZu11f3CT1NsN6MsQcR1792GfUNhCIDy2bCYJEWgtQzt3hRkFMYsyMRBi9yRHdl
         AfIATj6apVJivn0jMgDpLyIj4Ztd76+yNCJqrV2W/IoyQ6QzeJLzNdcfpOSq+N//gHS0
         00w9BoJLMatjUbAeSr7U5j5SiDQFZvvIYOY0OG3RxZJQdSkF8JM/1y6XHXCd3cfPPcGD
         iy2w==
X-Forwarded-Encrypted: i=1; AJvYcCU28kcNAK2E39byBKRfhFhNu6N+0kwyikSViekoyJhmC6qm2qpYMYrNDHEL51O+Q6bBNLLI56ECw9pYJYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9nRy11rIqFX0wKFNG1TUprehvmHyMfjKaYBiP4Osow6bB/va
	QA8sPX0Y8YRjMe2GvmP6MBwlENSt18afnni+/yAF0KF9RFubh8XicSyRtTk/4wf1DU+SF+6/3De
	IhXd2nDfSPUUuoXZKTHHneKJC5CUYz37vaxPR
X-Google-Smtp-Source: AGHT+IE5luy5UBQ185BJWoPqDDM1TnLd4PCqV2DLnc+LIC9QgkGZbzUPxUEZLm0+v/dLWn/IHMzUNmnXBY+ab/kjVpA=
X-Received: by 2002:ac8:4904:0:b0:456:7d9f:2af8 with SMTP id
 d75a77b69052e-45ca03bd89bmr245591cf.7.1727375850392; Thu, 26 Sep 2024
 11:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com> <20240925233854.90072-15-mmaurer@google.com>
 <b31c74c1-0c19-4bc4-b1af-db817977748d@csgroup.eu>
In-Reply-To: <b31c74c1-0c19-4bc4-b1af-db817977748d@csgroup.eu>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 26 Sep 2024 11:36:51 -0700
Message-ID: <CABCJKudyC_EzRTtkJSSQqQhLdUk_9tYBtoq62tjmghFyi8omWg@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Matthew Maurer <mmaurer@google.com>, masahiroy@kernel.org, ndesaulniers@google.com, 
	ojeda@kernel.org, gary@garyguo.net, mcgrof@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 5:22=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 26/09/2024 =C3=A0 01:38, Matthew Maurer a =C3=A9crit :
> > Adds a new format for MODVERSIONS which stores each field in a separate
> > ELF section. This initially adds support for variable length names, but
> > could later be used to add additional fields to MODVERSIONS in a
> > backwards compatible way if needed. Any new fields will be ignored by
> > old user tooling, unlike the current format where user tooling cannot
> > tolerate adjustments to the format (for example making the name field
> > longer).
> >
> > Since PPC munges its version records to strip leading dots, we reproduc=
e
> > the munging for the new format. Other architectures do not appear to
> > have architecture-specific usage of this information.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >   arch/powerpc/kernel/module_64.c | 23 ++++++++-
> >   kernel/module/internal.h        | 11 ++++
> >   kernel/module/main.c            | 92 ++++++++++++++++++++++++++++++--=
-
> >   kernel/module/version.c         | 45 ++++++++++++++++
> >   4 files changed, 161 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/modu=
le_64.c
> > index e9bab599d0c2..4e7b156dd8b2 100644
> > --- a/arch/powerpc/kernel/module_64.c
> > +++ b/arch/powerpc/kernel/module_64.c
> > @@ -355,6 +355,23 @@ static void dedotify_versions(struct modversion_in=
fo *vers,
> >               }
> >   }
> >
> > +static void dedotify_ext_version_names(char *str_seq, unsigned long si=
ze)
> > +{
> > +     unsigned long out =3D 0;
> > +     unsigned long in;
> > +     char last =3D '\0';
> > +
> > +     for (in =3D 0; in < size; in++) {
> > +             /* Skip one leading dot */
> > +             if (last =3D=3D '\0' && str_seq[in] =3D=3D '.')
> > +                     in++;
> > +             last =3D str_seq[in];
> > +             str_seq[out++] =3D last;
> > +     }
>
> Why do you need a loop here ?
>
> Can't you just do something like:
>
>         if (str_seq[0] =3D=3D '.')
>                 memmove(str_seq, str_seq + 1, size);

I initially had the same thought, but it's because this is is a
sequence of multiple null-terminated strings, and we need to dedotify
all of them, not just the first one. Here's an example:

https://godbolt.org/z/avMGnd48M

> > +     /* Zero the trailing portion of the names table for robustness */
> > +     memset(&str_seq[out], 0, size - out);
>
> This seems unneeded.

Strictly speaking it shouldn't be needed, but I think it's still good
hygiene to not leave another null-terminated fragment at the end.

Sami

