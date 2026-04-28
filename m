Return-Path: <linux-kbuild+bounces-12906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLAAEqcF8WnhbwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12906-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 21:08:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B118548B06A
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 21:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5515D3054B97
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 19:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4EF378821;
	Tue, 28 Apr 2026 19:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fcf8SScX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714C324501D;
	Tue, 28 Apr 2026 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777403297; cv=none; b=njMaAWqo1nRog5DFsqAhVifNuCZU8kOy7Tr34vd/khXrAv0rMPkflbASfnDHL7QPHMl8a5fPhe1rqWKjqSnt3BiTfP3efwOebqthAKhzGBwcciEKw7U17HWk8TrhEIVfs5ZkBnNvsiXIkm3Q96IIn2jYH1WLH43mK9FUdlyK4TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777403297; c=relaxed/simple;
	bh=xvsDYCme7eftf2IRguclZo3RDCq2rrXBQCxYPz9OJFc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UUIDgjtdSAxJ0XAaoWGOMIv3Z0rmMNnyT9iQQtm117AIrWJxQIZoSvL2Uvh+D9c1oVz/cosmTy8kkd6qnrYBoWWMt7S3JwnosfQIM+/Uq5y/c9nAUM5gHpjE8XPivPHRExfDXFhF7UrZDTW2SToEs6FNe8uGOJSjdjmKCoyWmEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fcf8SScX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1971E410AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777403295; bh=Qig114bVhtz6joUvF87WAcmR+wnwEJvLRPuFf4Omcrs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fcf8SScXmV+6MLN/3mCoW9Qf9IJ35E6c47Z1PG92IUd2QFnRvTnGV7hSgEw+dMp3U
	 OekRaC/6kNAETFhOAll5oJ7VeGmoYYVP4amNbMSUE7H1cveMCDNU51KLnsBik74yIZ
	 9LlEfW9/oZ2KG4yjaEmMTwpD/Hf1tRydU6Xu6P7es+zleD09xcqvPZ3dojRViTekLR
	 q5cTYiJGnpwihbT7+Pk3vZjf+JfdIIPxwL7W2pKWONM2s2yNfNZ36PbzwP/vZqIgRS
	 qjZ5LH2wQYOMRmKcSY7N2aTY0Uj0yOTNLq9drCCsC5vi9Je5g4KBiNyt/4cqppmFxx
	 EVdubtz+mVFMA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1971E410AA;
	Tue, 28 Apr 2026 19:08:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, akpm@linux-foundation.org,
 ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 masahiroy@kernel.org, nsc@kernel.org, ojeda@kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] scripts: add kconfirm
In-Reply-To: <20260428183101.GA3304253@ax162>
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-2-julianbraha@gmail.com>
 <87mrynmuuu.fsf@trenco.lwn.net> <20260428183101.GA3304253@ax162>
Date: Tue, 28 Apr 2026 13:08:11 -0600
Message-ID: <877bpqlx7o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: B118548B06A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-12906-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kernel.org,arndb.de,linuxfoundation.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Nathan Chancellor <nathan@kernel.org> writes:

> On Tue, Apr 28, 2026 at 01:01:29AM -0600, Jonathan Corbet wrote:
>> Also, a nit, but I would really suggest putting it under tools/ rather
>> than in the scripts/ dumping ground.
>
> As if tools/ isn't its own dumping ground? :)

It is more structured and more amenable to useful MAINTAINERS entries.

> While I can understand the desire to avoid adding more random stuff to
> scripts/, it sets a confusing precedent because tools/ is not a part of
> Kbuild, so I would not expect tools that would run within Kbuild to live
> there (which this one appears to do). While there are obvious exceptions
> such as objtool and resolve_btfids,

...and the docs build system...

> I would like to avoid adding new
> ones, which aligns with the comment added by Masahiro's commit
> 6e6ef2da3a28 ("Makefile: add comment to discourage tools/* addition for
> kernel builds"). Maybe this could be mitigated with a tools/kbuild/
> directory or something but not sure. Just some additional input.

I don't understand that reticence.  As we build up more tools, why not
organize them in a directory tree, perhaps called "tools", where we can
track who's responsible for the various subtrees?

Thanks,

jon

