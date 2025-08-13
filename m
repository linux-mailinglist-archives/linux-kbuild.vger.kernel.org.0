Return-Path: <linux-kbuild+bounces-8419-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 681B7B24030
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 07:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18881B6712E
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 05:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D7D2BE644;
	Wed, 13 Aug 2025 05:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KwF4uX8X";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="baOC6SEs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDDA2690D9;
	Wed, 13 Aug 2025 05:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755062965; cv=none; b=SSjBDPDKZJFtZWKsQXpPaSySiCUxRdAAQb68qI3L9m9JhmhJBeKcxNJ9LDBoROmBzXWijo4lrBhbWbb+itTCATQk55TpI37oYsYivZ7c4ockBsgFd4supfg5MFNYt1RjPB3dZaIZz7sL/TqEo2dCOX0u5ZOpp50n7pMY4X4iUBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755062965; c=relaxed/simple;
	bh=TIuUmolt7WOk1L1lU2W33P/4x4d+TTD+Yst8bd1sAfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAZ+UJCxnD2SiPKYjHSTfZJbhSCzhqe8QJs/mCkCL9OYeay1GH/+Lgrkko67r8pXqEGDByRDbO/cyrxZbZaXnulSPF91m4oVf1TMjCN/GszdiL0xjMG1rPZjb9ZZVgDJwLUwqMIkks8GdYCv5+ZPumBsbn9jpIwIMyVshY+gzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KwF4uX8X; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=baOC6SEs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 13 Aug 2025 07:29:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755062961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIVBEpNr1x1eligfQijwGYu/XCV1uBU/bWvnD9UKsIU=;
	b=KwF4uX8XM+J+Oed4t+n6FCP3sUng4vi0VKUBi+wvhE//8Qs1VpR509JlqA5/brxQ0OpJms
	3Bw4pBQH1sPRibEIsQrkMMXtiq37+9fwXjUqVGJlCsLyLhA3+0H7UB/AXsIlUH2icw2xCD
	UhsnUxuhaEyCWtjLi8F1OqzX3GgG9E9qhl9Kw//F3Unkkss2zxTX4E6EJnH7z/Gn/args4
	UiaKeqny8uqnn9NYW9JQy/RvIpiKb/6Z8nhAXEuKTSoBHcDCsORCDoE19LMhWqHVI0lz+G
	R1gE4p+6FljLSByz903xisuma4O3v4838O4d7jAcnfv4s/hwW6CelyFpk1d2Tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755062961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIVBEpNr1x1eligfQijwGYu/XCV1uBU/bWvnD9UKsIU=;
	b=baOC6SEs/vHlCkQ3HmjJN/gvmu59Xg0Rps1sRG2qjgP/vdbD0FE1zyhDNbIz+k9qTrmT7d
	U578h941UV9iidAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] kbuild: uapi: only update hdrtest output on success
Message-ID: <20250813072751-ed791f27-41c5-4be7-9a57-cb79301da763@linutronix.de>
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
 <20250812-kbuild-hdrtest-fixes-v1-2-7ad2af66cd58@linutronix.de>
 <CAK7LNARdhx+L6VeN2Q-gykcoWMY0MtoiNyhpY+Q9v_3tYA6o-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARdhx+L6VeN2Q-gykcoWMY0MtoiNyhpY+Q9v_3tYA6o-w@mail.gmail.com>

On Wed, Aug 13, 2025 at 09:29:31AM +0900, Masahiro Yamada wrote:
> On Tue, Aug 12, 2025 at 2:33 PM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > If a header test fails, the output should not be updated.
> > Otherwise the next make invocation will not rerun the test.
> >
> > Also headers_check.pl should only run if the syntax check invocation
> > before succeeded.
> >
> > Add explicit sequencening.
> 
> Did you test this?

At least I thought so.

> See scripts/Kbuild.include line 153
> 
> The macro 'cmd' has "set -e".
> 
> Any single error in a series of commands
> bails out.

Indeed, this patch is pointless. I will drop it.

Thanks!

> >
> > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  usr/include/Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/usr/include/Makefile b/usr/include/Makefile
> > index c7f164952b33acf6c7b8eb7ce91cd192bfc39ad2..6868d183f36d532cd3d4023b936c67b8a58a9ba5 100644
> > --- a/usr/include/Makefile
> > +++ b/usr/include/Makefile
> > @@ -81,8 +81,8 @@ always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/
> >  quiet_cmd_hdrtest = HDRTEST $<
> >        cmd_hdrtest = \
> >                 $(CC) $(c_flags) -fsyntax-only -x c /dev/null \
> > -                       $(if $(filter-out $(no-header-test), $*.h), -include $< -include $<); \
> > -               $(PERL) $(src)/headers_check.pl $(obj) $<; \
> > +                       $(if $(filter-out $(no-header-test), $*.h), -include $< -include $<) && \
> > +               $(PERL) $(src)/headers_check.pl $(obj) $< && \
> >                 touch $@
> >
> >  $(obj)/%.hdrtest: $(obj)/%.h $(src)/headers_check.pl FORCE

