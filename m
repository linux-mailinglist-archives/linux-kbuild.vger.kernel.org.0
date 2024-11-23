Return-Path: <linux-kbuild+bounces-4819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A699D6820
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 09:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEE89B21ECE
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 08:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D90716D30B;
	Sat, 23 Nov 2024 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTeOH3VC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2DC4A0A;
	Sat, 23 Nov 2024 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732349249; cv=none; b=fiNeTmqKFlaQlGsZM9+q2IlSZPulmOK+S+V9XtMaXH8icptSmzULbswC+qYvE2rroPLKC2PxyZuqVmodK+4vtrziXcJTjfTQ7CDsNbjtR2ZW1CmfFM9swYCOcU7Fdmn+5lSpfe0YnaGM0qRftIJ1R30q59DdDPBndwkjSuvlXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732349249; c=relaxed/simple;
	bh=PIbwRTHdbqi5eTD61P0KDKt7aHhX7HKfT5+ET4l6qoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3Ek64ZAju2VSt0ir2SpIA8ld+25FgD0myoVmmYllZitxgzdGLahQTEGbqCzfYjQOziiCr3P+2WrmyMC+G0FIedR50B4ki1hAtEB4no7B+rqXDj7GoRY8FUb027C/JtpBaoljSf7BcfTKu4A6KFC53UixYDVKlW7Id46QKAayTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTeOH3VC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E2FC4CED2;
	Sat, 23 Nov 2024 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732349248;
	bh=PIbwRTHdbqi5eTD61P0KDKt7aHhX7HKfT5+ET4l6qoc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uTeOH3VChgkz5EnGR6oIbw4WHEudXDAQ30jO2IgjB+vRNVDtJ1zFPGxlxjv/2kDT/
	 OXqrsNwpS+CRxO9ju4fZYoxfSgPZU9KzG21zEyJDo5cMtDViSkDSCTpz8Dp9ne8uJZ
	 CW7Xk9vrLkTaS6pR9B4v6QumaJJ2Fm1AA6AowEMciXOY1vA9/ykgmVi3JVIKJMbkXR
	 QiVtUFHP7S4bBeCnXP10O6BDiaGWfTQT/YxIW967CvVrP8npWI0VJt0RUygBc4o3mR
	 fNqBB3lJ+Az9U3ABfWcxJu4+3QhUSW570mUOHeR1ZOepSRHQGbfVxvXQVT3dsTXjQe
	 Z5a++kM5frBfQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5111747cso34050081fa.2;
        Sat, 23 Nov 2024 00:07:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWC+TN+/zFXr+w5b88/qVm3003dBdGLc+05z/4ekFlB5hON1TE8Wwe/8qPSLrGkXaUG8miU+4W3aM2twZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9XbWvB+3oYn8Ew6PJhp9PvzGHQNH3JydjWMkikyxbixX5C8cr
	HB/uyo9K0l4DvyUer3f7qHijrMEj5+nPCiIn02waZWdCLBpId0FBqVdvGgmdo7arQIc+moJbrPr
	bEDu3xfK5p/pRQVk2HZY3ZVovMMI=
X-Google-Smtp-Source: AGHT+IGa7sb4RLdDJOo9iuRfeVpapV2AaJzdZkOATJJpVHFMWs49WfoKrdLRU9RgukSwVlC9apmJEKLJYJ1pY0DIimA=
X-Received: by 2002:a2e:a90e:0:b0:2fb:6277:71d0 with SMTP id
 38308e7fff4ca-2ffa7133606mr35884541fa.22.1732349247035; Sat, 23 Nov 2024
 00:07:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122150037.1085800-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20241122150037.1085800-1-linux@rasmusvillemoes.dk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 23 Nov 2024 17:06:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS6aU4L+4JyDXzncMVsY+6XRYTD=RkhcXSUXTRh_WxWWw@mail.gmail.com>
Message-ID: <CAK7LNAS6aU4L+4JyDXzncMVsY+6XRYTD=RkhcXSUXTRh_WxWWw@mail.gmail.com>
Subject: Re: [PATCH v4] setlocalversion: work around "git describe" performance
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jeff King <peff@peff.net>, Sean Christopherson <seanjc@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 12:01=E2=80=AFAM Rasmus Villemoes
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
> Closes: https://lore.kernel.org/lkml/309549cafdcfe50c4fceac3263220cc3d8b1=
09b2.1730337435.git.jpoimboe@kernel.org/
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> v4:
>
> - Switch the logic to make use of the return values from try_tag,
>   instead of asking whether $count has been set.


No, please do not do this.

As I replied in v3, my plan is to set -e, because otherwise
the shell script is fragile.

With this version, -e will not work in try_tag()
because it is used in the if condition.


> +try_tag() {
> +       tag=3D"$1"
> +
> +       # Is $tag an annotated tag?
> +       [ "$(git cat-file -t "$tag" 2> /dev/null)" =3D tag ] || return 1
> +
> +       # Is it an ancestor of HEAD, and if so, how many commits are in $=
tag..HEAD?
> +       # shellcheck disable=3DSC2046 # word splitting is the point here
> +       set -- $(git rev-list --count --left-right "$tag"...HEAD 2> /dev/=
null)
> +
> +       # $1 is 0 if and only if $tag is an ancestor of HEAD. Use
> +       # string comparison, because $1 is empty if the 'git rev-list'
> +       # command somehow failed.
> +       [ "$1" =3D 0 ] || return 1
> +
> +       # $2 is the number of commits in the range $tag..HEAD, possibly 0=
.
> +       count=3D"$2"

Redundant double-quotes.



--
Best Regards
Masahiro Yamada

