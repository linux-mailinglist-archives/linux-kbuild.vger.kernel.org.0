Return-Path: <linux-kbuild+bounces-2938-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 906A594E8C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 10:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 874C8B20987
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 08:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2B816B39E;
	Mon, 12 Aug 2024 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/acFV1m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1410D16B38E;
	Mon, 12 Aug 2024 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723452121; cv=none; b=fyv6SgyR0KGM0iKJzQTx8kiq0DZiBcegKLkZzJdnqvYCqEXsoqGK6n8hZoPxcKS86LPX9TluK/otp3oTqRz8XdKlwXsawJMqtKrw/mpJamG0+jmXXU1vV2Ug4iXvypwYRN+CposLGSi8M3D3vbDOzUnbAHK2EGvG00n5dDQ8pSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723452121; c=relaxed/simple;
	bh=jhBgPtgXEyURbqfeIUYzRwczAY2lurc8806tLbtMip4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyxGLFgnEz1MyFflQeVFCre9EqHTcA9rxbISRKFEwiq0HWtLXOH4NfE9n2jJnnhqVSlc0laUuM3qZ1p5llYSIHhoaUYO+wmy78JSkANaDVusrwVsUKKmFKOKHfBuhI6ckNfbehwc43b5CA7zqLV2uHWPeKoD8a0gZcLwiBgCzms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/acFV1m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95172C4AF0C;
	Mon, 12 Aug 2024 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723452120;
	bh=jhBgPtgXEyURbqfeIUYzRwczAY2lurc8806tLbtMip4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d/acFV1mN0EU6toH25HLgLkQ/fnbjgCTrKPYZLEa31QpE2LBHmwKLrgz7atOJ0Gao
	 TtqjefPQyPrlQiVDXGu8mrHx0Q6OOuXi0vEDoibDyt2llQRB/+oszOyt9ddg7Eb7DQ
	 B78mIHyG4BSGIp+It+16ywXLKxV3zaL3IsROBJ6V+tJ71h75wnoUBeqm0x+LCZ/roW
	 vza/rqjIzKtIifyHyHk7Yl2OvnzUvge/wBRstaJ4v5UldA3fN7W4FaGccE4+aBCmAd
	 LBKy1yTWogt/bNa0CSIJl2BFc8Jp/ikgeka17bs61ZTkp4bdzCk5ibzoo+bvxNx5zE
	 9OK4IeXP5ZPbQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f15e48f35bso40013731fa.0;
        Mon, 12 Aug 2024 01:42:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1NPIEJ+KGPS9/DUltBMp8Ipxvlay8Wrg6TVgWoOOFAAgv/BqIScorcL8rw8yZBKDwHwcAlgAwb2Q+klCTHIja1Xw6PvEpvPTCvSc9
X-Gm-Message-State: AOJu0YxeYr9LQ4P49TMQBbZThdFI1AJaxoW3SqkiBAuRwoSJNP6vzpST
	VyPJAqcNmziCx04GjKDqqKDWG6YKyWlx/QxF0AR7R/rw0BTFc6VncTd6CipbNRrgEjWzQ1f6syr
	hK76K2mCYaqVBmsZRnTfTRdw4Dz4=
X-Google-Smtp-Source: AGHT+IH3GOuDXW+9O93sVTeb0j6owQGLSIzNKMNp3KuhphpNBRzkmX4g16mcxkrGxQ+fajjdZ4JxopX0pnTEuYNYh64=
X-Received: by 2002:a05:651c:210f:b0:2ef:1db2:c02c with SMTP id
 38308e7fff4ca-2f1a6d0011amr73101471fa.10.1723452119200; Mon, 12 Aug 2024
 01:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710065255.10338-1-ole0811sch@gmail.com> <20240710065255.10338-3-ole0811sch@gmail.com>
In-Reply-To: <20240710065255.10338-3-ole0811sch@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 Aug 2024 17:41:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ9fddijdAJFNYKqA3nQibwiv5jvZs3O9-nDbcRToWS4g@mail.gmail.com>
Message-ID: <CAK7LNAQ9fddijdAJFNYKqA3nQibwiv5jvZs3O9-nDbcRToWS4g@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] kconfig: Add picosat.c (1/3)
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de, thorsten.berger@rub.de, 
	deltaone@debian.org, jan.sollmann@rub.de, mcgrof@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 3:54=E2=80=AFPM Ole Schuerks <ole0811sch@gmail.com>=
 wrote:
>
> PicoSAT is the SAT solver used in this project. picosat.c is the actual
> SAT solver. Since the file is too big for a single patch, it needs to be
> split up. This patch contains the first part of the file.
>
> Signed-off-by: Patrick Franz <deltaone@debian.org>
> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
> ---
>  scripts/kconfig/picosat.c | 3000 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 3000 insertions(+)
>  create mode 100644 scripts/kconfig/picosat.c


I usually tend to avoid adding huge files like this.


Is this for avoiding any portability issues across distributions?



Debian:
https://packages.debian.org/search?keywords=3Dpicosat


Fedora:
https://packages.fedoraproject.org/pkgs/picosat/picosat/










--=20
Best Regards
Masahiro Yamada

