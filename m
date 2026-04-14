Return-Path: <linux-kbuild+bounces-12781-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFldBrsU3mlBmwkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12781-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 12:19:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D8C3F8921
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 12:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4234305FEBD
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 10:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B674D392837;
	Tue, 14 Apr 2026 10:10:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3F4317155
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Apr 2026 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161422; cv=none; b=ZgLNHoiwnYme1XTu0+eHRJAikuwKBsRKnIOssVCrp9zsFjRrwZDvBD0477SVK95BBTxKINxX2rVVnIMplT6x4fE1W0M5/8Ckz2+DiEYh9Ihlsl03QNjnSDGYP3ZUtUkjFsISFKy4fWWjsSnk4juHwM/D16uoSiz6YXbCtGjINmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161422; c=relaxed/simple;
	bh=uqZMWrwhfG+vpxeqGY7KauI5PFZV26IGtP22OXksh/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZVos/EMs4MNC5GanS7zFB0OeN96bcTYmb1FYRVdElFsTa+pWkEyt85yvnmRPmXGgleCzBThc+NwyAjmg1CbelGtDhIImQNfxqG3hoc6wdTFMf9JU9g/gWUYJDTRFvVK+Kyd3/59ahsU/tNARIoMwS1nCzW9WBvxN+ul3xxyzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <nschier-oss@avm.de>)
	id 69de114c-1e6c-7f0000032729-7f000001e012-1
	for <multiple-recipients>; Tue, 14 Apr 2026 12:05:00 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 14 Apr 2026 12:05:00 +0200 (CEST)
Date: Tue, 14 Apr 2026 12:04:58 +0200
From: Nicolas Schier <nschier-oss@avm.de>
To: Andrew Valencia <andy@linux486.org>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: Kconfig olddefconfig nukes 32-bit
Message-ID: <20260414-marvellous-saffron-toad-8aaefb@l-nschier-aarch64>
References: <af3a3eea-ae34-4f94-b17c-43f154e80ff7@app.fastmail.com>
 <advGKvtLfEb1vwNK@levanger>
 <cc85769a-3f61-45bc-8773-322d3435bd83@app.fastmail.com>
 <20260414-inescapable-true-armadillo-1ab7f3@l-nschier-aarch64>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-inescapable-true-armadillo-1ab7f3@l-nschier-aarch64>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1776161100-32F1A373-6652996A/0/0
X-purgate-type: clean
X-purgate-size: 2395
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Spamd-Result: default: False [0.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[avm.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12781-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nschier-oss@avm.de,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19D8C3F8921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 11:40:56AM +0200, Nicolas Schier wrote:
> [ CC: x86 (x86 arch specific olddefconfig behaviour) ]

typo in x86@kernel.org, resending



> 
> Hi Andrew,
> 
> please reply in-line instead of top-posting.
> 
> On Sun, Apr 12, 2026 at 11:36:16AM -0700, Andrew Valencia wrote:
> > (Re-sending for rejection of an HTML part by the list management SW.)
> > 
> > Hi,
> > 
> > This is for x86 32-bit target, built _on_ a x86 32-bit machine.
> > 
> > The issue appears to be:
> > 
> > config 64BIT
> >         bool "64-bit kernel" if "$(ARCH)" = "x86"
> 
> This makes 64BIT interactively selectable only if ARCH=x86.
> When using ARCH=i386 or ARCH=x86_64, the "64-bit kernel" Kconfig option
> is not available in 'make oldconfig' or 'make menuconfig' etc.
> 
> >         default "$(ARCH)" != "i386"
> 
> This sets the default value for CONFIG_64BIT to 'y' if ARCH is not 
> explicitly set to 'i386' -- thus for ARCH=x86 and ARCH=x86_64.
> 
> >         help
> >           Say yes to build a 64-bit kernel - formerly known as x86_64
> > 
> > Which appears to say this config item is only enabled if ARCH is x86.  
> > But this then makes the default value calculation invariant for any 
> > target with this config item--it is always true, and thus always 
> > 64-bit.
> > 
> > So things like CONFIG_X86_32 go away, and CONFIG_OUTPUT_FORMAT switch 
> > away from elf32-i386.  Even if you're on a 32-bit build machine with a 
> > proper .config brought over from a previous 32-bit x86 build.
> > 
> > When 64BIT is being introduced in olddefconfig, I'd hope it would key 
> > off of CONFIG_X86_32 or something like it.
> 
> Running 'make olddefconfig' (w/o a specific x86 arch) lets 
> arch/x86/Makefile choose a defconfig file for reference (cp. head of 
> arch/x86/Makefile).  If ARCH=x86 (or unspecified on any x86 machine), 
> the output of `uname -m` is evaluated.  If ARCH=i386 is explicitly 
> given, the 32bit defconfig will be chosen, no matter what kind of x86 
> the build host is; and the other way around for ARCH=x86_64.
> 
> Thus, if you build a 32bit kernel with your 32bit config file on a 
> x86_64 host, you have to use
> 
>    make ARCH=i386 olddefconfig
> 
> if you want to use 'olddefconfig' to let the config keep the 
> CONFIG_64BIT=n setting.
> 
> Does that help?
> 
> Kind regards,
> Nicolas

