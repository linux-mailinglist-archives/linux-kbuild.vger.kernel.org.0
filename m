Return-Path: <linux-kbuild+bounces-8315-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A6B1DB8F
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 18:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D750E565174
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 16:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EE726E17F;
	Thu,  7 Aug 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSSrT4+N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222571E766F;
	Thu,  7 Aug 2025 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754583764; cv=none; b=CoIKmnGxkS/mK6dDBlrpB7FlVQt0Dfj0yH57nyB4t3vFwWYPTf6hKOF4fRXNupvHaihfWdr8n1kK1WWHCTh/b5WzBdexGVsjIKbG4HSe0g2A5MHnhWOzcGnnqazvrREfGXbaZWamOAt9DHy65oZLG6rg08mrlq2puKt8G7JqXC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754583764; c=relaxed/simple;
	bh=sePTBshsVyA/U+dKkgUJmJ8cQsIoyj5xyZs0vl6/4+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfB0OipxypsZktbPeyao30Ys/lZZK4c0hQxTZ/NLJbfAqlTOkk6fM3oIdlnlQNk+uXtvrhCvbEHC2dahnKDlsF/kuTURmm8YdXVzafrkeEo2o5ibINGMpPufPgs7PiGSmtvnzo3xpsRzcSsPaiJ/fiNzGV2HdMKZK6xuLWo0kcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSSrT4+N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF25C4CEEB;
	Thu,  7 Aug 2025 16:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754583762;
	bh=sePTBshsVyA/U+dKkgUJmJ8cQsIoyj5xyZs0vl6/4+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSSrT4+N0x7+8IjmJc9HYBWYlQ0bOlMnc0or4HXUuy3fs+bqE+9cZuG8TxrT87yUh
	 qIDs6fGF3ZFRQ/Ao1v2YfhomRYsQ75Bdh5StJzj6K83N0XJ46HILmVhsECRJnEjate
	 Nwd9psEuYt9TfTO4/EwLU7JmTf+28IWoEf1AP3T+N52CboFK50NftjNcAuTF4goyyc
	 gg/TdIA/nOchwYAxu68qRYIUbdi6cA2G9r/6G5XDmRYsRPa9aeYYX4n8qDiJSEtTBL
	 mBhaZ4lTbllDPuDl6C4tUhj3Ekj3tQMU5wZruBz67A0MD+Xu3TkOLMYZtDza4lBMGz
	 g099rEW19krMw==
Date: Thu, 7 Aug 2025 09:22:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Haoran lee <470658536@qq.com>, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/mod/modpost: For CentOS 7/old binutils
 compatibility
Message-ID: <20250807162238.GB2145434@ax162>
References: <tencent_6FE857803A1AAB21B71853A2E89626ABA407@qq.com>
 <20250807-elastic-transparent-kingfisher-8f7ada@l-nschier-aarch64>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-elastic-transparent-kingfisher-8f7ada@l-nschier-aarch64>

On Thu, Aug 07, 2025 at 12:51:59PM +0200, Nicolas Schier wrote:
> On Tue, Jul 29, 2025 at 12:19:46AM +0800, Haoran lee wrote:
> > 
> > Signed-off-by: Haoran Lee <470658536@qq.com>
> > ---
> 
> Please note that empty commit descriptions will not be accepted.

Agreed, a clear description of the issue (including an error message)
and logic of the fix is needed.

> >  scripts/mod/modpost.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 5ca7c268294e..216647e2f301 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -30,6 +30,32 @@
> >  
> >  #define MODULE_NS_PREFIX "module:"
> >  
> > +/* CentOS 7 / old binutils compatibility */
> 
> Since v6.16-rc1 the minimum binutils version has been lifted to 
> binutils-2.30 [1].
> 
> [1]: https://git.kernel.org/torvalds/c/118c40b7b50340bf7ff7e0adee8e3
> 
> Which binutils version do you have at CentOS 7 ?

These values come from glibc's elf.h if I understand correctly, so I
think this is more about compatibility with versions of glibc that do
not have these relocations defined, rather than binutils.

It appears these were all added in glibc 2.18 over ten years ago [1],
whereas CentOS 7 appears to use glibc 2.17. There is some prior art to
adding elf.h constants to modpost.c when they are not defined by elf.h
but I am not sure if it is worth it in this case, as CentOS 7 has been
EOL for over a year at this point (and I suspect the binutils / GCC
version is already prohibitive for working on mainline).

If we do want to add these relocation defines, I think they should be
added in order of their numerical value. I do not have a strong opinion
either way.

[1]: https://sourceware.org/git/?p=glibc.git;a=commit;h=08cbd996d33114ca50644d060fbe3a08260430fb

Cheers,
Nathan

