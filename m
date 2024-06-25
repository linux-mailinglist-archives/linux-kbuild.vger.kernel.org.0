Return-Path: <linux-kbuild+bounces-2247-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB49169CF
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2024 16:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0546A284476
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2024 14:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292A21509A5;
	Tue, 25 Jun 2024 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fo4xTVOe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F343F1B7F7;
	Tue, 25 Jun 2024 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719324351; cv=none; b=diMUDsizrmRT3cKZyMDhxWiqEecE1B32/dTrSosynLP7h9MUz2cLFuF2XBnMnbCjPge587YCTviDQ9gU/H1TcJu3gL8WKXIOeJeh416uYriVQ9efky+3dB6AcPRQtxCP4ek0pyb6nhKZa+uDVOtZIdHT/vxU14UaMaHF8ORYcKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719324351; c=relaxed/simple;
	bh=6dZAItMcJeBVKPsL6anNiuaV2akrLj/ZehEz2jVwd28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktWx/Shaju083ESyFJLrXocuGl3nLsWq5/VOlTrX8gRcLf3oifZH3j1P8QHKkDpKTKzQsXuXDZF7nlyaprxwj+ug6CNG9aLhDHPrhQUA/vPsBK/zW3Q8umnwMetSW4Xh8U4hPDM94ocRHJW3AQbmXxJErgGTcO5DwHrtixPauMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fo4xTVOe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BB3C4AF09;
	Tue, 25 Jun 2024 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719324350;
	bh=6dZAItMcJeBVKPsL6anNiuaV2akrLj/ZehEz2jVwd28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fo4xTVOe7gc+/MUQWjDd5FoDVMXsH7yQ8Dm+fbzmalzvJH/tXJeScNRfWUW2ou2wX
	 luM+zgJd+682/WlSFPfJl3r0LokQv0424uk5SYWJtdpTrMCb+LtSKfq2mutKbJd68V
	 VIQ8DCJjCtDNsoyayD9aahflFlgzj3PCR7kkF2NeWLWgNZdAjLfBF6ptgj76ifY7Mr
	 VGSxkZK7pKXAFKabZBJkRKRUx9Zfui9THxrrRaz793Ejnp/++xpNuKnlc3DaXoeerW
	 fi/CLwp0sYDPqXL/+XunXKl2x0Xxy3nCSFU1otTZRcezetHGNiKNzjf5shLVF/Tlax
	 ridWIZHXY+ehA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so60721271fa.3;
        Tue, 25 Jun 2024 07:05:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwtmEH19LbIwEqZyAkHQ+Gd0dV/wONI2TMWUqAYJWHIz72qvsQINwuX0D7gF41/chJgPj95zIK356hjlmDARkmNz6hcsceDQ5fN2ZAE2ZcpjygCYwN/xdjX4kLapEfFVhLNSy+KZ32rMaz
X-Gm-Message-State: AOJu0YxoqPDPApVEeouqNMHdYYQV2rVfITCE5Zde7obbxUQDBo3NDT68
	PJp2M0/a1mMX98ol+9sdf7WpoHihVkSkadGwxBk4FOOUJaB7BuqzrRb4VLawc1cp+8VpIlMGjCF
	FRZ84g1yU40Y8m4muPTGQreCD8tE=
X-Google-Smtp-Source: AGHT+IHdZXWyZThJdlhl3ZtP2SQnSA684soUV2SbCh9btSLH/kVKz83OILRohORl08dqXtfdvgz2K3FMfb3GEfgxqdM=
X-Received: by 2002:a2e:3a10:0:b0:2eb:dfe9:b462 with SMTP id
 38308e7fff4ca-2ec5b3e3599mr43788451fa.45.1719324349498; Tue, 25 Jun 2024
 07:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-kbuild-fix-xconfig-v1-1-7c06eae6d3aa@avm.de>
In-Reply-To: <20240624-kbuild-fix-xconfig-v1-1-7c06eae6d3aa@avm.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 25 Jun 2024 23:05:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARej5AOyxFzRoZa3VKmJcEhbQYpx6h6rim9t+uVNaPOyw@mail.gmail.com>
Message-ID: <CAK7LNARej5AOyxFzRoZa3VKmJcEhbQYpx6h6rim9t+uVNaPOyw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use $(obj)/%.cc to fix host C++ module builds
To: Nicolas Schier <n.schier@avm.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rolf Eike Beer <eb@emlix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 8:12=E2=80=AFPM Nicolas Schier <n.schier@avm.de> wr=
ote:
>
> Use $(obj)/ instead of $(src)/ prefix when building C++ modules for
> host, as explained in commit b1992c3772e6 ("kbuild: use $(src) instead
> of $(srctree)/$(src) for source directory").  This fixes build failures
> of 'xconfig':
>
>     $ make O=3Dbuild/ xconfig
>     make[1]: Entering directory '/data/linux/kbuild-review/build'
>       GEN     Makefile
>     make[3]: *** No rule to make target '../scripts/kconfig/qconf-moc.cc'=
, needed by 'scripts/kconfig/qconf-moc.o'.  Stop.
>
> Fixes: b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(src) for=
 source directory")
> Reported-by: Rolf Eike Beer <eb@emlix.com>
> Signed-off-by: Nicolas Schier <n.schier@avm.de>

Applied to linux-kbuild.
Thanks!



> ---
>  scripts/Makefile.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index d35f55e0d141..e85be7721a48 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -146,7 +146,7 @@ $(call multi_depend, $(host-cxxmulti), , -objs -cxxob=
js)
>  # Create .o file from a single .cc (C++) file
>  quiet_cmd_host-cxxobjs =3D HOSTCXX $@
>        cmd_host-cxxobjs =3D $(HOSTCXX) $(hostcxx_flags) -c -o $@ $<
> -$(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
> +$(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
>         $(call if_changed_dep,host-cxxobjs)
>
>  # Create executable from a single Rust crate (which may consist of
>
> ---
> base-commit: 224a21441b0925ce1e60afb27629773a522c946e
> change-id: 20240624-kbuild-fix-xconfig-f0e95d0d5b27
>
> Best regards,
> --
> Nicolas Schier
>


--=20
Best Regards
Masahiro Yamada

