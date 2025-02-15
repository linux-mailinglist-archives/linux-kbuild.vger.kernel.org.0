Return-Path: <linux-kbuild+bounces-5766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF853A36EBC
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 15:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7BA170DAA
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 14:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9A41A3176;
	Sat, 15 Feb 2025 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYaZmSXG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41DD13DDAE;
	Sat, 15 Feb 2025 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739629226; cv=none; b=rCq2WkSh5I4X6DnJFXWiTriCvQpUsMTuHV5P+uBNTqd6bDcVD/30TYUz/EDXesM6FDiPm0dP55urpz/7hfXUnd6crche615C8/3cKwytq6EP/OxWdQ01N/P/+KQ40SNa3OLfGB0l6Iom1tGkFv+xveK+fAJmVVG5+UFQwHXb0t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739629226; c=relaxed/simple;
	bh=vMvQRjuv1vGCSFx8wFuFSrwF4Vfs84FA2cOaPrDafZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2mIXrHHX8RR2bY+1lstNox4RPaQ/HXzFKko14WPUIEoov08ATESc/CHWJU6eT1sldwXPOuI6Qv3dx00RAIymXSBsANnS+6xJgZgP99LcOYj8zXzA0GKSUja5IfCNWkdE/Ixf+M18wy+RGhIq3NMmg0UoiTVSQgWtqL59ByXACk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYaZmSXG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54115C4CEE8;
	Sat, 15 Feb 2025 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739629226;
	bh=vMvQRjuv1vGCSFx8wFuFSrwF4Vfs84FA2cOaPrDafZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HYaZmSXGFXQ7XcFmvAhp5sLGJ4+Mxv0Ll+Iuy+rwJcuVrBSlYM+ea3VBIEQyr/2tb
	 o8llVs0DlGciXon2G4zCZJvkrGT3JTFELmSKXsZzjk+ZcYXgQjtm2GCGPax9a53Zr/
	 JC5UOvtX2cFt3Pgc0dPFMqO5/1WDCKjcPGiSHhO89xAMZi6tDPfKUlatSyxnv1v5s+
	 E3jzpKxgk/HnKp359kDhFTovdvpcMMY6amC7YGx6FLD2cZfu6JbWQsQRRZ6bDhFqCF
	 ER1zG+iEz3hPO8P/Zx2Kw//pF4n3sv8l2i/O2e3w8qpF8HHzPI9TudkfGCZuNA+Ra8
	 gyX4Oxl74F0SQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3091fecb637so14120201fa.1;
        Sat, 15 Feb 2025 06:20:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUncpjoqN+YgJU8Wg3J5XjV9qOk9ByWnYPhl1yZw7Aq2UZRSI+aKetUbD3dv4phqAOxYkJzK7PN+Rk=@vger.kernel.org, AJvYcCXDLw+pmNt3EPfmsAb+v9twFZM8jB0DsSzRAFb+fSpxr26XCf3AmzeHkfafZ1hlqSPMg37X2cLTE40Adrsf@vger.kernel.org, AJvYcCXgAPUcxHY/hT7ps5qJTSbvc3C+7WKwVz4OWwQNXxsNCWO5n0L5SIxtz8jCP7o2edNtB0WrxMzkVVNdT+tw@vger.kernel.org
X-Gm-Message-State: AOJu0YyRhxXWQGuefeQag4VqzGvQdzWorCux3VzRYZ5mlFaMDh+N9kb3
	Cn9wdyhTLbgcpLzDIJXDoSLDR4LMty5CPJuwFkPPrEsEQHYvtWTV3t+YQsa7zMsFCFb9ZM1NS9c
	rP8aFYUGi51IffUG+Mq3wx2WOf0Q=
X-Google-Smtp-Source: AGHT+IEn4QmvBBN4zk0EepOwGaCTOHfaVaSe8FqudfNVLihJRqeNKKool8KtoxB6GlwlfdxZCKdgpO3jveG+b+F6Nug=
X-Received: by 2002:a05:6512:2342:b0:542:2190:9d99 with SMTP id
 2adb3069b0e04-5452fe2e32bmr1192255e87.6.1739629225000; Sat, 15 Feb 2025
 06:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250215114223.140688-1-krzysztof.kozlowski@linaro.org>
 <CAK7LNATqSPBnGfVXCfJq7oCtE1ge4-L5QY6gVx8_chpmKDQusg@mail.gmail.com> <886cb4b9-9d95-4346-9c38-923cb7c69036@linaro.org>
In-Reply-To: <886cb4b9-9d95-4346-9c38-923cb7c69036@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Feb 2025 23:19:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQXXrwCGHKJRCynM3edT9JyQ-f_CXHOoZaBH76csD1URw@mail.gmail.com>
X-Gm-Features: AWEUYZl1j8av6G_nZeziPb8eszZ-qUH_e-MDL7y56CpjrilMtMb_j-ZyK67b6wo
Message-ID: <CAK7LNAQXXrwCGHKJRCynM3edT9JyQ-f_CXHOoZaBH76csD1URw@mail.gmail.com>
Subject: Re: [PATCH] docs: kconfig: Mention IS_REACHABLE as way for optional dependency
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2025 at 10:02=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/02/2025 13:54, Masahiro Yamada wrote:
> > On Sat, Feb 15, 2025 at 8:42=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> Several drivers express optional Kconfig dependency with FOO || !FOO,
> >> but for many choices this is neither suitable (lack of stubs for !FOO
> >> like in HWMON) nor really needed and driver can be built in even if FO=
O
> >> is the module.  This is achieved with IS_REACHABLE, so provide cross
> >> reference to it.
> >>
> >> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  Documentation/kbuild/kconfig-language.rst | 13 ++++++++++---
> >>  1 file changed, 10 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation=
/kbuild/kconfig-language.rst
> >> index 2619fdf56e68..66248294a552 100644
> >> --- a/Documentation/kbuild/kconfig-language.rst
> >> +++ b/Documentation/kbuild/kconfig-language.rst
> >> @@ -194,6 +194,8 @@ applicable everywhere (see syntax).
> >>    ability to hook into a secondary subsystem while allowing the user =
to
> >>    configure that subsystem out without also having to unset these dri=
vers.
> >>
> >> +.. _is_reachable:
> >
> > Instead of this, could you move this hunk below ?
> >
>
> Ack
>
> >
> >
> >
> >
> >>    Note: If the combination of FOO=3Dy and BAZ=3Dm causes a link error=
,
> >>    you can guard the function call with IS_REACHABLE()::
> >>
> >> @@ -580,10 +582,15 @@ Some drivers are able to optionally use a featur=
e from another module
> >>  or build cleanly with that module disabled, but cause a link failure
> >>  when trying to use that loadable module from a built-in driver.
> >>
> >> -The most common way to express this optional dependency in Kconfig lo=
gic
> >> -uses the slightly counterintuitive::
> >> +There are two ways to express this optional dependency:
> >>
> >> -  config FOO
> >> +1. If pre-processor can discard entire optional code or module FOO do=
es not
> >> +   provide !FOO stubs then in the C code :ref:`IS_REACHABLE<is_reacha=
ble>`
> >
> > Instead of the link, please move the code example at line 200 to here.
> >
> > The note at line 197 is not strongly related to the 'imply' keyword.
> >
> >
> > One more thing, please document the drawback of IS_REACHABLE.
>
> Ack
>
> >
> > It is true that IS_REACHABLE() resolves the link error, but we
> > will end up with run-time debugging.
> >
> > foo_init()
> > {
> >         if (IS_REACHABLE(CONFIG_BAZ))
> >                 baz_register(&foo);
> >         ...
> > }
> >
> > Even if CONFIG_BAZ is enabled, baz_register() may get discarded.
>
> Hm, why would that happen? For compiler this would be "if(true)", so
> what case would lead to discarding?



Let's say this code hunk exists in foo-init.c
and it is compiled by CONFIG_FOO.

  obj-$(CONFIG_FOO) +=3D foo-init.o

If you see the top Makefile, 'MODULE' is defined only when
this code is compiled as a module.

   KBUILD_CFLAGS_MODULE  :=3D -DMODULE

For the combination of CONFIG_FOO=3Dy and CONFIG_BAZ=3Dm,

   IS_BUILTIN(CONFIG_BAZ) is 0
   IS_MODULE(CONFIG_BAZ) is 1
   __is_defined(MODULE) is 0

Hence, IS_REACHABLE(CONFIG_BAZ) is 0

This code becomes

   if (0)
          baz_register(&foo);


and the compiler will optimize out this function call.



--
Best Regards
Masahiro Yamada

