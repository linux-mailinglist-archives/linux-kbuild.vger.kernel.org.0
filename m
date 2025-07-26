Return-Path: <linux-kbuild+bounces-8191-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ED9B1294A
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 08:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 923A91C85826
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 06:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AD71F8723;
	Sat, 26 Jul 2025 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyB1rr/3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578981E1DE9;
	Sat, 26 Jul 2025 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753512451; cv=none; b=jfiJeEb4ymzmIqMjvHuPy1UqK6N75z27WJ5J2RoF8336ZIATFsUJ4TepDxxxy2jm+FkQ5aoPfTCMDik85RhhpIylqNvNMqkelkBQ6VmJeBtOjdaLh7uAmP1X/hhWT01GwCA/9PO/InYykFcR22fEihANB4aD8VS17wX1vp/obyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753512451; c=relaxed/simple;
	bh=gcloVs4AuB+DhckE0NJKdL5J3lPmZnpWvJo3h5Elh+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtfvfCF8vrcPF30Lm8qGCWndo4BtmTVZDnZwUT+Vh6zGTauVYWy5SNrtgkg+mGo+1cAKJ8RpVH7UjH6ppAdlatJVkMjVkP59CWaagMu6wwhihzVbxpByzf1Rtc17Cnhvg92jDgWo2LUAR6NuGfaVIUwHPBpSVI87BDrY7Kaa3pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyB1rr/3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1838C4CEF4;
	Sat, 26 Jul 2025 06:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753512450;
	bh=gcloVs4AuB+DhckE0NJKdL5J3lPmZnpWvJo3h5Elh+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QyB1rr/3YFWVaeX1YKhwtNwVAgZMBKWvUauogRV2XW9j/cuW2W00sEHRp9JeTntBE
	 weGByhjuHrRqLuXduzC64C9HUTWfpBjnOdhKe6s8NgPtpL2ABslUzhT1YcS9hKgC4h
	 SbUgK5pE3G9jyv/tJhLsd7QFiBN4aO6038IdQzc/YxfsnZ8u76yjEnNcFRyV4miL/V
	 Ho4lwhcM5yL05gdrQSTWBOVQX2K98VTlVQDRjSO9dHltCMWSUQOZTuFz5ELQmOXd/w
	 FvVwUhG1RHIKdsAtBjJpE9V+dqzBe7Tpr78qk7i9TrDVXkgJ/O6T0zKBI80O987EGU
	 dPEL3pfyE06Hg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55b50590cb2so2941765e87.0;
        Fri, 25 Jul 2025 23:47:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5/0dPnG/FrD1bgktFMqGQSG7O3zgNn1vVbWGV5TLtr70j1penyUPdagQb3ExRwm00U7HtkBnp2DVlJ0M=@vger.kernel.org, AJvYcCUcCZOdt1JDO899qDMFwR3jJv/A/w1TM1h5gNK5JTa3dFXF4yAtWhvEEncgyXG+d+NVScYOPuvY7XBiexYB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80WoU1xrQhBwObUX56d3tjuARuPakzn7idngP8P+KRjjRGBEc
	EEj6CiU/ZhEMrIzPdtyH44v/w8pW0WU21/Q34iLfys9a844GCLv3enTrsw3zDvrplQl0scEpxAh
	OZa1YIlrVLV2DvK5A4d5MMRKdJtL8JGg=
X-Google-Smtp-Source: AGHT+IG95LbI+HZlHdP+c4RqNpV3gNB3aJbR2wnVaVs+hu03z3Z176WIeeTwOMV+weE1iei3oZ/BW9BMLJlu0qnbjQA=
X-Received: by 2002:a05:6512:a8a:b0:553:2a0f:d3d4 with SMTP id
 2adb3069b0e04-55b5f4b2e42mr1171996e87.49.1753512449590; Fri, 25 Jul 2025
 23:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230412082743.350699-1-mgorny@gentoo.org> <277557da458c5fa07eba7d785b4f527cc37a023f.1752938644.git.sam@gentoo.org>
 <20250719201002.GA3285766@ax162> <5cd7b14179531cec3cdc8fe3c40a639ccf0be5c1.camel@gentoo.org>
In-Reply-To: <5cd7b14179531cec3cdc8fe3c40a639ccf0be5c1.camel@gentoo.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 26 Jul 2025 15:46:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNATRPWXZ5WT2C8Q1DL=1+ocUK3RFEyUneUvhcjk3WCv1SQ@mail.gmail.com>
X-Gm-Features: Ac12FXyyghK537AA_lQTZQkurYjvh7_QfV2PaoNgKX_MYMJmw33oX5n0Bi3HMu0
Message-ID: <CAK7LNATRPWXZ5WT2C8Q1DL=1+ocUK3RFEyUneUvhcjk3WCv1SQ@mail.gmail.com>
Subject: Re: [PATCH v3] kheaders: make it possible to override TAR
To: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Sam James <sam@gentoo.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 4:08=E2=80=AFAM Micha=C5=82 G=C3=B3rny <mgorny@gent=
oo.org> wrote:
>
> On Sat, 2025-07-19 at 16:10 -0400, Nathan Chancellor wrote:
> > On Sat, Jul 19, 2025 at 04:24:05PM +0100, Sam James wrote:
> > > From: Micha=C5=82 G=C3=B3rny <mgorny@gentoo.org>
> > >
> > > Commit 86cdd2fdc4e39c388d39c7ba2396d1a9dfd66226 ("kheaders: make head=
ers
> > > archive reproducible") introduced a number of options specific to GNU
> > > tar to the `tar` invocation in `gen_kheaders.sh` script.  This causes
> > > the script to fail to work on systems where `tar` is not GNU tar.  Th=
is
> > > can occur e.g. on recent Gentoo Linux installations that support usin=
g
> > > bsdtar from libarchive instead.
> > >
> > > Add a `TAR` make variable to make it possible to override the tar
> > > executable used, e.g. by specifying:
> > >
> > >   make TAR=3Dgtar
> > >
> > > Link: https://bugs.gentoo.org/884061
> > > Reported-by: Sam James <sam@gentoo.org>
> > > Tested-by: Sam James <sam@gentoo.org>
> > > Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> > > Signed-off-by: Micha=C5=82 G=C3=B3rny <mgorny@gentoo.org>
> > > Signed-off-by: Sam James <sam@gentoo.org>
> > > ---
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >
> > I assume that other places that call tar within the build process are
> > not problematic because they do not use GNU specific options, such as
> > scripts/Makefile.package and scripts/package/install-extmod-build, or
> > maybe that people just have not tried building those packages with
> > bsdtar?
>
> Precisely.  We focused on the one place which actually breaks our build,
> to avoid touching too many subsystems simultaneously.  If this is
> desirable, I can look into replacing the other instances.
>

This patch is not applicable to my tree.

Please rebase to the kbuild tree (or linux-next).




--=20
Best Regards
Masahiro Yamada

