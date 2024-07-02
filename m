Return-Path: <linux-kbuild+bounces-2313-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A57FF923999
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 11:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62E2D1F224B1
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 09:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2641D155308;
	Tue,  2 Jul 2024 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvaTpcwd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5C71509BA;
	Tue,  2 Jul 2024 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719911759; cv=none; b=G1VzIL+VB7LOyPBGhPszZwg5XvhFqE50/7oesOR5KjjXOhgoiWOeqldt6592MTtZ+reS2hT6F4YG9PM2kV8jyrReOmFj5ftmBiGJkpOz5/EE0KciPvHZZxe1dTJdHs7n8avCVaEXoU0h2v6rdaCvpOe6jdXez6/qlbLjSsj4qts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719911759; c=relaxed/simple;
	bh=MRAyKK0fVdVJwWvA6JVDZsXJD/sJbapIKeDiht7fGso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbRtFXso+/R16atni4MxQJK7KgWhC+rKm0cRWE+D/DVeikCK+U9Ap+UVIHKgJGBXR9j7uk7NxM6FQTBxHWeR7ctzgAyTW8zO0hWio4ylsDWew1Er/Ou7/6MZBEdsdDxefHGVpc9lx2sMjg2qsMMsXyT89dtKfOYuX5MwTdfvMkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvaTpcwd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C126C4AF0C;
	Tue,  2 Jul 2024 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719911758;
	bh=MRAyKK0fVdVJwWvA6JVDZsXJD/sJbapIKeDiht7fGso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SvaTpcwd92zGVXxnkMxaFkRDqNvZSb7ipiQGdnO0Va1V7f8GM/VW28dsLpX/YlAl7
	 mW4kvxVRwOn8Hp//L/HJQiibGZCTjo4/loArRKGcW8hUqtUi7Ky8zZPfANO0ULRuZE
	 dORlT+MNNs2eKIhg7T0w8KaXFE8IGGM8N2cL24eltpUDeTtui3XmgZPPDUQP3BmJXU
	 MgMCZKAqM+a5PG4WOoWy5lgNKiKOed+fA317ShMY2ByuCB2FiANWITSi5wz4vl2Jy+
	 SG+MEFTAEFXbWfOrqI5uL9jdcDJ6q+96KX9BRZsEA7jUNzIrcZe5c6xoPzXp3U2xcc
	 Rdcvpu5+t8Lfw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec52fbb50aso46571561fa.3;
        Tue, 02 Jul 2024 02:15:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYCWa1PzSOmODUiOlyuqYL9WzZNcZf/Hl4/CuFparnh1l0WLZdsS0AEoUm+feAGdy4+t+yEKWf0jMylFJSO77CDSF+0bDhkaT4Z8TW8FHgIhxHo97PFtxw0KJ92qpn3+DwB6d6MITvBaoaO0tm6LVB1pjimckU11IeFrJJVsvjdaamUEie1Q==
X-Gm-Message-State: AOJu0Yz27TSPscKPbQHW6lGvMgtqvCjjpWk62PYlg/HHZyu13OxmR9Vo
	faMH68jeGNqiX1doaH1eL5KEfKgfDR93hgZpoml5SSPtqKWThzckukAdhOlgkiYb5HjLmbxmOOe
	PmbD0g1hhfwCs2ZQshAKeSVJWA6o=
X-Google-Smtp-Source: AGHT+IE4GHDcQXiZ5qOndjTEyoCt4LL+YrGb1SRx7bLn4ugUXHEOWryM5hy1HMDniW1HFtWRzZrIHHez4npdaavw/Sw=
X-Received: by 2002:a2e:9dd4:0:b0:2ec:403e:6314 with SMTP id
 38308e7fff4ca-2ee5e3809b5mr55808121fa.3.1719911757135; Tue, 02 Jul 2024
 02:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240427145502.2804311-1-masahiroy@kernel.org>
 <20240427145502.2804311-5-masahiroy@kernel.org> <ea24aa9b-291d-47bc-98cf-5893926ff8da@kernel.org>
 <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com>
 <9771d50d95e508bf8971a36b6475c782c42b46a1.camel@intel.com>
 <CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com>
 <803eabc8e2fa5dec950d149f83027fd204d5ef69.camel@intel.com> <2ada559c1a4517ed879bb662689815b4357674ac.camel@intel.com>
In-Reply-To: <2ada559c1a4517ed879bb662689815b4357674ac.camel@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 2 Jul 2024 18:15:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ47bZpE6c6Yoz-jQS78uU611oZwU8bH+7e=p5zSyADJw@mail.gmail.com>
Message-ID: <CAK7LNAQ47bZpE6c6Yoz-jQS78uU611oZwU8bH+7e=p5zSyADJw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "nicolas@fjasle.eu" <nicolas@fjasle.eu>, "conor@kernel.org" <conor@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "krzk@kernel.org" <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 7:54=E2=80=AFAM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2024-06-28 at 14:23 -0700, Rick Edgecombe wrote:
> > On Fri, 2024-06-28 at 11:13 +0900, Masahiro Yamada wrote:
> > > There are two solutions, depending on what you want to achieve.
> > >
> > > The official way is to pass the absolute path to M=3D
> > > (or relative path to ../linux-tdm-kvm-out)
> > >
> > > The other unofficial way is to pass VPATH.
> > > The external module build does not officially support
> > > the separate output directory, but you can still
> > > do it in this case.
> > >
> > > [1] will work like before.
> >
> > The absolute path worked, but why not make it use the relative path by =
default
> > in this case? "arch/x86/kvm/" shouldn't be confused with an absolute pa=
th...
>
> Argh, I missed that make ARCH=3Dx86_64 O=3D../linux-tdx-kvm-out/ -j36 M=
=3D$(realpath
> arch/x86/kvm) will output the the source tree instead of the output direc=
tory.
>
> So there is no official way to build just a module to the output director=
y?


You already know how to do it:

#I'm guess it has something to do with the "M=3D" option because:
#make ARCH=3Dx86_64 O=3D../linux-tdx-kvm-out/ -j36 arch/x86/kvm/kvm.ko
#arch/x86/kvm/kvm-intel.ko
#
#...works.




> And
> it just accidentally worked all these years? IMO it's a nice feature to h=
ave.
> I've especially found it useful when doing virtualization development whe=
re you
> need to build/test guest and host kernels as the same time.
>
> Or was it just now delegated to unofficial support after this patch?


No.
The M=3D option is intended for building external modules.
You just abused it to build the upstream modules.

Kbuild has never supported building external modules in a separate
output directory.


"delegated to unofficial support" is a wrong statement,
as it has never officially supported in the past.


Your way is a workaround that people found happened to work.






--=20
Best Regards
Masahiro Yamada

