Return-Path: <linux-kbuild+bounces-3948-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E79955DB
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 19:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74A4A1C25975
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 17:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B3220ADF8;
	Tue,  8 Oct 2024 17:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDCRzG5Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA3720ADF2;
	Tue,  8 Oct 2024 17:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728409183; cv=none; b=pBw/wcTUHW5kDFqsAUXDJQWDGKiwYK4hVcfzBBSApl9quYQhzNqx9RR1EvFgi9wF8iQh2Cm+LSFSk0QLphIqDcoWxo/Q7hnm3NcHJqlrumj1ERbFgHIDchgHhHFBQd9+WxIcYrpSZEFWDiditMFIn5uxbKpSFEsYiVyl+HtK6kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728409183; c=relaxed/simple;
	bh=F8K/fyyl6oa/UHm1guEeag5cPYOeEG0925ryPgqSDPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gB8kABZ76DaBvjDQfDPt4yfyEUYR2xaFeCD7kfYeOik6duIi/krIhmQgAvyijcSuSeXbOzjN4IKzWIRlqzMFlPuAllwpzbZzPbgh6KBFk844nvZ2r4BN/YTHaWPLubB24tmwYHXJQ/MTkYowLl/0ikz1zK75YXSID9r2H1OBZhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDCRzG5Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE494C4CEC7;
	Tue,  8 Oct 2024 17:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728409182;
	bh=F8K/fyyl6oa/UHm1guEeag5cPYOeEG0925ryPgqSDPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DDCRzG5YVq72+qguVWNWC/JgpPIOE0UXFbBZZ8hQzh6LArumC879drbdnHfeLMKBo
	 pHOjdw2FZ9U4ls2fBuWLAleneuv5BZkccSUb1+5pLZnI1/UgIHGzYGm4CDMSbu7pns
	 /Eakys5NCLzj9O6dabimM/Cqafpx1bOeGBEQYUYHEPAFDWfhhY3KCbDpT7gzZmgF0d
	 Wa4oAATnGg7M1Z4wlj4HChzzOOh/9dqS1LmJNFReCng4w8UAAYzm2DGCBaHeGRAFz/
	 xEdeDsdfUhPshBRBk0w/4h8+IkjbuRc05HPA4LxDzXJw1WeWzDB+ruAsew3Ztzob7v
	 x0ifaKoCdZlCQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fad100dd9eso59098941fa.3;
        Tue, 08 Oct 2024 10:39:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBLzJWPxFjWmm9zIJre5uJ7z65Wme9z3T0oVMKBPIlQxnJhNdGoJWoCp0xSZf4hg8C4o+DQnOpHrisB8Ue@vger.kernel.org, AJvYcCWHd1JV33EX+i7D4Ho11pyf5Gp/bN9506PrtJJ1Mbz82wkIT/nTCBKieVqJuHf2IKBmEDCDS4eEtPTD9Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYiMZPPBirEzTl1knEu/W8a8SuKVgokuV3Re8Bo2NzMLsWUsyh
	wb00BuRNvpaN3P/BG0y8ypdzKvF2WXBovcLYTGK1d1sVKwJ92YrGU8xVyRvj3klDx+mphf7VJEw
	6AdrU3QNeCy1SC1iOl4LpdBeWdvQ=
X-Google-Smtp-Source: AGHT+IFuVrGcjx2d8VL2Gv1rxbmu0pk9dUMbkri/wL6pcUdDFUzpj0cI157O6Ep3RdOHcIG2YfooZktl8Ru7qgQkrLI=
X-Received: by 2002:a05:651c:b0b:b0:2fb:dc2:21ea with SMTP id
 38308e7fff4ca-2fb12767b99mr14922131fa.19.1728409181541; Tue, 08 Oct 2024
 10:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007160710.3937-1-zachwade.k@gmail.com>
In-Reply-To: <20241007160710.3937-1-zachwade.k@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 9 Oct 2024 02:39:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR8WgUi1XTvFQiY7MBAjue1QGm=Bc_5WGKXGmSOXq7wgQ@mail.gmail.com>
Message-ID: <CAK7LNAR8WgUi1XTvFQiY7MBAjue1QGm=Bc_5WGKXGmSOXq7wgQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add vmlinux_install to facilitate debugging
To: Zach Wade <zachwade.k@gmail.com>
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 1:07=E2=80=AFAM Zach Wade <zachwade.k@gmail.com> wro=
te:
>
> When testing multiple versions of the kernel with the same source code,it
> is often necessary to recompile the kernel, which is time-consuming for
> small hosts. I need to cp vmlinux to the corresponding module directory.
> I think adding this will make debugging the kernel a little more
> convenient.
>
> Signed-off-by: Zach Wade <zachwade.k@gmail.com>
> ---
>  Makefile | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index c5493c0c0ca1..1caab011599f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1579,6 +1579,7 @@ help:
>         @echo  '* vmlinux         - Build the bare kernel'
>         @echo  '* modules         - Build all modules'
>         @echo  '  modules_install - Install all modules to INSTALL_MOD_PA=
TH (default: /)'
> +       @echo  '  vmlinux_install - Install vmlinux to INSTALL_MOD_PATH (=
default: /)'
>         @echo  '  vdso_install    - Install unstripped vdso to INSTALL_MO=
D_PATH (default: /)'
>         @echo  '  dir/            - Build all files in dir and below'
>         @echo  '  dir/file.[ois]  - Build specified target only'
> @@ -1887,6 +1888,19 @@ modpost: $(if $(single-build),, $(if $(KBUILD_BUIL=
TIN), vmlinux.o)) \
>          $(if $(KBUILD_MODULES), modules_check)
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>
> +# ----------------------------------------------------------------------=
-----
> +# vmlinux install
> +
> +PHONY +=3D vmlinux_install
> +
> +vmlinux_install:
> +       @if [ -f vmlinux ]; then \
> +               echo "INSTALL ${MODLIB}/vmlinux"; \
> +               cp -f vmlinux ${MODLIB}/ ; \
> +       else \
> +               echo "vmlinux file does not exist."; \
> +       fi
> +

This is a very niche use-case.
What if someone else wants to copy vmlinux to /boot/
instead of ${MODLIB}/ ?

People tend to have local scripts to meet personal demands.
The upstream is not a place for that.


>  # Single targets
>  # ----------------------------------------------------------------------=
-----
>  # To build individual files in subdirectories, you can do like this:
> --
> 2.46.0
>
>


--=20
Best Regards
Masahiro Yamada

