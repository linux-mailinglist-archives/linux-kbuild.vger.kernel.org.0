Return-Path: <linux-kbuild+bounces-156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BDB7F75BE
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Nov 2023 14:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F4D1C20A4B
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Nov 2023 13:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D1C28E3B;
	Fri, 24 Nov 2023 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KazqAwEm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020B828E24
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Nov 2023 13:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3012C433C9
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Nov 2023 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700834091;
	bh=jJVsEV0qxvvJFeZTSqvoBGCVfuab6IO4PmVsXwx2buU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KazqAwEmdRmK2LR7XzskL06kZoN+T5QqQMoPEb2DQ/ORYmxKaiSiGTVrva3Z6x7p2
	 1GEbRHOOiUZ21pRozMZr0d4rrKGsEUTFe6ZbpMnIpW2r9nwYBcq0cOgTD2kn5IHCwB
	 yH3aNFlV9l8MZ8BsMEYeEtpir5hVrOwSWIUE4we63QIiXA+3pkN53QXDKQy6sPIExL
	 Fi+6UaTGGGhI84xY51lX+1tHDRTV6AUjahhu1gJXRxcwWz0ZjMmU3MQwhitnHvvNjR
	 XjyIxloiVlRCdo+K+VmqnkDx6K37ObUqz2sm9Nd8c/aoRX7VDdTuFR5UbVFm732t5/
	 ppePlm3Hts6qg==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1f5b92bba54so1358703fac.0
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Nov 2023 05:54:51 -0800 (PST)
X-Gm-Message-State: AOJu0YwIe50owcTEWWlJYLycP83qgp4bhOqJcMd+WQn77Xp8aJbPiWRa
	buFYk2nAEv+17rcd9+USCWS/8HHWFF3unVqHzYc=
X-Google-Smtp-Source: AGHT+IE8kvyx11qYx6Ewt8Qvd4hxqdcGTljTn6QxNervP8Ve/Q6gvHjND6S2ajZpxwZb7KWPSxRzKOIig4QDvuydBws=
X-Received: by 2002:a05:6870:71ce:b0:1f9:f01c:141c with SMTP id
 p14-20020a05687071ce00b001f9f01c141cmr1192833oag.16.1700834091093; Fri, 24
 Nov 2023 05:54:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121115855.111358-1-pvorel@suse.cz> <20231121115855.111358-2-pvorel@suse.cz>
In-Reply-To: <20231121115855.111358-2-pvorel@suse.cz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 24 Nov 2023 22:54:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNARC4HCHpS9=pbLBAwG1JOz8rtdprD+oKegsSDpeGatvGw@mail.gmail.com>
Message-ID: <CAK7LNARC4HCHpS9=pbLBAwG1JOz8rtdprD+oKegsSDpeGatvGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: buildtar: always make modules_install
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Petr Vorel <petr.vorel@gmail.com>, 
	Josh Triplett <josh@joshtriplett.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 8:59=E2=80=AFPM Petr Vorel <pvorel@suse.cz> wrote:
>
> From: Petr Vorel <petr.vorel@gmail.com>
>
> It is done for the same reasons as 4243afdb9326 does it for builddeb:
> always runs make modules to install modules.builtin* files, which are
> needed for e.g. initramfs-tools or LTP testing tool.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---


Applied to linux-kbuild.


>  scripts/package/buildtar | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 8ac075dd0e9c..72c91a1b832f 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -37,11 +37,9 @@ fi
>
>
>  #
> -# Try to install modules
> +# Install modules
>  #
> -if grep -q '^CONFIG_MODULES=3Dy' include/config/auto.conf; then
> -       make ARCH=3D"${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH=3D"=
${tmpdir}" modules_install
> -fi
> +make ARCH=3D"${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH=3D"${tmpdi=
r}" modules_install
>
>
>  #
> --
> 2.42.0
>


--=20
Best Regards
Masahiro Yamada

