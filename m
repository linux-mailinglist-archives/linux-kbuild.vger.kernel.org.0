Return-Path: <linux-kbuild+bounces-7353-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACFACBB30
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 20:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 298EA3A8D7E
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 18:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B5A221F3E;
	Mon,  2 Jun 2025 18:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/6TaT1W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112BF9478;
	Mon,  2 Jun 2025 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748889887; cv=none; b=fNsRIFjKz2IqEhm29GTIrBmxbHD08E2dF5FvHHr1DCql3Lb0E+zWom++JC7sL8RBYiNCtaV5BIx7HkvcL8ZmGQGW1UzX6f/Co66I58zaU2DKe+qKbG055KpXBYp3zM+w4CTPwuYxqRkvIjy9tJBzZQkktQykWseQRqcDpRWHgCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748889887; c=relaxed/simple;
	bh=tgt6I9DSOmblyV+VhXIdkDPXTQP0Z7ihBQ5Q4BYf8Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U80xdSXDgPf/Jz3sAONoaET0+r5OD3mWaG79G76DwhLxZe+pgGLlMIoto9b6tzd6bhpmz7fHMdplBzyuqMLJ8J+UGGd2dZ1ydySj5AAQkLMpio6duq1ke3LVuw3WmZNkJ98b6R368bZytysj7IILyBt+9JGxhKWf5VIFxH442+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/6TaT1W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64687C4CEEB;
	Mon,  2 Jun 2025 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748889885;
	bh=tgt6I9DSOmblyV+VhXIdkDPXTQP0Z7ihBQ5Q4BYf8Rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/6TaT1WsCnKWWkSaK/FEEmtO3036TYUkDQs7ZZS5URVraWiEd33rS0+58bnPlOvC
	 ypEcKQq5r3hR84Lf2VZaMqOYvgZj/wirlLz7GHZP8T+J3AFzukPWPFKQ8gfgoqpaaV
	 I469HozmYlDBpLMI+ClyS+twQZoBjfThBzq5XmT+MCOEPGShCt5zsyze6P84JfCbqi
	 IyhOQCQxwbHXEyp7dOkSkLjUQp0t1X2d+fo5/pNnuwRQ622o8tZHdgs2OHf08wQqLq
	 VmhLDt75Ab5ZR2f+qPPsjfdyI6h/+SBFYIspn9XGoQs4jTghbl0p+VLY1hdhTnXr0h
	 Rw14uNLL6ws/Q==
Date: Mon, 2 Jun 2025 20:44:39 +0200
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
Message-ID: <aD3xFzKQbxaIo60a@example.org>
References: <cover.1748335606.git.legion@kernel.org>
 <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARm1+L0CrE8TYrFaipfOX4pjEJ7Uz7dn=3g+26PER6jNg@mail.gmail.com>
 <aD1f0CZfbsMR61OX@example.org>
 <CAK7LNATt+=k3sYU4FWM22aJzzH_a7_1FkO5S=LW7L-Z7K4CQhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATt+=k3sYU4FWM22aJzzH_a7_1FkO5S=LW7L-Z7K4CQhQ@mail.gmail.com>

On Tue, Jun 03, 2025 at 03:00:07AM +0900, Masahiro Yamada wrote:
> On Mon, Jun 2, 2025 at 5:24 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > On Mon, Jun 02, 2025 at 04:52:36PM +0900, Masahiro Yamada wrote:
> > > On Tue, May 27, 2025 at 6:08 PM Alexey Gladkov <legion@kernel.org> wrote:
> > > >
> > > > In order to avoid symbol conflicts if they appear in the same binary, a
> > > > more unique alias identifier can be generated.
> > > >
> > > > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > > > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > ---
> > > >  include/linux/module.h   | 14 ++++++++++++--
> > > >  scripts/mod/file2alias.c | 18 ++++++++++++++----
> > > >  2 files changed, 26 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/include/linux/module.h b/include/linux/module.h
> > > > index 88048561360f..e7506684069d 100644
> > > > --- a/include/linux/module.h
> > > > +++ b/include/linux/module.h
> > > > @@ -249,10 +249,20 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
> > > >  /* What your module does. */
> > > >  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
> > > >
> > > > +/* Format: __mod_device_table__<counter>__kmod_<modname>__<type>__<name> */
> > >
> > > This format relies on module-name mangling, but
> > > I hope we will be able to stop doing it some day.
> >
> > I didn't like this approach either when I found out how it was
> > implemented.
> 
> Yeah, I dislike it.
> 
> I hope we can stop this historical mistake:
> https://lore.kernel.org/lkml/20250602130609.402581-1-masahiroy@kernel.org/
> 
> Once we stop doing that, __KBUILD_MODNAME will not match to KBUILD_MODNAME.

Do I understand you correctly that I cannot use __KBUILD_MODNAME now ?

> Also, you need to be careful about the rust side, as
> you did not take care of it.
> 
> https://github.com/torvalds/linux/blob/v6.15/rust/kernel/device_id.rs#L157

Oh. This will make it much more complicated because I don't know rust
well. :(

I found a few more issues with modules when they compile as part of the
kernel, but was hoping to fix them after these patches.

-- 
Rgrds, legion


