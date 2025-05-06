Return-Path: <linux-kbuild+bounces-6963-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FF3AABC83
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 10:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69C6EB21205
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 07:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A43822A4EB;
	Tue,  6 May 2025 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ru7w9Xcv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628BF22A1D5;
	Tue,  6 May 2025 07:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517645; cv=none; b=aZ4p35gqOf5ZA+mM9Yd4iU4DcXNyzCbp8AcGCB0K6JyTwKJzlsPRShjamfSX2k4qkTOIEzAkr8TXlFNOLZacswybjjDOLE8IVqAZTBETaP9kaCRaC5fbNjzxjcW7Vppgrso+NWKgpQS0QxaCgFjF2+pKYZ9V/75il4ykgrwsFcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517645; c=relaxed/simple;
	bh=hGFu6CV6qBx92/vlDq2cxoUHe+DraBOLfT+WjIwOKjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9lUiUeZuZxJtSnY+9KYq7eTI4tmEx9v0cnHeG1CKu/iNJcfcTf17foYH6cSQ2tUGWbrjv2Yzr0uzlRDlOb2v3jEd0rCsCQ2N7rtxNLXgXoc1PGLXPyEcQawqNgkSzQVSiwBpn3LnmOdHHgynGoegh4DCyZBBrOaaD5cLwW/rvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ru7w9Xcv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB552C4AF09;
	Tue,  6 May 2025 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746517644;
	bh=hGFu6CV6qBx92/vlDq2cxoUHe+DraBOLfT+WjIwOKjo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ru7w9XcvcVY2nG6aeZ/paT4Xf2pXCWLsQFY2rOSCb+SLldqK6UsR9IxU0Q27lI3Wt
	 ElWp2qUhi0LHMk1hhcBn9SIkdjXN9cfIIIj0rNk4/BB+SFDDLXMvu1gTcHG0Vm+8zu
	 4Vkr4ubgkUa6bbhzieCLb+5BfhBCpVNjWif+FyjTJjNBPA2U7avsOo9ZDO8na5LvDV
	 VdwxJX8zR15z93Dr8y2JQYYSIQ3o+wCLXGtuQ4IaN7R/6rj3vau6ggwrKNnFwmwSBA
	 vUE6pWvHG9EdEizQ+jDBo6aX2FOY5HjF2ySK3Ld1ca8sOrgJo9FBq/82gIAsvD92+S
	 5v/GfiDjnkH6w==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-548409cd2a8so5951135e87.3;
        Tue, 06 May 2025 00:47:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEpVd5XsvzTfP9ItDTzt16DGtdQyCV0BwIwWTzxL6ddPntJQLOozXr2No6D29Q6Lo/2UJDK5C6uegLbpk=@vger.kernel.org, AJvYcCXqO/iL55txSjN7Jm+tMQTAZ4Gz8H5bTO3STRsWun2y+l27r1tadoaF+/gPp5FI38byIp+u+KGJDkbI14zN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy79IuTj+eB8Bqyu71SXHCx/ks+HySyAEyLEjEgTfUXWYcy2pkY
	eBUdsmPQkIbfZ+Q9uAvlP4Xbymu0X138uFpO1HSJEDMC1qWy9i2jnz7aq5jUrJW7GkzJ9joci0h
	QWwF/+MDD41eKAkmMX6GCfWFwT+k=
X-Google-Smtp-Source: AGHT+IEMcQysez1GUopl8isxaYY0umLEuT6DPb7pr6cNTVDu4sBd95dTBe2aGDFiOc+rDPYxbI9lPt+T3vDNnzSPWpE=
X-Received: by 2002:a05:6512:2509:b0:549:b0f3:439e with SMTP id
 2adb3069b0e04-54f9efcc466mr2954137e87.19.1746517643514; Tue, 06 May 2025
 00:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <215802BA292C2DF6+20250408081441.61776-1-wangyuli@uniontech.com> <F4939E0696099A5A+20250408081921.63040-1-wangyuli@uniontech.com>
In-Reply-To: <F4939E0696099A5A+20250408081921.63040-1-wangyuli@uniontech.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 May 2025 16:46:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQeNetCPTxQ53J89SH1KD7jDB+HxjOmj_03QgA0nXK99A@mail.gmail.com>
X-Gm-Features: ATxdqUGhHsPLFHoIW5Tw3Fk7UbO50jbGBQ2ruk81MOA0BibD0fM-ycgasynDCrg
Message-ID: <CAK7LNAQeNetCPTxQ53J89SH1KD7jDB+HxjOmj_03QgA0nXK99A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
To: WangYuli <wangyuli@uniontech.com>
Cc: guanwentao@uniontech.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	niecheng1@uniontech.com, petr.pavlu@suse.com, samitolvanen@google.com, 
	zhanjun@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 5:20=E2=80=AFPM WangYuli <wangyuli@uniontech.com> wr=
ote:
>
> The dwarf.h header, which is included by
> scripts/gendwarfksyms/gendwarfksyms.h, resides within the libdw-dev
> package.
>
> This portion of the code is compiled under the condition that
> CONFIG_GENDWARFKSYMS is enabled.
>
> Consequently, add libdw-dev to Build-Depends-Arch to prevent
> unforeseen compilation failures.
>
> Fix follow possible error:
>   In file included from scripts/gendwarfksyms/symbols.c:6:
>   scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file=
 not found
>       6 | #include <dwarf.h>
>         |          ^~~~~~~~~
>
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---

Applied to linux-kbuild.
Thanks.



> Changelog:
>  *v1 -> v2:
>     1. Correct the commit log.
>     2. Add Sami Tolvanen's "Reviewed-by" tag.
> ---
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 744ddba01d93..d4b007b38a47 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -210,7 +210,7 @@ Rules-Requires-Root: no
>  Build-Depends: debhelper-compat (=3D 12)
>  Build-Depends-Arch: bc, bison, flex,
>   gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
> - kmod, libelf-dev:native,
> + kmod, libdw-dev:native, libelf-dev:native,
>   libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
>   python3:native, rsync
>  Homepage: https://www.kernel.org/
> --
> 2.49.0
>


--=20
Best Regards
Masahiro Yamada

