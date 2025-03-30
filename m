Return-Path: <linux-kbuild+bounces-6369-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE79A7587D
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Mar 2025 05:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8F613ACDF5
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Mar 2025 03:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7FB2C187;
	Sun, 30 Mar 2025 03:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVb1LnTd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023E0282ED
	for <linux-kbuild@vger.kernel.org>; Sun, 30 Mar 2025 03:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743306136; cv=none; b=GMbx0Ka9aQhjYMQNTPfqcD6LtivARxD9Lhql9baeA6f0MT+oioECTrObxayxZY30DTI8jKkpDRbICNlWypS9fvsVo985XwtdWPIZcnWNA3d5mLONfUUL+Q4djRaePK7Cm6CcfJN+uu/hI0mtrT3Kg/z0bc9e0HDt/OID/gDO/YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743306136; c=relaxed/simple;
	bh=WsCq4vnvlB4z5DKhjweruUjpiO2fRrKqW7LTvyArv60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qoFRbEaXbdkr6tYegGxMlpyGtXTlz58HqidcE/o2bk+hxFgrQCsYpwmrpW19IQgfBeC5kGGsSSxOR1ffuqgYuI1OVa2CPj1AifdwPVOV2Hhb6jEeG0x+wFKWsuTYSSRceJ5iQudY4JijZyzEna9VSzy05y1UKhRqjColBt29J7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVb1LnTd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689BDC4CEDD
	for <linux-kbuild@vger.kernel.org>; Sun, 30 Mar 2025 03:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743306135;
	bh=WsCq4vnvlB4z5DKhjweruUjpiO2fRrKqW7LTvyArv60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gVb1LnTdX5wPEZqKo3hvl1xVPnjg0hwj9WlQoznRmyASL5OskNTd+3B9pC0TNycWv
	 mWWXNfcoZWwmseUWycNsyuh0cqfuiO53vBTxMKPNh5FLF7UkKZYBaCz0eofGQu41ND
	 BftxSLOg6VT+hedM1NEDx7tgmI3eJxO6hLX8/Y9vmp2mjzrxst3KlJzjt4LPYq23Ug
	 pmG3xl5KImWwdowbjW8ns8M8E9zNqzCmHl9BbtNF7DbrbMvSRROilUQCY5/QOGJIHQ
	 FZy5cxTjm2PKSSJa7wvPGSZx9YT3pFtuTW2tki8sUhRhYvOJJ7k9RREFtHKqdejWC4
	 MhP9wz4BL5IaA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso35637581fa.0
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Mar 2025 20:42:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YzTZr9/Z0UVrxSynyIy3E1YU3imexJHOgZKxVwMR/PX0KKDZYxO
	9erB9Jo7R6/bF6PFg8aRuXb2WPwrP9h3q1fccLOdE/0xj/De9MgXOw7KF7ANuDeXdECHP9MYbU8
	8wOKGYfI2q+7FmEfmIup/zaad7BE=
X-Google-Smtp-Source: AGHT+IEPKWbkioYSt4UvUS4n0lMq8kuf++hquGmOBBhCc0p+I48Ubug4fjXa/nPpXm5FrX5MaJaqPREY7rfqLuLd9WM=
X-Received: by 2002:a05:6512:39d5:b0:549:8d16:7267 with SMTP id
 2adb3069b0e04-54b10da7215mr1408090e87.10.1743306134097; Sat, 29 Mar 2025
 20:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DS0PR10MB7317103847A838A01154D836EFA12@DS0PR10MB7317.namprd10.prod.outlook.com>
In-Reply-To: <DS0PR10MB7317103847A838A01154D836EFA12@DS0PR10MB7317.namprd10.prod.outlook.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 30 Mar 2025 12:41:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNASc7jmzmW5HbvH6N=gZw2M5o=iSkk1revZAp_8P9-e9zA@mail.gmail.com>
X-Gm-Features: AQ5f1Jq8u3knlRg24tabLqIN0zExTZEYuU-lJk7focASpdV5TYtGniDUUBkeY-M
Message-ID: <CAK7LNASc7jmzmW5HbvH6N=gZw2M5o=iSkk1revZAp_8P9-e9zA@mail.gmail.com>
Subject: Re: kbuild: deb-pkg: Does the deb-pkg target discard multi-core
 compilation options?
To: Richard Bastos Higuera <richard.bastos@smartmatic.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 3:58=E2=80=AFAM Richard Bastos Higuera
<richard.bastos@smartmatic.com> wrote:
>
> Hello.
> I'm using the deb-pkg target to create Debian kernel packages, but I've n=
oticed that the debian/rules script executes the compilation using only one=
 core. Is it possible to enable multi-core compilation without patching the=
 source code? The procedure used to test that was:
>
> make prepare olddefconfig
> make -j $(getconf _NPROCESSORS_ONLN)  deb-pkg

For me,

make -j $(getconf _NPROCESSORS_ONLN)  deb-pkg

is much faster than the single-threaded 'make deb-pkg'.







--=20
Best Regards
Masahiro Yamada

