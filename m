Return-Path: <linux-kbuild+bounces-174-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB37FAA45
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Nov 2023 20:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2B7B1C20CB9
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Nov 2023 19:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5693EA7E;
	Mon, 27 Nov 2023 19:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v6opLKah"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501F61735
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Nov 2023 11:27:21 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-548c6efc020so47421a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Nov 2023 11:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701113240; x=1701718040; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XzTuOpSVbJlV6jvvk+X3oPv5/iVM0u3vN6xCSt+v7i8=;
        b=v6opLKahQ7iDBF7CxKntXtXLf959vAIZWxBoHwNQf7G25UfoviswTcMLSRndx1Yvw2
         Dxw/al2f2LPzrPzEhbwehbU2yePTy4nQAWEZ5AePO0IJHgsOrw9aF6M1pJtC8x6YgIi0
         /mo8s+ZwrswLJKwnIuROe9v1hmtpwYr9R/NXtpEPDwvcT5tgwSJ4Si8VI3JqhZ+X6JjD
         2ojV2wwsA5/FoDaEGrCycH5SnqwEtSgv6CJzBT2Hg9tHXKZwCDEPR7fgNJKj7eJ9Wrom
         F6frFJWsCO/JSBw24YsehFf2TIDN8W/K5eG+g/5lGb4qu3IZ/afg01r1hkm0gG1M8ala
         9KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701113240; x=1701718040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzTuOpSVbJlV6jvvk+X3oPv5/iVM0u3vN6xCSt+v7i8=;
        b=b8mcURVwIxaOsStVAB1NRuVvuOREDokpfR9VOweP4eCfFoDsDrg8wCNUUUxDJNneAV
         K6Jegh3b22wSqCX/gfykLXJxl5Ux3hBGYRgLC/tLMQx4Y6MTc+x3JZPpx+3zmJHJnZCd
         i7mCPatVVBAx61Az1M5OPWly2DeCE6w77NciZuqMc86h9WzMm8V7RP0aeR7RPmUjm/Fl
         RjQiY68zvTHegR8iA4SwpvAKBkSIw6ijWAjUrPuJNMYRdGJD94coCBunkeYWC4q6sOQR
         UYy5jxfFaM3O3ZBASLQt2Q0DljDgdV/fnYRwe8KH4OzO66/xSrxDI9Iuwl2qHy9s4Uuc
         b65g==
X-Gm-Message-State: AOJu0YzqvYQ/Qfk5pvuNzOch1CXItfxwW/qaHcGz1bKlKmrDv1AdGgYk
	kE7lwkVkJ3n1zpwfx+aIUWuFQZyAwgkUq1kjWD3EMomxZ8XDhxfUx1BmPg==
X-Google-Smtp-Source: AGHT+IGKwdo1ZSkcsOIcurvO0mHUiByb1C1j8DM9pzIpG8I41SgplF7gVh3OmwIEABFLg5jVukQI20YeFDGoZpg1adk=
X-Received: by 2002:a05:6402:5515:b0:543:fb17:1a8 with SMTP id
 fi21-20020a056402551500b00543fb1701a8mr690841edb.3.1701113239428; Mon, 27 Nov
 2023 11:27:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231118025748.2778044-1-mmaurer@google.com> <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
 <CAGSQo00hyCTVsqHtrzKBBPvuH38z5yRm_4jzdi00C0RV+8APwQ@mail.gmail.com>
 <2023112314-tubby-eligibly-007a@gregkh> <CAK7LNAT-OcaCi6tqPRgZxPXOV6u+YbaO_0RxtfmrVXPzdrio0Q@mail.gmail.com>
 <2023112312-certified-substance-007c@gregkh>
In-Reply-To: <2023112312-certified-substance-007c@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 27 Nov 2023 11:27:07 -0800
Message-ID: <CAGSQo005hRiUZdeppCifDqG9zFDJRwahpBLE4x7-MyfJscn7tQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] MODVERSIONS + RUST Redux
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Luis Chamberlain <mcgrof@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Laura Abbott <laura@labbott.name>
Content-Type: text/plain; charset="UTF-8"

> > >
> > > > With regards to future directions that likely won't work for loosening it:
> > > > Unfortunately, the .rmeta format itself is not stable, so I wouldn't want to
> > > > teach genksyms to open it up and split out the pieces for specific functions.
> > > > Extending genksyms to parse Rust would also not solve the situation -
> > > > layouts are allowed to differ across compiler versions or even (in rare
> > > > cases) seemingly unrelated code changes.
> > >
> > > What do you mean by "layout" here?  Yes, the crcs can be different
> > > across compiler versions and seemingly unrelated code changes (genksyms
> > > is VERY fragile) but that's ok, that's not what you are checking here.
> > > You want to know if the rust function signature changes or not from the
> > > last time you built the code, with the same compiler and options, that's
> > > all you are verifying.
What I mean by layout here is that if you write in Rust:
struct Foo {
  x: i32,
  y: i32,
}
it is not guaranteed to have the same layout across different compilations, even
within the same compiler. See
https://doc.rust-lang.org/reference/type-layout.html#the-rust-representation
Specifically, the compiler is allowed to arbitrarily insert padding,
reorder fields, etc.
on the same code as long as the overall alignment of the struct and individual
alignment of the fields remains correct and non-overlapping.

This means the compiler is *explicitly* allowed to, for example, permute x and y
as an optimization. In the above example this is unlikely, but if you
instead consider
struct Bar {
  x: i8,
  y: i64,
  z: i8,
}
It's easy to see why the compiler might decide to structure this as
y,x,z to reduce the
size of the struct. Those optimization decisions may be affected by
any other part of
the code, PGO, etc.
> > >
> > > > Future directions that might work for loosening it:
> > > > * Generating crcs from debuginfo + compiler + flags
> > > > * Adding a feature to the rust compiler to dump this information. This
> > > > is likely to
> > > >   get pushback because Rust's current stance is that there is no ability to load
> > > >   object code built against a different library.
> > >
> > > Why not parse the function signature like we do for C?
Because the function signature is insufficient to check the ABI, see above.
> > >
> > > > Would setting up Rust symbols so that they have a crc built out of .rmeta be
> > > > sufficient for you to consider this useful? If not, can you help me understand
> > > > what level of precision would be required?
> > >
> > > What exactly does .rmeta have to do with the function signature?  That's
> > > all you care about here.
The .rmeta file contains the decisions the compiler made about layout
in the crate
you're interfacing with. For example, the choice to encode Bar
with a yxz field order would be written into the .rmeta file.
> >
> >
> >
> >
> > rmeta is generated per crate.
> >
> > CRC is computed per symbol.
> >
> > They have different granularity.
> > It is weird to refuse a module for incompatibility
> > of a symbol that it is not using at all.
>
> I agree, this should be on a per-symbol basis, so the Rust
> infrastructure in the kernel needs to be fixed up to support this
> properly, not just ignored like this patchset does.
I agree there is a divergence here, I tried to point it out so that it
wouldn't be
a surprise later. The .rmeta file itself (which is the only way we
could know that
the ABI actually matches, because layout decisions are in there) is an unstable
format, which is why I would be reluctant to try to parse it and find only the
relevant portions to hash. This isn't just a "technically unstable"
format, but one
in which the compiler essentially just serializes out relevant internal data
structures, so any parser for it will involve significant alterations
on compiler
updates, which doesn't seem like a good plan.
>
> thanks,
>
> greg k-h
Given the above additional information, would you be interested in a patchset
which either:

A. Computes the CRC off the Rust type signature, knowing the compiler is
allowed to change the ABI based on information not contained in the CRC.
B. Uses the CRC of the .rmeta file, knowing, as was pointed out, that this
effectively contains the ABI of every symbol in the compilation unit, as well
as inline functions and polymorphic functions.

If neither of these works, we likely can't turn on MODVERSIONS+RUST until
further work is done upstream in the compiler to export some of this data in
an at least semi-stable fashion.

