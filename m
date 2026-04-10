Return-Path: <linux-kbuild+bounces-12740-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J3JBDFc2GnzcQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12740-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 04:10:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0C3D1533
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 04:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56F823014851
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 02:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCB332FA2A;
	Fri, 10 Apr 2026 02:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4tLeQJf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814B3290DC;
	Fri, 10 Apr 2026 02:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775787052; cv=none; b=o+osE7gGbQ5P33dBj3biP56VKDlmIOQTyiYJ/qTR/wvlu0xhLDYp8qBwKNmG5gLKJ+KsyucXvjxu8isDdZIGe5dOeFTHYZOfUYTm3/SIY/ben4bTigyobBzn5OqcFtyLkQ8j54qcOQfIiB6A1VKcX0VlDxI1PAAmy8ekQzv0to4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775787052; c=relaxed/simple;
	bh=sYEJlC+80a5TUPCyGZHLWRArwG8vmKPmnR+IrEgx5A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pd8iV84RO7G4jQYJCkxGgX8WH+F6BDCfPzbhsf5ZM6DHxE68whp4fw+hXUFHaOW5F8nha3P5fkCvLC4YXrV8xaf2NpyNboly9yXYE14MQC10K7nf5tKUUbj+rA1gK9onO1Db/PvP5I80MEI2r4mig28TzMRLs9Lt+k3dDyuEDQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4tLeQJf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799ACC4CEF7;
	Fri, 10 Apr 2026 02:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775787051;
	bh=sYEJlC+80a5TUPCyGZHLWRArwG8vmKPmnR+IrEgx5A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r4tLeQJfd+vN9qPkw7uJDjgl7R1cWD7iGKz3zMVvIUlierwn/u/iPnlSeDHMZHxwP
	 F/bz5k3nRbvK5s3c3ZL/V4w8iYT/lZ4nouO/LlhquLbR8R9xz5YCAfnhy5gaWGZYHy
	 CLhOTZ2JjllHI3lQDgvAzZgMHzRc8M5d9I0eN0ggS8SyDhnBHiR6Sx4ijxq8YDKLXh
	 qEHnTm45l/RcSxwgCIDoSjB+Y4ZNA43eGpD4V8pwxyIRDNVBGtPLacCzOYsmYz6Qyp
	 WmlO4XdncK7IPKPYCuqglYMgN3oYZuS96duJOS0SMh9xqWhYmMezOOt9TnZV1eC7iE
	 CNjvptAiRAk5g==
Date: Fri, 10 Apr 2026 11:10:49 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Marco Elver <elver@google.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
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
	Florent Revest <revest@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <adhcKZGytWdaLxJu@hyeyoo>
References: <20260331111240.153913-1-elver@google.com>
 <ac9d5O5XehnXRc5A@hyeyoo>
 <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org>
 <adM2XVZf1DekahlY@hyeyoo>
 <CANpmjNMeaWWuDMAj_n38U9XRqgZQz30ca82Vy10Bg=NoDfZ5ng@mail.gmail.com>
 <adT-gkVmVDDXR1h_@hyeyoo>
 <CANpmjNO1aNm3mKphDGWasK_NUfVY8q4K9GCjyREZFqrOu9WLcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNO1aNm3mKphDGWasK_NUfVY8q4K9GCjyREZFqrOu9WLcw@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12740-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huaweicloud.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,googlegroups.com:email]
X-Rspamd-Queue-Id: 6FA0C3D1533
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 10:19:09PM +0200, Marco Elver wrote:
> On Tue, 7 Apr 2026 at 14:54, 'Harry Yoo (Oracle)' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
> >
> > On Tue, Apr 07, 2026 at 01:17:14PM +0200, Marco Elver wrote:
> > > On Mon, 6 Apr 2026 at 06:28, 'Harry Yoo (Oracle)' via kasan-dev
> > > <kasan-dev@googlegroups.com> wrote:
> > > > On Fri, Apr 03, 2026 at 08:29:22PM +0200, Vlastimil Babka (SUSE) wrote:
> > > > > On 4/3/26 08:27, Harry Yoo (Oracle) wrote:
> > > > > >> diff --git a/include/linux/slab.h b/include/linux/slab.h
> > > > > >> index 15a60b501b95..c0bf00ee6025 100644
> > > > > >> --- a/include/linux/slab.h
> > > > > >> +++ b/include/linux/slab.h
> > > > > >> @@ -864,10 +877,10 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
> > > > > >>   * with the exception of kunit tests
> > > > > >>   */
> > > > > >>
> > > > > >> -void *__kmalloc_noprof(size_t size, gfp_t flags)
> > > > > >> +void *__kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> > > > > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > > > > >>
> > > > > >> -void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
> > > > > >> +void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node, kmalloc_token_t token)
> > > > > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > > > > >
> > > > > > So the @token parameter is unused when CONFIG_PARTITION_KMALLOC_CACHES is
> > > > > > disabled but still increases the kernel size by a few kilobytes...
> > > > > > but yeah I'm not sure if we can get avoid it without hurting readability.
> > > > > >
> > > > > > Just saying. (does anybody care?)
> > > > >
> > > > > Well we did care enough with CONFIG_SLAB_BUCKETS to hide the unused param
> > > > > using DECL_BUCKET_PARAMS(),
> > > >
> > > > Hmm yeah.
> > > >
> > > > I wasn't sure if we could do this without hurting readability,
> > > > but perhaps we could...
> > > >
> > > > > so maybe extend that idea?
> > > > > I think it's not just kernel size, but increased register pressure etc.
> > >
> > > I'll take a closer look at generated code.
> >
> > > In some cases the compiler ought to omit zero-sized arguments,
> >
> > Oh, didn't know that was a thing.
> 
> So I checked with Clang and GCC. Looks like Clang does omit the
> zero-sized struct argument, i.e. generated code is identical to
> before. Whereas GCC wastes a few bytes of stack space at callsites.

Thanks for confirming that.

> Which is sad, because that means we need the macro workaround.
> 
> Do you want to be credited with Co-authored-by

I'd appreciate that. (I guess you meant Co-developed-by)

> - in which case I need your Signed-off-by.

Signed-off-by: Harry Yoo (Oracle) <harry@kernel.org>

> > Not sure if it's safe to do that for exported functions though (since
> > modules can be built w/ a different compiler).
> 
> Kernel modules built with a different config (implicit if different
> compiler) are not supported, and never have been. If it works, it's
> just luck (I know people do this, but it's just a disaster waiting to
> happen).

And if GCC folks somehow fix this at some point, even kernel modules
built with a different version of GCC might not be supported?

-- 
Cheers,
Harry / Hyeonggon

