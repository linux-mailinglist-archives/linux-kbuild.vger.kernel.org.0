Return-Path: <linux-kbuild+bounces-13930-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w80YG/sMSGpkkwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13930-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 21:26:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E3070519D
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 21:26:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PUPKlPeG;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13930-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13930-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF6E8302A6AC
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2026 19:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC323290C8;
	Fri,  3 Jul 2026 19:26:23 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAAE30E0D5;
	Fri,  3 Jul 2026 19:26:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106783; cv=none; b=dOjRvtYNG0wttcu0eLlr0xp9dC5Lw8K//3XeevRi+ntQiIgTqRaJ1RVTGqWrshti9Tw+eMYVlcAWJZV4C5jnWuCcFCBLP5AnZ8hlC6HMyrXilECjCfDAnDV0QA8XyelQxBx6ishKkr2TxcZYELtOddcr3MJr//vuRrkFir6MZ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106783; c=relaxed/simple;
	bh=vUBLtEQosFUvLLWRnh1ekRucrHyIhERB8VpuLqSoZXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IigTlV1AtbGp/NiWFBpEaKHg8rIJogJ3wmzpZF2b6TxZeSuR4AumTzn1hwXrqSXKugvRu3j5024D856QHAIeguaG+8zRjun98jM4xAH1/9WDQV6TeNBTbA45ednu7wwQStvDFJdfcjcMQCk2O0U9fvcQz+La4FkgWWxK8LgXf/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUPKlPeG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 59E0B1F000E9;
	Fri,  3 Jul 2026 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783106781;
	bh=QvTI58QiC2TuqyjxFhnNcEQHA14b/JGfC7JQWcOKCHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PUPKlPeGZJ4YFSigsyPRrVVwSVkIgkIxuAXekGyjJKwVkvDkENbFrK1srabmrnIL9
	 XWKiCQcp9qix3kxN3Xsd6yBqtnuSScDbFFV1gaucDeJEovmhQdFvR8VEqAB24aV7ba
	 GTFmKN8NvWWMJwn3vcVrAf3yz2kz/Nqoh2mD76Wh2YXBvyG+//02BPhDBVwyJ82AZ6
	 fpNqCQFbbkjIxPVYB6pk1cyxeRbjJmVHWyICuHZWImt3Kn4gkz89GlXjedlZJkS/Y0
	 kALKxy0G2MYDoWlzLgKn5RbgD7W4nx7DrhFlswp5l64qf8DFzTeATsVoNJ9eFQ5R2T
	 mQQgKPIQs4m6w==
Date: Fri, 3 Jul 2026 21:25:30 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
	live-patching@vger.kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Zelin Deng <zelin.deng@linux.alibaba.com>
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akgMqqdj3aLWoZPO@levanger>
Mail-Followup-To: Petr Mladek <pmladek@suse.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
	live-patching@vger.kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Zelin Deng <zelin.deng@linux.alibaba.com>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
 <akdx6xWTuv5Ga0YY@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akdx6xWTuv5Ga0YY@pathway.suse.cz>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:thomas.weissschuh@linutronix.de,m:nathan@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mbenes@suse.cz,m:live-patching@vger.kernel.org,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,m:zelin.deng@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13930-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0E3070519D

On Fri, Jul 03, 2026 at 10:25:15AM +0200, Petr Mladek wrote:
[...]
> 
> PS: I could take this via livepatching tree. But feel free to take it
>     via kbuild tree. I am going to wait few days until the discussion
>     settles down.

Yes, take it via livepatching tree, thanks!

Kind regards,
Nicolas

