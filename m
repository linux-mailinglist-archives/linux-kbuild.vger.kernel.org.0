Return-Path: <linux-kbuild+bounces-12847-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALaMMNf/5WnVqAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12847-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Apr 2026 12:28:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 288CB4295A0
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Apr 2026 12:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FED23003309
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Apr 2026 10:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5408D399341;
	Mon, 20 Apr 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMJaDPvY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB3C214204;
	Mon, 20 Apr 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776680900; cv=none; b=Nrk9UhgFXAxvYOrR1HJBXrE1pfZS+1134dILIm/oTdl/dYFkJZ9/DPAnH0Lt4eKsGGYKN6O1zYlu6/iXPbldGJWtWljc00bXYGByKAqAblpOJ3V9ycv+jTElth2QgdfbEtLazJkO/OTN1/oIaalZ0R62e5GgO6yWOY6gTKrkSME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776680900; c=relaxed/simple;
	bh=Ndln9vQTZpiFLL6wQKrdieqa21z6eByrPd0QvS1gFb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHeLGRNi7oeKown54CB+v6F2T2U68e9gQNoHeuONJItfYQhYx5Qf2Ge4TGvJtEUZ/f7/fsMbxY67rkis5UxRSVS3NLTFcp8siUxmfzt5cqOsUuK6Y6mScGftBh7DDCAzvAmLpY/+PNCk/en7T/iC8wYcLFSLVxJbh4035w01WMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMJaDPvY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDECC19425;
	Mon, 20 Apr 2026 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776680900;
	bh=Ndln9vQTZpiFLL6wQKrdieqa21z6eByrPd0QvS1gFb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMJaDPvYVyO7t3gR6EGUpa7cpPBZiqH7/ywZCh9nANqephTKzNzCl+wZ+YoewhE+B
	 W09n9eyGn0HdRCoh6LxwpixOa9UYgRcwU7GNhCNUdcnwLslShTO0IDNYI1Jxj2DoDo
	 +t0GKNhemcX3iNy2sz7kAg4xLdcRWaGguwrTcnoLnwVfNiGcyf6lVONN5vx65N2sDU
	 7LomD2dDKftkucHQ63ivJiRG3diRD7koZ9P961FAsFYlrt4/7NVnwd3+5a6TTZIGko
	 FQGZJWWKYqIaARmVYEgOQySolBf8dX+qwpwHKT1V5HeG/4kF4RWS5aE19C4TJq1nG3
	 BJU5+XXuV5s/Q==
Date: Mon, 20 Apr 2026 19:28:17 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>,
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
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>,
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>,
	KP Singh <kpsingh@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <aeX_wbOBX3l8PJqi@hyeyoo>
References: <20260415143735.2974230-1-elver@google.com>
 <aeXU-wwGSwcx2dvy@hyeyoo>
 <CANpmjNN0dYD8MB3PpPoxpz4ey2U9xA0w6oVO9hambtRwzSSkiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNN0dYD8MB3PpPoxpz4ey2U9xA0w6oVO9hambtRwzSSkiQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12847-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 288CB4295A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 11:30:23AM +0200, Marco Elver wrote:
> On Mon, 20 Apr 2026 at 09:25, Harry Yoo (Oracle) <harry@kernel.org> wrote:
> > [CC'ing RUST ALLOC folks for rust bindings]
> > On Wed, Apr 15, 2026 at 04:37:05PM +0200, Marco Elver wrote:
> > A few comments on V2:
> >
> > # comment 1
> >
> > I'm not a big fan of how k[v]realloc_node_align()
> > and kmalloc_nolock() define and pass the token parameter.
> >
> > IMHO it'll be fine to use {DECL,PASS}_KMALLOC_PARAMS() in those
> > functions, since SLAB_BUCKETS users already passes NULL bucket
> > to most of __kmalloc*() calls anyway.
> 
> I'm not sure I agree. 2 reasons:
> 
> 1. Even though it's "just" k[v]realloc_node_align() and
> kmalloc_nolock() - despite their relatively less frequent use - just
> put one of them in a hot path and you're sacrificing performance even
> further. There are only so many arguments that can be passed in
> registers (depending on arch), and may cause more stack spilling.
> 
> 2. We'd misleadingly declare that these functions do something with
> the bucket arg. This is wrong.

Both are valid points. But it still feels wrong to have:

void *krealloc_node_align_noprof(const void *objp, size_t new_size,
				 unsigned long align,
				 gfp_t flags, int nid DECL_TOKEN_PARAM(token));

n = krealloc_node_align_noprof(p, size, align, kmalloc_gfp_adjust(flags, size), nid _PASS_TOKEN_PARAM(token));

Actually the problem here is that some of parameters in
DECL_KMALLOC_PARAMS() are not necessary in some functions.

Perhaps we could have

DECL_KMALLOC_PARAMS(size, b, token) # declare size, bucket, token

DECL_BUCKET_PARAMS(size, token) # declare size, bucket;
				# but, actually, we don't need this!

DECL_TOKEN_PARAMS(size, b) # declare size, token only;
			   # for kmalloc_nolock and k[v]realloc_node_align()

and use DECL_TOKEN_PARAMS(), PASS_TOKEN_PARAMS() for those functions?
(just like how DECL_BUCKET_PARAMS() worked before)

What do you think?

> Both feels wrong, and would only make this change if you confirm both
> are trade-offs that you strongly prefer.
> 
> > # comment 2
> >
> > This breaks Documentation/.
> >
> > Problems:
> >
> > - The document generator doesn't handle DECL_KMALLOC_PARAMS() well.
> >
> > - The signature of the function that users call (krealloc_node_align())
> >   and the function that has kerneldoc (krealloc_node_align_noprof())
> >   don't match.
> >
> > - Even worse, moving kerneldoc to the macro doesn't work because
> >   it uses variable arguments (...)
> 
> Well, some were broken before, now it's just broken more. :-)

Ouch... ;-)

> We could move the documentation to macros and switch to explicit args
> instead of (...).

That works for me!

> Otherwise, I don't see any way to fix this. Preferences?
> 
> > # comment 3
> >
> > Looking at how rust generates helper functions,
> > in rust/helpers/slab.c:
> > | // SPDX-License-Identifier: GPL-2.0
> > |
> > | #include <linux/slab.h>
> > |
> > | __rust_helper void *__must_check __realloc_size(2)
> > | rust_helper_krealloc_node_align(const void *objp, size_t new_size, unsigned long align,
> > |                               gfp_t flags, int node)
> > | {
> > |       return krealloc_node_align(objp, new_size, align, flags, node);
> > | }
> > |
> > | __rust_helper void *__must_check __realloc_size(2)
> > | rust_helper_kvrealloc_node_align(const void *p, size_t size, unsigned long align,
> > |                                gfp_t flags, int node)
> > | {
> > |       return kvrealloc_node_align(p, size, align, flags, node);
> > | }
> >
> > Rust code probably won't pass any meaningful token?
> > (something you may want to address in the future)
> 
> Yes, it'll just pass '0' by default. We could force Rust's allocation
> to be in the pointer-containing range - if we assume Rust code is less
> prone to contain bugs, but the assumption is that such allocations
> both originate and are confined to the Rust side. One easy way to do
> this is to write:
> 
>        return kvrealloc_node_align(p, size + 0 * sizeof(long*), align,
> flags, node);
> 
> But I'd defer that for now, until we're sure the above assumption
> holds (Rust originated + confined).

Ack.

By the way, since Allocator trait uses realloc() to allocate new memory,
IIUC all k[v]malloc, k[v]realloc usage from Rust will be affected.

-- 
Cheers,
Harry / Hyeonggon

