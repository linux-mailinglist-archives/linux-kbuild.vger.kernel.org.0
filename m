Return-Path: <linux-kbuild+bounces-3300-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5329675AB
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 11:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C05E91C20CC8
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 09:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417A314389F;
	Sun,  1 Sep 2024 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMIzohmn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178334A1B;
	Sun,  1 Sep 2024 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725181895; cv=none; b=h6SQNy1U+bfwVxtusApQ0NyaN97FC7KVZnmgNN953dQznnjLFK89iRxlosjdv+Rp+2EzVJ+Es9zWKnczbAEbRmOtxJJS+PlMV1R550MscZWp8VWLzxYctn6zu+Xdl/juQ8D1fKQJG5F+OyJtBmieOPzvEN8oP8lIPVXWn8D1NnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725181895; c=relaxed/simple;
	bh=lcYyR85PNLW3+IjX0Ikk8GJxpGulbJ4VVBRy9piqfKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQP21/MwWBiu2nkTPCX9P+LhBf/6oAJ6RGMIb5Xbnt0EAiztQ6QryxLe4sD3rygCXC9F+vQy5PwXDwM2/r65NyPSvU/s+uxAZLbrFdtHT69/6MXi5vISWQX6EFjbCcjmyQH+DyOuUCRJnNuUzn60kldmDWKqIC3xamMroJlv5EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMIzohmn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E1AC4AF0C;
	Sun,  1 Sep 2024 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725181894;
	bh=lcYyR85PNLW3+IjX0Ikk8GJxpGulbJ4VVBRy9piqfKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kMIzohmn6+2Yn79DGPTtyMxJzf6LOwj24SJuIOd/D4SCk+ccYQ0z88NbwQQFlwz8q
	 aqPD0rVEDBTAp2j3wMbIh5T2VknpHmfBxZ5JldLt6pYwdW1nOsfRtmvzaeSXYbskXf
	 4nmF0Lb7xkD3Cv+6Y/qhIe1sHkFGGwZcXkeS9fIdZ+j01YA281UZMMF2+0n0l5oxtu
	 0nsBRab6mRHGvKq72mhQtr+VmQX5Act7fZQ3OT7TdEdKP3oVREkNjO0QiwlzTMkdme
	 PzZkrz4NsBbqm3Q9FD0tCuo4KDDSMQ0H/BqH/XipI9d55AakGewifn5CNrPpnc6BW6
	 9JqL5fKkLzoVA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso5547204e87.0;
        Sun, 01 Sep 2024 02:11:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNwsAKneVNpdR3X4FUPSmY/lF+NvXvlliI7TI4UvKh5PwcQitig+Nw0SL39aacdwDOARnhvIfDUIp/p0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYq11lBNaEw8zblmp90ZSCF+FrgLvdsMlFhE23nM+rcFAnfJbC
	ubwFjKiyUHi32euiiOTWzjCmJulScaHaOkhioWs1TMUCH4CX8mynaBdm7Ix6zf29X7grYY61yYB
	VoEUljRlhkf1DMhGlyQH8FNbZw7w=
X-Google-Smtp-Source: AGHT+IHn3f/+Ne0B8GegIU1ArVL1sqNIQ6hfcsrRwb32y+/gu2PrxmsyJpZOgzvD8au3NhdyohRZQ2GrPS7DMEL5AqE=
X-Received: by 2002:a05:6512:2251:b0:530:aa3f:7889 with SMTP id
 2adb3069b0e04-53546baaa20mr4191277e87.56.1725181893271; Sun, 01 Sep 2024
 02:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618103541.3508486-1-masahiroy@kernel.org>
 <20240618103541.3508486-3-masahiroy@kernel.org> <20240831173053.GA27734@ragnatech.se>
In-Reply-To: <20240831173053.GA27734@ragnatech.se>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 1 Sep 2024 18:10:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNASfpKz+PG+tphZHaSssUHirUBxRB13MdBs3TG3HZ6qrQg@mail.gmail.com>
Message-ID: <CAK7LNASfpKz+PG+tphZHaSssUHirUBxRB13MdBs3TG3HZ6qrQg@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] kconfig: refactor choice value calculation
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 1, 2024 at 2:31=E2=80=AFAM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> Hello Yamada-san,
>
> Thanks for your work.
>
> I bisected a kconfig issue to this change, but I'm not sure how to
> resolve it and would appreciate your help.
>
> Before this changes if I run menuconfig,
>
>     $ ARCH=3Darm64 make menuconfig
>
> The menu option for by SOC_RENESAS is visible at
>
>     Device Drivers ->
>         SOC (System On Chip) specific Drivers ->
>             Renesas SoC driver support
>
> However after this patch it is not.
>
> Furthermore searching (/) for any config option protected by SOC_RENESAS
> in drivers/soc/renesas/Kconfig (e.g. ARCH_R8A77965) results in a search
> hit, but if I try to jump to it by pressing 1 all I get is a blank
> screen.
>
> I'm not sure if a fix to the for mention Kconfig file is needed or if
> something else is wrong. This is still true for today's linux-next [1].
>
> 1. 985bf40edf43 ("Add linux-next specific files for 20240830")






The prompt of SOC_RENESAS depends on
COMPILE_TEST && !ARCH_RENESAS.
Hence, it is hidden by default.

Pressing (1) navigated to the nearest parent menu.

Setting COMPILE_TEST=3Dy and ARCH_RENESAS=3Dn made it visible.

All look quite normal to me.



 Symbol: SOC_RENESAS [=3Dy]
 Type  : bool
 Defined at drivers/soc/renesas/Kconfig:2
   Prompt: Renesas SoC driver support
   Visible if: COMPILE_TEST [=3Dn] && !ARCH_RENESAS [=3Dy]
   Location:
     -> Device Drivers
 (1)   -> SOC (System On Chip) specific Drivers
         -> Renesas SoC driver support (SOC_RENESAS [=3Dy])
 Selects: GPIOLIB [=3Dy] && PINCTRL [=3Dy] && SOC_BUS [=3Dy]






--=20
Best Regards
Masahiro Yamada

