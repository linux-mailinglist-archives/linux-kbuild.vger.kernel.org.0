Return-Path: <linux-kbuild+bounces-7575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2971DAE0B55
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 18:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDE2A165901
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 16:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0B028B7E2;
	Thu, 19 Jun 2025 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuGVlmFY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA87422B590;
	Thu, 19 Jun 2025 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750350372; cv=none; b=kh3Oac4BYkuLDc7rLCycTJTe1lyUE8KtWHytQW88gfwP+3iS46ie+gQ9nky1Bp40/NNHt/2mnTGDQD5dbjvYNEhH2dfMHddWiJLs7gOzzHhZCkbdv7NynVXfv2XiOIJoXFalzD+yl4xd7cwU44a0lHfdqF1X+xvhW1BNhyH4s6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750350372; c=relaxed/simple;
	bh=2JYAwQJ/PUM7koPPsRke3N147Ydx6y3F32T6RAk7wCk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxJpNClij/Jl9mmXH8oMy+YrApn5XyNJftgb3QVoZzeF0HiT80KCRvg3h2UYFpQqWAq37XVKvB4UAxiMswedh35/T3UIPTiqpoo0rRWuxx1Nx4TnPaVOKWVrw9Q8uxEjbKaKqH+iA8XO724n8yb1Qs/x/H/3/blfhQ7esAK3a2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuGVlmFY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B395C4CEEA;
	Thu, 19 Jun 2025 16:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750350372;
	bh=2JYAwQJ/PUM7koPPsRke3N147Ydx6y3F32T6RAk7wCk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KuGVlmFYIsCWk+GsIywyvOue/tP7dNTlJRowkkyL6sXVmdoYiaSXDKnOJIvG4Bs3e
	 JKWrqJwa7/hwSxLJVs/wdL0As8OnCk4zqiiH4ZHoQb2aeUarnUuQSfKE5KwXGLMA6M
	 H3wM0nuzhOidccq+9BufPs6NPe257kOFTDuibXVEsYm2LMukGJ+SzuTn64Il8RbXki
	 +qlvlwstbE/AhzhuWR4ndao6HNmd02foRqcBCgbsYlbaBYpGXYpeY5bqKd9X2bKQc5
	 +UMVg76yhUrwKlIMsXKI6Q+9AoluV5Zm86XFgbKvOPyq8p3OCIr0Gqk+6zaiI+APU9
	 nA2n5bc6Fp96w==
Date: Thu, 19 Jun 2025 09:26:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, torvalds@linux-foundation.org
Subject: Re: [PATCH v2 3/4] scripts/misc-check: check missing #include
 <linux/export.h> when W=1
Message-ID: <20250619092611.07d2feb8@kernel.org>
In-Reply-To: <CAK7LNARJdVRcUCKo2zEfJr_0Dc-1fzkjf01OsDpDQLH2+wZHCg@mail.gmail.com>
References: <20250601133230.4085512-1-masahiroy@kernel.org>
	<20250601133230.4085512-3-masahiroy@kernel.org>
	<20250619090100.39e37c5a@kernel.org>
	<CAK7LNARJdVRcUCKo2zEfJr_0Dc-1fzkjf01OsDpDQLH2+wZHCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 01:13:28 +0900 Masahiro Yamada wrote:
> > IIUC you made the kernel spew nearly 5000 warnings on every W=1 build
> > to "encourage" others to help fix a fairly innocuous problem.
> > I appreciate the work that goes into separating the headers but it's
> > hardly urgent enough to force others to scroll thru 5k warnings.
> >
> > Please LMK if I'm missing some context here, otherwise I think this is
> > quite antisocial behavior, and the warnings should go back to W=2 until
> > someone actually cares to fix most of them.
> >
> > Happy to hear from others.. CC: workflows  
> 
> Please see commit a6a7946bd691940cfe7289ae6dfb1f077516df72

Thank you.

