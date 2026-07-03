Return-Path: <linux-kbuild+bounces-13924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aITSI852R2qOYgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13924-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 10:46:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D747003D3
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 10:46:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Os+GC+hH;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13924-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13924-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 736363035386
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2026 08:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BE5340409;
	Fri,  3 Jul 2026 08:25:21 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C5C3403E0
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jul 2026 08:25:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067121; cv=none; b=MTeGjwmEbfnmhhKBuUXjMTVKaf9XgjxgRhPm7Zau6Hr0D3neigAEcEbkDYVeKyIDVX8S8GJhx5o58brfdv2w/9NXDcS10LDhZwgke12fvNRO7fx9NAPz/OarRgvvRVk40qwRNtgTnYuTwS/8Iw13WHhoHwpJ2lIdR3A222V37aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067121; c=relaxed/simple;
	bh=FMD/ZdR5TV/zMpIaXaekNOgBHrcVT9Hf7I5g9Mfv/xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmxIeGzFNi5+y3tpXNBOJ3Brv4ms3XKStaiA/MP9x8KYPVl1W/Y3UOe8wbuPdv5SEDunZrD/e68RHlp5CUGZr6U8Xyh1hOOwJa5wcHkbd9qDsYCIDttNPUOmpcaVztV1jqD9/oAm61B/JbYsinBwZKmA2YU3PVXxhQEz0MM39M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Os+GC+hH; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493ba701891so1989335e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jul 2026 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783067118; x=1783671918; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxHYpki4yEEhqIJwGY1xJ1lg0TosZM+PSkKjRYtqjgc=;
        b=Os+GC+hHMQkfgqxPFwtpcjfUFeDUXDrf5RlC1bAZYewXZlBRFJY/dz2Ffn0/h8cXzz
         +tY1L272fS+oTayj5xKzShUaJ8cJqY5AHXSX0TYCCB4H0y5tjuKh07sjWxwJauaCoBfy
         j1N7PP3AGIiC7sxNZKaeEGZsi8y2G4Los8TZM6UNGutn1kX1zXYQ9v9ew9KUASHFUpRn
         r/H+SD33Mbe/flHkLiKLoKzrt4sRjGpr3iaxQAG+JFm6gQ9Fij6SuRSAj4DosElKRfgD
         N+eWst96LQNkZKGP1ZDwpJ1PoHwzac0YjTcwx3cEGqgVLobgMqci08QSsC9T3djva+TN
         ZNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067118; x=1783671918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yxHYpki4yEEhqIJwGY1xJ1lg0TosZM+PSkKjRYtqjgc=;
        b=ZoJFDXQFRyC5Twi9Sn6ZJn+J84VNLrCLf7cPGgWVN7sITfgFdMKAjSMOU/7ehd0RqE
         7AYlTg3gc3h8CpWM3fnw9ZZgaEywQ63qrYE3jrKGd7fqEA+7jL3auvdFX9esecZPvsBC
         08qpGcNTKcwbZPF2bZ/peDwWM3KDY8+INDVo+QA99zB9kd86jVIm7MC8fYtqB5sS2R/d
         8Rfa2GrMihw5EvxfseOjAxslVlTWeGLqG092Dd5pZnw3PTItDw1NHAZEReqa0+djKUra
         v62RZXRybEIt3XuBn7RTcmY4CRiMDu35t4gL9PIJ5bfQeqCqHEJfe2qkTrGG5AVwmd6S
         8gnA==
X-Forwarded-Encrypted: i=1; AFNElJ9XdmPsXgdc4CftyejCj4HVBGdAnxXFQPS2OZETGvZu+nAkBRV8dtXgCWDrZFFQqQKIgcL5CFQQs6qucYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGUIZlax3v5TiBikH8QtV1BDfpuXRx5HoIfC1M3QfIpzDA8u8S
	YG16t+vR5kL4+4J9kWVg7HvQGrF4xtHJsVzoUhyHM7pxcKDTvkqffHnWYUslBLHTlEQyO8kktX1
	Y0xJmEYk=
X-Gm-Gg: AfdE7cmeJi/BawFyc2LNfA3f1rH8rapoSpgi16O3biJc0rXkHPYplROv6JRacQSSY9e
	O88z/yPLSOb+zrt1HLLdx9SZp7gflYYlw0vLFsvizsy8TdMTtDLc8QmAi9A72N3qiN6M9E3EFak
	ZuYbE5wMMOOQcMswPqwtbxjxaPNjvDLwNTNfaPrZSgQPJBJi9iBumQvc/fl82IAW64/Gl0Hg9jb
	5FR3J0OWoXnCdU1sR4tlrtVN2NcH/iLx2Et2V/361tZaFnb55BBvyC30/OCYg1Ll/2jzCPi6ssQ
	KRRIxFqeTZFLd3vDWe/pAlXcaMXQJrq44egL2hSRbqXVVLoj5BI749yhQDeh466XZ36x18+640l
	/IQvGWgmj0BfcTaWd+8NiSK8VT/4cBP3DIbdTOJyOjC1IuLtY0+/V/xXb93MIjRgmJIr5ANuxGd
	cv1alAdoDH6qkdsgw=
X-Received: by 2002:a05:600c:a4a:b0:493:a96b:fa0b with SMTP id 5b1f17b1804b1-493c9bc6d44mr45352795e9.24.1783067117809;
        Fri, 03 Jul 2026 01:25:17 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm28999435e9.4.2026.07.03.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:25:17 -0700 (PDT)
Date: Fri, 3 Jul 2026 10:25:15 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miroslav Benes <mbenes@suse.cz>, live-patching@vger.kernel.org,
	shuah@kernel.org, linux-kselftest@vger.kernel.org,
	Zelin Deng <zelin.deng@linux.alibaba.com>
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akdx6xWTuv5Ga0YY@pathway.suse.cz>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mbenes@suse.cz,m:live-patching@vger.kernel.org,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,m:zelin.deng@linux.alibaba.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13924-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92D747003D3

On Fri 2026-07-03 08:04:08, Thomas Weiﬂschuh wrote:
> The kselftest build system may recourse back into kbuild when building
> test modules. In that case kbuild needs to parse the new flags passed
> from the command line, instead of using the ones inherited from the
> kbuild invocation.
> 
> Force that command line reevaluation.
> 
> The same was done for scripts/install.sh in commit 14ccc638b02f9ec
> ("kbuild: cancel sub_make_done for the install target to fix DKMS")
>
> Reported-by: Zelin Deng <zelin.deng@linux.alibaba.com>
> Closes: https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/

It is great that you added references to the related commit and
the original thread.

> Fixes: c9bb03ac2c66 ("kbuild: reduce output spam when building out of tree")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

I believe that this is reasonable solution:

Acked-by: Petr Mladek <pmladek@suse.com>

Zelin, could you please provide your Tested-by, please?

Best Regards,
Petr

PS: I could take this via livepatching tree. But feel free to take it
    via kbuild tree. I am going to wait few days until the discussion
    settles down.

