Return-Path: <linux-kbuild+bounces-5634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC061A295A1
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 17:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E1A116563F
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 16:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0280C1FC0E3;
	Wed,  5 Feb 2025 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbHnuLnC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0371DE4D3;
	Wed,  5 Feb 2025 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771312; cv=none; b=id/gEQY9Y9ScqKHzJ8ffnCMgho7QKX5Qd7LDj5Ds5qk5aIWUbR4zcf1IDa2lFtCSUX2uEjxnlNJKN/fsa7SSMNI4vhoRWaUNUuGUTvv/bgUd1UIIh05s4KHiG7GsLE85ixPC1mnMPCBs2oEfkpDvr/aABCX9xocC555YPPrPiX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771312; c=relaxed/simple;
	bh=xzNVZNJv/6CXgk6KsLZwHnGFe7nGZ2qgsdhgsNZ4y58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdQob9GkXa8i1A4ilC5s5ra9my+tdSkrYLNvTCx/ghaU0VOdaBi6U60QM9OEQwgSVJx59E/yttihPwgx8EP9mdin+AaabFYwig8ygj3u4zHDXF6H7L0MvNvcLaHksIYCFG/jkmG0aHOjRyQKxQcjo0SemO9ykgkc/eCYenj6pm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbHnuLnC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42544C4CEE3;
	Wed,  5 Feb 2025 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771312;
	bh=xzNVZNJv/6CXgk6KsLZwHnGFe7nGZ2qgsdhgsNZ4y58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SbHnuLnCt/K9oqml9aufa5kr0vMe57UL/zyCw/KRE4GA4cHooCiY2C3Ri6Pa8pSjS
	 Ugnu8hNgevaVsBHkCinO8/NQDCPLINn7TvkNR2045+acMn9CMTa04S7C3Qpz+axG7g
	 3NCPW8q+Lq1YDLSevRiLL4Y+pVxtKpHvZcTyJfOk8n1kJ1fWed/a15HvYG0YCud6lI
	 J/s/g0T9+C2pKbchl3dM2DNlYkmsPUg7ZgakUVTqDUGqX2Avi4hma3EFQG8NgChh+n
	 bgB3/E6tRZHOIE46f4T/DVxDxP8Y82l1N68K0FWOnNQ7HIS+/ClQXuAU2togPiiVtb
	 LxAnxLvNuVBAw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30737db1ab1so14490411fa.1;
        Wed, 05 Feb 2025 08:01:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhVFt3x/6YJ0/2ESSFanixtFJ9sJDylI8XNdp49CgDY38tkkL27i6w3puhdOlNhwMw74Bnc8jJZao63rTR@vger.kernel.org, AJvYcCXcvtL7+JaNGJgJH84319vEZMjZxi9Voyviu8fToQy0l+WVtzJK/ZEsftkdKY2mmu8stTbSTZnfXclu7bM=@vger.kernel.org
X-Gm-Message-State: AOJu0YztfiXZEUY2J5dd/Ts8fQMIfWqn1dxxZSQllHiYPEBZimgF5K02
	paKlU1IHJCOvIuDq+dJICccjF8nraevHlYPGMFHnScga3t01D1zLZnbMgTmeQLYZ62r1uisfNCZ
	xrwWHk8NbR6bNrNZ767ML0viImo0=
X-Google-Smtp-Source: AGHT+IHza+YHJ9sHLjSByA/vo8ZtacacWkt+fNgBXLi/kgqSszwUQtsbXvEpHDDJbGIhcqflk/XqAOLHwKwhWoeTFlE=
X-Received: by 2002:a2e:9a11:0:b0:302:350c:c630 with SMTP id
 38308e7fff4ca-307cf3145d5mr15148401fa.22.1738771310719; Wed, 05 Feb 2025
 08:01:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-makefile-extrawarn-fix-clang-format-non-kprintf-v1-1-6c6747ada0d4@kernel.org>
In-Reply-To: <20250131-makefile-extrawarn-fix-clang-format-non-kprintf-v1-1-6c6747ada0d4@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 Feb 2025 01:01:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQaAtVsLOVLKwM_BSMf+CNgKbxCv++SQb-Bq4Z2-2Pxtg@mail.gmail.com>
X-Gm-Features: AWEUYZmBplNRhPSdPu9YNsVlym28aL3b9CavToSaPVo1MWSCsXtOSQq157es_yY
Message-ID: <CAK7LNAQaAtVsLOVLKwM_BSMf+CNgKbxCv++SQb-Bq4Z2-2Pxtg@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.extrawarn: Do not show clang's
 non-kprintf warnings at W=1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 7:55=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Clang's -Wformat-overflow and -Wformat-truncation have chosen to check
> '%p' unlike GCC but it does not know about the kernel's pointer
> extensions in lib/vsprintf.c, so the developers split that part of the
> warning out for the kernel to disable because there will always be false
> positives.
>
> Commit 908dd508276d ("kbuild: enable -Wformat-truncation on clang") did
> disabled these warnings but only in a block that would be called when
> W=3D1 was not passed, so they would appear with W=3D1. Move the disabling=
 of
> the non-kprintf warnings to a block that always runs so that they are
> never seen, regardless of warning level.
>
> Fixes: 908dd508276d ("kbuild: enable -Wformat-truncation on clang")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501291646.VtwF98qd-lkp@i=
ntel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied to linux-kbuild/fixes.



--=20
Best Regards
Masahiro Yamada

