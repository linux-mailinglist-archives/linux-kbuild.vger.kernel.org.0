Return-Path: <linux-kbuild+bounces-9238-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7BFBF8ED9
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 23:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F5A6406EB0
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 21:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF65285418;
	Tue, 21 Oct 2025 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffTyfdad"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476527BF7C;
	Tue, 21 Oct 2025 21:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761081692; cv=none; b=azC7h5nlgc1WEF7HwmIAESwG/pcsL6a8nglba4ThOwo6C1/xLgzNfFb8EcGIF71KVDGtJ2Zy+JhbdCYmV07laZrPyOCcEUxAR4XrnR2FERAKccZbc7qSJds1QTjjH689E6EHehWoYhJLX2yoLE9mEjk/xp3QRcJPNzTyrecvqTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761081692; c=relaxed/simple;
	bh=qlFUOSDCpv5Vk45f8TeWwUOHvvUhZJo7QoIYDia+ISE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmtkGGga/vo30/+CTrlhEpBounSTFSAwXJI5mP/D+hv3UVoFgXnsN/TcNlpZUEtZBLc8Gld4G4g2NUnKnoeYMW34nBU7cgPVh/7po7AoQPpK7Yxdh1R+La2RSO8RTi2LyQkS41hcE7eiC9ivGVIpdJthAZXMrZzChqSHiOy04VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffTyfdad; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08174C4CEF1;
	Tue, 21 Oct 2025 21:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761081692;
	bh=qlFUOSDCpv5Vk45f8TeWwUOHvvUhZJo7QoIYDia+ISE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffTyfdadAlq85eK0DEDZfwxO9AXJ771s11UzEGvWpmmzUshBCZb4wTOZP4X2Pde33
	 /iNe2nz5KxG4j/q79qcLH0Ab7V3NLZbXqczUyuvrNgbtRNUMNC87+GqVe1QmDITpfj
	 uBKXKGsjkDdwyvzUFx2YnSafFmAzzDDvT2WugjRzb6Pcw1dKGAJrsf7JDKrEe41uxg
	 aYRumPgimTeOc6+ImUlmtpnR+9ce4npH+64JIAy/Qjs9T/oTSFjMB3PnDZoZg4Ctbh
	 U5MX0ZiHOAfCH6MsVfW/ljJuarAeYNe0Sk/GbEkUjn2JZZhYVlsCCJ4xABp24NlNV7
	 khwcrXbHTrw5Q==
Date: Tue, 21 Oct 2025 23:21:17 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v9 2/4] tracing: Add a tracepoint verification check at
 build time
Message-ID: <aPf5TVismRLkQQOE@levanger>
References: <20251015203842.618059565@kernel.org>
 <20251015203924.391455037@kernel.org>
 <aPKj2Ilnq7F0xLFx@levanger>
 <20251021154737.77377790@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021154737.77377790@gandalf.local.home>

On Tue, Oct 21, 2025 at 03:47:37PM -0400, Steven Rostedt wrote:
> On Fri, 17 Oct 2025 22:15:20 +0200
> Nicolas Schier <nsc@kernel.org> wrote:
> 
> > > +# To check for unused tracepoints (tracepoints that are defined but never
> > > +# called), run with:
> > > +#
> > > +# make UT=1
> > > +#
> > > +# Each unused tracepoints can take up to 5KB of memory in the running kernel.
> > > +# It is best to remove any that are not used.
> > > +
> > > +ifeq ("$(origin UT)", "command line")
> > > +  WARN_ON_UNUSED_TRACEPOINTS := $(UT)
> > > +endif
> > > +
> > > +export WARN_ON_UNUSED_TRACEPOINTS  
> > 
> > Is there a special reason why you chose to introduce a new command-line
> > variable instead of extending KBUILD_EXTRA_WARN / W ?
> 
> Honestly, I didn't think about using KBUILD_EXTRA_WARN. I also want this
> option to go away after we remove the current unused tracepoints so that
> any new ones will always cause a warning.
> 
> The only reason not to make it always warn is because I don't want to add
> warnings for the existing code. I'm working on having outreachy projects to
> remove the currently unused tracepoints. Once that is done, then this
> option is going to go away and the build will always warn on unused
> tracepoints.
> 
> I thought it might be easier to remove it without any issues if it's a new
> command line that goes away in the future.
> 
> Looking at EXTRA_WARN, it appears to be for basic issues with the code and
> adds new C compiler warning flags. This isn't exactly the same.
> 
> If you think it makes sense to extend EXTRA_WARN, I can still go ahead and
> do that.

thanks for clarification!  For completeness: KBUILD_EXTRA_WARN is also
used for non-C related checks (cp. scripts/misc-check).
I somehow missed that UT= shall exist temporarily only - if this is
still the plan, I don't see a strong reason to put to much work into
integration in KBUILD_EXTRA_WARN.

Kind regards
Nicolas

