Return-Path: <linux-kbuild+bounces-5061-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2B9EAEAB
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 11:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EBF5188A0A9
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 10:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9D3230D3E;
	Tue, 10 Dec 2024 10:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khrfeY23"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507EA230D21;
	Tue, 10 Dec 2024 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827704; cv=none; b=EMtsEiSsj/NcM1RPAluA6zZkIBrZpopx3mTkDmy7T4dgD8crnvwR3jxQEZqhBbkrZ//+xWhrnF7AOKAY+1i5058+AUkvLL0qWIMWIAmOaw3/ecbFwMqRdsQlQrHReJ/oQpx4aV7uTL003HnR/A+agByVRIB7pKf4mJG0S86ppkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827704; c=relaxed/simple;
	bh=nDEcLzOXkw5lDX1vPhdxB5fFLH1KL7iUs8wX2ih2tvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAVlBVE7JiBP0wDetJkHxM07qXRQTM7RVpUnPXxYXdq0Cx51BBIHX8qQnLTEIQRHHrs9JM1xaz0bxo7/NhNgY6BJjWKrdLIZ7YgkSKK40KSY4kPpWs29CZ/vNwfm1cHivV0QH5hv18Qhm0K2BQLZUa9naITGQaveppTnSq8iuFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khrfeY23; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA52BC4CED6;
	Tue, 10 Dec 2024 10:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733827703;
	bh=nDEcLzOXkw5lDX1vPhdxB5fFLH1KL7iUs8wX2ih2tvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=khrfeY232VZNe+Zz7igj6gnKawg7RnD2KJjau1MMQCbFq7lbQIAczSbhz7Xt3QnyT
	 Rg/9Wv23m+8V0b3tafIcBSW26C5me8vnKe4jQnjO4RcAB2zE3vbRazKDw+6nzZzR8S
	 s+LTNC8T88yhBeEKCRx5p+pBhAAdK02bYPttYFNVOAm/yDhi3o3Vg1Q0RWDQMPkYAn
	 InlRagMfYZQt3t5RrvXoY8uqCmSB3G6xKxHY1S3YVCAMZRhwMkABdF5HccCtaR/Xxg
	 77+Q0Zp0MJT20Qe+VKRjdlMtg952QuekItNEcwDVCeO68aHEp3Q/gSswOspyBicPbz
	 bT/ujdWzemnAg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401c52000dso2260369e87.3;
        Tue, 10 Dec 2024 02:48:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwhxGA9uX8MFIm5jUDGsu7vBkk7Gb11usLDRoI8U1HVaqhmQ8HOfsns/2K18qrjPMQnAPFQCHtRVSEi18=@vger.kernel.org, AJvYcCWGem+qLibcYrGbhDjk95nJBKP6wQElEvD9uEZsORvgu6kBihkh2/ig0weg9gGWdgN584M8gw1deSwhN3z+Zd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXkQbZSO2QzOgOdiMlfbqJeYZWudXZhKsVfWxwUt2jMnBpubrC
	9xAzJSub31mBnlAMJ+o3gX98UjfQH1Dx8J5o62smnayXHcRh5EEGMsjhbCK0V0fyPhstB5y5jyO
	E0TtGSh+6KFM0D5YRCJ4yVlWi/5Y=
X-Google-Smtp-Source: AGHT+IG+NBDQ+Wr2u+Ka9B5mjOl9WuBsaKYe1AoAeVspIENEADbvb4snVH0SrUJ7CXgH2/wrBk+9ssaNF1V3JZNVpC0=
X-Received: by 2002:a05:6512:23a4:b0:53e:3a01:cf45 with SMTP id
 2adb3069b0e04-53e3a01d067mr3740331e87.13.1733827701466; Tue, 10 Dec 2024
 02:48:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110013649.34903-1-masahiroy@kernel.org> <20241110013649.34903-6-masahiroy@kernel.org>
 <82FA2E02-05A5-4297-B364-9D7D89001D9D@linux.dev> <1116D946-05F3-4463-A61F-DE221F258A3F@linux.dev>
In-Reply-To: <1116D946-05F3-4463-A61F-DE221F258A3F@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Dec 2024 19:47:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ1MvB_wXa6F8aZB_srrLTQupRXNsz6Rav27fyjznXZJQ@mail.gmail.com>
Message-ID: <CAK7LNAQ1MvB_wXa6F8aZB_srrLTQupRXNsz6Rav27fyjznXZJQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 10:56=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> On 9. Dec 2024, at 14:46, Thorsten Blum wrote:
> > On 10. Nov 2024, at 02:34, Masahiro Yamada wrote:
> >>
> >> Currently, Kbuild always operates in the output directory of the kerne=
l,
> >> even when building external modules. This increases the risk of extern=
al
> >> module Makefiles attempting to write to the kernel directory.
> >>
> >> This commit switches the working directory to the external module
> >> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> >> some build artifacts.
> >>
> >> The command for building external modules maintains backward
> >> compatibility, but Makefiles that rely on working in the kernel
> >> directory may break. In such cases, $(objtree) and $(srctree) should
> >> be used to refer to the output and source directories of the kernel.
> >>
> >> The appearance of the build log will change as follows:
> >>
> >> [Before]
> >>
> >> $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >> make: Entering directory '/path/to/my/linux'
> >>   CC [M]  /path/to/my/externel/module/helloworld.o
> >>   MODPOST /path/to/my/externel/module/Module.symvers
> >>   CC [M]  /path/to/my/externel/module/helloworld.mod.o
> >>   CC [M]  /path/to/my/externel/module/.module-common.o
> >>   LD [M]  /path/to/my/externel/module/helloworld.ko
> >> make: Leaving directory '/path/to/my/linux'
> >>
> >> [After]
> >>
> >> $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >> make: Entering directory '/path/to/my/linux'
> >> make[1]: Entering directory '/path/to/my/externel/module'
> >>   CC [M]  helloworld.o
> >>   MODPOST Module.symvers
> >>   CC [M]  helloworld.mod.o
> >>   CC [M]  .module-common.o
> >>   LD [M]  helloworld.ko
> >> make[1]: Leaving directory '/path/to/my/externel/module'
> >> make: Leaving directory '/path/to/my/linux'
> >>
> >> Printing "Entering directory" twice is cumbersome. This will be
> >> addressed later.
> >>
> >> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >> ---
> >
> > Hi Masahiro,
> >
> > I get the following error since this patch is in master, but only when
> > using COCCI=3D in combination with M=3D<relative or absolute path>.
> >
> > It works when I either use COCCI=3D or M=3D, but not with both.
>
> Using the absolute path of the cocci script fixes my problem, but this
> used to work with relative paths too.
>
> $ make coccicheck COCCI=3D$(pwd)/scripts/coccinelle/misc/flexible_array.c=
occi M=3Darch/

M=3D looks a bit weird for the upstream code, but
I think using the absolute path is the right thing to do.


--=20
Best Regards
Masahiro Yamada

