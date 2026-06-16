Return-Path: <linux-kbuild+bounces-13776-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hh3VELCtMWo8pAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13776-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 22:10:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 662986951AF
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 22:10:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=RcTSBzRO;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13776-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13776-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8741131988FC
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D67384238;
	Tue, 16 Jun 2026 20:10:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C2384CD5
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 20:10:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640613; cv=none; b=afIApb6qv7majrdhp5kzaeDx0aMdUISCmv2QSUMJKA5DmyxYKCrdcmbQV0FrpdvkoEllJAqLedRdtoTp0BgT90Q6aJvoE3JGRy2n6trfflb3vBoUV/Oki9IwPyZwXjykpDXH97/JeFV8q2LkH9Y0oXziH7RU19DwfbZ/npUOifQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640613; c=relaxed/simple;
	bh=uXi1GrLjUavubxJ3YDfn5OC1eELmb/Bf1eiQ0IgU4TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sI5PwthWAzw0G0DdzAwfLoGaiSFu0wvzW0coSy/5CS68FUlLxdovBB4snQ6GDBI/AO8P+o75on9EeKGWaJYbEbU2sxt1NU1QdbU5scWVRr3jeufdqMsNTcsd/5vhnfUNfdCI0ma2mWa78TrXzyKFjJcnMsODKzAQYU29u9S/y68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RcTSBzRO; arc=none smtp.client-ip=95.215.58.177
Message-ID: <d4c1c0a8-0c7f-4b0d-b7e7-37933c9f9efe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781640610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHbp9nlXw7phrFaurZznoIn29ClzJQQUdZgiSuc8s2Y=;
	b=RcTSBzROzZD+GmlukfJh9sjOIrZZvxd93HOdThXbagw8ymbhs/sTOhcV8mEHrgj/TSX0wS
	bo04btO26QpJnlbotf892RZrcspGVbrtKBU7hlYG+rPogPbxY5UxRCIiybc6Y6P8GQqoPR
	py5korJ2tv+be1SICgy54JFzwlju1Iw=
Date: Tue, 16 Jun 2026 13:10:01 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 00/14] resolve_btfids: Implement BTF tags
 emission for kfuncs
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Emil Tsalapatis <emil@etsalapatis.com>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <CAEf4Bzb-MuvFqsBdNCYyU=X7O+OXGK33TKA3GRe=P0gVFR=S2g@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <CAEf4Bzb-MuvFqsBdNCYyU=X7O+OXGK33TKA3GRe=P0gVFR=S2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13776-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrii.nakryiko@gmail.com,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:emil@etsalapatis.com,m:andriinakryiko@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org,etsalapatis.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,gen-btf.sh:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 662986951AF

On 6/3/26 4:45 PM, Andrii Nakryiko wrote:
> On Mon, Jun 1, 2026 at 3:18 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>
>> BTF data for the kernel is generated through the following pipeline:
>>   * DWARF is emitted by the compiler
>>   * pahole reads in DWARF and produces BTF
>>   * resolve_btfids makes kernel-specific btf2btf transformation and
>>     patches .BTF_ids section
>>
>> This is orchestrated by link-vmlinux.sh, gen-btf.sh and Makefile.btf
>> in ./scripts directory.
>>
>> Historically kernel-specific BTF features were implemented in pahole,
>> and controlled by the feature flags. This requires kernel build
>> process to be aware of pahole version used for the build to set
>> correct runtime arguments for BTF encoding [1].
>>
>> This is a burden which can be alleviated by splitting kernel/module
>> BTF generation in two stages:
>>   1. Generic BTF generation from the kernel source code.
>>   2. Kernel-specific BTF modifications to support various BPF features.
>>
>> So far both stages were fused in pahole's BTF encoding. By moving
>> stage (2) in-tree, the dependency of kernel build on pahole can become
>> much more loose.
>>
>> Recent work [2] made it possible to do btf2btf transformations in
>> resolve_btfids, and it is already responsible for a few important BTF
>> modifications for the kernel:
>>   * .BTF.base generation for modules [3]
>>   * BTF sorting [4]
>>   * KF_IMPLICIT_ARGS support [5]
>>
>> This series continues the migration of kernel-specific BTF
>> transformations from pahole to resolve_btfids, implementing emission
>> of decl/type tags for the kfuncs and handling of the KF_ARENA_* flags.
>>
>> The implementation is idempotent with respect to BTF modifications: if
> 
> This sounds like an unnecessary complication. Can't we just control
> pahole through flags to guarantee there will be no kernel-specific
> information emitted?

Hi everyone.

I talked to Andrii off-list about this series last week and I'm in the
middle of preparing a v2, which is why I've been quiet in the thread.

The main v1->v2 design change from the discussion is to drop the
"ensure" pattern: just assume valid BTF on input. This requires
restructuring the series to preserve bisectability with respect to the
pahole flags.

I'll go through the messages now and reply where necessary. I'm going
to silently accept most of the nits I think.

Thanks!

> 
> 
>> input BTF already contains target tags, corresponding resolve_btfids
>> transformation is a noop. This allows for more flexibility in terms of
>> dependency on pahole. In particular, older pahole (without
>> decl_tag_kfuncs support, for example) can now be used in kbuild and
>> the resulting vmlinux BTF will contain properly tagged kfuncs
>> anyways. Conversely, if for whatever reason pahole emitted the same
>> tags, they will be properly skipped.
>>
>> [...]

