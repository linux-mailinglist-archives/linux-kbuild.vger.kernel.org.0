Return-Path: <linux-kbuild+bounces-5084-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490D79EDD5E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 03:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6801B162464
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 02:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0545413AA20;
	Thu, 12 Dec 2024 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xp1kzy9l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB00B1304BA;
	Thu, 12 Dec 2024 02:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733969354; cv=none; b=UVIcDD0xRSH04/kYsR1PIrK8Zr4RHZ+lHclMe0wVXwZ7tmmD2uQaCX1NObLebuby91mVBYaLvv4AcaXqwW8zq/sRb70rkdBXJVlLqM1XvmfLAuWHjO4kLDqwzJjJ0STDHXHCGbtDd/O/+PlnMDf5jeXIqipRlgyxaaUAp0pMFu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733969354; c=relaxed/simple;
	bh=RX1KM030pVU5SrawI2Bpt7O7lQKBznHQJyKYqseyMrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lX+h58u5G+cBXQ4t2jUEoDc2wN0WcfdaiyJCEnmiaMhuc5HFryTo83DhWZEzw542kq0hroax8ZAG/G7HcMynP+z9L79cGR3Z2CQkG2C1B+YhtIZcUfW2pDr1Ti8roAg0CRd0FPOj9LYLaN7YU8FG6dn8hW7Eky+LEUPNCelS2gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xp1kzy9l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619FDC4CED7;
	Thu, 12 Dec 2024 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733969354;
	bh=RX1KM030pVU5SrawI2Bpt7O7lQKBznHQJyKYqseyMrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xp1kzy9lKs5Y6tnQlhNJ4JHBfuHXEkK7578NGBOpcervYUOIqvqkw4auqfpNGEee/
	 pfSBBa4O9h61rSD9KQ7E89DHKyFyh2O87ThZWl3YK/5YePxA+CnyZdd0qH/2p7ni7S
	 yyrLOAS7+T/0Ihq42ZF9BuCaA0RE0j5sqBEQ+krP6azEPAmCfG2HJBPKYxyQmh4GXn
	 tm3xPrYcsH3CsVnfFiut2hc18XwW1Ri189UaABaVBR8XvC7o4pId+29L42bUVMOALS
	 kwBaM3x/Iqob3x7f2SByzOBP0r001DvfB4s3BYgefHF7kBXlraasZzhJiGMqXQ8QvA
	 b5KToMlHcCeIg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-300392cc4caso581001fa.3;
        Wed, 11 Dec 2024 18:09:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzVFoqAXwJ900is98g5fwueWp+kwVqObtC0fK3Cm1A/49UjQppxOM69rrpEZhAqUg1C6enHS2p1TJ7K+w=@vger.kernel.org, AJvYcCVVoT7JXDE3Ee/pkWx6NE6B6nUWIzbAeMyFdSI6BelJpyjKmzmXvqNusJeeBriWUS3fi4vhAYotsbaAtH8=@vger.kernel.org, AJvYcCW1S1FPM0NYtaHma+xilYv5YGgPJyfNQNQY0vZPvaCxjmf0QVr5hfuLSGE60OcQ3MKWTkTEo9fkKoIXOHoqPrc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf9x3zJ/SOKuya8BSR5aBOaqjOp+FX1ArjwmzSTGlkvdv21ffT
	8jSgrPhhi7lu951R4W0tBZa/mekxpkegXBnBfH156HFh5y8Ct5viEsIBY0xR79rsLupNvCf9OKD
	KXIwkSsIE5XjSQuuKu/dkLDsGTU0=
X-Google-Smtp-Source: AGHT+IHggMs6oY4itU/JqMKfM3nJ5pIoKS9RIS5+JCWG241xKHM5udlZpFhablRTqOzWEHtv0kN5CA+KWbNcYlDCuMU=
X-Received: by 2002:a2e:bd81:0:b0:300:3778:4dbb with SMTP id
 38308e7fff4ca-30249e01d2amr5268561fa.1.1733969352988; Wed, 11 Dec 2024
 18:09:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110013649.34903-1-masahiroy@kernel.org> <20241110013649.34903-6-masahiroy@kernel.org>
 <bdd5ff13-ec66-4ab6-985a-1fe433e85f91@nvidia.com> <CAK7LNATgL=vOr37+XfF7du+_ak5yKgXYyNNNTEQdVvy5J2MMyA@mail.gmail.com>
 <b20db4db-afb4-4f58-bc01-ae1250abc8b0@nvidia.com>
In-Reply-To: <b20db4db-afb4-4f58-bc01-ae1250abc8b0@nvidia.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 Dec 2024 11:08:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNATzdVrvmqm2wYHojVhNEiBNTaz6+4xgGBJwFixDvL=TMA@mail.gmail.com>
Message-ID: <CAK7LNATzdVrvmqm2wYHojVhNEiBNTaz6+4xgGBJwFixDvL=TMA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cocci@inria.fr, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 9:21=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 11/12/2024 02:39, Masahiro Yamada wrote:
> > On Wed, Dec 11, 2024 at 12:34=E2=80=AFAM Jon Hunter <jonathanh@nvidia.c=
om> wrote:
> >>
> >> Hi Masahiro,
> >>
> >> On 10/11/2024 01:34, Masahiro Yamada wrote:
> >>> Currently, Kbuild always operates in the output directory of the kern=
el,
> >>> even when building external modules. This increases the risk of exter=
nal
> >>> module Makefiles attempting to write to the kernel directory.
> >>>
> >>> This commit switches the working directory to the external module
> >>> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> >>> some build artifacts.
> >>>
> >>> The command for building external modules maintains backward
> >>> compatibility, but Makefiles that rely on working in the kernel
> >>> directory may break. In such cases, $(objtree) and $(srctree) should
> >>> be used to refer to the output and source directories of the kernel.
> >>>
> >>> The appearance of the build log will change as follows:
> >>>
> >>> [Before]
> >>>
> >>>     $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >>>     make: Entering directory '/path/to/my/linux'
> >>>       CC [M]  /path/to/my/externel/module/helloworld.o
> >>>       MODPOST /path/to/my/externel/module/Module.symvers
> >>>       CC [M]  /path/to/my/externel/module/helloworld.mod.o
> >>>       CC [M]  /path/to/my/externel/module/.module-common.o
> >>>       LD [M]  /path/to/my/externel/module/helloworld.ko
> >>>     make: Leaving directory '/path/to/my/linux'
> >>>
> >>> [After]
> >>>
> >>>     $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >>>     make: Entering directory '/path/to/my/linux'
> >>>     make[1]: Entering directory '/path/to/my/externel/module'
> >>>       CC [M]  helloworld.o
> >>>       MODPOST Module.symvers
> >>>       CC [M]  helloworld.mod.o
> >>>       CC [M]  .module-common.o
> >>>       LD [M]  helloworld.ko
> >>>     make[1]: Leaving directory '/path/to/my/externel/module'
> >>>     make: Leaving directory '/path/to/my/linux'
> >>>
> >>> Printing "Entering directory" twice is cumbersome. This will be
> >>> addressed later.
> >>>
> >>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >>
> >>
> >> Since this change I have been observing the following build error when
> >> building an external module ...
> >>
> >>    MODPOST Module.symvers
> >> ERROR: modpost: drivers/gpu/host1x/host1x: 'host1x_device_init' export=
ed
> >>       twice. Previous export was in drivers/gpu/host1x/host1x.ko
> >> ERROR: modpost: drivers/gpu/host1x/host1x: 'host1x_device_exit' export=
ed
> >>       twice. Previous export was in drivers/gpu/host1x/host1x.ko
> >>
> >> Now host1x is an upstream driver, but I have a local copy that using t=
o
> >> stage development changes (and avoid polluting the upstream driver).
> >> Plus I can swap between which version I am using on a live system.
> >>
> >> What I noticed is that previously the Modules.symvers for the external
> >> module had the full path of the external module for the name. However,
> >> now the name is just the relative path and in this case
> >> 'drivers/gpu/host1x/host1x'. Hence, this clashes with the in-kernel
> >> driver and we get the 'exported twice' error.
> >>
> >> I have been looking to see if there is a way to fix this because it ha=
s
> >> been a useful feature to override an upstream driver with a locally
> >> modified version.
> >
> >
> > I do not know how to reproduce it.
> >
> >    if (s && (!external_module || s->module->is_vmlinux || s->module =3D=
=3D mod)) {
> >
> > is not checking the module path at all.
> > I do not understand why it was affected.
>
>
> So this is not explicitly checking the path, but comparing the contents
> of the Module.symvers before and after this change for the external
> module I see ...
>
> $ grep -r host1x_device_init Module.symvers
> 0x00000000      host1x_device_init      /absolute/path/to/drivers/gpu/hos=
t1x/host1x        EXPORT_SYMBOL
>
> And now I see ...
>
> $ grep -r host1x_device_init Module.symvers
> 0x00000000      host1x_device_init      drivers/gpu/host1x/host1x  EXPORT=
_SYMBOL
>
> So the problem is that now there is no longer an absolute path in the
> external modules Module.symvers and so conflicts with the kernel's.
>
> Does that make sense?


As I said, I do not know how to reproduce it.

Please provide the steps to reproduce it.





--
Best Regards
Masahiro Yamada

