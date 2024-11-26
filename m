Return-Path: <linux-kbuild+bounces-4867-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB639D980C
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 14:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6110428261E
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 13:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D5D1D2B22;
	Tue, 26 Nov 2024 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEX0bfHM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890C82F32;
	Tue, 26 Nov 2024 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732626682; cv=none; b=QTLQFyv1iedr3e+pJ7UiYf69tG2DKMZggIBcoRiFltzPyMsak8obX+NkK9Q/j2KvBpbYqDBgWajZx3u+ZZXOjeJzmmXxm4kghnaJbDKeEgllSHVsUn747J/uXF5Qs4ZfDLhAUVQKFGX8PFHWzP9rvwLAuAZo60VN2472Ktq6TME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732626682; c=relaxed/simple;
	bh=RdjUtNInTsN8apkRc/h7zF3wy/MPjPH8qpjS0p1IL6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUJQH1i++b6+FKN/6vDCIJz4MBbhz3PW7OrYU1EaXCQySbBu2UD2CWR1XE5Y+5ndxf+o6MDMDeSNVYadMRPi2l3UXPYPO9D1UVh1+GL9HzCR7dfjdWpxcLvF5anZKMG9DASmiFAfN00vAJ32LkMr257/ppD/OBYqMGMi4DQFrio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEX0bfHM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155AFC4CED7;
	Tue, 26 Nov 2024 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732626682;
	bh=RdjUtNInTsN8apkRc/h7zF3wy/MPjPH8qpjS0p1IL6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jEX0bfHM+FJjTGvb6Or9Qpt2kk5GiTngdW5QfL5w31L7b+M3QgwD3PRG1WL4Z7vde
	 7QRRT6I1JFhco+51ZPPOR1KG2Cy6tj09fNouA+wTk+R/O/4XmOcPfVIsMg9q1yuN/T
	 Y1iun4k4BQcADSLb4BN7SAqfzUfJKCp85JB1N2tPyu8p+1EZ5sX4NaBJkFrf5FhCMZ
	 J0V3Noo03yW78vi0x3TkiiO0L0IScsWwtxAcrj8yw8YZGe/f0C7KHQSDSsGI3YCt6Q
	 qMHVeO+xvpJrv3Q6ka5g25yVKERbsbVuXTTBdCavv1eF34M7qePfs2YfUF8+iKGUrt
	 Nq/lBPIJ86Zew==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53da209492cso7108110e87.3;
        Tue, 26 Nov 2024 05:11:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7mXJD6UU+xviRpr64nxfKjeDxwnA/B1FuVTMrQmLnAnpZd2s3+wgMHbUkMJlQ+OAuDJmN1vYUvRyIvtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyotumSKwIncHJpa/ZqDehW+rshIx9rG5qOMmzgy7fHcmh7OMk6
	kz0T9eQGH3X8vFvSXhhMR5b8k9jDFozWC8jmLAvQC3XJ4vdplfBLxHLdMpByn+J8D58O10cgNld
	wPvcijSSOPOA6gHU1tMe6cNxqvkw=
X-Google-Smtp-Source: AGHT+IFMdAIk8+GOf0m05hit04T6P6AJVYnAl49cueMqRPgyEQ9iG01ZtIfmibIFby1H97bbVezBYOnMioxez5EwPns=
X-Received: by 2002:a05:6512:3e19:b0:53d:d431:74fc with SMTP id
 2adb3069b0e04-53dd4317532mr8313907e87.10.1732626680734; Tue, 26 Nov 2024
 05:11:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118110154.3711777-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20241118110154.3711777-1-linux@rasmusvillemoes.dk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 Nov 2024 22:10:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_gapAfOrReKwzjixszmCXMhCEnqVgRegJ7smCQKMm5g@mail.gmail.com>
Message-ID: <CAK7LNAQ_gapAfOrReKwzjixszmCXMhCEnqVgRegJ7smCQKMm5g@mail.gmail.com>
Subject: Re: [PATCH v3] setlocalversion: work around "git describe" performance
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jeff King <peff@peff.net>, Sean Christopherson <seanjc@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 8:01=E2=80=AFPM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> Contrary to expectations, passing a single candidate tag to "git
> describe" is slower than not passing any --match options.
>
>   $ time git describe --debug
>   ...
>   traversed 10619 commits
>   ...
>   v6.12-rc5-63-g0fc810ae3ae1
>
>   real    0m0.169s
>
>   $ time git describe --match=3Dv6.12-rc5 --debug
>   ...
>   traversed 1310024 commits
>   v6.12-rc5-63-g0fc810ae3ae1
>
>   real    0m1.281s
>
> In fact, the --debug output shows that git traverses all or most of
> history. For some repositories and/or git versions, those 1.3s are
> actually 10-15 seconds.
>
> This has been acknowledged as a performance bug in git [1], and a fix
> is on its way [2]. However, no solution is yet in git.git, and even
> when one lands, it will take quite a while before it finds its way to
> a release and for $random_kernel_developer to pick that up.
>
> So rewrite the logic to use plumbing commands. For each of the
> candidate values of $tag, we ask: (1) is $tag even an annotated
> tag? (2) Is it eligible to describe HEAD, i.e. an ancestor of
> HEAD? (3) If so, how many commits are in $tag..HEAD?
>
> I have tested that this produces the same output as the current script
> for ~700 random commits between v6.9..v6.10. For those 700 commits,
> and in my git repo, the 'make -s kernelrelease' command is on average
> ~4 times faster with this patch applied (geometric mean of ratios).
>
> For the commit mentioned in Josh's original report [3], the
> time-consuming part of setlocalversion goes from
>
> $ time git describe --match=3Dv6.12-rc5 c1e939a21eb1
> v6.12-rc5-44-gc1e939a21eb1
>
> real    0m1.210s
>
> to
>
> $ time git rev-list --count --left-right v6.12-rc5..c1e939a21eb1
> 0       44
>
> real    0m0.037s
>
> [1] https://lore.kernel.org/git/20241101113910.GA2301440@coredump.intra.p=
eff.net/
> [2] https://lore.kernel.org/git/20241106192236.GC880133@coredump.intra.pe=
ff.net/
> [3] https://lore.kernel.org/lkml/309549cafdcfe50c4fceac3263220cc3d8b109b2=
.1730337435.git.jpoimboe@kernel.org/
>
> Reported-by: Sean Christopherson <seanjc@google.com>
> Closes: https://lore.kernel.org/lkml/ZPtlxmdIJXOe0sEy@google.com/
> Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Tested-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Closes: https://lore.kernel.org/lkml/309549cafdcfe50c4fceac3263220cc3d8b1=
09b2.1730337435.git.jpoimboe@kernel.org/
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> v3:

Applied to linux-kbuild because this is better than v4 at least.

Thanks.






--=20
Best Regards
Masahiro Yamada

