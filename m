Return-Path: <linux-kbuild+bounces-4709-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE95C9D1BC8
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 00:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 318CD283034
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 23:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310EB194A53;
	Mon, 18 Nov 2024 23:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWVhzMyU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08542147C71;
	Mon, 18 Nov 2024 23:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731972020; cv=none; b=MfE8JRUrFObTVwJmBWqMtbfhp/pYloNzUzI8+nHb57pgFI8iJX0sWq4wrVtvpQI3rVFkx2Z+VZALo/NbTYuFo6l4BQvpj/DJl/QjnBtvwyIbz8Vr8FgPAZKoEwcAi1UTeAk4hYTEqBfSUV/0duCPHJWPRM+F8LVSyoVy/f8IIsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731972020; c=relaxed/simple;
	bh=BaVw3kfXsoiSkf74HWaBs6gPJl6E8QZFBql0KydVi50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/IdDQpUG9mkxAhysaafDfFHi3GUo/IuS2tj/R1i7lJANuFrS9eEE1QSOwjjhvtVCqIC/KGUiEoO2R0aj4IQiO2eWHI0BgXdsIHrQXVGnkikRFy52p5bC9Z0jjT+3+UUBYJkgdZLS1reh+tkwdy46lHcOU7Y/Aoof1xnGbq4LCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWVhzMyU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8DCC4CED7;
	Mon, 18 Nov 2024 23:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731972019;
	bh=BaVw3kfXsoiSkf74HWaBs6gPJl6E8QZFBql0KydVi50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fWVhzMyUDG9AqnkmCFYJLXAsQWCx4bZfg+T9FvpDERz+zkhCqa0SHzMrxUTOONGSR
	 UP1jexdQqU2F1M1JVGgDOUi1m4H3fcOjLK+iABaln76ocTuFDsrlwC6wXUMD5eVc5S
	 E4drNKBf6ozXI6N8ZM9MtoeBkWjtmj0fJ2Rx79Gcsn6lnDOgqNTMvuKN2pDXH6KCxv
	 YXRqxhbAFoFvVMDy+Blr0+EUo2wMRxmjG1IpRBr//WoF8yrhDd14vVfVuBO+4LWA0o
	 39nKrWdLjfsgbRE8466fkK5oXeRae9PNZLuA6ArB4BYRlSlcW7a0/PKwTrx6+BIdoM
	 BDFU8ttgGM1bg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53b34ed38easo362920e87.0;
        Mon, 18 Nov 2024 15:20:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtyEkdZyIxY2f9EsPuWf0yeodcgrLocE+h2G39iyp6LOmGSAZ8PtJRyV1keXJdUzbeVx8J6KF03GhidN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVAr0ukIJWPQaacm4CR61cf6MmS80hosBwn4+LJZo09jAF5+ll
	HIWG1zf3JirvSfqR49qah91AWxcYXwqEbvHDC0V0K0SBuCDB/kHFMuJ5cGzkjNdO21ZKZ2eXmmW
	plDHiLQXE+WrTBDnVRHWY2UHGwBM=
X-Google-Smtp-Source: AGHT+IG1fK7n0D0KSLQsBdJJ6+sYaXGVDS1vE2YI3gBWfE7pJTFggdp3rMlVZrE1iN2TN/x7DCTEy0VCpIkzXFhERF0=
X-Received: by 2002:a05:6512:2389:b0:53b:1625:bcf8 with SMTP id
 2adb3069b0e04-53dab2a71bcmr5925262e87.30.1731972018044; Mon, 18 Nov 2024
 15:20:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118110154.3711777-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20241118110154.3711777-1-linux@rasmusvillemoes.dk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 19 Nov 2024 08:19:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNATvMOR3qcp+-6koxnKkvMDRVHYJ0E0hyUaWLeV3-c0eBA@mail.gmail.com>
Message-ID: <CAK7LNATvMOR3qcp+-6koxnKkvMDRVHYJ0E0hyUaWLeV3-c0eBA@mail.gmail.com>
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
>
> - Update trailer tag list, per Masahiro.
> - Drop redundant quoutes around the word tag
> - Add a shellcheck disable directive
>
> Masahiro, I decided to keep the changes minimal, in particular not to
> change anything around the logic or the (unused) return values, in
> order not to invalidate Josh' T-b tag. I think it's more important for
> this to make it to 6.13-rc1 (if that is even still possible, given
> that the MW is already open).


This is not urgent because it has been broken more than one year.

Your "|| return 1" may not live long.
https://lore.kernel.org/linux-kbuild/20241118231534.1351938-1-masahiroy@ker=
nel.org/T/#u


If you write try_tag() like you wrote, my patch can become even simpler.




> +
> +       # $2 is the number of commits in the range $tag..HEAD, possibly 0=
.
> +       count=3D"$2"

count=3D$2

is enough because double-quotes are not required on the RHS
of an assignment.




> -       # If we are at the tagged commit, we ignore it because the versio=
n is
> -       # well-defined.
> -       if [ "${tag}" !=3D "${desc}" ]; then
> +       # If we are at the tagged commit, we ignore it because the
> +       # version is well-defined. If none of the attempted tags exist
> +       # or were usable, $count is still empty.
> +       if [ -z "${count}" ] || [ "${count}" -gt 0 ]; then

Is this code equivalent to the following?

         if [ "${count}" !=3D 0 ]; then




--=20
Best Regards
Masahiro Yamada

