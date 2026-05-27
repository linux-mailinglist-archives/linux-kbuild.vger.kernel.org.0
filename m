Return-Path: <linux-kbuild+bounces-13379-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH2CARFtF2oqEwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13379-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 00:15:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E0D5EA948
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 00:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F32B30FEAA4
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 22:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367F33C6611;
	Wed, 27 May 2026 22:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbOISycC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BF33C1404
	for <linux-kbuild@vger.kernel.org>; Wed, 27 May 2026 22:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779920035; cv=none; b=KXP6XftkKWBPsq/zVjUcSQMGEdTYzzbF9cJMEbD9IWIRrKAWvUEF6vMEbw+aY22mY4chrd7XpKGex0IUsdNj9oquHkl1iUdtITTQHSBghbBypOK9MoL8VKg7Anb4WuQAersR+U5+vcDV2AJvWRNEAoOujtbxIQYdsOwvWJd12qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779920035; c=relaxed/simple;
	bh=vEPlucUnKC2eIYzfAOmTk5IPKn1r8XW8/aUl2SsBpmk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7txFNAtPWwdC8C2RwfXwOD3malIRk99uft/n3gZiejWKa77OAtdjL5XiFFhPkuwL4xuQhYf4wMzreB6dyomdwHdX1CA2JBQyzGQjU1+hzW6Kh+3NN3mmCZDKn3nGVjiuS8Dm5YKYh7wcDhPQpSsc1uoSulBN7RF1cdI8XS9w3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbOISycC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d146705b4so128664965e9.3
        for <linux-kbuild@vger.kernel.org>; Wed, 27 May 2026 15:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779920032; x=1780524832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qox1TiSpqfkd9GiZ8W/3HGU6KYxt7IfGtOMsuhPKfQg=;
        b=BbOISycCvdaSmBDWO4k/tVl1yUk1zncRddDXl9uhALpnJC2v1tIQObm9kOsceK6qAL
         xy8I71PlchdIYPtF+2deQ7+HCWfZ5Cb0VQsa841HYnDW+dQ2IohZjGN2ZlXwbXaf9gJ7
         ere06li6Pm/kiZPAJPwrNG+Epbr7YezHnKpSkZoF7ZLcAkUh+69il6PEGjBk4L82x/za
         m1Ksp1J39vv2GBmdGdSPuhAhBlokT/KWeQ2vB4AJXKZ/KddNbdjrsFFAiKX2uUsReQhT
         Udo4SunJkeX5Kc4dFMmAZstl1wH4IY3XwFJs+SRuSBovWjztJLunB6O3kAcfkLmj4hk5
         SUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920032; x=1780524832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qox1TiSpqfkd9GiZ8W/3HGU6KYxt7IfGtOMsuhPKfQg=;
        b=ec7tDtX2UdoEkGkkt+J/yNthnDaVoQqxYaObTujtV7LMdUGVgCZMd7p5k6s0YgQ7y2
         xN3bkpUg9rKp0PFJazPNP3AjXwn/rHB7O53RUbrECAV+KfDX9IVgWrLDBBd0G+IcOqAU
         f48ERi5jM47A9iPliWMz8vvR16kwYXKKGOClovZCWElKjf9AuZed+E1r5lsLGTqZpI4j
         mOMnSXc07tdWQnIm2XPqLlWw8OjvsL4BnPPvDDCjOJ5q8ezCmOcXG2mBoibGalJ/7P4/
         nbRiFOskyinePp7BCBWc57r1nQErGj7mbuMFPhg820XCSjYEhEigdY8Ytpl4KJKXgeQ0
         znkg==
X-Forwarded-Encrypted: i=1; AFNElJ9GwV4a1STIB8nvGCnQqpRB7eNInUQtkZtc1FWMXWtSvonfmwcxra0FpZxF8V5lk/9HgMHbUu1yrYIL5xU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84P0hTu4754mcusqNFZ8xHu/bPHXygRxgt+s7WucKsxQtdwmn
	B/YTRGFZTXs6eYWjnmQnya1Uyr3Y3ZIIC/duturTrAPVPh2dlapbxuiL
X-Gm-Gg: Acq92OHF3kEIM/23IlNpweH99WhZNBeayTLJlJkvTVXwlFxh65inmMW1PwS1SywRO41
	BOQcx1QomJjGze+5SeiQY55TQ7dqE80z2MKt4cXWC261pShRoFmAQStRQ4FUFdIEQ3OAZ7KBwVv
	IO+8pQSscr6GOwEnEGzetdF7MOTnZAgxA3yaVs6hdlJt4gTuPxBXuZIUHQNbrZYaVb3oTFjoUua
	68mDcrV6BFVVfQfpiWIzQuVOkVOppyxDVCFPSWGug+G9dHDiIIHrPLXVq8BUOZDl9DUY9Af+Pk4
	n6mW84PVazA9k9UJwu+L4v33XFCleWNN5D7per2TIUSt48V0GBVmnmk048H0Q3oUe9qciXKa2Hi
	aY1hqirAqHHkpMXifiIsfhu/18IQqdq39ZL7iD4ustFHtw7T/vBISdUvYaomO58HheELhiSP0Tf
	4GiDx4himSewR6GZ9ZUQbjIEglheph2UD6qEITZ4nOxjqoV5FwOWyPSuCRF2TOzqukVksHz0MAE
	SKff0ohDRdjMw==
X-Received: by 2002:a05:600c:4ecc:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-490426cd8a4mr386738845e9.21.1779920031705;
        Wed, 27 May 2026 15:13:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454b1ab3sm476390655e9.14.2026.05.27.15.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 15:13:51 -0700 (PDT)
Date: Wed, 27 May 2026 23:13:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Alexander Lobakin" <aleksander.lobakin@intel.com>, "Arnd Bergmann"
 <arnd@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, linux-s390@vger.kernel.org, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Christian Marangi"
 <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org, "Steven Rostedt"
 <rostedt@goodmis.org>
Subject: Re: [PATCH] err.h: use __always_inline on all error pointer helpers
Message-ID: <20260527231349.14bdcfc6@pumpkin>
In-Reply-To: <21f771b5-b8fe-4357-b081-ae83a39df485@app.fastmail.com>
References: <20260526101851.2495110-1-arnd@kernel.org>
	<b5e15330-ed64-4f31-bea2-bb877a24c1ce@intel.com>
	<8e50449f-66f0-4e85-aefa-7016697fe722@app.fastmail.com>
	<9398ee4c-3b51-4a00-a0d5-3674ce1b1081@intel.com>
	<21f771b5-b8fe-4357-b081-ae83a39df485@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13379-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linux-foundation.org,vger.kernel.org,linux.ibm.com,linux.intel.com,gmail.com,goodmis.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[godbolt.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arndb.de:email]
X-Rspamd-Queue-Id: 94E0D5EA948
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 16:25:41 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Wed, May 27, 2026, at 16:06, Alexander Lobakin wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > Date: Tue, 26 May 2026 23:03:50 +0200  
> >> 
> >> Without CONFIG_PROFILE_ANNOTATED_BRANCHES, the changes are
> >> very small, with around 100 functions growing or shrinking
> >> by a few bytes.
> >> 
> >> I don't think we care much about the size increase when that
> >> option is enabled, but I do wonder what behavior makes more  
> >
> > Yup, and even without this option, __always_inline is better here
> > regardless of how it affects the size. Such oneliners must be
> > transparent to the compiler  
> 
> In general I would trust the compiler to make the right
> choices here, but as I have shown it makes very little difference.
> 
> I think one case where an out-of-line copy may legitimately
> be generated by the compiler would be when optimizing known
> cold code for size and the compiler can show that the
> out of line version is indeed shorter.
> 
> >> sense regarding the annotation for every single IS_ERR(). 
> >> Does it make sense to have every instance get its own counter,
> >> or would it make sense to actually try to reduce these
> >> when profiling the annotations?  
> >
> > I'm not familiar with branch annotations, but from the stats above, it
> > really looks like it adds a lot of code bloat. Plenty of branches in
> > the kernel are sorta pointless to track (the ones which trigger once
> > in a thousand years, the unlikely() ones etc.), I guess.  
> 
> Yes, the CONFIG_PROFILE_ANNOTATED_BRANCHES option definitely
> adds a huge amount of bloat. The point here is to find
> incorrect annotations, either a branch that is marked unlikely()
> but taken most of the time or the reverse. I think
> Steven Rosted enables the option occasionally to
> see if there are any outliers, but nobody should use
> this in production environments.
> 
> For IS_ERR(), it is fairly clear that unlikely() is the
> correct annotation in almost all cases, and it's helpful to
> mark all of the error handling as unlikely so the compiuler
> can move it away from hot code paths. With 35000 instances
> of IS_ERR() there are likely a few exceptions to this
> rule, but I don't know if any of them are important enough
> to require a code change. Steven might remember if he's
> ever seen one here.

IS_ERR_OR_NULL() is more interesting, see https://godbolt.org/z/z3b1Yxqe9

The last one ((unsigned long)p - 1 >= -MAX_ERRNO - 1) only contains
a single branch.

I'm sure I remember Linus ranting about something similar.

-- David

> 
>      Arnd
> 


