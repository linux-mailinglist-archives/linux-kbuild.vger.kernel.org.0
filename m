Return-Path: <linux-kbuild+bounces-7349-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FCCACBA0B
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 19:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AEFF3BEC20
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 17:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750421DF25C;
	Mon,  2 Jun 2025 17:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sGFEkQHw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B71E6ADD;
	Mon,  2 Jun 2025 17:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748884172; cv=none; b=GMR+1QMTgVEi4h3Dw88QYB3mlpv2MWElIE0xWlE+lVKbayfkjYBaE9lIAM6I3tbZI53g0Dc8tOeC40ywQuzXxI9V77m4aMX/X62SF0h6fz868wi/uWfDvzEa+K2DAQdU/AjSQGsps0gc5XuCdIig5CtjYpY2NA/KcOfi+Iwy9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748884172; c=relaxed/simple;
	bh=n4G8cLLjdWhr4e4qI7+x9BnZNiru6KmV1+k7R3AAlMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/PIPnXmBPJh+crQ0vVEJ+o1UHqu4jhxvP2fXi5H9w5HDNCUwn2dlZL3abniC/PwZhJ1OL9SM8IIDOR6MDHu/Cd70b7UKINJJdcSgSOYft/Ss2zNGU1thB7sjapBrOG4kzPuk0S2e762Bt7bbozA0hlPDrDw1aYOJNt5YVb0tV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sGFEkQHw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B733C4CEEB;
	Mon,  2 Jun 2025 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748884171;
	bh=n4G8cLLjdWhr4e4qI7+x9BnZNiru6KmV1+k7R3AAlMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGFEkQHwV8owV5qQ0ZL4r7AOXme9L9olE8N51lKUsDwih6NcEBm3YPjsXixSCjtYD
	 fGGJ2CUxdr1MLrpKxpoxKGCqbDKyFPihK7bDzObIt6SAArwO5MrokbZNfjeeBVfue5
	 wsphzUrvkMdwFPs9mQ4herj48IneGuNzq0CwLjM7/1N9lXSmfmRyBDTC0+FaNBkzgz
	 IEJNPtf5B/zBGWrYv6JViXNW+6Di4M4EZARhXE/rku8tCLahTJtszyisnmHB6BJpWe
	 olcGrozb8/oPAilRRf+EmxkZYgIk6GeVOpBEbQS09Cg6qEzVzkycbgBYf2r/YC7i2w
	 iaUHghQuS9Abw==
Date: Mon, 2 Jun 2025 19:09:25 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
Message-ID: <aD3axclxzkOAA-Sf@example.org>
References: <cover.1748335606.git.legion@kernel.org>
 <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARkhc40UfrmmqsqmqkCn60=7zHc=pDFGR4o=k2p7CsABA@mail.gmail.com>
 <aD1bozP0l67f_wbs@example.org>
 <CAK7LNAQmQtvB4PfmH4MkRM123wySON6cF6TG79fi0WER1sz4Gw@mail.gmail.com>
 <aD2vSnZhofEPilcL@example.org>
 <CAK7LNATfUzCXmCb5kKOJOKOw=CJvk7viGgYtrGLwbSAkq7VtyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATfUzCXmCb5kKOJOKOw=CJvk7viGgYtrGLwbSAkq7VtyA@mail.gmail.com>

On Tue, Jun 03, 2025 at 01:18:25AM +0900, Masahiro Yamada wrote:
> On Mon, Jun 2, 2025 at 11:04 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > On Mon, Jun 02, 2025 at 07:58:41PM +0900, Masahiro Yamada wrote:
> > > On Mon, Jun 2, 2025 at 5:07 PM Alexey Gladkov <legion@kernel.org> wrote:
> > > >
> > > > On Mon, Jun 02, 2025 at 04:45:36PM +0900, Masahiro Yamada wrote:
> > > > > On Tue, May 27, 2025 at 6:08 PM Alexey Gladkov <legion@kernel.org> wrote:
> > > > > >
> > > > > > In order to avoid symbol conflicts if they appear in the same binary, a
> > > > > > more unique alias identifier can be generated.
> > > > >
> > > > > Why must this be unique?
> > > > >
> > > > > What problem would happen if the same symbol names
> > > > > appear in MODULE_DEVICE_TABLE()?
> > > >
> > > > Before these patches this was not a problem as non-unique characters are
> > > > in separate object files when the module is compiled separately.
> > > >
> > > > But when the modules are compiled into the kernel, there is a symbol
> > > > conflict when linking vmlinuz. We have modules that export multiple device
> > > > tables from different object files.
> > >
> > > This is because the __mod_device_table__* symbols are global, but
> > > I suspect they do not need to be.
> > >
> > > Let's test this
> > > https://lore.kernel.org/lkml/20250602105539.392362-1-masahiroy@kernel.org/T/#u
> >
> > I tested this patch with the config:
> >
> > make allmodconfig
> > make mod2yesconfig
> >
> > and it works.
> 
> Good.
> Then, __COUNTER__ is unnecessary.

I will send a new version asap. Thanks!

-- 
Rgrds, legion


