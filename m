Return-Path: <linux-kbuild+bounces-581-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 922D182FDF8
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jan 2024 01:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2204B289D87
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jan 2024 00:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B44B642;
	Wed, 17 Jan 2024 00:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQOe3HaY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3965EB641;
	Wed, 17 Jan 2024 00:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705450956; cv=none; b=TODutIjh4gr7FqKxhJ0gOB2xrYI64+BFXpl6B+JV38aGQu2Cvj1X2KJ187eugjrFhdZqV3ZlMmxH1E2GepsAI6W2UbPengqwXF7CFf8p451sBPh6zAQzZ7XVfSYjNr/7FAw5tbh21lOVcFwJfuTJqlaVQgfsyzQ11PQ9ZtIAIyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705450956; c=relaxed/simple;
	bh=e1EAVS0NjhXdvVPSZSo1uqGu9RFrRzGAusUIpBOA2C0=;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:
	 X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding; b=Ep07qHBlZGiGRsm9S1roIu1r5X0akSypxOi3LXqIFYzWWDoG//69ImJK60zfDWvjInVbwrsmHgH9UCR5ffffApHqnYflLiMaREzRV2gLjN2rH7LmaJPJVULXah80SoJPTfBUDvUs9AuJCC7vlfaoj+TZJw/wJCBUKLvhf7eQFZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQOe3HaY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF595C433F1;
	Wed, 17 Jan 2024 00:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705450955;
	bh=e1EAVS0NjhXdvVPSZSo1uqGu9RFrRzGAusUIpBOA2C0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nQOe3HaYLmXpohm8Av05AiLGrtsLzzKoIDdvQ5w4wVVqibgVKe754hTloxZ7YIysr
	 E1qKU5S8Pwbs9sLkb/71lW2pSYZbhPzdDWR09LzM7BiT7AzbV6adU6TVFFA0wkHkD2
	 ySVHskdWU5cxxcB3atdlDiVMbaTQ78yfTsfwNCfd9uyK0v8nVQMT72qwXfU/6h14XF
	 LsaXp73vHfhkeYwCqkZOyFrdeS10y9Dfh6afA8zjG7LQsz0Rpof02OWIRACfdKSqWm
	 b0ff9il3aqNN5ALiKMX42NqKpjFXWCTJsboKtTecBI8bzjP2iVXVH0FGt9AwXPwRsO
	 4IKzEIcnxOLhQ==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5989407dd3cso2298944eaf.0;
        Tue, 16 Jan 2024 16:22:35 -0800 (PST)
X-Gm-Message-State: AOJu0YygIjvJUO+vedJ9mM3ckewiTPZ2rM/bV1heUaCKXuMtpJlTFZI7
	vVS9/E8/QDy5QmKeM650gfHxzEKjCk3WizP0ZrY=
X-Google-Smtp-Source: AGHT+IG5Fwy3pj6UnCb/wfvu0oBqHbX6t/MTS2UwX0Sg4IrOvcfTXzc3FOJwp92eS8vBON/PrXnIOZZk6dTI9usNYDw=
X-Received: by 2002:a05:6870:1953:b0:205:fd77:f3e9 with SMTP id
 m19-20020a056870195300b00205fd77f3e9mr5778933oak.39.1705450955018; Tue, 16
 Jan 2024 16:22:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk> <ZaUo7ctf5H/qqqkG@shell.armlinux.org.uk>
 <CADWks+a7jBSqWZh-MJSp9x8vTUFvzu6c2GTHc8eQaMNE5VDrQg@mail.gmail.com>
 <ZaVAaScCdwpWuAH0@shell.armlinux.org.uk> <p22vxc3uchm35sq3rgwcakydrvdiq7vlkql3s7dj73n7iracwe@dh3qgcpb53sh>
In-Reply-To: <p22vxc3uchm35sq3rgwcakydrvdiq7vlkql3s7dj73n7iracwe@dh3qgcpb53sh>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 17 Jan 2024 09:21:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQKmVUg9SqKvZigyx3A79pzsPVrwZjdq+t9hrxU5X+eZw@mail.gmail.com>
Message-ID: <CAK7LNAQKmVUg9SqKvZigyx3A79pzsPVrwZjdq+t9hrxU5X+eZw@mail.gmail.com>
Subject: Re: Re: [PATCH] kbuild: detect depmod version to exclude new SHA3
 module signing options
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Dimitri John Ledkov <dimitri.ledkov@canonical.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 7:36=E2=80=AFAM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Mon, Jan 15, 2024 at 02:25:45PM +0000, Russell King (Oracle) wrote:
> >On Mon, Jan 15, 2024 at 01:09:25PM +0000, Dimitri John Ledkov wrote:
> >> On Mon, 15 Jan 2024 at 12:45, Russell King (Oracle)
> >> <linux@armlinux.org.uk> wrote:
> >> >
> >> > Ping?
> >> >
> >>
> >> The intent is good.
> >> The implementation is incomplete.
> >>
> >> Please respond or address review feedback emailed previously. See
> >> https://lore.kernel.org/all/CADWks+Z5iZ=3DP_OAanA-PiePFbMpwtRe3_dF8wRT=
ak8YAi87zvQ@mail.gmail.com/#t
> >
> >> Did you test that things are successful wtih kmod 29, 30, 31?
> >
> >No I didn't. See my comment below the "---" line:
> >
> >"I don't know what the minimum requirement is for SHA3 to work, so I
> >have chosen a minimum of version 29 for the purposes of this patch."
> >
> >> The code to correctly support sha3 in kmod was committed after 31 was
> >> tagged, and there is no newer tag yet hence the revision that has the
> >> correct code is v31-6-g510c8b7f74.
> >
> >Thanks for the information.
> >
> >> If such check is desired, kmod 32 should be tagged and check should
> >> check for 32.
> >
> >"If such a check is desired" ? You mean you prefer systems to segfault
> >during the installation step when the build system doesn't have a new
> >enough kmod?
>
> I don't think we should check the version number at all to workaround
> bugs like that. It'd better we let distros to port the fix. If we need
> a 29.1, 30.1, 31.1 kmod releases to make this common for distros,
> I can help make that happen.
>
> Lucas De Marchi



I think Russell's comments are sensible.

But, if Lucas back-ports a fix-up to older kmod versions,
that sounds great too, as I do not need to pick up this patch.





--=20
Best Regards
Masahiro Yamada

