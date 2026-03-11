Return-Path: <linux-kbuild+bounces-11858-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ/2IkU7sWkLswIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11858-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 10:52:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF4E2614B3
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 10:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09CC9309271E
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3F83B3884;
	Wed, 11 Mar 2026 09:35:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CA82BEFE7;
	Wed, 11 Mar 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773221709; cv=none; b=lHGzswplAReTaJcNNGmSseExIWB9V96pgr9IfJPoDzED+UV8el5BGpvHCJcbtGYkUU0+qoo3MYaGc81GWcBBOvQcujxaFOm7WKMbOqQGjsUkHT/kNPmFroLRSDRQDX+NBK6VEuWiRpJZgf1tGKtICQE4KWlLn6Eh1L+6gUGWSjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773221709; c=relaxed/simple;
	bh=aa57vnTUh0SxWMfF1DF7EcfbL+UNLmA40TkPWU3lvMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABDKOcW5eJx3N5L1k0W0jaxWe8T1S3z19UXnPCPm5qWQvw8uBDDR56NQPq1t8AZRidVXOxjlF1CZ3QJZhf4wS+G0CWnAkacohs3Ci8jmLI36zK1SqTdJM6ryHzFoMYT34j+RPotvRk12QiInaHTR0mJ/zuLkbPvNlN8pfZiW2Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14BBF169C;
	Wed, 11 Mar 2026 02:35:01 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECA6B3F73B;
	Wed, 11 Mar 2026 02:35:06 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:35:05 +0000
From: Leo Yan <leo.yan@arm.com>
To: bot+bpf-ci@kernel.org
Cc: acme@kernel.org, irogers@google.com, namhyung@kernel.org,
	james.clark@linaro.org, kees@kernel.org, qmo@kernel.org,
	nathan@kernel.org, nsc@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
	haoluo@google.com, jolsa@kernel.org, rafael@kernel.org,
	daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
	peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, adrian.hunter@intel.com,
	mhiramat@kernel.org, wbg@kernel.org, baohua@kernel.org,
	xiaqinxin@huawei.com, brgl@kernel.org, warthog618@gmail.com,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, jic23@kernel.org,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	akpm@linux-foundation.org, w@1wt.eu, linux@weissschuh.net,
	jpoimboe@kernel.org, robert.moore@intel.com, lenb@kernel.org,
	srinivas.pandruvada@linux.intel.com, tj@kernel.org,
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com,
	broonie@kernel.org, rostedt@goodmis.org, gmonaco@redhat.com,
	shuah@kernel.org, jikos@kernel.org, bentiss@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org, martin.lau@kernel.org,
	clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH v4 06/30] libbpf: Remove duplicate $(CLANG_CROSS_FLAGS)
Message-ID: <20260311093505.GH4153946@e132581.arm.com>
References: <20260311-tools_build_fix_zero_init-v4-6-9e35bdb99cb3@arm.com>
 <00482d80980f713b27b422ec1ea2d17d0f1daed19243b597c5954e470cc09c92@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00482d80980f713b27b422ec1ea2d17d0f1daed19243b597c5954e470cc09c92@mail.kernel.org>
X-Rspamd-Queue-Id: 5CF4E2614B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11858-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev,meta.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,bpf-ci,lkml];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[73];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.949];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,e132581.arm.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 09:02:13AM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> > index 168140f8e646..b1fbd0211c5e 100644
> > --- a/tools/lib/bpf/Makefile
> > +++ b/tools/lib/bpf/Makefile
> > @@ -84,7 +84,6 @@ override CFLAGS += -Werror -Wall
> >  override CFLAGS += $(INCLUDES)
> >  override CFLAGS += -fvisibility=hidden
> >  override CFLAGS += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> > -override CFLAGS += $(CLANG_CROSS_FLAGS)
> 
> At this commit, doesn't this removal lose CLANG_CROSS_FLAGS entirely
> from the libbpf build?
> 
> The libbpf Makefile includes Makefile.include at the top, which does
> append CLANG_CROSS_FLAGS to CFLAGS. But then the libbpf Makefile
> overwrites CFLAGS with :=
> 
>     CFLAGS := -g -O2
> 
> which destroys everything Makefile.include appended. The removed line
> above was the only thing that re-added the cross-compile flags after
> that overwrite.
> 
> The next commit in the series (233d70853154 "libbpf: Initialize CFLAGS
> before including Makefile.include") fixes this by moving the CFLAGS
> initialization before the include, so Makefile.include's addition
> survives. But at this commit, cross-compilation with Clang appears
> broken.
> 
> Could these two patches be squashed or reordered so that the
> initialization move comes first?

To be honest, I feel much more comfortable being corrected by a human
rather than a bot :)

The comment is fair enough, I will squash the two patches.

Thanks,
Leo

