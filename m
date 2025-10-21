Return-Path: <linux-kbuild+bounces-9235-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBCBF84EA
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 21:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DE761893900
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 19:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9196525BEF2;
	Tue, 21 Oct 2025 19:47:23 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C77125B1DA;
	Tue, 21 Oct 2025 19:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761076043; cv=none; b=aOOdWJGIchz/9PcU79KfTpbzrlWWsj3RaqbQF5oz/D2PlRkN1/UA9ctmAAM9TvANPPV6Dw/7R9sW3XlQx9lAZIsnt9FzMKTzBk86XyyRztkEb3aVpSQEzFmtz7C5NyEYJIBlfyfZwskw4wdDC3b2QVCq9c7BClfgxMJjaqSlwZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761076043; c=relaxed/simple;
	bh=vjm3dE9/IKpod5P0ZC6/pXwY8a7TnoBYoU+Ea8E0nQU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J7hGxjiORXMRLOaQawJGeu9pi6qN0wSrKRqJM+0U3pqvnChW62Rhl8PAHVndr9l5qVt6vsYG5Z5ypt9W781ufOCZ4Wo5siWYy/D0y3+oWy2pT1iew/jhSRVL90qquZ6+LEqYL0cpU/SsDmwyiV/imYmdfRGk3I9UL6lYmoEDZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 3E001B9E75;
	Tue, 21 Oct 2025 19:47:18 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id D1B7832;
	Tue, 21 Oct 2025 19:47:14 +0000 (UTC)
Date: Tue, 21 Oct 2025 15:47:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: Re: [PATCH v9 2/4] tracing: Add a tracepoint verification check at
 build time
Message-ID: <20251021154737.77377790@gandalf.local.home>
In-Reply-To: <aPKj2Ilnq7F0xLFx@levanger>
References: <20251015203842.618059565@kernel.org>
	<20251015203924.391455037@kernel.org>
	<aPKj2Ilnq7F0xLFx@levanger>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: yjfsxrh3gy8g91p7nad311cbso9t3sbo
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: D1B7832
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/flYNkAmboTsYT3r6DHHdcV5Gz6/AmDAo=
X-HE-Tag: 1761076034-53474
X-HE-Meta: U2FsdGVkX18B9EjrayZv+hXuypmrQkGMt43qexIIwD10HRSDrWuiM0dBBByW7r7rd/wzdU6XcOVbtO9gJRYdLeLT7DbyNk6fyki8AzGh4Jk1tEXtPPHXt924rz0J6oVIiDRQnoU/V0jIkk5n45fOferJU+PSq9d6EDR1pMxDn3blFzZUd871dTWZagvmjwnQmZ0lMbOuJ8NS05+r6/1Ql1OBg2QWLUZ5EudeGfwyq6bhNk2VMoRtW7ARyqPwMs5vh8NpQKA5z/mZbGqCCJ7GB9clnQrNgtDUyORrcoylg9jKK6LAiw3ZqyLNptPofNGFk+SD44/ucNWKzOJXaw2lNi3ehsSJ0fZV

On Fri, 17 Oct 2025 22:15:20 +0200
Nicolas Schier <nsc@kernel.org> wrote:

> > +# To check for unused tracepoints (tracepoints that are defined but never
> > +# called), run with:
> > +#
> > +# make UT=1
> > +#
> > +# Each unused tracepoints can take up to 5KB of memory in the running kernel.
> > +# It is best to remove any that are not used.
> > +
> > +ifeq ("$(origin UT)", "command line")
> > +  WARN_ON_UNUSED_TRACEPOINTS := $(UT)
> > +endif
> > +
> > +export WARN_ON_UNUSED_TRACEPOINTS  
> 
> Is there a special reason why you chose to introduce a new command-line
> variable instead of extending KBUILD_EXTRA_WARN / W ?

Honestly, I didn't think about using KBUILD_EXTRA_WARN. I also want this
option to go away after we remove the current unused tracepoints so that
any new ones will always cause a warning.

The only reason not to make it always warn is because I don't want to add
warnings for the existing code. I'm working on having outreachy projects to
remove the currently unused tracepoints. Once that is done, then this
option is going to go away and the build will always warn on unused
tracepoints.

I thought it might be easier to remove it without any issues if it's a new
command line that goes away in the future.

Looking at EXTRA_WARN, it appears to be for basic issues with the code and
adds new C compiler warning flags. This isn't exactly the same.

If you think it makes sense to extend EXTRA_WARN, I can still go ahead and
do that.

-- Steve

