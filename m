Return-Path: <linux-kbuild+bounces-2580-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24193415A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 19:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4583028146E
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 17:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E1917FAC1;
	Wed, 17 Jul 2024 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJcdzzlT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87691E526;
	Wed, 17 Jul 2024 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721236749; cv=none; b=sLfGPhVDG0jqkS4+F9Al/LZsYLFDZbCp2j8cIDebPytwBHmjsVdJrgBYLSc2TbmP1cYWTiT0HxB7GHtrtV4kUBCTNXq9zBZ8dzM9+ao1mvB2/HF6t9Ts6b2cBpWlM2Pm4bTw+6524v9RJiFQI1ybuzEGXYcM6782uCdNClf0BiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721236749; c=relaxed/simple;
	bh=ZJFx6OAcpAMtlmchc/ApoFKdR2XcOKPR+oPx1dwqlgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAuWd06D/mX5ltdBTAHFW3oYl+szWSD4MXi8XOKH1iGlJh+2H7TvvbRAD69e1oGOVp5tXrJnnPAJZ4+1al2yD9i5ZYNDcvKUVg32wyDZnA3CT34jnFoEwHBYw1ziYRwKJU7ayuOheDmMVGDtbSXGjSgfYU8KLyH9F/oC9/EFPBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJcdzzlT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A5FC4AF0D;
	Wed, 17 Jul 2024 17:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721236749;
	bh=ZJFx6OAcpAMtlmchc/ApoFKdR2XcOKPR+oPx1dwqlgA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NJcdzzlT8HDJcQzCxEZfbL//y1wrhsNhR/7bM+zbGx3CwP4q4HZfvhDvukg36iJDy
	 49iLXTDV/zZsTLERSfCuKDOYOhZyFvPijbiz7BMJmXPWjtPH8j53ASa7kD0jeoH/2a
	 Y6hgDVMhMis0YlD+EBhKBK63T+E70WYnj7KZPcNdkAjcuYlw0kEDqPg5sw4ohu10J7
	 DHZvQyagW00bru9F64RAKg2BBp9TYaTj0zgFBCZo9OmBmwxyozJ9Dbv10mUdTAOVFh
	 FKCEtBwgNz6C/AbLWVDJPOAzAoAFkYyXnFoOv+d6CdTrjnPWhxwa/ecnN3/TDPFaWo
	 RpP0eFABhBeew==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eeb1051360so334721fa.0;
        Wed, 17 Jul 2024 10:19:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUea0/sfFSDVLzaGqT8Mnj0vF5Z4j+IKIvV2tstEORjr4YtzjU7KMMJO/JMGGBSz7vQ1wU1+CXJmYGDXFsJBN965aIpoGwxYYzEBnb7wW9W2QwRP/Rh4Rk503L2HAdTYVirekQWG5Ziw7VM
X-Gm-Message-State: AOJu0YwO7uD2l1etqc8URo+KUsP2DkkatepHrTwiHvpwQZ32ZFBpOtmZ
	ncWILCICiD1fK8dRkro4B6ngbGBeFEf0npl3xxOYerOeyfiuiUeh6QAVYmFP9is0VXntilQ/biY
	S99YO5zXGz7Dsdk1s3ZKRoI0evzk=
X-Google-Smtp-Source: AGHT+IEPJ+Oi/ELsHNdPAp6d4Hj7fV8B8c7RGYBGVFucB/hc7o9mbVh/cOzpfgFwK9OMUBzx1Z3afPiYJClbZF4WU+U=
X-Received: by 2002:a2e:97c9:0:b0:2ec:3fb8:6a91 with SMTP id
 38308e7fff4ca-2ef05c6e430mr513961fa.19.1721236747866; Wed, 17 Jul 2024
 10:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
 <20240717011515.GA1230090@thelio-3990X> <CAK7LNARYNqjcMkdnaY2oAkxttFTtTEgJ9VuOZOn0i4AuXp-How@mail.gmail.com>
 <CAK7LNARGWu8q5dAW5tYzfiSKKtZ9t8Dm9FzRoaoZhU4d-TWswQ@mail.gmail.com>
 <20240717135747.GC24892@thelio-3990X> <41cf1da7-ef13-4586-9e9a-f1f8f3b34d8e@t-8ch.de>
In-Reply-To: <41cf1da7-ef13-4586-9e9a-f1f8f3b34d8e@t-8ch.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Jul 2024 02:18:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQVSZZCPvh9Z1OE2PZbp5n1H8njMoxs8wZPkK_5UDFv-w@mail.gmail.com>
Message-ID: <CAK7LNAQVSZZCPvh9Z1OE2PZbp5n1H8njMoxs8wZPkK_5UDFv-w@mail.gmail.com>
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman package
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 1:33=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> On 2024-07-17 06:57:47+0000, Nathan Chancellor wrote:
> > On Wed, Jul 17, 2024 at 05:51:21PM +0900, Masahiro Yamada wrote:
> > ...
> > > > > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUIL=
D
> > > > > > new file mode 100644
> > > > > > index 000000000000..eb3957fad915
> > > > > > --- /dev/null
> > > > > > +++ b/scripts/package/PKGBUILD
> > > > > > @@ -0,0 +1,99 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > +# Maintainer: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > > > > > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlin=
ux.org>
> > > > > > +
> > > > > > +pkgbase=3Dlinux-upstream
> > ...
> > > Perhaps, this may make sense.
> > >
> > > Currently,
> > > pkgname=3D("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-api-headers"=
)
> > > is hard-coded.
> > >
> > > I do not think linux-upstream-headers make sense
> > > when CONFIG_MODULE is disabled.
> > >
> > > scripts/package/mkspec turns off with_devel
> > > when CONFIG_MODULE is disabled.
>
> Ack.
>
> > Yes, I think that is a reasonable change to make. In the face of that
> > potential change, would it make sense to slightly adjust the
> > makedepends? pahole is only needed when CONFIG_DEBUG_INFO_BTF is enable=
d
> > but I guess no other package building infrastructure makes dependencies
> > conditional in that manner.
>
> The pahole dependency optimization seems like an overcomplication.
> Arch Linux in general is not hell-bent on minimizing dependencies,
> for example there are no dev-packages at all.
> Also if the kernel will require pahole in more cases it will create
> churn.
>

FWIW, we conditionally added build-dependency for the deb package
in the past, but I gave up on maintaining it.



See b88365b6d74edc88a9d283c837fec05b13d401a6


--
Best Regards
Masahiro Yamada

