Return-Path: <linux-kbuild+bounces-10500-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C227D12083
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 11:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 862813008F0D
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 10:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971D034D4EF;
	Mon, 12 Jan 2026 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4EjOOdup";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EnPLrJnK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A4B34D925
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Jan 2026 10:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215104; cv=none; b=mKKgcOzS5v2155K1HlSRp2r10FsgBfzQP2Palml88tZ722XX7Y2t2cLmuoyDZMrAcR3jlW2lGVWuciG0BtjR91zYUHkxAqCww1qQBgOTaxW8lW3Bt0DysI5Z2Auu2cMiNAR/SVYimwEX31Dd1sjC7DMV4M10c9BvsLF9w0VAR5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215104; c=relaxed/simple;
	bh=oMxnyE7FHNcMSzwSwznJpBbdErwKS8cGjHXO7MFPAQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTlZCWf8zVbs+Rio62EeEfU9eJo9hdrcqjT3k+/OU++dpbB2cVVRVMvxztfw2uJlE62Gq9AHysXN4q0Jz3HEA2AmZ2+m1itfe3w0MihSGdPNUG6qOli6XA1UQnw989BtJ+3L2xtPMiwT8MeGLyXSQ64hU8M1r0b1QH2CFL2fBrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4EjOOdup; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EnPLrJnK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 12 Jan 2026 11:51:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768215101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oMxnyE7FHNcMSzwSwznJpBbdErwKS8cGjHXO7MFPAQw=;
	b=4EjOOdupWWiKlK2rbWOFx9xHX6Mi8u1My7Ulr6BSHlQd7s2X2G7SOHCPYXXChmxxWeRWIS
	62wMlyruuI1zSjbgqgnNjvAbZbRR/m7UCVanCjDsGW8Q4gfopkB/miM9zLA7QWi+gzz9Xx
	8SpHOT24oO0D5UzS9Vg+htEmulCLbumDRig97/qNQ1BPc4Gt7H0KxHLqDjXMTnO1BMWgy5
	LwwWRIXdWQHxPwiuNF5Zi2Kocbdpk1xzXRAo3WvZ1lpLTfHOAJa0KZ27FczUDm3lajEM/4
	F1dZcPaMJxT2B/Z8vt3MF5SDPZSyRlfzpUvKg4w5cz8UNoIIknBZuBsqj0EJig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768215101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oMxnyE7FHNcMSzwSwznJpBbdErwKS8cGjHXO7MFPAQw=;
	b=EnPLrJnKw8UFHXsPTC5RqHgHie/Xa8ldBvPFyRt1jC8rJUscX3vk6qp4Ub2D4LfyDZCbvw
	63FBdnupJqm4SPAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: David Disseldorp <ddiss@suse.de>
Cc: linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/2] scripts: headers_install: filter ignored configs
 via sed
Message-ID: <20260112114650-7d38ec05-adfd-4f65-8605-67b051fcdeaf@linutronix.de>
References: <20260107205239.6390-1-ddiss@suse.de>
 <20260107205239.6390-2-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107205239.6390-2-ddiss@suse.de>

Hi David,

On Thu, Jan 08, 2026 at 07:39:42AM +1100, David Disseldorp wrote:
> The sed script currently prints any CONFIG_ entries carried in installed
> headers. A subsequent shell script parses this output to check whether
> the found CONFIG_ values should be ignored or not.
> Drop the unnecessary sed output post-processing and instead skip over
> ignored CONFIG_ values as part of initial processing.

The exlusion logic is going to go away completely soon:
https://lore.kernel.org/lkml/20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de/
(My series is probably going through the asm-generic tree)

Our patches will conflict.


Thomas

