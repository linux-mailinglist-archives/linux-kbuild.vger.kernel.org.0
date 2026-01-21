Return-Path: <linux-kbuild+bounces-10767-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPfnLsvBcGmKZgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10767-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 13:08:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 840625684E
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 13:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 564E734AE28
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 12:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A61342C80;
	Wed, 21 Jan 2026 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SJuvf7wm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QvgkzybO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596F63A7F58;
	Wed, 21 Jan 2026 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997209; cv=none; b=CSKZZ1rZCXPXtvas716z4wtKi2Zg+9g0f1REVDkHt1Xfgcg8vylA7Me4/jh/Nn54NS7fIZVaHluHECncyPttWcws/NjqmULwWHfccEMadxX9jHd9g4luIAk4WT210B6OQm+fPWdCwAy0T04kvC3EtUcNU+oEL6oxZB42G1xtcAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997209; c=relaxed/simple;
	bh=xlgaYn7R57lvnBTtUgtVRZzLGUQHt0OHKjncSZoA7Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXUGDq427KxadlVro5d/yU4/yndOt6xVRASWb+lczVY4m2xs2bDr5dmICbWeT0c2FrEemPzGjlBi+ync2+11KqiG/0f4zyRYR1AXb1uznL+ENj3gVB9y1Gzfds4sx0jSu6SNtNDgirnXQ09l/XyOyYT3POHuKCIHpBtoAseDO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SJuvf7wm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QvgkzybO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 21 Jan 2026 13:06:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768997206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pMOlL52f21hJOSmHH01IW3iMpJxxgMgPiIY9YYSIzY4=;
	b=SJuvf7wm295ae9jOzKLhvw4zZDLCbTKcq0ETM2QAbcsFp70UrCNmVc6R/paTEMVDSLch8H
	uGlSo6B3quVieH6mcqrdysAzol5LxDZo3AlD3XOdkXW4yCDnMVjH5laVfDmdTDHW2A0dql
	q77n1xmPUYwXK7EktaF/FZtRvgWAHQDN/4J/b19i735JMWu53zwAM53U0hMotPNMapPDt+
	czQDNPVKTEcD1Zzq+oL2SM5q+jw+efmmC+UjrOYIFE3PZ83Kj7P7c8bU/y3T+rF41e6k1j
	nET0c/h/1W5d/lMTz5pQtk4Ldw78HyXFcdFOB2Ff1KQA//iGS5Q85Ko16KDPdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768997206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pMOlL52f21hJOSmHH01IW3iMpJxxgMgPiIY9YYSIzY4=;
	b=QvgkzybOHbgxTa6qtKAU0fBJE2ys/QnlIJbcrH0sBQKoPk9vdCPb0pf4mMz8zUYgnwM6My
	G98jrEF/uw/vHaCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/5] ARC: Always use SWAPE instructions and enable
 ARCH_USE_BUILTIN_BSWAP
Message-ID: <20260121130603-5f023f71-6f29-49ff-a32d-0f3baf30954f@linutronix.de>
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
 <20260112-headers_install-config-leak-v2-1-4d8084444603@linutronix.de>
 <aXC0Gl2GqF0LEQzZ@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXC0Gl2GqF0LEQzZ@derry.ads.avm.de>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10767-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linutronix.de,none];
	DKIM_TRACE(0.00)[linutronix.de:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 840625684E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 12:10:18PM +0100, Nicolas Schier wrote:
> [Cc+=linux-kbuild,nathan]
> 
> On Mon, Jan 12, 2026 at 08:58:29AM +0100, Thomas Weißschuh wrote:
> > Since commit 67a697e7576 ("ARC: retire ARC750 support") all supported
> > CPUs have the 'swape' instruction.
> 
> I can't find commit 67a697e7576.  Did you mead 
> commit 767a697e7576 instead?

Yes, indeed.

Thanks for the review!

