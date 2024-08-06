Return-Path: <linux-kbuild+bounces-2826-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 243449488F1
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 07:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3FBD28113C
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 05:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF581BBBF5;
	Tue,  6 Aug 2024 05:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qT8PnM7w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F551BBBF4
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 05:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722922196; cv=none; b=QrKchGlVGLW4aq2uDKsbSn8gF6vO7V9BrZhWRWa73kDqrPkiZHs6h5tRA3VsbntoSrN52zw9mkcfSjIln3QIYduX5+2Z/u9NsfusYjKDE+IlhCjv7jLLn928JF5R9f6BuesQkuu/AhiF2CfyGC4TQ9LFno6sw1J0RNvRiD9Yhco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722922196; c=relaxed/simple;
	bh=5gMXoM3vHUEae3lm4AB9BPLUCErdoOZm+REVr/zxs+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVMFQVBw4lFNfAElKUcZXaQAPH/CXWJl/GR/e23FPID0ZZCT08IT8pwjdlRPy6tpHNmb2zTP1DCCO40LgcCyiIkDQHPcCxV6tu6jgDeB5vIukYd2s4B1PUYf5YZO4IUiRKZJw2WY0Cev/YnWKourtan0ju+PdRSwu+fOQsAkzGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qT8PnM7w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80640C4AF10
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 05:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722922195;
	bh=5gMXoM3vHUEae3lm4AB9BPLUCErdoOZm+REVr/zxs+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qT8PnM7w99j18RCSQAaGFHDErR3uK1E+0lRsX59+pfDigymIWX0wTigXM+tSh0ldY
	 ZD8MwpqwUoLD0zc/cmuAJruy3gxOOwgTP9QykkzonCfzmxRUifhpMy7bFT7Yjeb4y3
	 VmpPF2Iq077o05u5pbe+gne0M8AOT3H4OhjUa+7HOVZnLCnzEK6BOhVHocMHWjw/Af
	 wGILFBd30WX8WQ84CZBRagIgjO+HcxGbmKcHtaU2dWkJwtr27pm3u40ulBOWO7F2Y5
	 0WxDzjspTRJNumodqdFvvf7OqXIn3K+SDiC5L/qQJEUbUo72hj5PCAAxg41OMMNpr+
	 Zi6fkR8OIxyrw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef2fbf1d14so60622281fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Aug 2024 22:29:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YyOxczLgegt4Xa7591rlKbRJR7jcr4Th1rgTQINnbIx3Cjdi9zQ
	culAiwpaw8FtRNFCblyN/yUQJuUIc+kW4uyGbZlzdP7tyn3+QpYoX48eK1eTMA3nNkIBP4aH/9C
	Z5E33C1LrDVYqZIMX2CPbtyLGu50=
X-Google-Smtp-Source: AGHT+IEBQsHS9gA/jfo9zH4J/QTPaP5xKGLFsKpOHV0GI1otrauCHhywCI55HWd2iPOCVXWDThulCCsBmnAMhrjWOsQ=
X-Received: by 2002:a05:6512:acb:b0:52b:bee8:e987 with SMTP id
 2adb3069b0e04-530bb2a228bmr3850472e87.3.1722922194168; Mon, 05 Aug 2024
 22:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530210342.1540045-1-maximilian@mbosch.me>
In-Reply-To: <20240530210342.1540045-1-maximilian@mbosch.me>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 Aug 2024 14:29:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASLi6s8AZ1R+Ab08zLBpfpN0qaFcR5ANCoXtx9NqQk8mQ@mail.gmail.com>
Message-ID: <CAK7LNASLi6s8AZ1R+Ab08zLBpfpN0qaFcR5ANCoXtx9NqQk8mQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: allow setting zstd compression level for modules
To: Maximilian Bosch <maximilian@mbosch.me>
Cc: linux-kbuild@vger.kernel.org, "torvic9@mailbox.org" <torvic9@mailbox.org>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 6:13=E2=80=AFAM Maximilian Bosch <maximilian@mbosch=
.me> wrote:
>
> From: "torvic9@mailbox.org" <torvic9@mailbox.org>
>
> Zstd offers a very fine-grained control of compression ratios.
> Add a Kconfig option that allows setting the desired compression
> level for module compression.
>
> Signed-off-by: Tor Vic <torvic9@mailbox.org>
> Tested-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
> Tested-by: Maximilian Bosch <maximilian@mbosch.me>



Please use:

$ ZSTD_CLEVEL=3DN  make modules_install


I hope this is available widely enough.
https://github.com/facebook/zstd/commit/6e9512a70cfe099ac6fdf4dda58b61c2e79=
bbfd9




> ---
>  kernel/module/Kconfig    | 8 ++++++++
>  scripts/Makefile.modinst | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 33a2e991f608..076b18dd3941 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -317,6 +317,14 @@ config MODULE_COMPRESS_ZSTD
>
>  endchoice
>
> +config MODULE_COMPRESS_ZSTD_LEVEL
> +       int "Compression level (1-19)"
> +       depends on MODULE_COMPRESS_ZSTD
> +       range 1 19
> +       default 3
> +       help
> +         Compression level used by zstd for compressing modules.
> +
>  config MODULE_DECOMPRESS
>         bool "Support in-kernel module decompression"
>         depends on MODULE_COMPRESS_GZIP || MODULE_COMPRESS_XZ || MODULE_C=
OMPRESS_ZSTD
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index ab0c5bd1a60f..480d47eca36a 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -101,7 +101,7 @@ quiet_cmd_gzip =3D GZIP    $@
>  quiet_cmd_xz =3D XZ      $@
>        cmd_xz =3D $(XZ) --lzma2=3Ddict=3D2MiB -f $<
>  quiet_cmd_zstd =3D ZSTD    $@
> -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> +      cmd_zstd =3D $(ZSTD) -$(CONFIG_MODULE_COMPRESS_ZSTD_LEVEL) -T0 --r=
m -f -q $<
>
>  $(dst)/%.ko.gz: $(dst)/%.ko FORCE
>         $(call cmd,gzip)
> --
> 2.42.0
>
>


--=20
Best Regards
Masahiro Yamada

