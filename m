Return-Path: <linux-kbuild+bounces-11860-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOroEY9NsWlCtAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11860-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 12:10:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB76262C51
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 12:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6D23303EF89
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 11:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC763DA7E2;
	Wed, 11 Mar 2026 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TVq/mqgX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1E43D9DA1;
	Wed, 11 Mar 2026 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773227166; cv=none; b=dHQte4InPBnY3Sa2KFUGaGtkuI4UfXmy00w/bJEg5+JzMlC7BCMLWQgMGgeRZSKEDYkVBcF/Q3OqYigRINjcGDj4TJhFuD2k/f6uCkIw+NbW8ZSwlC2lk90qcmIJZ/Fa2x++PBlz7o+nAmmkGqmwvCpJBVfp0aIzlwO3gDsiFt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773227166; c=relaxed/simple;
	bh=kfpEWkH2XpzSfGzipu6OR2Z7FxO8Oow3FzZ0Lraka2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tddFxjMInL7wGRe5ZjgNjo3nGEbfJ9NVnsMX8t1N0rbVJggcHK2FbAmGvyt9EvQhcmM0F6Gckcy/rUywqxfodLwjvVdbyyVmdueF7HPZfxW1iNqXyl0aXnOxw4fpAwEQazKTylHMOEXC6kY0wOyMwiYPFrhNbvHHB1tgowNabDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TVq/mqgX; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8TahdgEn3gMu5VtPViQvPPRTFhQLJ1Z62fN7PBBs1bk=; b=TVq/mqgX8wM37fMpnv59UYrKlf
	n60VzuvWBApR8D2t1mCfWJd89b34Bjedf/1KV0neNrwDL2/Ok4fQRMsH/ejppI+BM81eY3vQF94iE
	ADbiCIlK8EgeD6nBo3cMAp9Ul13T2bJs5mYjjJIpUPbQvTsRQqYPhfrby7XuSKdMi+BQ9ZR1b70lm
	5jh6X/S/StSkgUCb18nUWR2T+9NLrdUhIphDccVXevd53oUd47ien5izcVgfPEiKHsPyAt/2khEsl
	MEd8l5q4J25yaU8nzxaFwQ8DVP8cFAhHe3GjjEz0mt+NSyW0HyxZg9LWulMd+M5esR0ZXMRQgnK86
	FopvLgLA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HNy-0000000GmSP-1xvV;
	Wed, 11 Mar 2026 11:05:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 395B8300462; Wed, 11 Mar 2026 12:05:53 +0100 (CET)
Date: Wed, 11 Mar 2026 12:05:53 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: urezki@gmail.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
	samuel.holland@sifive.com, dave.hansen@linux.intel.com,
	jeremy.linton@arm.com, weixugc@google.com, ljs@kernel.org,
	ryabinin.a.a@gmail.com, rppt@kernel.org, bp@alien8.de,
	luto@kernel.org, jan.kiszka@siemens.com, mingo@redhat.com,
	david@kernel.org, mhocko@suse.com, akpm@linux-foundation.org,
	andreas@gaisler.com, kas@kernel.org, Liam.Howlett@oracle.com,
	morbo@google.com, thuth@redhat.com, catalin.marinas@arm.com,
	ankur.a.arora@oracle.com, kbingham@kernel.org,
	nick.desaulniers+lkml@gmail.com, andreyknvl@gmail.com,
	dvyukov@google.com, corbet@lwn.net, leitao@debian.org,
	hpa@zytor.com, tglx@kernel.org, yuanchu@google.com, ardb@kernel.org,
	vincenzo.frascino@arm.com, tabba@google.com, joey.gouly@arm.com,
	nsc@kernel.org, will@kernel.org, yeoreum.yun@arm.com,
	nathan@kernel.org, maciej.wieczor-retman@intel.com,
	skhan@linuxfoundation.org, axelrasmussen@google.com, osandov@fb.com,
	surenb@google.com, justinstitt@google.com, kees@kernel.org,
	vbabka@kernel.org, hsj0512@snu.ac.kr, trintaeoitogc@gmail.com,
	jackmanb@google.com, maz@kernel.org, glider@google.com,
	linux-doc@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v11 00/15] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <20260311110553.GM606826@noisy.programming.kicks-ass.net>
References: <cover.1773164688.git.m.wieczorretman@pm.me>
 <20260310190022.GI606826@noisy.programming.kicks-ass.net>
 <abBu-M5esEYWScDf@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abBu-M5esEYWScDf@wieczorr-mobl1.localdomain>
X-Rspamd-Queue-Id: CDB76262C51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,sifive.com,linux.intel.com,google.com,kernel.org,alien8.de,siemens.com,redhat.com,suse.com,linux-foundation.org,gaisler.com,oracle.com,lwn.net,debian.org,zytor.com,intel.com,linuxfoundation.org,fb.com,snu.ac.kr,vger.kernel.org,googlegroups.com,lists.linux.dev,lists.infradead.org,kvack.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11860-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,noisy.programming.kicks-ass.net:mid,infradead.org:dkim]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 07:30:36PM +0000, Maciej Wieczor-Retman wrote:
> On 2026-03-10 at 20:00:22 +0100, Peter Zijlstra wrote:
> >On Tue, Mar 10, 2026 at 05:51:19PM +0000, Maciej Wieczor-Retman wrote:
> >
> >> ======= Compilation
> >> Clang was used to compile the series (make LLVM=1) since gcc doesn't
> >> seem to have support for KASAN tag-based compiler instrumentation on
> >> x86. Patchset does seem to compile with gcc without an issue but doesn't
> >> boot afterwards.
> >
> >Can you put all that under a specific CONFIG and make that depend on
> >CC_IS_CLANG?
> 
> I made HAVE_ARCH_KASAN_SW_TAGS depend on CC_IS_CLANG, and that controls all the
> software tags stuff, like ARCH_DISABLE_KASAN_INLINE through KASAN_SW_TAGS.
> And ARCH_NEEDS_DEFER_KASAN is for if KASAN is compiled but LAM is not available,
> so that it gets disabled in runtime.
> 
> But sure, I suppose I can add a separate CONFIG with CC_IS_CLANG to these three
> so the clang connection is more transparent.

Right, because building but not booting is BAD :-) While compiler
specific features are a dime a dozen.

