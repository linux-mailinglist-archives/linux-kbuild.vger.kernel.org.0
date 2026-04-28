Return-Path: <linux-kbuild+bounces-12898-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O5FKYpb8GlJSQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12898-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 09:02:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30347E687
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 09:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96B5F302FA3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 07:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1E83793BD;
	Tue, 28 Apr 2026 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="U+/zQodY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165137267A;
	Tue, 28 Apr 2026 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359695; cv=none; b=ket4O1A9ajFS4/GjmxpHdzoWofhJ0fFqfnS0W1GQJJQY+DhmNj2GXtlivBY6FHx/pf3dAnE/lg14sIlUxvd48OoiMSNanONSAk6yqOAfv9FJfZuXR1b4RrV/n5VTM3b4uHmjsyj4qMm7ch44cDW0SP6HxXqbxbckqkAiAGffR8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359695; c=relaxed/simple;
	bh=Qyfax9b2PWaORu+5g08cf0wvuZbpx4bQxHNJdxSztfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nbZTqggYU0ylYz/jqc4wGPjUvKwGiQinjHugqWdEAkERTPcbE9QljzvvHnAUA1jGQ3Yd984iLBR395+tYDcLO/coHWpFfTMJYMupAB1ulpzxOkISLuPHcYY42KvKSeaOYt2EgSf3dNd2G0OIMGLwAmwq9IrcNxhmrRCbfJUZt2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=U+/zQodY; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 24B0040B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777359693; bh=Qyfax9b2PWaORu+5g08cf0wvuZbpx4bQxHNJdxSztfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U+/zQodYv4dtWJpSq+X3pDYO989SyhtcnEIUaLEQ2AQNnXNEudHeIbW7jXTyN9jwy
	 sR7/06C/tT7GR7tZvKZu9nrkA2Mip6yNyqNaxIRSAP2zCvWsQdXTcY6mu3DdOboalY
	 UbCVdp3PrPZctrA9DRxHWtCED1T6I64kWti55YpwEN5DsGShWsk6MRMF180Rb8dEbJ
	 g/ERGLUnDX/nFzVaDbTXejJT+qD5N1O210aLXo57YwC6ZQoKNOcw97JNMEFAIdxDys
	 2vpSZRudmITmRZ5SvdbyQN825ExVUuP+iwEOd9i3GgA8bGY2KjLIjF/LRdNnmPJQw/
	 7/KX5GM69T/PQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 24B0040B0C;
	Tue, 28 Apr 2026 07:01:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Julian Braha <julianbraha@gmail.com>, akpm@linux-foundation.org,
 ljs@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, masahiroy@kernel.org,
 nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Julian Braha
 <julianbraha@gmail.com>
Subject: Re: [RFC PATCH 1/2] scripts: add kconfirm
In-Reply-To: <20260427174429.779474-2-julianbraha@gmail.com>
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-2-julianbraha@gmail.com>
Date: Tue, 28 Apr 2026 01:01:29 -0600
Message-ID: <87mrynmuuu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 1E30347E687
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12898-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]

Julian Braha <julianbraha@gmail.com> writes:

> Add kconfirm into scripts/ and modify the root Makefile and
> scripts/Makefile accordingly so that it can be compiled and run with:
> `make kconfirm`
> from the root of the tree.

As Greg noted, it would be helpful if you said what this tool does in
the changelog.

Also, a nit, but I would really suggest putting it under tools/ rather
than in the scripts/ dumping ground.

Thanks,

jon

