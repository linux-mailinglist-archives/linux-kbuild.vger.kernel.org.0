Return-Path: <linux-kbuild+bounces-1948-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B168D3343
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 11:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 305981F25E01
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 09:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9263616A368;
	Wed, 29 May 2024 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYXxracD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686F143AA0;
	Wed, 29 May 2024 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975677; cv=none; b=l/2Qqfsg6ZqjB9ctFlGjYkIWaRxoYpdaJxD4TiVPt/mu55IIvueKdJX9aS3ysLDXncO3mjOqeAssI6PNPoiquzkqldVzQKu80BDRX8HhD+oitbxHzetZDQ/m/zAs/TKTzUIrXGAbnk1GzMeJnj2rzHDV65WuWxCSu87HtlfqypY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975677; c=relaxed/simple;
	bh=i9hu7Hv1eiqS5bROpHlphFtj2gxQ51GFXxiEA/KHrYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFRK6uf8U2ecNBUZAhr7GlqIr6ysL5QZCMAuXJ/ygaK/uzCmWHdIYPp4DtLm9QGLgUGmC+9u7RMD4oJwtgqH/otN8KKxXlZoNzMC+YggRI7U//Tj0p4PBO5eW4Z+zDSSmTAYN3nmlFoyrK7X6DhSGQdyybSkzBMZvRxtTQB4wsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYXxracD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7E1C4AF08;
	Wed, 29 May 2024 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716975677;
	bh=i9hu7Hv1eiqS5bROpHlphFtj2gxQ51GFXxiEA/KHrYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SYXxracDVUDcyOtr5O8gufjVG3F06rNcztATkfkm713qsYaPcVc9xOrQzuTB+2bJf
	 qPOlYJaulDjNxSN/pm/p71KygY9qU2YzL+ZO2CaXM5sgA1RCVO3JrzbI6N2oiUATT9
	 n6Wmn1cwkhvQhzKadajoSX4qbRYV97gFegjySkZbSNZvZRTuCmnAVRmIjpho+FLFy9
	 YKF2S8iATpnrgaC8h/EJ2w0ZFPShjQlHaiCUlqLykjYr6e07E1l/FONL0yu1J36vHF
	 ph5VHNjYakigLqL8ApudUNsunX89JyGnlG29NfVcNspznqy+G058d3JfIavKDTBt4X
	 jTfbWtM+K/w9A==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e968e77515so22666051fa.0;
        Wed, 29 May 2024 02:41:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5CMvLwuqXiFJqx3MJfY+TrYiWA/y5aXVf7pvqSCvFPRa+ky/H3X9gtFBk/pd1b6ofKawDxnNciICRIPg3kfIPZYTUb/e2zkAg3KdMcty/OT/fX8d5tm8emy6nwD5B3+S4aYt/fPiETWLx
X-Gm-Message-State: AOJu0Yz3m1JqXBvc+IrkMqBEWPLixPSpaHpObigsknISW7rCWICzGQrg
	MTX24HKs/9tkdTrtlJVq4D1VNNNSxdTez/wHnIpxjJTWCfBXVWskoknYmOEwSVTBAINvQ9Kfym0
	16sV0pbE0WTE1uwfiFqBvNQS11Lg=
X-Google-Smtp-Source: AGHT+IFjU7Ggfjm7KDn9oFJHZN0cfR6CEPeugupJZ6TFLzITgGJzMldlWNONRgPQPLK6ib7G5KOac72kZtBV/ym0J+Y=
X-Received: by 2002:a2e:9a90:0:b0:2e1:d94a:773f with SMTP id
 38308e7fff4ca-2e95b096d84mr93484931fa.11.1716975675602; Wed, 29 May 2024
 02:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528085221.2989315-1-wenst@chromium.org>
In-Reply-To: <20240528085221.2989315-1-wenst@chromium.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 29 May 2024 18:40:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNASPJH_eMg8_Pck9WyMJnPZPrtRa+Bg5sfj8U4RxhMP26A@mail.gmail.com>
Message-ID: <CAK7LNASPJH_eMg8_Pck9WyMJnPZPrtRa+Bg5sfj8U4RxhMP26A@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/make_fit: Drop fdt image entry compatible string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Simon Glass <sjg@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 5:52=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> According to the FIT image source file format document found in U-boot [1=
]
> and the split-out FIT image specification [2], under "'/images' node" ->
> "Conditionally mandatory property", the "compatible" property is describe=
d
> as "compatible method for loading image", i.e., not the compatible string
> embedded in the FDT or used for matching.
>
> Drop the compatible string from the fdt image entry node.
>
> While at it also fix up a typo in the document section of output_dtb.
>
> [1] U-boot source "doc/usage/fit/source_file_format.rst", or on the websi=
te:
>     https://docs.u-boot.org/en/latest/usage/fit/source_file_format.html
> [2] https://github.com/open-source-firmware/flat-image-tree/blob/main/sou=
rce/chapter2-source-file-format.rst
>
> Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Add clear reference to U-boot docs along with excerpt
> - Send separately from "disable compression for DTBs" patch
>


Applied to linux-kbuild.
Thanks!




--
Best Regards
Masahiro Yamada

