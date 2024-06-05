Return-Path: <linux-kbuild+bounces-2002-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C68FD05E
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 16:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE32EB315D5
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 13:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3947D196D90;
	Wed,  5 Jun 2024 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Trv5KrF0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06959196D8E;
	Wed,  5 Jun 2024 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717592585; cv=none; b=E7+ZUp+B0227lOwYzE8DwizQns8s6ItNl2h5NkrkBnJNF7Qq984PNEDFzFnivxbShu4/xd9QvLOVc1cqDYlGxiyKjeuL3GLlTLrOSfy5hUdD1g1J8/XobwY3f6FRCu73kmK2PX1O9+U4/PnDzZZxbEmDwt4CSLVOVU1ULyoEuRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717592585; c=relaxed/simple;
	bh=pIUH1SYvl+n4ux5la4H2jH7ufg2H8fTYXd0fOPLDrwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/Vss9IGi884OpTNjaj6hIOAOxz3hdoXs6FsQlyqrrsKdtLLoADZsv1kN6+OxtX/KX9GuqHfCdfN/3LGV8AFfm3H2SdwNbdjS90RjP80VkLuFv1ipuglLmn7LsBX/hrDwAwbtQkjXXtVgkzXRWwV6taePLKa2LBwJAgvvgTUhmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Trv5KrF0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC39C3277B;
	Wed,  5 Jun 2024 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717592584;
	bh=pIUH1SYvl+n4ux5la4H2jH7ufg2H8fTYXd0fOPLDrwM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Trv5KrF0HSWm4vFjCYIfnKXseYSgsO2MzXGCQY6/UvDZWuH9+V2XeludFFsjXZ4sz
	 6DolXtJ6tJeshWdopwX3sM80s1d02Jhcv4HAHFVxJaqALsQqNa/dqYZJ2T3HFmHAk9
	 n92nxvZ5v27J0WfxQvdiAjzjPC3OAoPZZsDQBTgdy5SAr6SiFME0vxlE8tB8cDAKC9
	 r12NCEvRNvgY4pbXWArY8etKUF8V7OMYVG91FuMgH1/a3B/Q5zgxehgyCellvZTF+A
	 Xx47uXpKQdaVYmVZ/TQtSBaoUr+4fkUrijCbB80m7Lkx1nwCZK03mVkYFoSpUjUoLa
	 6Ve9Na9iNoXVA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eabd22d404so23738441fa.2;
        Wed, 05 Jun 2024 06:03:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWK1cXI9XFeSmenA/uXYTqS5sy2weGro8nuBgqngIu3YGx2Vu2XIUTE+iCjJHmzGVbNz9rcI/cktSTcz9LemDaBjdtoXltBXO841b+eXm+An3nifHBiGgXqBp2uv/Kk+SMtnHepAwkENwnlQwabcRypTYz8eOtBtgkjd9EP3pZ+hy3Xt24avH8=
X-Gm-Message-State: AOJu0YyMGb7kVbVwuaL6edl0vN/94w4Fs9a1nzzOE6U0cwxlmWmR2/UK
	iqo73tAthyPGpxZnRakoB8JU6XRBWIJq36pBX1J/LBGyrQgYTh5wL8LHROs2So7VgmzC/xDmrtA
	SPFNrQe+vHrCvaucoiIsSgmKpWLE=
X-Google-Smtp-Source: AGHT+IGwVpOkLFoOkP5TWr3HYPGM/66qLz3qCtA6eyNoWR3THWuiWL+/KltVE6krHcyFH65a/ekDvjBJJ1fzlnrqR0E=
X-Received: by 2002:a2e:804b:0:b0:2e5:685a:cd24 with SMTP id
 38308e7fff4ca-2eac798a96dmr14243171fa.6.1717592583355; Wed, 05 Jun 2024
 06:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <21cdf8ef-e2fe-4247-9390-4b3d975f80a3@nvidia.com> <2b6llsqhqvsc3qrtsqlv2b6353kvuldwrp3xs5v6jistuskzeh@hnlhxbzpvwzh>
In-Reply-To: <2b6llsqhqvsc3qrtsqlv2b6353kvuldwrp3xs5v6jistuskzeh@hnlhxbzpvwzh>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 5 Jun 2024 22:02:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR5fYTzJLtRDSob2TuL0Lt0bxCayY8sx0_1+UEuu1Hz9A@mail.gmail.com>
Message-ID: <CAK7LNAR5fYTzJLtRDSob2TuL0Lt0bxCayY8sx0_1+UEuu1Hz9A@mail.gmail.com>
Subject: Re: kbuild: mksysmap: Build regression for next-20240604
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Jon Hunter <jonathanh@nvidia.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 9:56=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Jun 05, 2024 at 09:14:23AM +0100, Jon Hunter wrote:
> > Hi Kent,
> >
> > Since next-20240604 I noticed a build regression in our farm builders
> > and I am seeing the following error ...
> >
> > /usr/bin/env: invalid option -- 'S'
> > Try '/usr/bin/env --help' for more information.
> >
> > These builders have an older version of 'env' that do not support the
> > '-S' argument and so your change [0] is breaking the for these
> > machines. I did not see your patch on any list and found it on your
> > bcachefs tree [1]. So not clear if this has been reviewed and if this
> > is trying to fix some related to Masahiro change [2]?
> >
> > It is also not clear what the minimum version of 'env' is supported
> > for building the linux kernel, but these builders have been building
> > the kernel fine for years.
> >
> > Thanks
> > Jon
> >
> > [0] https://evilpiepirate.org/git/bcachefs.git/commit/?h=3Dfor-next&id=
=3D973eca8db5570dd0c3f2b3190867138cc446eb3b
> > [1] https://evilpiepirate.org/git/bcachefs.git/log/?h=3Dfor-next
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbu=
ild.git/commit/?h=3Dkbuild&id=3Db18b047002b7d3b19d9fb905c1bd2a214016c153
>
> I'll drop it, but we need a real fix then, my CI builders are broken
> without it...




I will apply Richard's patch instead and send a pull request for -rc3.

https://lore.kernel.org/linux-kbuild/CAK7LNASx_iSWZ14W5dpTOM87kB8A-Paq8fM_3=
nKH5tdfJQ7+ZQ@mail.gmail.com/T/#mfa8b89c64a6a14a764338e9398d40be9bc48cdf1






--=20
Best Regards
Masahiro Yamada

