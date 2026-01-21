Return-Path: <linux-kbuild+bounces-10773-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIj2AZAxcWmcfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10773-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 21:05:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 603245CCB3
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 21:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8DC3DA2FC7D
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 18:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381553AE711;
	Wed, 21 Jan 2026 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ej6dBDyn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1742F2E62A6
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020262; cv=none; b=HTLtx8ynyNeF00fjwD14jzhFvMk9twRrN3FTiq0dPTsR/EBSIpuIFsqfxD7RtkBzmoKlzw6aqpn5tmsQJWDNW3xHKHzeDC06sYcFEeERtUxyDCJmP6uK879XVcGL5mZe7NFYDunkSyJVY9GLSK11k0X6TkXFdIAkDOiz4ARBHDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020262; c=relaxed/simple;
	bh=ZVUlkxeaMTJXJPPFCVrxJq/9bdSEP7BNcBobtEVeH9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryzU0KKhx5cZQXCGouxiy+ceuaiZxjmPcZCMdgjxydNjZGstBgPslX6sFRTXwCGfmQmEQyoMFujppDI728rOyIru8gzmwHIko+gEzxq2kaM8iPlaRbYWJjtij9KUDu6lOD42YECuhteT3hL5yHGeHEcV8Kfo4gnWoEV3JqMWbP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ej6dBDyn; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <44168005-28df-4b5b-96a7-b6b9e7494aed@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769020247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CROyEznehMA1RhrDyu6WZuj0lQdIFsoxBRDmxAZdZwc=;
	b=ej6dBDynvxtF6pMKDGFlCnTnkhBJSvcz9eYMbWO5trBMsexpT6IsioTjnJgjrFkbjYOUVg
	s2mx/NdAgUaPr4rzIiPQJiloEgf5Hl0kYB8bERzsp4CPScdKL/xM2R9Lugnx4JhL6LBl2Z
	BYLijy9i6UZaGxJ+gksZMKg/h8bRw1g=
Date: Wed, 21 Jan 2026 10:30:40 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1] scripts/gen-btf.sh: Use CONFIG_SHELL for
 execution
To: Gary Guo <gary@garyguo.net>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 bpf@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260121181617.820300-1-ihor.solodrai@linux.dev>
 <DFUH7UI3MM6F.1B30NTZ5NFSKR@garyguo.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <DFUH7UI3MM6F.1B30NTZ5NFSKR@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	DMARC_POLICY_ALLOW(0.00)[linux.dev,none];
	TAGGED_FROM(0.00)[bounces-10773-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,garyguo.net:email,gen-btf.sh:url]
X-Rspamd-Queue-Id: 603245CCB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 10:24 AM, Gary Guo wrote:
> On Wed Jan 21, 2026 at 6:16 PM GMT, Ihor Solodrai wrote:
>> According to the docs [1], kernel build scripts should be executed via
>> CONFIG_SHELL, which is sh by default.
>>
>> Fixup gen-btf.sh to be runnable with sh, and use CONFIG_SHELL at every
>> invocation site.
>>
>> See relevant discussion for context [2].
>>
>> [1] https://docs.kernel.org/kbuild/makefiles.html#script-invocation
>> [2] https://lore.kernel.org/bpf/CAADnVQ+dxmSNoJAGb6xV89ffUCKXe5CJXovXZt22nv5iYFV5mw@mail.gmail.com/
>>
>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> 
> I can indeed build again when applying this on top of linux-next. Thanks.
> 
> Tested-by: Gary Guo <gary@garyguo.net>
> 
> You probably also want to carry some Reported-by, Suggested-by and Fixes tags here.

You're right. This should do it:

Reported-by: Gary Guo <gary@garyguo.net>
Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Fixes: 522397d05e7d ("resolve_btfids: Change in-place update with raw binary output")

Alexei, please lmk if I should re-send with tags.

> 
> 
>> [...]

