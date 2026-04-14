Return-Path: <linux-kbuild+bounces-12780-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD/fLwkN3mlfmgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12780-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 11:46:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB73F82AD
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 11:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FC9B3015835
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 09:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7893CA4A9;
	Tue, 14 Apr 2026 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="QQ24Ydph"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95E238F65A
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Apr 2026 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159987; cv=none; b=o5eTVzmUbqzvZRYhu70ZAKhiUhFd4+2RvgCKtbBjsWobildxsE0wMDLrm3/+eRwN2dV2kNWCsx4IWEKIf2c3CRFxGg/PZWDq0Qx7aU47phdzf35k0Vy1l/GZ7fCHrWxgeF+lLfVd/Bed9q+5qq1D6ahFNZQAri2MNCW2t3sNCkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159987; c=relaxed/simple;
	bh=VCPvXFGr/aJNfeFnOM4zEEfuXlrNHdv576rJKjSF9Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwIcXfSPUfGJbu8ObqsqK3ZJzbSGAvErrVh3sKyPZnrYktfKMDsjpq770EbezlcUP+O9tdnFEdshazuzDSULdm7w92vM/6f/irQrN3m81kOT5QVxT7GoMa6TrL0b7K3/zKRROmCWaBKj+IMU2+dr0/QRCmyuzGWOBqUU94eyHJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=QQ24Ydph; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1776159658; bh=VCPvXFGr/aJNfeFnOM4zEEfuXlrNHdv576rJKjSF9Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQ24Ydph2PLkqWXKE2sSDiqqBPySn4iw0SQy6sBKX7asjdH4GjPRVJfJMk0PxSIMY
	 3O5YJ9wo4ey3H2jyBthKn+/kecvL8M4ZnwDFTZSurZvO+LcOPl1KgTkGrIYXKuIibE
	 K9uoVvLmg7/KMwh5BW9e/ue2ABJ9asSdfKkmFLRg=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <nschier-oss@avm.de>)
	id 69de0baa-7cca-7f0000032729-7f000001a0d2-1
	for <multiple-recipients>; Tue, 14 Apr 2026 11:40:58 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 14 Apr 2026 11:40:58 +0200 (CEST)
Date: Tue, 14 Apr 2026 11:40:56 +0200
From: Nicolas Schier <nschier-oss@avm.de>
To: Andrew Valencia <andy@linux486.org>
Cc: x86@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: Kconfig olddefconfig nukes 32-bit
Message-ID: <20260414-inescapable-true-armadillo-1ab7f3@l-nschier-aarch64>
References: <af3a3eea-ae34-4f94-b17c-43f154e80ff7@app.fastmail.com>
 <advGKvtLfEb1vwNK@levanger>
 <cc85769a-3f61-45bc-8773-322d3435bd83@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc85769a-3f61-45bc-8773-322d3435bd83@app.fastmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1776159658-5CD681B7-5D771457/0/0
X-purgate-type: clean
X-purgate-size: 2165
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[avm.de,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[avm.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12780-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nschier-oss@avm.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[avm.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCAB73F82AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[ CC: x86 (x86 arch specific olddefconfig behaviour) ]

Hi Andrew,

please reply in-line instead of top-posting.

On Sun, Apr 12, 2026 at 11:36:16AM -0700, Andrew Valencia wrote:
> (Re-sending for rejection of an HTML part by the list management SW.)
> 
> Hi,
> 
> This is for x86 32-bit target, built _on_ a x86 32-bit machine.
> 
> The issue appears to be:
> 
> config 64BIT
>         bool "64-bit kernel" if "$(ARCH)" = "x86"

This makes 64BIT interactively selectable only if ARCH=x86.
When using ARCH=i386 or ARCH=x86_64, the "64-bit kernel" Kconfig option
is not available in 'make oldconfig' or 'make menuconfig' etc.

>         default "$(ARCH)" != "i386"

This sets the default value for CONFIG_64BIT to 'y' if ARCH is not 
explicitly set to 'i386' -- thus for ARCH=x86 and ARCH=x86_64.

>         help
>           Say yes to build a 64-bit kernel - formerly known as x86_64
> 
> Which appears to say this config item is only enabled if ARCH is x86.  
> But this then makes the default value calculation invariant for any 
> target with this config item--it is always true, and thus always 
> 64-bit.
> 
> So things like CONFIG_X86_32 go away, and CONFIG_OUTPUT_FORMAT switch 
> away from elf32-i386.  Even if you're on a 32-bit build machine with a 
> proper .config brought over from a previous 32-bit x86 build.
> 
> When 64BIT is being introduced in olddefconfig, I'd hope it would key 
> off of CONFIG_X86_32 or something like it.

Running 'make olddefconfig' (w/o a specific x86 arch) lets 
arch/x86/Makefile choose a defconfig file for reference (cp. head of 
arch/x86/Makefile).  If ARCH=x86 (or unspecified on any x86 machine), 
the output of `uname -m` is evaluated.  If ARCH=i386 is explicitly 
given, the 32bit defconfig will be chosen, no matter what kind of x86 
the build host is; and the other way around for ARCH=x86_64.

Thus, if you build a 32bit kernel with your 32bit config file on a 
x86_64 host, you have to use

   make ARCH=i386 olddefconfig

if you want to use 'olddefconfig' to let the config keep the 
CONFIG_64BIT=n setting.

Does that help?

Kind regards,
Nicolas

