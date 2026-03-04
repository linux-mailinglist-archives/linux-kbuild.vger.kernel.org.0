Return-Path: <linux-kbuild+bounces-11548-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KWTO1T6p2mtmwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11548-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 10:24:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 658281FD864
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 10:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44DAD3028359
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2026 09:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567A23932FA;
	Wed,  4 Mar 2026 09:23:34 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18629386C0C;
	Wed,  4 Mar 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616214; cv=none; b=R7okEp1V2Rf3XOCTXisdMrfBUP40wgiuW+NKlNQK5zru2w5HRkgUE3LGJQbKBzUwwkBve1D1Vsbu22kFWatODEBqjdOTd98v3pPyzasX3jHrDIeEX/D3LR1UOaalB1DWmcCFdo17HbgHExe2NA15hkXrc6LrvqTFxe3ZkK3axvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616214; c=relaxed/simple;
	bh=rFG0yKTU0uBkBGAcaVw7OE/xatWrPiHKyWJgjVKOtVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHJhS8+Pls31UjloXS3Ut7JO0A5LOOKY97ESc6WdGzqCq6VbRjdBdNsuPa9+waGmi0aRgFOzBe+fpD7Nz5FhgbrGrnli/BSAC4p8NPsupP6wxxptT0ik7QIUQ/YM47lxsXEtOxIhqstBc1aojTF0tqVVYD1TCJSr8/vC+gR1Mv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54084497;
	Wed,  4 Mar 2026 01:23:26 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 377853F694;
	Wed,  4 Mar 2026 01:23:32 -0800 (PST)
Date: Wed, 4 Mar 2026 09:23:30 +0000
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
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
Message-ID: <20260304092330.GJ1098637@e132581.arm.com>
References: <20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com>
 <aaCTC86U9KjnmZmu@google.com>
 <99e7fe4e-72de-4b55-9a9a-ae51718a0e73@kernel.org>
 <20260227103611.GA1098637@e132581.arm.com>
 <c886c8c9-d336-4ec3-94c0-c4869dee7e7f@kernel.org>
 <aaeHcL7vEhZ0LWth@google.com>
 <2ff9897c-3822-4e31-acfb-884690448af0@kernel.org>
 <aaeMSBW_K827ARYJ@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaeMSBW_K827ARYJ@google.com>
X-Rspamd-Queue-Id: 658281FD864
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linaro.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11548-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 05:35:04PM -0800, Namhyung Kim wrote:

[...]

> > I don't want bpftool's HOST_CFLAGS to inherit
> > -fzero-init-padding-bits=all if the compiler doesn't support it, which
> > may happen with the current version of the patch. I'd prefer a version
> > with separate EXTRA_CFLAGS and HOST_EXTRA_CFLAGS, as proposed by Leo and
> > discussed above, to address the cross-compilation issue.
> 
> Got it.  Leo, can you please update the patch?

Yes, I will prepare a new patch series.

Also thanks Quentin's detailed suggestions.

Leo

