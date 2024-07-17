Return-Path: <linux-kbuild+bounces-2578-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C366934135
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 19:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA361C20DDB
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 17:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97EE1822CF;
	Wed, 17 Jul 2024 17:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbH+0uGJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A321822C6;
	Wed, 17 Jul 2024 17:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721236290; cv=none; b=F1JT0UwFamwB8JT4JPiwemem0W9B4eqAbEGScEDtFesHOmy37tCwbXTCqe/jBDRfZj5elr+gG71UtWW5+5eHT5V7gYw4q42LdpDkwpY1WbrTicbriSzPngjQfoJrJQf5aNdWlujTAcqPnQ18GN1or28HSgC6/YK3vGOcD9N9zb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721236290; c=relaxed/simple;
	bh=X6ReRm40FpwP6017bDhQf/iVSDcVajYzOuWasuUTS/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cI4u7Z9jZ6oxRZQC1WyK9BDNi8ZST823n7vXOLNzjs6TcsCO6G0knxJHFaG9FfDyjlYpTP4cq1ssY1rDM8M1FUvCIafCS4cSPyJ00NZQvIKqpH91GzjqCNvEcem5pC8A9RMSx6cFuXVuSwWCfJ4h+WOzmQYzylrmYm2YPJjrUnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbH+0uGJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CF4C32782;
	Wed, 17 Jul 2024 17:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721236290;
	bh=X6ReRm40FpwP6017bDhQf/iVSDcVajYzOuWasuUTS/c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bbH+0uGJg6Ue7i8AQaoxVYeF1JKI/JHLxKLnXzYM7eu198OSZgr842+NiuNh9pfaw
	 RhQO5l12958wND1Oi+OSKtU+ok+EeljuZAEb16m5Xcg/juZnt913stdFLEJlXVNMz/
	 7uCO44FGEdNhZ93qzf/vKcXFkgBUMEncl9tJNQTNorN8oArbY9y6qPkytxfIF7pBel
	 Bxi2/ZHMQ9zdRuzCq07Eyi+elqOnNH+YmK9cOWqJMJOFKA/eZ3ENqtYo/yUV5m4GYk
	 QFk6HHW75fr6Xi5XMqjLSjHkbmAIDiaTLPxCxWVhI6YVukeAg++IgpGDYngXgqTeHM
	 VmT0I8XkO0TZA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eecb63de15so292691fa.0;
        Wed, 17 Jul 2024 10:11:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6w6ASuOoh/KfIxM9miK/pFvS4ArVJMKs3HBkuuvkV3jO6No8Fw7nclq6XybTo7jXHdH5SxnYA7fF+Ep5mlQq2GBRKcV7QUIrtVAWtUaEGXWet154v4oWWmpi302P0wYF2Y4aMMb7P4R3S
X-Gm-Message-State: AOJu0Yz76Lrcawxuri1OQBZc45QAhwt5IxjDayA/unplXmURta0HWSEy
	quTJeKXK6aKfTN4XcgXO4eJ+IuH7NQ1JSpSz5N9GN/64OmivuEumKN0MP8KSFkPWXcWVLfxaNfl
	FEfV+TBoJTmlCF/wzZeOL5pY1Wy8=
X-Google-Smtp-Source: AGHT+IGpQZCQCCAnE2VB7N79eUar2tXdiJYifvkegV1ttwOnE/hzhEflsTEljDHJps6w4qSbg/FZKkq0rZ5n5TvQzpY=
X-Received: by 2002:a2e:9045:0:b0:2ee:80b2:1e99 with SMTP id
 38308e7fff4ca-2ef05d5bb22mr198941fa.44.1721236288833; Wed, 17 Jul 2024
 10:11:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAR_=AWh1aE4iev1xtcfTAAHNOhwq3gF+h6DFzz9x39qPw@mail.gmail.com>
 <20240717015042.339931-1-elsk@google.com>
In-Reply-To: <20240717015042.339931-1-elsk@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Jul 2024 02:10:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNATdQuPAwC_y71epb_bANqdzJ6SXUUnipCttbgjXF8-Pyw@mail.gmail.com>
Message-ID: <CAK7LNATdQuPAwC_y71epb_bANqdzJ6SXUUnipCttbgjXF8-Pyw@mail.gmail.com>
Subject: Re: [PATCH v4] kconfig: recursive checks drop file/lineno
To: HONG Yifan <elsk@google.com>
Cc: kernel-team@android.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 10:51=E2=80=AFAM HONG Yifan <elsk@google.com> wrote=
:
>
> This prevents segfault when getting filename and lineno in recursive
> checks.
>
> If the following snippet is found in Kconfig:
>
> [Test code 1]
>
> config FOO
>         bool
>         depends on BAR
>         select BAR
>
> ... without BAR defined; then there is a segfault.
>
>   Kconfig:34:error: recursive dependency detected!
>   Kconfig:34:   symbol FOO depends on BAR
>   make[4]: *** [scripts/kconfig/Makefile:85: allnoconfig] Segmentation fa=
ult
>
> This is because of the following. BAR is a fake entry created by
> sym_lookup() with prop being NULL. In the recursive check, there is a
> NULL check for prop to fall back to stack->sym->prop if stack->prop is
> NULL. However, in this case, stack->sym points to the fake BAR entry
> created by sym_lookup(), so prop is still NULL. prop was then referenced
> without additional NULL checks, causing segfault.
>
> As the previous email thread suggests, the file and lineno for select is
> also wrong:
>
> [Test code 2]
>
> config FOO
>        bool
>
> config BAR
>        bool
>
> config FOO
>        bool "FOO"
>        depends on BAR
>        select BAR
>
>   $ make defconfig
>   *** Default configuration is based on 'x86_64_defconfig'
>   Kconfig:1:error: recursive dependency detected!
>   Kconfig:1: symbol FOO depends on BAR
>   Kconfig:4: symbol BAR is selected by FOO
>   [...]
>
> Kconfig:4 should be Kconfig:10.
>
> This patch deletes the wrong and segfault-prone filename/lineno
> inference completely. With this patch, Test code 1 yields:
>
> error: recursive dependency detected!
>         symbol FOO depends on BAR
>         symbol BAR is selected by FOO
>
> Link: https://lore.kernel.org/linux-kbuild/20240627231919.2461945-1-elsk@=
google.com/T/
> Link: https://lore.kernel.org/linux-kbuild/20240620211112.500465-1-elsk@g=
oogle.com/
> Link: https://lore.kernel.org/linux-kbuild/20240618185609.4096399-1-elsk@=
google.com/
> Signed-off-by: HONG Yifan <elsk@google.com>
>
> --
> v4: Rebased & addressed comments from masahiroy@kernel.org. Simplify
>     code by dropping `prop` variable.
> v3: Rebase on top of
>     https://lore.kernel.org/linux-kbuild/20240626182212.3758235-1-masahir=
oy@kernel.org/T/#t
>     & resolve merge conflicts. Fix
>     scripts/kconfig/tests/err_recursive_dep/expected_stderr
> v2: Delete all filenames/lineno completely as suggested by
>     masahiroy@kernel.org


Applied to linux-kbuild.
Thanks!


--=20
Best Regards
Masahiro Yamada

