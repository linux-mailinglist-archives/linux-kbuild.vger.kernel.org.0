Return-Path: <linux-kbuild+bounces-13928-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B9QXMrmLR2ppawAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13928-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 12:15:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8075770113B
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 12:15:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=MLwMamkv;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13928-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13928-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69FF43025A72
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2026 10:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0037E399892;
	Fri,  3 Jul 2026 10:06:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348E137E316
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jul 2026 10:06:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073211; cv=none; b=Fna8IUf4bAxP4v/X4s1o9U6tYMZEMBaIlErrrIHPahOJ/OVsSCMwWgSn9Git9wTDnr8zYpMXXjcs9snJJPPZGsSN6OkflAA18iRkShiKIEgc4Nyvu5cNnIA4VGBvs0Tw0x+g9O6fRtanrEiQbrsoy3eLObpWt6HcFpnb+EP3m1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073211; c=relaxed/simple;
	bh=laBEFR0I3RWvs1+Is2iqG1fnTejy7x7hXOUjl6aoww4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZwIWBykU9x8NTfE44D9CF18Pvvmis5zGbrmc2lIM1H6JAZdckLkkuup1wHeIoKwG0/aNauJKpWC8YyQh/WNMrmymK8dfPwApIo5CgP3211kWbXP8X/yH8WaqNm9xbwETtCjJOeCHjpFfIgMVtLEvrDQzbR8MN9Rpo5aVxFKI8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MLwMamkv; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so3182315e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jul 2026 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783073209; x=1783678009; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yYQ94JtDIgj0sKRw/RmLXkJVierqwHbIhkMFu0H0wXY=;
        b=MLwMamkv8W2fw6gTzpYGNNRnmThuKvGP9cz0Jtkvchs/8jvDdQa0acLfCJHJmErdmF
         9sSnt6A2qTZdpVrW740qiwnsUrKdFp0moALIFgt4DxKVQ2FTCTHkZFw47ZJVgOz57mkz
         DiimNL2vCUMGQRP/1bAyLsrQs0Jb+jUW3xAjxAe29rWBdrDbmncs/ZKMxdTs+UMB1geY
         9HdVrMk0bIAADafVoA8TEvTlrCtzMtf/gCOH/NYezVC3+LC3MPkubiDmgTZQJaujrQuq
         BALKr9G/iEdJJq9xHeU+tzbipTUwPGMh29zuRSSj5l5IypakFByLjgqSe7tjYJqlumpa
         mf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073209; x=1783678009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYQ94JtDIgj0sKRw/RmLXkJVierqwHbIhkMFu0H0wXY=;
        b=T0lg/+D66CCr3krtMRStbf4F73E+0xGrJMNbt8i/U5osEuXP9k6t2WMd1fSV9DBrJx
         DGQjqmrFuWH1qA8deYl5+gkE9Pimxgm3nmAfUkypIKlULLXCe47ORCX5c2C3zlcu3v6o
         gYFY/z0xtflDiYjoaVwKCTTd/w0g+rZVm9XxMyF6n1rGDSZyyXbLgpZjZEZL2Z6oNvZP
         9UKdtYZ2md2ti53zq0kTiqhOXW89fHUkzxxGgrpsRTp+lo5UUqsFHhrjNeaKz5ETK37K
         fL9lVfd80uluLTgGhfRRF/RpCkjCGINwm6O/euYoUFKB6OAqYemF1XVvf5zol0PvjEtA
         rqkw==
X-Forwarded-Encrypted: i=1; AFNElJ/rjIwpgI6ANC3B7JALJg6LIoP18WUsoZ4PBSxl8v7z5VAo0wkJ/Qzlpcf/7RYpnPfMRKTxsoXDrP//hIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBKHmOnhC89STjkwYqi7NiU85FKZS4ObY7q1fPjWh/8QGLSXtD
	If2+gkYG4I8/Gm5P5KEes5d4JRZZkF18p5CZ/tPmXqekgZD5zLZLYzm6lveNieoweok=
X-Gm-Gg: AfdE7clRJstYsdfzv1tTJ5pzkrV2WA8vVq6X5QfCB8ZYCQmEZk2fyiTX+DyPzO6ZD0W
	ywUPF3VbMj+X8ejtJ3zg7rdaIQsNMK39Ph5niqYqyYG0snErjtsufvXZxo5YHlL4sAvMWEsUoyb
	BSbdGIlDyzdwMGsfYLC742zgpi3Hv3RbJ9ZwZsUe7Xr6KJF05OBa2wP2VzWihahfv/lTa7Avchq
	Uy6JClGZLeT4aFjELAmbTrX1O68jR5a4X1YzjIkcPZZTnGTguctWz6CMxGz9EBdInRLqdm94/G5
	CTDVvAqKzXpUydHM1TtGsP8efBqPATmQqSci+Tn5+/hM6TmtDUNpWXFGzYQgFWl6FF4aet88HeL
	zLKDPHJwVOICONRmLQP6dbI0Oui7qAFWlqhG/n0Kd/koszBe13tREe6cwLSnQG9y9gR19+NgQ3H
	qg5nqOX10WhcaQp3M=
X-Received: by 2002:a05:600c:350f:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-493c2b6e607mr144501925e9.19.1783073208553;
        Fri, 03 Jul 2026 03:06:48 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef183e7sm222444665e9.2.2026.07.03.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:06:48 -0700 (PDT)
Date: Fri, 3 Jul 2026 12:06:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: sashiko-reviews@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Miroslav Benes <mbenes@suse.cz>, shuah@kernel.org,
	Zelin Deng <zelin.deng@linux.alibaba.com>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akeJto1TC2CSs4Yw@pathway.suse.cz>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
 <20260703061449.246801F000E9@smtp.kernel.org>
 <akdyH7rRV1WHtBJ3@pathway.suse.cz>
 <20260703113019-678f1eb6-a061-435e-91a4-c0d76794b2cf@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703113019-678f1eb6-a061-435e-91a4-c0d76794b2cf@linutronix.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13928-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:sashiko-reviews@lists.linux.dev,m:nathan@kernel.org,m:nsc@kernel.org,m:live-patching@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:mbenes@suse.cz,m:shuah@kernel.org,m:zelin.deng@linux.alibaba.com,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,vger.kernel.org:from_smtp,suse.com:from_mime,suse.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8075770113B

On Fri 2026-07-03 11:32:30, Thomas Weiﬂschuh wrote:
> On Fri, Jul 03, 2026 at 10:26:07AM +0200, Petr Mladek wrote:
> > On Fri 2026-07-03 06:14:48, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] Incomplete fix and inconsistent state: The patch correctly unsets `sub_make_done` for the `kselftest` targets to allow Kbuild command-line reevaluation when building external kernel modules. However, it fails to apply the same logic to the `tools/` and `tools/%` targets, introducing a discrepancy between build entry points.
> > > --
> > > 
> > > commit 06c418388d65deb3d8494a6e8e7071c0e709186b
> > > Author: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > > 
> > > kbuild: unset sub_make_done before calling kselftest build system
> > > 
> > > This commit unsets sub_make_done before invoking the kselftest build system to
> > > ensure Kbuild reevaluates command-line flags when building test modules. It
> > > mirrors a previous fix done for scripts/install.sh.
> > > 
> > > > diff --git a/Makefile b/Makefile
> > > > index b9c5792c79e01..f717a4dc96d6a 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -1591,10 +1591,10 @@ tools/%: FORCE
> > > >  
> > > >  PHONY += kselftest
> > > >  kselftest: headers
> > > > -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > > > +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > > 
> > > [Severity: Medium]
> > > Will make tools/selftests still fail after this change?
> > > 
> > > The tools/ and tools/% targets in Makefile delegate to the tools build
> > > system, which can also trigger external kernel module builds (like bpf_testmod).
> > > 
> > > Because sub_make_done is not unset for these targets, invoking commands like
> > > make tools/selftests or make tools/all will skip Kbuild's M= argument parsing.
> > > 
> > > Should sub_make_done also be unset in the tools/ and tools/% targets to maintain
> > > consistency across the build entry points?
> > 
> > This might make sense. I see that the tools: and tools/%: targets are
> > defined right above the kselftest*: ones. And they are even advertised
> > in "make help" or "make tools/help".
> 
> I am not sure how the tools/ targets can reach back into kbuild.
> The example with bpf_testmod above is bogus, as tools/* is only for
> top-level tools directories. Subdirectories in tools/testing/selftests/
> don't seem to be reachable.

I see.

> > Well it probably should be done in a separate patch. It would be better
> > for bisecting potential regressions. Thomas, Zelin, what do you think, please?
> 
> If we do it for consistency it should be its own patch, agreed.

I would keep it as is until anyone reports a real problem.

Thanks a lot for explanation.

Best Regards,
Petr

