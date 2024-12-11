Return-Path: <linux-kbuild+bounces-5075-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A725F9EC253
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 03:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08984284650
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 02:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149FD1FBC98;
	Wed, 11 Dec 2024 02:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWCGyPWa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D594BC148;
	Wed, 11 Dec 2024 02:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733884806; cv=none; b=J40hRDRo44ncXBaltv1246l9N/KLHdvk6Nvavgihg8axUxLbZgu4DV7eTCOU7inIg3aCe6FwOlzOwP9ux44FqoqFOpE3T2FFU2j3u2oqvZ7eidHZMmvoV2O0vN4Vd78+uAlpKqhulEIBiRhCGx/RjLXIXxojvcvdFWir9uepgM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733884806; c=relaxed/simple;
	bh=rUN6+1EcdrSc29o0r+g71abVsqJjIdoI6ULiRDI6x/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0VK8ZUlscht+EIoUvn85C97E2ooHJyV/XWJIQArQuASJQq1d1qJT/3NkoqdhS7bXM5Fb3XV5F91ItDa+XO3t7CkGqlJbtZxlF8QVty3MYyaFQNjV1PmPCIWQtw7FVC3SRv9tEp9qqKqbPb/hSy4nyQ75SXBtkHd0n7Agg0CAsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWCGyPWa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F87C4CED6;
	Wed, 11 Dec 2024 02:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733884805;
	bh=rUN6+1EcdrSc29o0r+g71abVsqJjIdoI6ULiRDI6x/A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MWCGyPWaSXDCTdWpb3EGz7nA//n219Cp04RJc56oc8qvZbq/qNAorRu8LZIoXRdCV
	 mEkI84TzxLxZwurnv8XI13FfZV/PC1lBlEqnvIbQJzhiiZKiqePua/+RhvQZWDGpfF
	 BBxo01jiltQJILqBZS1xQ0hTZ48D/RmysDYjZbOByg/EF6+NV2EnlqWxZTvST0XKyh
	 X53/zshwqiN98s+ujdKevHcQ3tXIXj6OO913jpjcg4c2N5El9vCmGqOGO7jZy+q5Od
	 M/TeefTCdQviUkgsjC5TWXp3zD5E4ruQq+ma1dMONTET6d72bAjMe4y/aB+R0v9aJa
	 qZdmnhG0aivQg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30227c56b11so23861551fa.3;
        Tue, 10 Dec 2024 18:40:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUioUo5PCrJlZakmv6zN6mED5Z2ouhTXrinrRsc8JRfa+aBE8lXXa9PwTXM2Tl4wauo2M0vqGbycf3OShs=@vger.kernel.org, AJvYcCV6mT/OduvdwJg1rmWvkjT+tH7MSQxbM+YUinQMAtDUGRral1pSWZo1e/0KCNzkkNtlELT/Es5zkJiPvlE=@vger.kernel.org, AJvYcCXrbrnshlxvcr18esuukGAMGw2vmhfCrXNlng6jFYLMEVBoE1sWcvQvTrZPmc0KhelE1gfIDbPG+QX/gKXiyis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3yZyXLbLJ72PlLRJ9DDzgyLqjblVYVOLGgUhJAgudYsMDZ9TJ
	xaCIUJdqScZdNugn5OXyj25a9JLUN7jiZupLnQ36U2eb8UzOQzSs29imD6earu523ICp79mpmmh
	t061IASYI3BGK8fVS6BDjYnt9bFU=
X-Google-Smtp-Source: AGHT+IHxGpnB/myKvlJsuWzHOTwl8yjs6e6CcOHIGoQ3+14Q2O5vvCXnxMip8nROElsib4NPrDvqxoKteTG3GissR3A=
X-Received: by 2002:a05:651c:1582:b0:300:360b:bc36 with SMTP id
 38308e7fff4ca-30240d52cb2mr4501801fa.23.1733884804055; Tue, 10 Dec 2024
 18:40:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110013649.34903-1-masahiroy@kernel.org> <20241110013649.34903-6-masahiroy@kernel.org>
 <bdd5ff13-ec66-4ab6-985a-1fe433e85f91@nvidia.com>
In-Reply-To: <bdd5ff13-ec66-4ab6-985a-1fe433e85f91@nvidia.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Dec 2024 11:39:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgL=vOr37+XfF7du+_ak5yKgXYyNNNTEQdVvy5J2MMyA@mail.gmail.com>
Message-ID: <CAK7LNATgL=vOr37+XfF7du+_ak5yKgXYyNNNTEQdVvy5J2MMyA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cocci@inria.fr, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 12:34=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> =
wrote:
>
> Hi Masahiro,
>
> On 10/11/2024 01:34, Masahiro Yamada wrote:
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
> >    $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >    make: Entering directory '/path/to/my/linux'
> >      CC [M]  /path/to/my/externel/module/helloworld.o
> >      MODPOST /path/to/my/externel/module/Module.symvers
> >      CC [M]  /path/to/my/externel/module/helloworld.mod.o
> >      CC [M]  /path/to/my/externel/module/.module-common.o
> >      LD [M]  /path/to/my/externel/module/helloworld.ko
> >    make: Leaving directory '/path/to/my/linux'
> >
> > [After]
> >
> >    $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >    make: Entering directory '/path/to/my/linux'
> >    make[1]: Entering directory '/path/to/my/externel/module'
> >      CC [M]  helloworld.o
> >      MODPOST Module.symvers
> >      CC [M]  helloworld.mod.o
> >      CC [M]  .module-common.o
> >      LD [M]  helloworld.ko
> >    make[1]: Leaving directory '/path/to/my/externel/module'
> >    make: Leaving directory '/path/to/my/linux'
> >
> > Printing "Entering directory" twice is cumbersome. This will be
> > addressed later.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
>
> Since this change I have been observing the following build error when
> building an external module ...
>
>   MODPOST Module.symvers
> ERROR: modpost: drivers/gpu/host1x/host1x: 'host1x_device_init' exported
>      twice. Previous export was in drivers/gpu/host1x/host1x.ko
> ERROR: modpost: drivers/gpu/host1x/host1x: 'host1x_device_exit' exported
>      twice. Previous export was in drivers/gpu/host1x/host1x.ko
>
> Now host1x is an upstream driver, but I have a local copy that using to
> stage development changes (and avoid polluting the upstream driver).
> Plus I can swap between which version I am using on a live system.
>
> What I noticed is that previously the Modules.symvers for the external
> module had the full path of the external module for the name. However,
> now the name is just the relative path and in this case
> 'drivers/gpu/host1x/host1x'. Hence, this clashes with the in-kernel
> driver and we get the 'exported twice' error.
>
> I have been looking to see if there is a way to fix this because it has
> been a useful feature to override an upstream driver with a locally
> modified version.


I do not know how to reproduce it.

  if (s && (!external_module || s->module->is_vmlinux || s->module =3D=3D m=
od)) {

is not checking the module path at all.
I do not understand why it was affected.



--=20
Best Regards
Masahiro Yamada

