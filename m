Return-Path: <linux-kbuild+bounces-8193-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB2FB129FE
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 11:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A78B1C2751D
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 09:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4669D223DF9;
	Sat, 26 Jul 2025 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROA3u/Dk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213D12AD0C
	for <linux-kbuild@vger.kernel.org>; Sat, 26 Jul 2025 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753523848; cv=none; b=skSsY4GEQlagqn/BPsRQ9278xP75+PnafJl+MgjTxP1/+8G+8AYj51k4TN04FDreYcMVKYbHS5n5+sNRT+SIAmV2hfaoh8nC3HicxxkIVejnzYVyl6kGn4bpvij5xKN4xOnubBn9iEnzLxwMk5nO9IQ5sLkxApzDvusfr3Zogq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753523848; c=relaxed/simple;
	bh=Ju7NzfKXU4eCibqgQcy+XncvwCUrHeT5R3qowdeLLq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ta6IHCJRhlT4EfmRxkucEAe7y/0mWIIwC9fZT1xrZkfXS9UgXPRbwFymQ4ydzWx5eS+bwRewbewfnzi2Pc85FI+gZuCmm+h5ymTXLhr26u6nhO81p2wFqBwhWAFtQrShMghwXls84G/3p9trF9tSgyNEKd2y/S+uTef9X+UrPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROA3u/Dk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93308C4CEF4
	for <linux-kbuild@vger.kernel.org>; Sat, 26 Jul 2025 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753523847;
	bh=Ju7NzfKXU4eCibqgQcy+XncvwCUrHeT5R3qowdeLLq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ROA3u/Dkic7ZHJgir3ovrZn/X7FtyDalBc0EAt3Os7TrcgKjN3M/I6d3I3ySiHMDo
	 knIRjo1Ros8lC+IoQa5RUwhjbZxByAT2V8sH62FnETdB5v+XtWEQbtKUPaFUTUIrxt
	 5f+0DblEIZYzI51305EXI9g9q9cgmrhSmSNprKWj6ldGPgpv34yulKjrFgLgK3D04G
	 CDL1opjXgylW46VAVo+TjTnyVzUSbrRZQozDdyaV5UR20/gPLvp3lKXVZh9Ag57kn4
	 s5n6GSpme++htBvDeL3Id2G7DEQG+e3gnm6iw5A9PMt2+ND/mVazd+98PX2KbedEyJ
	 znlBUJZ4G50Zg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55a4befb8ccso3048121e87.2
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Jul 2025 02:57:27 -0700 (PDT)
X-Gm-Message-State: AOJu0YwqLKrB7gn+uz1ITxoEliMV/ES5otYxpG7swrNQBzROTfEAt/36
	5QJ4sq3mQLr4unMBbrfROhJORYZ97MvdaVaTJcFPWKg7ALjwJWeAAKs4KslLwJmUgbto5nBgBGj
	A6jnZ7EywaiUdhjREpnSF+Wd24hzonOM=
X-Google-Smtp-Source: AGHT+IFoJXIShpVHJXmBYPQRCiPe9lu6PTnuCS94GDoW5Z8Go6CCfLWJtecu4+JwX+Aia5eupDk151c8wLhWsTUUSUc=
X-Received: by 2002:a05:6512:a8e:b0:553:2f8c:e631 with SMTP id
 2adb3069b0e04-55b5f3d61f9mr1448558e87.9.1753523846284; Sat, 26 Jul 2025
 02:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <211effdc-774b-4c59-9643-c43b058350cc@infradead.org>
In-Reply-To: <211effdc-774b-4c59-9643-c43b058350cc@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 26 Jul 2025 18:56:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQOejmh+mrfV7eMEZVjdZu-qWyB_jy9btTzPu2=mTeTfA@mail.gmail.com>
X-Gm-Features: Ac12FXxJ_4QrwI7WH6sGAjzrn3kQ7o5CblPF7F2YjrewwzSvt18GbMIAcCzQwtM
Message-ID: <CAK7LNAQOejmh+mrfV7eMEZVjdZu-qWyB_jy9btTzPu2=mTeTfA@mail.gmail.com>
Subject: Re: xconfig problem with 'comment'
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 9:59=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
> to recreate:
>
>         make O=3Dbld alldefconfig
>         # enable CONFIG_NET, CONFIG_WIRELESS, CONFIG_RFKILL, CONFIG_CFG80=
211
>         # with any kconfig tool or $EDITOR
>         make O=3Dbld xconfig &
>
>
> I get both the prompt for MAC80211 (depends on CFG80211)
> and the comment: "CFG80211 needs to be enabled for MAC80211"
>         depends on CFG80211=3Dn
>
> Other config tools (menu/n/gconfig) don't have this problem.

Perhaps, did you choose
   "Option" -> "Show All Options"
?

This option shows all options and comments,
including hidden ones.



Please try
  "Option" -> "Show Normal Options"

This will show only active options.




>
> I'm testing on linux-next 20250724 but I don't think this is a
> recent change.
>
> --
> ~Randy
>


--=20
Best Regards
Masahiro Yamada

