Return-Path: <linux-kbuild+bounces-8672-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9948B3CF03
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Aug 2025 21:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BB0517755B
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Aug 2025 19:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986472DCBF3;
	Sat, 30 Aug 2025 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dk56bp5O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F4A201266;
	Sat, 30 Aug 2025 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756581993; cv=none; b=Nk92WI3ksDGde/TvWZJVNw9LuxaAB6JV+xsWL+I8+/rnXqLLORtPyvoQpzQwxRtkgfrvu8hQ+BTA8a8saek/V8zfIOhueUpLQS7TMHbBnw7GDNaK8E8t2ErF7BiqJQebTGFtLTv8njnQF4t4JnOWpnEJufIeHxHwShRREOLeWKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756581993; c=relaxed/simple;
	bh=EFzZ/dRswnSMMyqhrChBf68AnBA7vwYE05vr7IlPs4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXmlZNAu6ZOUEWXll1DK4uDUuw5o/JJvOl2/yYkAAWjey7F1buLgTvjtm0833igfIhfC1wtxS+aprZ+eL8arULaOXvKlgPBnhwHTsnrn223W8ZGnGTmEqaZiLHTv68ZskFAc+JIJpiXRXO29TQwqYCmHWoR8vUarAsogrk5tdRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dk56bp5O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95053C4CEEB;
	Sat, 30 Aug 2025 19:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756581992;
	bh=EFzZ/dRswnSMMyqhrChBf68AnBA7vwYE05vr7IlPs4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dk56bp5OvrPV6ylIV3PBEDXzYUNWWy7DqgEv4CG7Z6kTGFtQonp+pxf8roItsuzKx
	 xUtYwrRRH8iRLM3VY0eCwMaWxjtwDAYpnMp7MRuX8ShoCOq3MbnnhTJ7m3y6UuEi70
	 4MXJbRRrsQIzWYv+WKJvprv/nmU5OubQj0dJ25Cqk8p1vWnLTHU5TlwHXIsdWeAyOo
	 3dxovkrwfPr7O4ZJigPKlN39JgWV5R+u5UpRli/6SEWr0RPtYiV9XebXgs8A/c/ZVz
	 r1tYoxpU1eOUSM9BF3W4SviXEj1ZPodWnjNXCiLA5Dep700Oi6IuSvjIdkg0dE6y22
	 bms8kh3nAQhHQ==
Date: Sat, 30 Aug 2025 21:25:10 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Brendan Jackman <jackmanb@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] .gitignore: ignore temporary files from 'bear'
Message-ID: <aLNQFmgS2IcDbPmd@levanger>
References: <20250827-master-v1-1-19f9f367219c@google.com>
 <20250829233824.GB1983886@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829233824.GB1983886@ax162>

On Fri, Aug 29, 2025 at 04:38:24PM -0700, Nathan Chancellor wrote:
> Hi Brendan,
> 
> On Wed, Aug 27, 2025 at 08:59:43AM +0000, Brendan Jackman wrote:
> > Bear [0] is a tool for generating compile_commands.json. For Kbuild,
> > Bear is not useful, since Kbuild already generates the necessary info
> > and that can be converted to compile_commands.json by
> > gen_compile_commads.py.
> > 
> > However, for code in tools/, it's handy. For example, this command
> > updates compile_commands.json so that clangd code navigation will also
> > work for the VMA unit tests:
> > 
> > 	bear --append -- make -C tools/testing/vma -j
> > 
> > Bear generates some temporary files. These are usually deleted again
> > but having them show up ephemerally confuses tools that trigger
> > recompilation on source code changes. Ignore them in Git so that these
> > tools can tell they aren't source code.
> > 
> > [0]: https://github.com/rizsotto/Bear
> > 
> > Signed-off-by: Brendan Jackman <jackmanb@google.com>
> 
> We can likely take this via the Kbuild tree. I do wonder if this would
> be better in a tools/.gitignore file since bear is really only of use
> there but I am not sure it matters much.

yeah, please consider using tools/.gitignore.  Please have a look at
this thread about ignoring files from "external" tools:

https://lore.kernel.org/lkml/CAHk-=wiJHMje8cpiTajqrLrM23wZK0SWetuK1Bd67c0OGM_BzQ@mail.gmail.com/

If using tools/.gitignore is not possible, I think the best way for
ignoring files that are not natively related to kernel build tools is to 
update the local ~/.config/git/ignore, as suggested in

https://lore.kernel.org/lkml/CAK7LNAQas0cK7pgi72tYC3yU=ZkQxnr41YYW1mXd-sWiHtG+UA@mail.gmail.com/

compare to:

https://docs.github.com/en/get-started/git-basics/ignoring-files#configuring-ignored-files-for-all-repositories-on-your-computer

Kind regards,
Nicolas

