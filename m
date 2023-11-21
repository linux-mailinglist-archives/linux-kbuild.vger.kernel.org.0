Return-Path: <linux-kbuild+bounces-93-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECA7F23CC
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 03:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3E501C21631
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 02:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058A714F63;
	Tue, 21 Nov 2023 02:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sxly0vUX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB79514AA4
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 02:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C44EC433C9;
	Tue, 21 Nov 2023 02:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700533287;
	bh=uCIAAso2o2OQwlp0AJVheBQitVA2TVtgsiyQ+Mez97M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sxly0vUXgMDBDfLs6ZoxC1suGBtCN9UTkQUnCVmRPm7tnzA9x6u0Mh2J4rYzJ+wj1
	 ZhOIdNEUs6ZZ0DVck7xZw37dh7+FqE3j5tipC5yE0O0IwRop4ORVosQST+sSNlMIDb
	 b9JWh9ywNem+hqYeFTpyHeFc+bHF5lRjW/vQIstkgG4kLKn03W2YloHjGScCk76uOk
	 AZWBZmKXpCXD39lws8w9g8r/8gifhF/NiEWqDTjZDXdhIeiAMUcgPVITbJaCyHl7vR
	 xoUjUV6tJX3eEXzNc1yMQcjlCN+5335TBdOpqX69bHvAZpnPM8nvzrd0tiMvBIh5oy
	 bJ+b3s9OlvU7Q==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1f94b07b6b3so674426fac.2;
        Mon, 20 Nov 2023 18:21:27 -0800 (PST)
X-Gm-Message-State: AOJu0YyJR/fUlY2pSwFO9l5//UPGaW85yDVwfERSGEHu6/yPuAPGjxoU
	DVKXmQ+FqoVlIkxz5H2IoXs40+PZ/iSeswztad0=
X-Google-Smtp-Source: AGHT+IEeCJtyTxsn3ccB7X1hkNcVLwoefNC9DpgwnLhiXBf7c1hy2h1XXtbmfmFWRru6YpJUsZbzvef6EEFa3dKQWOw=
X-Received: by 2002:a05:6871:22c9:b0:1f9:48fb:1835 with SMTP id
 se9-20020a05687122c900b001f948fb1835mr4140629oab.46.1700533286595; Mon, 20
 Nov 2023 18:21:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115004932.650702-1-ak@linux.intel.com> <CAK7LNASS1YWdqW5TUXQ0iC3vgoDbUf-M-cRX0BvrkOV8HPyjxg@mail.gmail.com>
 <ZVu8u+oofXO8iwyf@tassilo>
In-Reply-To: <ZVu8u+oofXO8iwyf@tassilo>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 21 Nov 2023 11:20:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNATFPWRaQb876p4=5K0H-Uc7KCLsVNnYVdxSypzmmfSv9A@mail.gmail.com>
Message-ID: <CAK7LNATFPWRaQb876p4=5K0H-Uc7KCLsVNnYVdxSypzmmfSv9A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Add inline-account tool
To: Andi Kleen <ak@linux.intel.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 5:08=E2=80=AFAM Andi Kleen <ak@linux.intel.com> wro=
te:
>
> >
> > > +    sym_sizes =3D [syms[x + 1] - syms[x] for x, _ in enumerate(syms[=
:-1])]
> > > +    sym_total =3D sum(sym_sizes)
> >
> >
> > This is equivalent to
> >
> >       sym_total =3D syms[-1] - syms[0]
> >
> > isn't it?
>
> No it's not when there are gaps in the symbols, which always happens in
> the kernel.  The previous version used the range but that led to inbalanc=
es.



I do not understand because there is nothing to handle gaps
in your code.


get_syms() appends only 'pc' into the list.


Then,

  sym_sizes =3D [syms[x + 1] - syms[x] for x, _ in enumerate(syms[:-1])]


computes each symbol size by:

   (address of the next symbol) - (address of the current symbol).


So, your code is equivalent to:

   sym_total =3D syms[-1] - syms[0]










> > def get_ranges(syms, threads):
> >
> >     ranges =3D []
> >     prev =3D syms[0]
> >     i =3D 1
> >
> >     while threads > 0:
> >
> >         boundary =3D prev + 1 + (syms[-1] - prev - 1) // threads
> >
> >         while syms[i] < boundary:
> >             i +=3D 1
>
>
> Note the boundary is not the address, but the sum of symbol sizes
>
>
> -Andi

--
Best Regards
Masahiro Yamada

