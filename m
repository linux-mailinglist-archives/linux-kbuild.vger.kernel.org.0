Return-Path: <linux-kbuild+bounces-5074-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA739EC24D
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 03:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E43BB168295
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 02:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A561BD9E6;
	Wed, 11 Dec 2024 02:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDZQ5TfR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F3C148;
	Wed, 11 Dec 2024 02:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733884649; cv=none; b=IXMLYFAuqml7VXAhsWRyISPYNdgOX77cEUhvuYU3lMHNjAePNZJjaXHfYgriv9GOhWeY4XTRUR4RSz10cw3qt72sTKHBDyzFp5Yoqv8TwIpYqhfKa58edYbus/WAYuO3FEXg1snrsaGf8wAJVFTXuOCFjECLcgiGFw+2ES0EGnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733884649; c=relaxed/simple;
	bh=DUGkTeY3nF0d2mRRcn/oCpk/z0595BnJpRO/MgGaiaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdHGRwHUBFoyrdyIvaR64F/gGAiV6FMq1eHcrKxQlTQkDp2OPfeiAbymXqCtp5jrcK0Zeg10WMGObnZcbgcMgQjDc1l68s4MzbxIe+kum4mnr/dm1O8X3K9Khh0YjSndiJfcnruUwRYQeToeOq5yCUqEI49dX7fFRfpkbdjcLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDZQ5TfR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE954C4CEDD;
	Wed, 11 Dec 2024 02:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733884646;
	bh=DUGkTeY3nF0d2mRRcn/oCpk/z0595BnJpRO/MgGaiaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aDZQ5TfR+4C1PqenyMh1oqQju/YOUFkb6ygJR8YzB1WOKjmo5tNGwigXcPSvQ/h6U
	 1l8VaztRWGNz/QuhI5AiGWRL9ShooogOqFidV1X9FsEWUdB9gFhhFfUsY1FxsZ0ArV
	 9nkUs/lWqYZnPBxZDoela9CTfLYqZulfpsh4EzsucipTznBMjCSwFGuuZbqqlClvuC
	 5Z6cK/PE8uOBKYHnY3bTvNXfwEU6xQhSvywHILzhTvYtK6Xkjj+PpGWVUaIFRW+myo
	 QgAULhYb8nApF6Rq+lsFsVkTxoNeboVwvyiJFZ7wWiqrAPytThVw/N20D7G1qp0yGj
	 QdRSm4/ciAUzg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-540254357c8so1569796e87.1;
        Tue, 10 Dec 2024 18:37:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaAPszQoGTFO7URlq1eiYq5Ng3zsLYx4rUQwGBxIhQxVYaxt5LvlRjHKYDWtvgsKLefO+n6KgN950qKHY=@vger.kernel.org, AJvYcCXg2F7NaTSz3sJHzre9dtT4YS0lj02Pi/2z+E7krPSSfGOaxIFRwOqZ3J0dAG89nnAsIDOdTAsaPlfUJMNiAsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUBWtDWdgwF/gCSUZJT6x3aNN/WN0UwLmTNP6q+afA/wkwV9DJ
	XRgsmPhmeWizN4CydXase6cmtK37+BgEzMKbnsOXCE/wZeM0rYN/rq4cneUQh7uvmfuKrgML4SM
	X/xyoGx4/wg4+1VWdASKOLId7g8I=
X-Google-Smtp-Source: AGHT+IHisRqzbuD8pT7SfEVDcme2Sdu/LmQSV5wOJ2448T01ybCZo4dCmRJBHcF7WEz49Yxqox0CwmVDEgAWJqSqBAA=
X-Received: by 2002:a05:6512:108f:b0:53e:12dc:e805 with SMTP id
 2adb3069b0e04-5402a5ff555mr264802e87.45.1733884645446; Tue, 10 Dec 2024
 18:37:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110013649.34903-1-masahiroy@kernel.org> <20241110013649.34903-6-masahiroy@kernel.org>
 <82FA2E02-05A5-4297-B364-9D7D89001D9D@linux.dev> <1116D946-05F3-4463-A61F-DE221F258A3F@linux.dev>
 <CAK7LNAQ1MvB_wXa6F8aZB_srrLTQupRXNsz6Rav27fyjznXZJQ@mail.gmail.com> <838D0FCD-EA9C-46C8-BCA7-FECFD3DC04D8@linux.dev>
In-Reply-To: <838D0FCD-EA9C-46C8-BCA7-FECFD3DC04D8@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Dec 2024 11:36:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNARi9t1mtUAW=X7bxiR_xWzaXX+Tq4dd8FfXW+LSm6o=ww@mail.gmail.com>
Message-ID: <CAK7LNARi9t1mtUAW=X7bxiR_xWzaXX+Tq4dd8FfXW+LSm6o=ww@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 8:06=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> On 10. Dec 2024, at 11:47, Masahiro Yamada wrote:
> > On Mon, Dec 9, 2024 at 10:56=E2=80=AFPM Thorsten Blum wrote:
> >> On 9. Dec 2024, at 14:46, Thorsten Blum wrote:
> >>> On 10. Nov 2024, at 02:34, Masahiro Yamada wrote:
> >>>>
> >>>> Currently, Kbuild always operates in the output directory of the ker=
nel,
> >>>> even when building external modules. This increases the risk of exte=
rnal
> >>>> module Makefiles attempting to write to the kernel directory.
> >>>>
> >>>> This commit switches the working directory to the external module
> >>>> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> >>>> some build artifacts.
> >>>>
> >>>> The command for building external modules maintains backward
> >>>> compatibility, but Makefiles that rely on working in the kernel
> >>>> directory may break. In such cases, $(objtree) and $(srctree) should
> >>>> be used to refer to the output and source directories of the kernel.
> >>>>
> >>>> The appearance of the build log will change as follows:
> >>>>
> >>>> [Before]
> >>>>
> >>>> $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >>>> make: Entering directory '/path/to/my/linux'
> >>>> CC [M]  /path/to/my/externel/module/helloworld.o
> >>>> MODPOST /path/to/my/externel/module/Module.symvers
> >>>> CC [M]  /path/to/my/externel/module/helloworld.mod.o
> >>>> CC [M]  /path/to/my/externel/module/.module-common.o
> >>>> LD [M]  /path/to/my/externel/module/helloworld.ko
> >>>> make: Leaving directory '/path/to/my/linux'
> >>>>
> >>>> [After]
> >>>>
> >>>> $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >>>> make: Entering directory '/path/to/my/linux'
> >>>> make[1]: Entering directory '/path/to/my/externel/module'
> >>>> CC [M]  helloworld.o
> >>>> MODPOST Module.symvers
> >>>> CC [M]  helloworld.mod.o
> >>>> CC [M]  .module-common.o
> >>>> LD [M]  helloworld.ko
> >>>> make[1]: Leaving directory '/path/to/my/externel/module'
> >>>> make: Leaving directory '/path/to/my/linux'
> >>>>
> >>>> Printing "Entering directory" twice is cumbersome. This will be
> >>>> addressed later.
> >>>>
> >>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >>>> ---
> >>>
> >>> Hi Masahiro,
> >>>
> >>> I get the following error since this patch is in master, but only whe=
n
> >>> using COCCI=3D in combination with M=3D<relative or absolute path>.
> >>>
> >>> It works when I either use COCCI=3D or M=3D, but not with both.
> >>
> >> Using the absolute path of the cocci script fixes my problem, but this
> >> used to work with relative paths too.
> >>
> >> $ make coccicheck COCCI=3D$(pwd)/scripts/coccinelle/misc/flexible_arra=
y.cocci M=3Darch/
> >
> > M=3D looks a bit weird for the upstream code, but
> > I think using the absolute path is the right thing to do.
>
> The documentation[1] uses M=3D and also COCCI=3D with relative paths and
> some of the examples don't work anymore.

I know.

This is what cocci people hoped to work.

If something is broken in coccicheck, it must be fixed.




--=20
Best Regards
Masahiro Yamada

