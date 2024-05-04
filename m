Return-Path: <linux-kbuild+bounces-1756-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4B28BBC81
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 16:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2821F2177F
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 14:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F47225D0;
	Sat,  4 May 2024 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzXGSyGm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1C657CAE;
	Sat,  4 May 2024 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714834067; cv=none; b=HkzAHL8fmIO0re0TTvkQa+gTc0rMm4y8XZRXUzBWDzQnQ7BeZlNMEK4wdQfjS13pUreGYNGdWCYEaUby8LnIPDh2ODX52BuXHf0+5fEgm9cTgN9CY6ZRJGvH8pU8LP+cmAwXaw6g74KvLHtF4DWvZJlJ1Wq7Al4QLRWbTFppgIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714834067; c=relaxed/simple;
	bh=fw2E+aY9WkraiCEWaDZyCMF9dC7UfMVHORj8CW/uR0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YacGQEmXfy9A3l7pGTjSrMZWB+wyieWxRr3MjpcGNNQMzst6TQSrsHXNmGLakdYf/AlWt16+7qzmBOKV0XjjxwBKuGpiT9oFpWGI1teVBMRkL2JZmq+Kz5lpKdVwYPgS1vOUpAOLFi918pxccCFFe+ZYwiuO5Y3jxK1Nj6b0XuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzXGSyGm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEAEC4AF1B;
	Sat,  4 May 2024 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714834067;
	bh=fw2E+aY9WkraiCEWaDZyCMF9dC7UfMVHORj8CW/uR0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mzXGSyGm1g4KLboYOZnYqdxlBtaTnrjBvVldARnANDvgEcIGSnrxbQ8Wq0QxWmt8p
	 E60iFwtjyOkpclc9NAENAewTkcG5u1tLrVgPZH4pkw/EQdbuhgtmJB2M9tNPWxmm1p
	 Uror41pvgooMZ4jw6F6DMGWALxvcxCWpzjMcV97aWgy8XJbtES2r6DRCLiZDHZC1hj
	 1NnIO6L5UV0PLGOTJnuULOAp38kKPB/eNktUZJydJinhYRqXKFHlXmeTpmVKYs5APV
	 /u1Gaqj+oIRlZZev2X+2AS7WYbreFZ9YLLJR2AnzpwNQ0g5CVu6IrvwJVMZqF4wEwM
	 cHG15d3MApuMg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52006fbae67so515860e87.0;
        Sat, 04 May 2024 07:47:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7AJytXwaaCw7NvYuhua8pUehTOMuKDyE2XmyLIVy8JSZsunZA7pwMuJnRgybYraZ9ZzOTSsGW/1prI4Bxz2C30jV5Ph8H4X3Jq55FBg7fw+1KLX3AI0x1Mg4Fx8H3vPpAn/vyhiuzcH/Z
X-Gm-Message-State: AOJu0Ywdm+UqgGNSQ3CX5iEvDYgAk2+9YN5f1yvkRBF3Dj9bKR9y/XEk
	JENCtiaoY5BYAVSo9zBNyLZzIm8cX8JF6QUUHJzWZaSYBtvThqhtGdmtO66mNRo/1GKzryf6+2R
	ghiB8vrLuO8ZYIUHWula+TybSl1g=
X-Google-Smtp-Source: AGHT+IFOSGq47HKKFcUKJSh06Ja/FFHjVignPWbD0QM9nuebLoEw2ENPLsO5p+OTXJ9vN64CQGMNZCUS+asovex4G3Y=
X-Received: by 2002:ac2:4214:0:b0:519:1e33:9d85 with SMTP id
 y20-20020ac24214000000b005191e339d85mr3467284lfh.36.1714834065760; Sat, 04
 May 2024 07:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
 <20240502111613.1380453-4-emil.renner.berthing@canonical.com>
 <CAK7LNATbseQCgjAUDemNoo9zPd_iSb+4Gz9TaW2YkOKcp3CSEQ@mail.gmail.com> <CAJM55Z-MMcePewnMsmTqHtcjLiCnmMMLawtJxPcXs8r1Sr6n4g@mail.gmail.com>
In-Reply-To: <CAJM55Z-MMcePewnMsmTqHtcjLiCnmMMLawtJxPcXs8r1Sr6n4g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 4 May 2024 23:47:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDtxZMajHJOU=pD+18gsOHg1QMEeHAY=eHQqQvzgsf4w@mail.gmail.com>
Message-ID: <CAK7LNAQDtxZMajHJOU=pD+18gsOHg1QMEeHAY=eHQqQvzgsf4w@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] kbuild: buildtar: install riscv compressed images
 as vmlinuz
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 11:02=E2=80=AFPM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> Masahiro Yamada wrote:
> > On Thu, May 2, 2024 at 8:16=E2=80=AFPM Emil Renner Berthing
> > <emil.renner.berthing@canonical.com> wrote:
> > >
> > > Use the KBUILD_IMAGE variable to determine the right kernel image to
> > > install and install compressed images to /boot/vmlinuz-$version like =
the
> > > 'make install' target already does.
> > >
> > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.c=
om>
> > > ---
> > > This patch depends on Masahiro's patch at
> > > https://lore.kernel.org/r/20240414174139.3001175-1-masahiroy@kernel.o=
rg
> >
> > Thank you for fixing the issue for riscv.
> > Only the question I have is how this patch series gets in.
> > If it waits for the next development cycle, it will be
> > cleanly applicable.
>
> I'm ok with waiting, but otherwise Palmer could take patch 1 and 2 and yo=
u
> could take patch 3. The worst that can happen is that a bisect lands on y=
our
> branch that will only package the uncompressed Image in the tarballs even=
 if
> Image.gz or Image.bz2 exist. CONFIG_EFI_ZBOOT=3Dy and CONFIG_XIP_KERNEL=
=3Dy_kernels
> will also be fine with only patch 3 applied.


Ah, OK. 3/3 is independently applicable.

I applied this to linux-kbuild now. Thanks.
(I added braces around KBUILD_IMAGE to keep consistency)


I leave the first two patches to Palmer.






--=20
Best Regards
Masahiro Yamada

