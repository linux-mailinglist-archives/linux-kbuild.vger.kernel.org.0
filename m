Return-Path: <linux-kbuild+bounces-12259-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM+4NGwHxGk+vgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12259-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 17:03:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEDA328A44
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 17:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A749B3105525
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 15:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584D03D9024;
	Wed, 25 Mar 2026 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zwxA57Sc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PuXSjlqy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B73D523E;
	Wed, 25 Mar 2026 15:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451835; cv=none; b=EuBfqESAKN6qo1q0qILIcy2zmnsLiUwsuHCgtsFbodDOhpfDMqPM8fekWaLjTdN+WESICZF0jJqHX87RuQbm3He9sbZj2bG4UK1ZRPw1KPUG97GVX0HPFaZj+ZLVDkCcTNopMv/c9vJEdVGhvT6qKzqN2KME8sKzGkvj7h8Gsl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451835; c=relaxed/simple;
	bh=GEVodloLR7Mb7HYHhfdt+IrjJ27gzgcZUBO6PGtAqNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4KLK3qGEa9fZMhLI7qneM6dNot3tOVGwqGWZgk1Rsjw8spklaB3qUo4N6r8wL9grqsn05pMJQ8ey+vrbDTg57d+IK0C9tjNVVPqvfRe9ZoUzO9DG6TbfPWVchpBWNeDEM4jQdnJ0db2HMA5fLUfRUZ2eUZQKfjdfbIyKqjLXcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zwxA57Sc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PuXSjlqy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 25 Mar 2026 16:17:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774451831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6V1FW5uH5af3L4LieaOmbNNe9Ykt11ITVEbrhLfFPDQ=;
	b=zwxA57ScDtzY3CKqnBtWA76MqEkrptDQmbcZLnCODqjoNwO0Qya0Do3WphxVjqHgMaP4Un
	GdosbmER3x91EE7rS6vUMRk6/l/00wSYixSfv0tKAkNtBqLqRKh9PaBSJ3q8KnZFqHsHIf
	eywQLBmxVbkBVC/oajNe6ZltGzgVPqVSs6rf1JrWTRDwJZ4EPAbXCm+FGkYhoah3atZuo7
	Zfrn3fNDizX3svJnCLxm80+ZK/qmrW8q7lwvgtGwc84PxG5ZNpznWeTBWYZTyiWd/RUR1Z
	oiUU0uP4TQYM2WFNcG5S0R3T50kb+J2klb/oTWJBi5lks/q0kH6TdCtVrgyOWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774451831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6V1FW5uH5af3L4LieaOmbNNe9Ykt11ITVEbrhLfFPDQ=;
	b=PuXSjlqymhjFUocAdGE4TX+9F1WM4ccsUS7A09s68i3mVa6HBTsPJOoM11FlPhda99EAzC
	RdV2l8QooIc1JZDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Janne Grunau <j@jannau.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Simon Glass <sjg@chromium.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Message-ID: <20260325161613-ee5a9561-af20-4d0d-99b5-2b1207b4c5ec@linutronix.de>
References: <20260325-kbuild-modules-cpio-pkg-usr-merge-v2-1-339ac87d82ea@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325-kbuild-modules-cpio-pkg-usr-merge-v2-1-339ac87d82ea@jannau.net>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12259-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,jannau.net:email,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,systemd.io:url]
X-Rspamd-Queue-Id: 4AEDA328A44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 03:57:25PM +0100, Janne Grunau wrote:
> The modules-cpio-pkg target added in commit 2a9c8c0b59d3 ("kbuild: add
> target to build a cpio containing modules") is incompatible with
> initramfs with merged /lib and /usr/lib directories [1]. "/lib" cannot
> be a link and directory at the same time.
> Respect a non-empty INSTALL_MOD_PATH in the modules-cpio-pkg target so
> that `make INSTALL_MOD_PATH=/usr modules-cpio-pkg` results in the same
> module install location as `make INSTALL_MOD_PATH=/usr modules_install`.
> 
> Tested with Fedora distribution initramfs produced by dracut.
> 
> Link: https://systemd.io/THE_CASE_FOR_THE_USR_MERGE/ [1]
> Fixes: 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
> Cc: stable@vger.kernel.org
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Janne Grunau <j@jannau.net>

Looks reasonable.

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>


Thomas

