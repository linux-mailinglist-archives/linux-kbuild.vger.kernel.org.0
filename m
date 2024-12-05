Return-Path: <linux-kbuild+bounces-5002-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0A9E4C52
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 03:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C00FB28630F
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 02:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A39A1891AB;
	Thu,  5 Dec 2024 02:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxz5O1FA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39612187FE4;
	Thu,  5 Dec 2024 02:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366051; cv=none; b=uTCiQsCuPzF8ZOJoz3HnXnXiF1CRcNsW642KbX24RQmAlEh45k07rT2Q4Kv7gTQwWgclPwPS+pVhQ1Nff/uKMhcgNhgBKBZjf7+HOXGe2c8yEl/03p9AgrAJsivmx/DmmIOJmed4M8Ww9IeeoRfwrHKb6GyLO1kGwY+zJmX9idc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366051; c=relaxed/simple;
	bh=UA2Uea6IGitYgfix2+eS7XWDk5SRJWyMNtpCYH383+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjuwOdnLXyTjqk0BXI+Uhmt07ANbFyrLxWAHdGbJfVJie+tEfMV5s4CBM0BUnnO7gcgL/FJQooWjpBRuzHK4i73Oyjcm7cVwYK+fXCgP7U4fhtpAHTgoNGk8bV6MzjG6GNNtkPazAC/mZtALEPuyU0CtfyajwLH6RykMB2B5RiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxz5O1FA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B63C4CED2;
	Thu,  5 Dec 2024 02:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733366050;
	bh=UA2Uea6IGitYgfix2+eS7XWDk5SRJWyMNtpCYH383+M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pxz5O1FA21sHXdqJoW4ydp49kC1q4DawugzBJoe+FT3XF2PqO2AGafugxpJmwrQjm
	 8zak05K8DnETcDGQaMVRlwW2faNQrfb72FXjtNG+SBj5I+4XqJ7La59tMTOy0JKRA0
	 9k248/V0ecp1Y4odMbdmbKp6kdWegA1N3vkFEABK5rdVmocSM7nBK7LMMYp8BIixI0
	 K6nNAo9sFTXKhHvlEW9xAJ+9rowBo628XgK4/wCUVGCm4wPwzV7xVc3HIf4V5Xfm7z
	 NiMIj94y2QbkiS1ehvIU8g3B1Xx6VCi0j+Vo0Ab5Pf2cfUq3IBD+zaUrSzPMEp61g1
	 UQkgOHgcpBFLg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so380672e87.3;
        Wed, 04 Dec 2024 18:34:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWB6VN3ocFOsRHDnWVRS4qy0OqrAlwMHIz+vmVNZyW5X2I484p9THRm/k7gdqkeM+NsxSTHtfIWfLrNrCo=@vger.kernel.org, AJvYcCWfuD1z91z5tZurR64ZBvFlPOVTZkQJwEBBY06W5gfq/ZM4rBa9zpdOXxbD7lVKbXIvHH0nzPItoJqMuYrw@vger.kernel.org, AJvYcCXUNHj4/suWtY6DgVassFogSRLvP0QY5S/0fvXz4TWNEEwlivRK7VqxfFba/9b8y/nUYOpSg8AyHcpPCu6jZo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBB2jbXCDSUCG+OAZId0vx2Nk/7cWKGdX+jZw0O4BEaix3Nf4V
	u9G9fA4HqiDA0RJG5DE5js50YcewOVSdbTU/bGKYvLqKGA+GddXIDsRdl8ALmzxmhHmE6CNAPOM
	mNft+HiP2qjVthF/kahs/zZi5SiE=
X-Google-Smtp-Source: AGHT+IGrXJnAWJ9eKTc0ln8iyn1stVLkq01FLiKFwS5cJm5ma4gHywwcy98ADbBgmYN9C9+w2atpMxYn2UYI0iUGHDc=
X-Received: by 2002:a05:6512:1247:b0:53d:a321:db74 with SMTP id
 2adb3069b0e04-53e12a28208mr4826786e87.50.1733366049377; Wed, 04 Dec 2024
 18:34:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110013649.34903-1-masahiroy@kernel.org> <20241110013649.34903-6-masahiroy@kernel.org>
 <Z1DAzaKYD_rfgGnk@aschofie-mobl2.lan>
In-Reply-To: <Z1DAzaKYD_rfgGnk@aschofie-mobl2.lan>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 Dec 2024 11:33:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNARCz1s2z_mBJgL_S+=o8jWOGSmRb017WLFXaKdp5EDiqw@mail.gmail.com>
Message-ID: <CAK7LNARCz1s2z_mBJgL_S+=o8jWOGSmRb017WLFXaKdp5EDiqw@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Alison Schofield <alison.schofield@intel.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 5:51=E2=80=AFAM Alison Schofield
<alison.schofield@intel.com> wrote:
>
> On Sun, Nov 10, 2024 at 10:34:33AM +0900, Masahiro Yamada wrote:
> > Currently, Kbuild always operates in the output directory of the kernel=
,
> > even when building external modules. This increases the risk of externa=
l
> > module Makefiles attempting to write to the kernel directory.
> >
> > This commit switches the working directory to the external module
> > directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> > some build artifacts.
> >
> > The command for building external modules maintains backward
> > compatibility, but Makefiles that rely on working in the kernel
> > directory may break. In such cases, $(objtree) and $(srctree) should
> > be used to refer to the output and source directories of the kernel.
> >
> > The appearance of the build log will change as follows:
> >
> > [Before]
> >
> >   $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >   make: Entering directory '/path/to/my/linux'
> >     CC [M]  /path/to/my/externel/module/helloworld.o
> >     MODPOST /path/to/my/externel/module/Module.symvers
> >     CC [M]  /path/to/my/externel/module/helloworld.mod.o
> >     CC [M]  /path/to/my/externel/module/.module-common.o
> >     LD [M]  /path/to/my/externel/module/helloworld.ko
> >   make: Leaving directory '/path/to/my/linux'
> >
> > [After]
> >
> >   $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >   make: Entering directory '/path/to/my/linux'
> >   make[1]: Entering directory '/path/to/my/externel/module'
> >     CC [M]  helloworld.o
> >     MODPOST Module.symvers
> >     CC [M]  helloworld.mod.o
> >     CC [M]  .module-common.o
> >     LD [M]  helloworld.ko
> >   make[1]: Leaving directory '/path/to/my/externel/module'
> >   make: Leaving directory '/path/to/my/linux'
> >
> > Printing "Entering directory" twice is cumbersome. This will be
> > addressed later.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
>
> With this in v6.13-rc1 the cxl-test module fails depmod.
> It causes depmod  to be invoked from the incorrect place
> (or something doesn't respect INSTALL_MOD_PATH)
>
> Is there something additional that this cxl-test module needs
> to do?
>
> Repro:
> /git/new$ make V=3D1 M=3Dtools/testing/cxl INSTALL_MOD_PATH=3Dqbuild/mkos=
i.extra/ modules_install

Kbuild changes the working directory, so you need to specify
an absolute path for INSTALL_MOD_PATH.

INSTALL_MOD_PATH=3D$(realpath qbuild/mkosi.extra/)




--=20
Best Regards
Masahiro Yamada

