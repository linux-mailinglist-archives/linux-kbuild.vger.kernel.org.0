Return-Path: <linux-kbuild+bounces-2640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F384A93AFCD
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 12:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3011F21FA0
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 10:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316A4152180;
	Wed, 24 Jul 2024 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sq3G4ADd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3F414375C
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2024 10:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721816727; cv=none; b=e80dsLDwI43vwFWA+LvsZ+gvbFhwcAkt9OC/ry5KUurfCo4BnuOp3CreNELAaMwgAQCvm7rp6zGg4r74h9RbV3n5c+bNs++HyJIwoJ48ewpSQ3KcKEVvgjuzMRA5dwcY4IoA51+kU+DM1Fix9sOJB6ffeKnIJj6RS90JjCqdVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721816727; c=relaxed/simple;
	bh=h0z8tQUFEloicFvAFH5Bz7A279S4zKNTfSEyBkef5gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tH5tnTWSFMRq4c1Eq0g2zdP/IzG3EAuoU65ynGS6H82vnRTyZiGAIutERaoxRFwzwxL1WLy1LuoW2IYP/blngrlBwQ9iJgn9SvkiNyrkpW22ajrteyU8WnTAAgUpbpl0LwCbEMeYNEF49yHZjQspqWkCou5I4bVy+cF0zi7e+7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sq3G4ADd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95294C32782
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2024 10:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721816726;
	bh=h0z8tQUFEloicFvAFH5Bz7A279S4zKNTfSEyBkef5gQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sq3G4ADdYFRFWpaLHoWiCMpy2KigdeS7AAYoAWk4p2lF0+SdXGNQWtLzxeFklcc5o
	 FL3OnBK/OqcQWxIN4kVw94G2GjvULiGwTYB+JqR83tikEfP1Pr69FAQzjGExBScBve
	 iUProP1HlhkWqwXT9Ksx/5w4N2hGAizrr+ZmOk6ZpwyP68HffhXseyGLpVVQi/aYmH
	 YfelFDnc92GaZdAS6rL4ufvsgTiJyERfIyY5E2ki/Bru2i3CzUX4EpIG/p/5Er1RFB
	 iVbFddf7FvxF0LArhwNibSeLV+U7SGgWqrgzQQGymTZlP1slj30sv1C7JwWmVpdtrq
	 p0GBkPHfuJACQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso34777431fa.1
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2024 03:25:26 -0700 (PDT)
X-Gm-Message-State: AOJu0YwwUGD1wNetIwq7FSAjHd5lnJvSn9+Ehvho+dG13b4Jq5/mjkXs
	hXXPdnirKKeoZxT9nqCdMPMDn6Dj0XFZpMWVfDSXzs6XZdu4b9CEb0olmALTbxHKrt0Wkw4BG4A
	fstte16Qo8yLaGQ+ZlHSoUR7L7JY=
X-Google-Smtp-Source: AGHT+IEgK75N/XpFsci4ol+JdihsvS4OcHWGwWs19KX67W09t9EPvvjcKk9F+lh5jzxlZg4bB7z/ez1vpPDVGSKkRFE=
X-Received: by 2002:a2e:81d2:0:b0:2ef:26b4:298 with SMTP id
 38308e7fff4ca-2ef26b4030emr74939071fa.36.1721816725325; Wed, 24 Jul 2024
 03:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724084655.930706-1-pvorel@suse.cz>
In-Reply-To: <20240724084655.930706-1-pvorel@suse.cz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 24 Jul 2024 19:24:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNASr8eKYvTwDwjwkaHzXwaGZ16WkXRPD+1_QsAVVmS8v6A@mail.gmail.com>
Message-ID: <CAK7LNASr8eKYvTwDwjwkaHzXwaGZ16WkXRPD+1_QsAVVmS8v6A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: Fix C locale setup
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Rafael Aquini <aquini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 5:47=E2=80=AFPM Petr Vorel <pvorel@suse.cz> wrote:
>
> semicolon separation in LC_ALL is wrong. Either variable needs to be
> exported before as a separate commit or set as part of the commit in the
> beginning. Used second variant.
>
> This fixes broken build on user's locale setup which makes 'date' binary
> to produce invalid characters in rpm changelog (e.g. cs_CZ.UTF-8 '=C4=8De=
c'):
>
> $ make binrpm-pkg
>   GEN     rpmbuild/SPECS/kernel.spec
> rpmbuild -bb rpmbuild/SPECS/kernel.spec --define=3D'_topdirlinux/rpmbuild=
' \
>     --target x86_64-linux --build-in-place --noprep --define=3D'_smp_mfla=
gs \
>     %{nil}' $(rpm -q rpm >/dev/null 2>&1 || echo --nodeps)
> Building target platforms: x86_64-linux
> Building for target x86_64-linux
> error: bad date in %changelog: St =C4=8Dec 24 2024 user <user@somehost>
> make[2]: *** [scripts/Makefile.package:71: binrpm-pkg] Error 1
> make[1]: *** [linux/Makefile:1546: binrpm-pkg] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
>
> Fixes: 301c10908e42 ("kbuild: rpm-pkg: introduce a simple changelog secti=
on for kernel.spec")
> Signed-off-by: Petr Vorel <pvorel@suse.cz>


Applied to linux-kbuild/fixes.
Thanks!



--=20
Best Regards
Masahiro Yamada

