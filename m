Return-Path: <linux-kbuild+bounces-12928-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J9nKSro8WlZlAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12928-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 13:14:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C52E49363D
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 13:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C70783010256
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 11:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE60A385507;
	Wed, 29 Apr 2026 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nUIBLiwh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB02BFC85;
	Wed, 29 Apr 2026 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461287; cv=none; b=khOg+oFitCDA2Xz1NWzwrFTeeSQnVEemVuV5vfdB+1DRrPPogiljbWgKvN1MIO7kzWCwVupNgtFWNZVkMAomkovr+P2xkmkG6LJp4LYCJzVKl2Tbi853s3SXextiaJgPtsiBhQhO/EkdmYOYD9YUv/ixfCypYtpxR3oi1xtBXZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461287; c=relaxed/simple;
	bh=ON3ZXNp2mNn0teuGO1Qch5RiWn/snTfcpl/leGkxYho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdiucZTIhcASizJi9HKfT2fgYqga2ZearvUNKMY2lCaRmcflNgWVQQE18GzrV5jONjsS1K8LrzxtcG0QQD1Ih2uExSsaMKiaUgk0Fk8SHzlJZwMgejFzNX/CxChUJ3yUnaxPx58Vbr8FAo2ydd/6S4KEPVD05qwSbad0aIcgiBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nUIBLiwh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777461284;
	bh=ON3ZXNp2mNn0teuGO1Qch5RiWn/snTfcpl/leGkxYho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUIBLiwhS6K0U2ji2ZtCW8eb1K2wMFJlY3SD7I5H5EGw4KPX0AQoBXWopwJu8LbGX
	 tAo8L3j/r5oy7oVLVN7IfKLFC9S6xwdvCU1t1nvLiLuiXdLPhjGX/uqorTIBv94PyH
	 W3lS2bGH6mEWcFr2Lx3I71qjsh4T2o05mj9lTFAY=
Date: Wed, 29 Apr 2026 13:14:42 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: David Gow <david@ingeniumdigital.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Subject: Re: [PATCH 2/2] kunit: qemu_configs: Add or1k / openrisc
 configuration
Message-ID: <19c00a88-ea92-4f17-afb6-9fa5da247d21@t-8ch.de>
References: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
 <20260427-kunit-or1k-v1-2-9d3109e991e8@weissschuh.net>
 <279a16dd-f98f-44ef-9685-44537eac2892@ingeniumdigital.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <279a16dd-f98f-44ef-9685-44537eac2892@ingeniumdigital.com>
X-Rspamd-Queue-Id: 1C52E49363D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12928-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linux.dev,davidgow.net,vger.kernel.org,lists.linux.dev,googlegroups.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On 2026-04-29 18:10:58+0800, David Gow wrote:
> Le 28/04/2026 à 12:04 AM, 'Thomas Weißschuh' via KUnit Development a écrit :
> > Add a basic configuration to run kunit tests on or1k / openrisc.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> 
> Thanks very much. This works well here (assuming CONFIG_KUNIT_FAULT_TESTS=n,
> and either a long timeout, or slow tests skipped, as qemu-or1k is not fast
> on my machine).
> 
> Reviewed-by: David Gow <david@davidgow.net>

Thanks!

> Do we want to split the series and take this patch via kselftest/kunit, and
> the generate_compile_commands one separately, or just pick both up in the
> same tree?

They should go through the same tree as otherwise kunit.py will fail to
build the or1k architecture, as it always tries to generate
compile_commands.json.

(...)

