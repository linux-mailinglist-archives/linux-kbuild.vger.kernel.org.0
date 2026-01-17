Return-Path: <linux-kbuild+bounces-10623-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDF6D39071
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jan 2026 20:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC568300BA1C
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jan 2026 19:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98023286416;
	Sat, 17 Jan 2026 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIG8VuUr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D2500941;
	Sat, 17 Jan 2026 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768676845; cv=none; b=jaXyfjTwglkYe9V0hVh8rCpW0rqq736eqDl2AVJRyV2/BK526/Emu+zGSpHCV3xw6NgpHjhEnkYN6aVf67IbytqwVwwQoKV3y6oV/x4pESlmbC4990CvuajFL6Q1eXUvt7Bq3eLORDvL98pwiJuxKHFk1YNQH9d1dAjgrnfyMpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768676845; c=relaxed/simple;
	bh=wvP+WP9tHXE//mbhVEIHbRHuOfsqiDs/WYK3kZyFGuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgIXjqtbz7iij9XjnkEXvNONtGuBz+2Fr6hWVTfQlqbibE61fMNC8F0lHp2KRDimvRwDMVXS/C6YTbgMZ5s53wY9joYD7aclac/WsZfHcEQwLGPWyEbZyXitqlRPYCvhpS27wuKeuFKfme7BTUymzQVAUsMKYxmzTfv5Q0HWCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIG8VuUr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D21C4CEF7;
	Sat, 17 Jan 2026 19:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768676845;
	bh=wvP+WP9tHXE//mbhVEIHbRHuOfsqiDs/WYK3kZyFGuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tIG8VuUryD78YJ3VnpohYAKeGUKqoWHDuaelEhtC11pFPOIBsUXxZF9UIFWCpeG3e
	 ht3ZCvK4QVkUOth141Yr30jE5Vv4SQyVbx8VksHMxXhSOY2gL0lkpJgmL7cy5MQQ0q
	 hraHy0U77gli6SR12Hf2YyXUT6A3g80DFgoYwS3e3KWw2FGBQ1imRYSxNZ8CXM28V2
	 w6nw3lDZ/xQoYcD1Bw4YgbPxoWZe2yA4wNIkKp7zRVRCKEveNYFDHkn9AwGGuPG2e+
	 QW6HgDwiO28iVG+tLa4UgKA0Kvo5Bqjbm2PbgHWL1+S1ATuY2o5hqmvWHbuc4QyRaA
	 XfdXgv6eNgmEw==
Date: Sat, 17 Jan 2026 11:07:24 -0800
From: Kees Cook <kees@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Bill Wendling <morbo@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Marc Herbert <Marc.Herbert@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brian Gerst <brgerst@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Compiler Attributes: Add __counted_by_ptr macro
Message-ID: <202601171106.90E508A9D4@keescook>
References: <20260114193716.1740684-1-morbo@google.com>
 <20260116005838.2419118-1-morbo@google.com>
 <20260116095318.46a149fb@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116095318.46a149fb@pumpkin>

On Fri, Jan 16, 2026 at 09:53:18AM +0000, David Laight wrote:
> On Fri, 16 Jan 2026 00:57:57 +0000
> Bill Wendling <morbo@google.com> wrote:
> 
> > Introduce __counted_by_ptr(), which works like __counted_by(), but for
> > pointer struct members.
> > 
> > struct foo {
> > 	int a, b, c;
> > 	char *buffer __counted_by_ptr(bytes);
> > 	short nr_bars;
> > 	struct bar *bars __counted_by_ptr(nr_bars);
> > 	size_t bytes;
> > };
> > 
> > Because "counted_by" can only be applied to pointer members in very
> > recent compiler versions, its application ends up needing to be distinct
> > from flexibe array "counted_by" annotations, hence a separate macro.
> ...
> > diff --git a/Makefile b/Makefile
> > index 9d38125263fb..6b029f694bc2 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -952,6 +952,12 @@ KBUILD_CFLAGS	+= $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
> >  endif
> >  endif
> >  
> > +ifdef CONFIG_CC_IS_CLANG
> > +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > +KBUILD_CFLAGS	+= -fexperimental-late-parse-attributes
> > +endif
> > +endif
> 
> Will that still be needed for clang 22?

AFAIK, yes. AIUI, this flag will remain while -fbounds-safety continues
to be upstreamed into LLVM.

> Looks a bit like a temporary flag to avoid regressions.
> Probably ought to at least have a comment that it won't be needed
> by some future clang version so that it gets tidied up.

Once it's no longer needed, yes, I will want it removed from the
Makefile.

-- 
Kees Cook

