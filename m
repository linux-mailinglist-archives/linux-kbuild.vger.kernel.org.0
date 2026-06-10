Return-Path: <linux-kbuild+bounces-13697-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RwdXBUiQKWqeZgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13697-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 18:26:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC0F66B74D
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 18:26:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=fqAaOyeR;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13697-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13697-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12E4530D68C1
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 16:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026D4349CC0;
	Wed, 10 Jun 2026 16:00:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5826FD9B
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2026 16:00:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107247; cv=none; b=c/9AfqU6ZxN4jCblm8ED4uCW6G53s7f6wNEU9ml+2LH7qW9Ki0EKDhFXUCcJzSNRrJZaQjnMbwvfastJdu4L+mogSv1FhgsPCPFaezlkrCQEjv7SULTMfb/YbcogYgtO2hVbPoiCc31B3CYZDKbm0wdk3Cpn+nVmmY5AroPFh/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107247; c=relaxed/simple;
	bh=F3CqFJpNvqu/pcAAEW4qvTza9jBgLa7hoPp5g9Sj2h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8nt/mkahIyC3FVSct3o1ywthaOnRosu6WgueN23stIYzoaKAhvcB1dstEZVscGbWMmDxWaFOgBuVnZaWsnuD1D9Z2X7x1/KJVojP25iwo3h+KC3gqGbgGvijQVrKWOEDDSze9S+d2djwsOMfG6HrcQW3BWZs45tS+MzgGoV7rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fqAaOyeR; arc=none smtp.client-ip=95.215.58.183
Date: Wed, 10 Jun 2026 11:00:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781107243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzgtGHVPM1ftx7M5mHi91OCGdfZy2KJgCQyJ9wwrAms=;
	b=fqAaOyeRF+3piHxcrv3/mseLVBiNsCsVDgwNtdJGWAiOQ/J7r9bS28cKt+9x7OkxYSj173
	8nHZlpGxKGKsGz+mc82SnuNQks3mMo72hGoQPHTrthpab4GsKc8JX1De/x+uTOrwiurtO/
	r+lULxdiNoIjymNx+bs293YJK8/22eA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nsc@kernel.org, andriy.shevchenko@linux.intel.com, rdunlap@infradead.org, 
	julianbraha@gmail.com
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <g5b6ff6h6p34mz3deqihy5wag2a3bmado6j7i4vi7q7kidmdl7@cwdht5xitxxh>
References: <20260527142703.107110-1-andrew.jones@linux.dev>
 <178104876973.2707941.12816857648925597603.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178104876973.2707941.12816857648925597603.b4-ty@b4>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13697-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.intel.com,infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nsc@kernel.org,m:andriy.shevchenko@linux.intel.com,m:rdunlap@infradead.org,m:julianbraha@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.jones@linux.dev,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.jones@linux.dev,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,cwdht5xitxxh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EC0F66B74D

On Tue, Jun 09, 2026 at 04:46:09PM -0700, Nathan Chancellor wrote:
> On Wed, 27 May 2026 09:27:03 -0500, Andrew Jones wrote:
> > kconfig: add kconfig-sym-check static checker
> 
> I took this in its current form since perfect is the enemy of good but I
> think some of Nicolas's comments are certainly relevant, so please feel
> free to set fixups on top of kbuild-next as you see fit.
> 
> Applied to
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next
> 
> Thanks!
> 
> [1/1] kconfig: add kconfig-sym-check static checker
>       https://git.kernel.org/kbuild/c/f58316a441b46
> 
> Please look out for regression or issue reports or other follow up
> comments, as they may result in the patch/series getting dropped or
> reverted. Patches applied to an "unstable" branch are accepted pending
> wider testing in -next and any post-commit review; they will generally
> be moved to the main branch in a week if no issues are found.

Thanks, Nathan.

I've been meaning to get back to this in order to address Nicolas's
comments, but I got buried in other things recently and have vacation
next week. I won't drop those improvement suggestions from my TODO,
though, so I'll hopefully be able to address them in the near future.
And I'm happy to keep it maintained going forward as well.

Thanks,
drew

