Return-Path: <linux-kbuild+bounces-2057-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6FF903EE4
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 16:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FD1C287AE1
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 14:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA19217D34B;
	Tue, 11 Jun 2024 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2gJq4xW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04D9176FB2;
	Tue, 11 Jun 2024 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718116412; cv=none; b=lgdN93DitEMr4g4HfkCuRzAZ717qGRA7rxP0C8lu1iEmkEIXIgObio83+iVMNxDNcx5OTAoTpdsUQftw7LovYx9oMe82bfIuYXoRKXA74qpYuayIOLxgHkcsNa+FTUjMXDdpAn/kQwkkiN8mNUjMnl7IWckjtT/DELmjEMhh0yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718116412; c=relaxed/simple;
	bh=jjTUpPeIaaEwR6z44PyJWedATHRYe37OVHXra4vOKog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZkVPaLfe3aWvVIjbp76Wdm8RP+WQeI4wFG/Z05GZBVSce640bKRnmx4dxiujdr2DZt9GIt2xP6JBWSHk+DenRr369Ag3atDsbxy/N3a1El7acMyAdxlxHudwCtUC0usGgxbr3o6uyP6n0AAWT7xDbJdWTtY5NL+3PSiZLeM3pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2gJq4xW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380E3C32789;
	Tue, 11 Jun 2024 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718116411;
	bh=jjTUpPeIaaEwR6z44PyJWedATHRYe37OVHXra4vOKog=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A2gJq4xWaEuR130bkInxJ765QmHvgA71Pxhb/7MCBsPkHlsN6hnjDBOjvvHPqKEg6
	 r4+7dDnrHc/qV3dq1bdgfTLX3A6GNFDMpoRgt7wZLMgABd41rwdMQBbfEw9QTO+bSv
	 niKWUSaXtvqcejRqjRsLP2XBMPgKSX6HdxJXci0th8CsB1MAibRTPbf8e1arjp3t7N
	 7bgoEo9hWKITAKk/jVZy4mInqdLrkQkIMJLFchhhmS6QUgymZOXHzxCyt/uDXqTAme
	 1ANQIeclW4zST/pGiM+3ZC6b8up3pMdA/eJgy/C8zc0L1nSFw4DdWiEuDrTj1B3twY
	 A8FFz4GgXbwyg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c84a21c62so2857125e87.1;
        Tue, 11 Jun 2024 07:33:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKn3tE29w81TKfMnoT4Z8WXPxax1tSSlfueoulRnAazA2heGZB9++xOA/wXawjEty8SiNzqe6MMPasbNTDWZ4fkbcURelyZrHkYuFOUJjMyQmLQc341CHtgBIMJG2OUXN5SD6k3AJs93jR
X-Gm-Message-State: AOJu0YwrlSOe0ntoSvMEJWeotp+Zd2fqY36XQWPkwq6SrSGUrDPp7vu+
	NykP6MIVbVU14UYEdQzDdH3GdMk5Vxbn6SBn7P/jkE/IMKpPvTmmgiNF8wdNeaadqiEVswaohi9
	UmBPoabFCw6rimy4htMIsmHOlkRM=
X-Google-Smtp-Source: AGHT+IHwS67lNos2R5ogGz+mg0hSjQxVPgdwgwfzJU3OcO1GifI/cPKg1+stC2S9RVd24EzZotQeFtjmVlA4iKw9OAc=
X-Received: by 2002:a05:6512:1388:b0:52c:8416:69ec with SMTP id
 2adb3069b0e04-52c84166f27mr5811929e87.9.1718116409866; Tue, 11 Jun 2024
 07:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605094843.4141730-1-wenst@chromium.org>
In-Reply-To: <20240605094843.4141730-1-wenst@chromium.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Jun 2024 23:32:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQrPfpScYKKg_Mwoj2RyWe5_e_xn6YZRm+t_w2X4+3kYw@mail.gmail.com>
Message-ID: <CAK7LNAQrPfpScYKKg_Mwoj2RyWe5_e_xn6YZRm+t_w2X4+3kYw@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit: Support decomposing DTBs
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Simon Glass <sjg@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 6:48=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> The kernel tree builds some "composite" DTBs, where the final DTB is the
> result of applying one or more DTB overlays on top of a base DTB with
> fdtoverlay.
>
> The FIT image specification already supports configurations having one
> base DTB and overlays applied on top. It is then up to the bootloader to
> apply said overlays and either use or pass on the final result. This
> allows the FIT image builder to reuse the same FDT images for multiple
> configurations, if such cases exist.
>
> The decomposition function depends on the kernel build system, reading
> back the .cmd files for the to-be-packaged DTB files to check for the
> fdtoverlay command being called. This will not work outside the kernel
> tree. The function is off by default to keep compatibility with possible
> existing users.
>
> To facilitate the decomposition and keep the code clean, the model and
> compatitble string extraction have been moved out of the output_dtb
> function. The FDT image description is replaced with the base file name
> of the included image.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This is a feature I alluded to in my replies to Simon's original
> submission of the make_fit.py script [1].
>
> This is again made a runtime argument as not all firmware out there
> that boot FIT images support applying overlays. Like my previous
> submission for disabling compression for included FDT images, the
> bootloader found in RK3399 and MT8173 Chromebooks do not support
> applying overlays. Another case of this is U-boot shipped by development
> board vendors in binary form (without upstream) in an image or in
> SPI flash on the board that were built with OF_LIBFDT_OVERLAY=3Dn.
> These would fail to boot FIT images with DT overlays. One such
> example is my Hummingboard Pulse. In these cases the firmware is
> either not upgradable or very hard to upgrade.
>
> I believe there is value in supporting these cases. A common script
> shipped with the kernel source that can be shared by distros means
> the distro people don't have to reimplement this in their downstream
> repos or meta-packages. For ChromeOS this means reducing the amount
> of package code we have in shell script.
>
> [1] https://lore.kernel.org/linux-kbuild/20231207142723.GA3187877@google.=
com/
> [2]
>
>  scripts/Makefile.lib |  1 +
>  scripts/make_fit.py  | 70 ++++++++++++++++++++++++++++++--------------
>  2 files changed, 49 insertions(+), 22 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 9f06f6aaf7fc..d78b5d38beaa 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -522,6 +522,7 @@ quiet_cmd_fit =3D FIT     $@
>        cmd_fit =3D $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
>                 --name '$(UIMAGE_NAME)' \
>                 $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> +               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
>                 --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
>
>  # XZ
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 263147df80a4..120f13e1323c 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -22,6 +22,11 @@ the entire FIT.
>  Use -c to compress the data, using bzip2, gzip, lz4, lzma, lzo and
>  zstd algorithms.
>
> +Use -d to decompose "composite" DTBs into their base components and
> +deduplicate the resulting base DTBs and DTB overlays. This requires the
> +DTBs to be sourced from the kernel build directory, as the implementatio=
n
> +looks at the .cmd files produced by the kernel build.
> +
>  The resulting FIT can be booted by bootloaders which support FIT, such
>  as U-Boot, Linuxboot, Tianocore, etc.
>
> @@ -64,6 +69,8 @@ def parse_args():
>            help=3D'Specifies the architecture')
>      parser.add_argument('-c', '--compress', type=3Dstr, default=3D'none'=
,
>            help=3D'Specifies the compression')
> +    parser.add_argument('-d', '--decompose-dtbs', action=3D'store_true',
> +          help=3D'Decompose composite DTBs into base DTB and overlays')
>      parser.add_argument('-E', '--external', action=3D'store_true',
>            help=3D'Convert the FIT to use external data')
>      parser.add_argument('-n', '--name', type=3Dstr, required=3DTrue,
> @@ -140,12 +147,12 @@ def finish_fit(fsw, entries):
>      fsw.end_node()
>      seq =3D 0
>      with fsw.add_node('configurations'):
> -        for model, compat in entries:
> +        for model, compat, files in entries:
>              seq +=3D 1
>              with fsw.add_node(f'conf-{seq}'):
>                  fsw.property('compatible', bytes(compat))
>                  fsw.property_string('description', model)
> -                fsw.property_string('fdt', f'fdt-{seq}')
> +                fsw.property('fdt', b''.join([b'fdt-%d\x00' % x for x in=
 files]))
>                  fsw.property_string('kernel', 'kernel')
>      fsw.end_node()
>
> @@ -193,21 +200,9 @@ def output_dtb(fsw, seq, fname, arch, compress):
>          fname (str): Filename containing the DTB
>          arch: FIT architecture, e.g. 'arm64'
>          compress (str): Compressed algorithm, e.g. 'gzip'
> -
> -    Returns:
> -        tuple:
> -            str: Model name
> -            bytes: Compatible stringlist
>      """
>      with fsw.add_node(f'fdt-{seq}'):
> -        # Get the compatible / model information
> -        with open(fname, 'rb') as inf:
> -            data =3D inf.read()
> -        fdt =3D libfdt.FdtRo(data)
> -        model =3D fdt.getprop(0, 'model').as_str()
> -        compat =3D fdt.getprop(0, 'compatible')
> -
> -        fsw.property_string('description', model)
> +        fsw.property_string('description', os.path.basename(fname))
>          fsw.property_string('type', 'flat_dt')
>          fsw.property_string('arch', arch)
>          fsw.property_string('compression', compress)
> @@ -215,7 +210,6 @@ def output_dtb(fsw, seq, fname, arch, compress):
>          with open(fname, 'rb') as inf:
>              compressed =3D compress_data(inf, compress)
>          fsw.property('data', compressed)
> -    return model, compat
>
>
>  def build_fit(args):
> @@ -235,6 +229,7 @@ def build_fit(args):
>      fsw =3D libfdt.FdtSw()
>      setup_fit(fsw, args.name)
>      entries =3D []
> +    fdts =3D collections.OrderedDict()


I am fine with this patch.

Just a nit.

Is there any reason why you used OrderedDict() instead of
the normal dictionary, "fdts =3D {}" ?





--=20
Best Regards
Masahiro Yamada

