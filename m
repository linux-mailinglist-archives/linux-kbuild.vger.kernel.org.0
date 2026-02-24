Return-Path: <linux-kbuild+bounces-11404-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG/cHmqVnWnKQgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11404-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 13:11:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCCA186BDE
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 13:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C68E30333C9
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 12:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BD23803F8;
	Tue, 24 Feb 2026 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="a0pignQz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968B92405E1;
	Tue, 24 Feb 2026 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935078; cv=none; b=e5KdsO1jlW+6fwhIblR4my1avtJFp9b+r5O1bPTIByxaDef+TzzkNe2mLicAHE7Hxv8guczRtNOvS+bzwEj7QQJlXJQ2hkJ3PhZoKZc4n7FNYywfasGwmlPPqz3dkvehUzVG4pGKXRIqXVG9d74PQmyd1TjJCqODcxdn1TsRS0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935078; c=relaxed/simple;
	bh=5IFTXhltXmX0IsmlhDUIauXf6FhFAacrrKlyaxSk8Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Q2QduEy6xcsRcRRV32G4GMXJMsa9I88uQg0+179zcOM2fCUldwjGDA/63XulvLR8v3cxyPajrD5ZQQ+wpTnGWvh2a/73GGmQ6DEOv87MmsWgOktJ4VMMpspEzKo5f1HzG+z29b5zMQRL6mdKpWrUdh9SvTCMMrW3bbtWt0H42g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=a0pignQz; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4fKxQN01q0z98c3;
	Tue, 24 Feb 2026 13:11:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1771935068;
	bh=5IFTXhltXmX0IsmlhDUIauXf6FhFAacrrKlyaxSk8Rk=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=a0pignQzyeGS3CsCCnjHbn4LVCMN7Rfrmfd6kfE9qZ1nvziWwQBkC698Skz2N9L1m
	 DL8jHlRTJ/JATDqDUvxAMUBF65TDwR9KzO5VASWCKoOpS1bha2GjodR0G7OlRUlAkL
	 mWEdR5vuCfV89TdG6IDWkFJ51R/5Uyw94iA1lrJPwStBkuWfwReAMCZAoYmmLepOAw
	 PB0RvvSPPkKp46sxVXh+DNA+gEDI4IHlgIuyxRtchMQ3deyjL/INwF14DibY4LOwBO
	 slT4WcPv9zunK/vrdJX0vERheqVfpOv/4OfT6313QB/wYUwKhBWJajk7IZrvQpBmfo
	 braziIF66Y9Iw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4fKxQM6RL4z7vJt;
	Tue, 24 Feb 2026 13:11:07 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fKxQM1YhSz8sZP;
	Tue, 24 Feb 2026 13:11:07 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2C14A672E4;
	Tue, 24 Feb 2026 13:11:06 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3ac876ca-0038-41e8-a1a0-3d5434f30473@leemhuis.info>
Date: Tue, 24 Feb 2026 13:11:05 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: extlinux can't boot kernel after commit "kbuild: keep .modinfo
 section in vmlinux.unstripped"
To: Ed W <lists@wildgooses.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 masahiroy@kernel.org, nathan@kernel.org
References: <587f25e0-a80e-46a5-9f01-87cb40cfa377@wildgooses.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
In-Reply-To: <587f25e0-a80e-46a5-9f01-87cb40cfa377@wildgooses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177193506651.2973788.9122005200268033841@mxe9fb.netcup.net>
X-NC-CID: kwOXViOdelraZOT6zXRj7//q/XWqTKIBcTO6PG5gQEOTMFs5Y8g=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	TAGGED_FROM(0.00)[bounces-11404-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,leemhuis.info:mid,leemhuis.info:dkim];
	DMARC_NA(0.00)[leemhuis.info];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CCCA186BDE
X-Rspamd-Action: no action

On 2/17/26 20:24, Ed W wrote:
> Hi, I wonder if I can get some help debugging a problem post the following commit. After trying to
> upgrade to a newer kernel build I encountered boot failures on my amd64 machine, booting via
> extlinux and git bisect narrowed it down to this commit:

Thx for the report. Adding a few more recipients to this.

Two things are likely worth checking:

* Is 7.0-rc1 still affected?
* If it's possible to revert the culprit in 7.0-rc1, does it fix the
problem?

> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.19.2&id=3e86e4d74c0490e5fc5a7f8de8f29e7579c9ffe5
> kbuild: keep .modinfo section in vmlinux.unstripped

FWIW: Masahiro Yamada, that's a change of yours.

Ciao, Thorsten

> Keep the .modinfo section during linking, but strip it from the final vmlinux. 
> Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms. 
> This change will allow the next commit to extract the .modinfo section from the vmlinux.unstripped
> intermediate.
> 
> 
> The symptoms are that prior to this commit I can boot a kernel built using gcc-15 and binutils
> 2.45.1, however, adding that commit, or trying kernels up to 6.18.12, all fail to boot the bzImage file.
>  
> Extlinux apparently won't read (or otherwise rejects as invalid) the resulting bzImage kernel with
> error:
>     failed: I/O error
> So it doesn't even try to run the kernel, it appears to fail reading from disk (and presumably
> locating the entry point for execution?)
> 
> Kernel is relocatable and hence ends up being built with 
> VMLINUX_NEEDS_RELOCS=y
> 
> Curiously, if I build with clang then the resulting kernels all seem to work without a problem??
> 
> System is one of a cluster of Ryzen 9 5950X, but similar errors appear with older Ryzen 9 3900
> boxes. Underlying OS is gentoo, so packages approximately as per latest releases with that.
> 
> I'm not sure how to narrow down what precisely triggers the boot failure though. For example I see
> similar results to the following on both a working 6.17.0 and a broken 6.18.12
> 
> # readelf -l vmlinux | grep -A3 LOAD
>   LOAD           0x0000000000200000 0xffffffff81000000 0x0000000001000000
>                  0x0000000002a8b4d0 0x0000000002a8b4d0  R E    0x200000
>   LOAD           0x0000000002e00000 0xffffffff83c00000 0x0000000003c00000
>                  0x0000000001a00000 0x0000000001a00000  RW     0x200000
>   NOTE           0x0000000002c8b47c 0xffffffff83a8b47c 0x0000000003a8b47c
>                  0x0000000000000054 0x0000000000000054         0x4
> 
> On the non working 6.18.12 I see:
> # readelf -S vmlinux.unstripped | grep modinfo
>   [70] .modinfo          PROGBITS         ffffffff85600000  04800000
> # readelf -S vmlinux | grep modinfo
> 
> So it seems as though the modinfo sectors ARE being stripped?!
> 
> My guess is that something has moved or become re-ordered such that the extlinux is rejecting the
> image?? 
> 
> At this point I'm honestly not quite sure what I am doing, so would some kind soul please help me
> figure out what is happening? I apologise in advance that I've likely not given enough information
> about the problem, please be gentle...
> 
> Ed W
> 


