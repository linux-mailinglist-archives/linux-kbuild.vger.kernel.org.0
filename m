Return-Path: <linux-kbuild+bounces-11545-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGFtNuiMp2nliAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11545-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 02:37:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 998E41F98CB
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 02:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6352C3047605
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2026 01:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A8230BB91;
	Wed,  4 Mar 2026 01:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKItcNT2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF19A1A6825;
	Wed,  4 Mar 2026 01:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772588106; cv=none; b=h+D9suxua1hu96aoaXXDcPoDjTUQExw3xuWN8dwHsES+7B0StEn2nvr3dXE8YCEHtssGzII85vcYfnHDlUBPoaNFJFKQ7YFcW7U2GHXkrouk+92M58DBu3YxuTd3T50nweG61a505G4Y66r7wpnP34cmrbjPtO5fauTc4Re1D/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772588106; c=relaxed/simple;
	bh=PWqQw6QkHOEToxV7Zpy3OPRtRc1QebdYN5ooe3pSOeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hw1xqtOpHxGuY4zjj85lzDSncUm+pqZcpm9EYc2FgIMxvms4k6kiKi5gBGxIw9ve40aUhIGq6nEh1JEqQ34rqcnGXw9gwZqDuKjtAryHBUhO5Wl3Ay/e3WsDrq8XluPjSBO5MmNmGHYF1yLrz3GT1JmfkE0R9KKYNDIMdXQtca0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKItcNT2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B32C116C6;
	Wed,  4 Mar 2026 01:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772588106;
	bh=PWqQw6QkHOEToxV7Zpy3OPRtRc1QebdYN5ooe3pSOeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nKItcNT2isfPirMIuyaBmc/eLBbLP3r2Qce8i86fifUGaozLyDIRkAPEF4PTYtN8W
	 vAxNvQyu036666sZl7b6prIDZySssrmhXjfjym71KAjET10kYsWUqcG1dtdFKeZDhy
	 ReF8t7Gw8YYiStL2xpNfv920MIo/SlmhiWm8SFBIkvIjNrNFPFEyVpFMIWgQkvLhDw
	 JtAYUurPDkgfxgrH+EXJeUHYknvy953OMnI3STtfNNLGTKomRXe8Qs7xIoFKaIb6hk
	 e0fceYL7BkQOaTRdH5jvkhA0s/M6J0ihxOAg1FyKlAG7etUHxp2LeLWPFvWUjj30nN
	 PKz9UTTHl5EXQ==
Date: Tue, 3 Mar 2026 17:35:04 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Quentin Monnet <qmo@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH RESEND v2] tools build: Use -fzero-init-padding-bits=all
Message-ID: <aaeMSBW_K827ARYJ@google.com>
References: <20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com>
 <aaCTC86U9KjnmZmu@google.com>
 <99e7fe4e-72de-4b55-9a9a-ae51718a0e73@kernel.org>
 <20260227103611.GA1098637@e132581.arm.com>
 <c886c8c9-d336-4ec3-94c0-c4869dee7e7f@kernel.org>
 <aaeHcL7vEhZ0LWth@google.com>
 <2ff9897c-3822-4e31-acfb-884690448af0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ff9897c-3822-4e31-acfb-884690448af0@kernel.org>
X-Rspamd-Queue-Id: 998E41F98CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11545-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,gmail.com,google.com,linaro.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namhyung@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:28:05AM +0100, Quentin Monnet wrote:
> 2026-03-03 17:14 UTC-0800 ~ Namhyung Kim <namhyung@kernel.org>
> > Hello,
> > 
> > On Fri, Feb 27, 2026 at 11:52:38AM +0000, Quentin Monnet wrote:
> >> 2026-02-27 10:36 UTC+0000 ~ Leo Yan <leo.yan@arm.com>
> >>> On Thu, Feb 26, 2026 at 10:52:01PM +0000, Quentin Monnet wrote:
> >>>> 2026-02-26 10:38 UTC-0800 ~ Namhyung Kim <namhyung@kernel.org>
> >>>>> Adding bpftool maintainer.
> >>>>>
> >>>>> On Tue, Feb 24, 2026 at 12:16:40PM +0000, Leo Yan wrote:
> >>>>>> GCC-15 release claims [1]:
> >>>>>>
> >>>>>>   {0} initializer in C or C++ for unions no longer guarantees clearing
> >>>>>>   of the whole union (except for static storage duration initialization),
> >>>>>>   it just initializes the first union member to zero. If initialization
> >>>>>>   of the whole union including padding bits is desirable, use {} (valid
> >>>>>>   in C23 or C++) or use -fzero-init-padding-bits=unions option to
> >>>>>>   restore old GCC behavior.
> >>>>>>
> >>>>>> As a result, this new behaviour might cause unexpected data when we
> >>>>>> initialize a union with using the '{ 0 }' initializer.
> >>>>>>
> >>>>>> Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
> >>>>>> the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
> >>>>>> in unions and structures.  This commit applies the same option for tools
> >>>>>> building.
> >>>>>>
> >>>>>> The option is not supported neither by any version older than GCC 15 and
> >>>>>> is also not supported by LLVM, this patch adds the cc-option function to
> >>>>>> dynamically detect the compiler option.
> >>>>>>
> >>>>>> [1] https://gcc.gnu.org/gcc-15/changes.html
> >>>>>>
> >>>>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
> >>>>
> >>>>
> >>>> Thank you Namhyung for the Cc.
> >>>>
> >>>> I built bpftool with the patch, with gcc 13 (which didn't get the flag,
> >>>> as expected) and gcc 15, and it's fine with both. As far as I can tell,
> >>>> bpftool does not initialise any union with "{0}" anyway.
> >>>
> >>> Thanks a lot for testing!
> >>>
> >>>> One potential concern (I didn't try) could be for cross-compilation:
> >>>> bpftool's Makefile sets HOST_CFLAGS based on $(CFLAGS), but $(HOSTCC)
> >>>> and $(CC) could be different versions of gcc, for example.
> >>>
> >>> To avoid confusion, we can use EXTRA_CFLAGS and HOST_EXTRACFLAGS instead
> >>> in Makefile.include:
> >>>
> >>> -----
> >>>
> >>> # cc-option
> >>> # Usage: CFLAGS += $(call cc-option,-march=winchip-c6,-march=i586)
> >>> cc-option = $(call try-run, \
> >>>        $(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> >>>
> >>> host-cc-option = $(call try-run, \
> >>>        $(HOSTCC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> >>>
> >>> # Explicitly clear padding bits with the initializer '{ 0 }'
> >>> EXTRA_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
> >>> HOST_EXTRACFLAGS += $(call host-cc-option,-fzero-init-padding-bits=all)
> >>>
> >>> -----
> >>>
> >>> Then, in a project, its Makefile can append EXTRA_CFLAGS and
> >>> HOST_EXTRACFLAGS to CFLAGS and HOSTCFLAGS respectively.
> >>
> >>
> >> This sounds like it should work for bpftool as long as we += and don't
> >> overwrite the EXTRA_CFLAGS passed from command line. In bpftool's
> >> Makefile we'd have to move HOST_CFLAGS's CFLAGS-based defintion higher
> >> up, before we add the EXTRA_CFLAGS to CFLAGS; and if anything needs to
> >> be passed to the host binary, users will have to specify
> >> HOST_EXTRACFLAGS (or HOST_EXTRA_CFLAGS?) independently, which is acceptable.
> > 
> > Quentin, do you want v2 with this or just ok for v1?
> > 
> > Thanks,
> > Namhyung
> 
> 
> Hi Namhyung
> 
> (I'm not entirely sure what v1/v2 refer to, this one was tagged v2 and I
> suspect v1 was the first post before the resend - I suppose you mean
> this one is v1 and a v2 would be with an additional host variable.)

Oops, right.  They should be v2 and v3.

> 
> I don't want bpftool's HOST_CFLAGS to inherit
> -fzero-init-padding-bits=all if the compiler doesn't support it, which
> may happen with the current version of the patch. I'd prefer a version
> with separate EXTRA_CFLAGS and HOST_EXTRA_CFLAGS, as proposed by Leo and
> discussed above, to address the cross-compilation issue.

Got it.  Leo, can you please update the patch?

Thanks,
Namhyung


