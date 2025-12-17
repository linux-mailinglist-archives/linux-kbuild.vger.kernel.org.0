Return-Path: <linux-kbuild+bounces-10135-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0951ACC7275
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 11:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8409E304ADFF
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 10:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BB233984A;
	Wed, 17 Dec 2025 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSmt44J7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F9E338922;
	Wed, 17 Dec 2025 10:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765968323; cv=none; b=uZrpw70VaHeJXTbrJgdM64GH+zEVaJzIXBwUvrmKEzRRON4uhFIpnINtwQjr/wvhvIa3IkG00Om2OijEOedOS8svcWmxCjZ2jvQbG6M1wodovFq+54eHpcLZH8feMBj2t/fLo22j73D2br8lqpjhgdDaYzbp+kCSJfnl8antKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765968323; c=relaxed/simple;
	bh=WGo1Bl2te0veyldI4o0qzBIM8KLAmQ7vmushOGCl/+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5PUT8B4IJhIU42JmMBFsIu8IQmIdvTgzGix6kk6Evuc58qb9+ne0D1Lz1C9SrzwGoS5ArKrE767p883PdUJfwohm+E+ODVcZJ+WVawzFFBsn5U1zIPWN+zwWgl5G76mYJ56LgpsAFhciDI2onboizZTyNUfnEcw51EIN/Kapcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSmt44J7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C516C4CEF5;
	Wed, 17 Dec 2025 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765968322;
	bh=WGo1Bl2te0veyldI4o0qzBIM8KLAmQ7vmushOGCl/+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSmt44J7mdgZcU4z1yzYR8/hCeJn77fjYZZQayAcp/K3j63PhFORj8u7WLZTO3rXM
	 LORQ6hSdbUibz3rRh4Kd8s96YdveIBmCYGCUaRYx1qsxl7MOqObEG4VD1tVc5WiR3a
	 u6h16myi9vx8Ufu60zF+yY6SfFlbhxILEC1rrTKm4vRDixEHpyy793ZgwJwVqZIBjS
	 lHAt6syXse8VsCNUdETNsX2yTTI00u8Y5/zClNhBF03hEOr6IMejKfbXfBfP2DQWmG
	 cQRLf7ipBZxoJrfUMVUrsySFKiNzJsZ/nB/7VUjEYdOLFQAxmHMNojYWMviBV0WwRd
	 Dvo0WIRY+ZSVA==
Date: Wed, 17 Dec 2025 19:45:17 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Nicolas Schier <nsc@kernel.org>, patso@likewhatevs.io,
	Justin Stitt <justinstitt@google.com>, eddyz87@gmail.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [GIT PULL] kbuild changes for v6.19
Message-ID: <20251217104517.GA3546346@ax162>
References: <aS22QhwdrHN24ToD@levanger>
 <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>
 <20251217083202.GA2118121@ax162>
 <CACT4Y+bsiPfmL-yV99mLCA4n7ukYwS-6E7kTcLg1EOxOQ_cZjg@mail.gmail.com>
 <CACT4Y+aFSLS95qtpWQ0UjVU3wZ+svi2igLh_SoOqQec_Zwg7Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+aFSLS95qtpWQ0UjVU3wZ+svi2igLh_SoOqQec_Zwg7Mw@mail.gmail.com>

On Wed, Dec 17, 2025 at 11:16:37AM +0100, Dmitry Vyukov wrote:
> Yikes! I am trying to workaround this, but this is PITA.
> Entries are not in order, + there are now multiple entries for the
> same source file (yes, files include themselves). This is plain
> broken, and hard to workaround. Even if I find the entry that is
> correct, I can't really tell about it to a clang tool since it accepts
> just the source file name, and there are multiple entries for the same
> file name.
> 
> Does anybody see a reasonable way to undo what this commit is doing?

Does

  $ git revert 9362d34acf91a706c543d919ade3e651b9bd2d6f

not work for you? It is a clean revert for me.

> Thinking about this: I think included source files should be treated
> as include files by anything, rather than added to the database. They
> _are_ include files, and systems should handle include files already.

The commit message of 9362d34acf91 mentions that clangd does not work
properly with the files that are included in kernel/sched/build_policy.c
(such as kernel/sched/ext.c) because there are no entries for them in
compile_commmands.json (so it does not know how to build them), which is
what 9362d34acf91 was trying to fix. I don't use clangd or
compile_commands.json, so I can't say if there is a way for the tool
itself to fix this. Again, unless Pat can come up with some way to work
around this (which I do not personally see at this point), I think we
would be better off just reverting 9362d34acf91 outright and calling the
situation of including .c files within other .c files broken for
compile_commands.json and returning to the status quo from 6.18 and
earlier.

Cheers,
Nathan

