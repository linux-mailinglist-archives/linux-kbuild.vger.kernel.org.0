Return-Path: <linux-kbuild+bounces-13119-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB2PMo8dAmocoAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13119-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 20:18:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE96514398
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 20:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66277301CED1
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 18:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03382478E50;
	Mon, 11 May 2026 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yik00MFs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B2A46AECC;
	Mon, 11 May 2026 18:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523266; cv=none; b=NU1WieSwg0Sptxy7y8muRoKURbLTxfNANk4FUVJbhbN1Ilh5H1xwwOjU0IGTOPPI1YreKnjyqyzx3Y7pxdswFO0fWD6DOhwhn6c1ekvLzEd5l0FgwnRGOHZ8SsUS9U3G4fejCD3L/5XJASC5PXRSMh6ode0ylowdvqZhOKsYUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523266; c=relaxed/simple;
	bh=kYJAjhBLTK5188tkpp895MuAn5ZwQjFTPdmZuwhzdKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ME4RMi+SUXDetXqRImEaIr5zpeV9iSRgHtSFqOhR9xRJnyT54lvRXV9XH/6eHFfvG/QLsIMot/KpdNJbM+aLWsSuDFWd5/9mgvQvC6oEv0f9x+lJa9ZxJbpZBimwzaLIZB61P2f2mG4BsdPSCZ5EXgHJM7Fr9+lmRsq7V+2XLvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yik00MFs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6274CC2BCB0;
	Mon, 11 May 2026 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778523266;
	bh=kYJAjhBLTK5188tkpp895MuAn5ZwQjFTPdmZuwhzdKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yik00MFsZZExqbxCaceAPJlMwLQrmJmplumBUszioAlx10aTI4RdUFOzjXo+x+c5u
	 /VZ6lGT4BZS+HALjze4VbOO1Pro9OETfEq58RSG64GOXUNLfBpoyrkzVnsxu2HjQPW
	 gmZdwzKpsmcDJCxfMa1NGnelSgreX+FZK15c0Rs05bF11sNGvdbSuIDjH+/77RO3F/
	 i4eCb0+n3xVp33OV69kdFRqIfPru7ydqw9Q8xz1B73DIYRHGuvEenFrzdyXLnXfzES
	 QUCSmeTH40A82aP4edYnZ8dDwBoXOb+P4FLxUoEv0Y7xclsqSNwlkWKi6e9qcA8e82
	 70fz60b4WW4dA==
Date: Mon, 11 May 2026 11:14:25 -0700
From: Kees Cook <kees@kernel.org>
To: Marco Elver <elver@google.com>
Cc: "Harry Yoo (Oracle)" <harry@kernel.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>,
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>,
	KP Singh <kpsingh@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH v3 1/2] slab: support for compiler-assisted type-based
 slab cache partitioning
Message-ID: <202605111113.5076F0DC@keescook>
References: <20260424132427.2703076-1-elver@google.com>
 <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
 <afkOMIPu1WNFE9MS@elver.google.com>
 <CANpmjNM261J5qefMvmUXWZGBVz-KBs7GkbpdNMfTOvNJ-=LiZQ@mail.gmail.com>
 <afz7pZADZPD4mKJr@MacBook-Air.tail10959e.ts.net>
 <af3xcFjrZSZFG846@elver.google.com>
 <rz7dt4wghum6beghfgm6suqje6jeivrensojjalfis5zeuyen7@6bj7kfpqb4q5>
 <CANpmjNNevjTo0uwo3DJdDc=PpQpyzj301kFT39OBoCNLW0A8VQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNNevjTo0uwo3DJdDc=PpQpyzj301kFT39OBoCNLW0A8VQ@mail.gmail.com>
X-Rspamd-Queue-Id: AEE96514398
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13119-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:34:53AM +0200, Marco Elver wrote:
> On Mon, 11 May 2026 at 10:31, 'Harry Yoo (Oracle)' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
> >
> > On Fri, May 08, 2026 at 04:21:36PM +0200, Marco Elver wrote:
> > > I think I have a solution for this mess, see below.
> > >
> > > I would not send it as 1 series, but only include the slab changes (+
> > > instruction_pointer.h change to introduce _CODE_LOCATION_) as one
> > > series, to go through the slab tree. The rest of the patches would go to
> > > respective arch maintainers.
> >
> > I'm assuming this will be a follow-up and reviewing patch 1
> > (and waiting for Jon's thuoghts on patch 2)
> 
> I'll be sending v4 shortly.
> 
> > > diff --git a/include/linux/instruction_pointer.h b/include/linux/instruction_pointer.h
> > > index aa0b3ffea935..dfe73aafddb8 100644
> > > --- a/include/linux/instruction_pointer.h
> > > +++ b/include/linux/instruction_pointer.h
> > > @@ -8,6 +8,30 @@
> > >
> > >  #ifndef _THIS_IP_
> > >  #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> > > +/*
> > > + * The current generic definition of _THIS_IP_ is considered broken by GCC [1]
> > > + * and Clang [2]. In particular, the address of a label is only expected to be
> > > + * used with a computed goto.
> > > + *
> > > + *   [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071
> > > + *   [2] https://github.com/llvm/llvm-project/issues/138272
> > > + *
> > > + * Mark it as broken, so that appropriate fallback options can be implemented
> > > + * for architectures that do not define their won _THIS_IP_.

Teeny typo above: "won" -> "own".

> > > + */
> > > +#define HAS_BROKEN_THIS_IP
> > > +#endif
> >
> > As long as _THIS_IP_ is broken on some arches, it cannot be used anyway
> > when in a general API that can be used by arbitrary users?
> 
> It more or less works today, and for debugging or tracing it's "good
> enough" in most cases.
> 
> The plan would be to phase out the generic _THIS_IP_ once all
> architectures have a correct _THIS_IP_ implementation.
> 
> > Is it something that can be fixed in all arches over time?
> 
> Yes, I have patches for that.
> 
> > > +/*
> > > + * _CODE_LOCATION_ provides a unique identifier for the current code location.
> > > + * When _THIS_IP_ is broken (generic version), we fall back to a static marker
> > > + * which guarantees uniqueness and resolves to a constant address at link time,
> > > + * avoiding runtime overhead and compiler optimizations breaking it.
> > > + */
> > > +#ifdef HAS_BROKEN_THIS_IP
> > > +#define _CODE_LOCATION_ ({ static const char __here; (unsigned long)&__here; })
> >
> > Nice!
> >
> > Yes, we don't really need the exact code location
> > for partitioning kmalloc caches.
> >
> > IIRC lockdep does a similar thing to define lock classes (unique for
> > each lock init location)
> >
> > > +#else
> > > +#define _CODE_LOCATION_ _THIS_IP_
> > >  #endif
> >
> > Probably we don't need this fallback?
> 
> x86-64 is the only arch that has working fast _THIS_IP_, and adding
> static __here markers to bss is rather wasteful.
> 
> More architectures will be supporting _THIS_IP_ properly once I get to
> send the patches. The mainstream architectures all have a reasonable
> and fast way to get the current IP, so we don't need to waste bss
> space there.

Thanks for finding a solution for this!

-- 
Kees Cook

