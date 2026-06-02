Return-Path: <linux-kbuild+bounces-13529-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KpGOIK4hH2rkhQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13529-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 20:32:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF8C631184
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 20:32:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=cWdAglnd;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13529-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13529-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A17893011122
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 18:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED60391831;
	Tue,  2 Jun 2026 18:29:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA23909AE
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 18:29:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424964; cv=none; b=qerjCjCD5V8+E0A511yxKwFOSo7jnBSku6u7Uoqc97hmoCk4woF90L+a8JklGSfQ5Yj/hxdDGdwAi6dd16F5x8lc7nf8sfgPdJE5AgN5N9DfziTgUwH1GNQfleSiC3KVyb99fZv0EYwjJdQAvOV4rx2TBmsvEyGFGv2eAEOM2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424964; c=relaxed/simple;
	bh=QDdAzWAblk0fwqPkNiE9X2RrQFQQX+OoiIAgHgJNIVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LoDkEAMI/QdZrWJrDsk/Tv2V8SzAceE2J/eCGxOvNfdRCZudoUjC1/mvsVwYg1c4Q736Ztp7IWhojfWlosoqA4WTYHkLxmMmlphs17fjHP0mx7HlyK85p5scUU2tNHzYWVDgTBsxGEUFs7LKOQjDv/2Lpnkc68AE7K01Jc3WBtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cWdAglnd; arc=none smtp.client-ip=95.215.58.187
Message-ID: <aea15513-c5db-4d67-9f28-5dc7f6063fe4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780424951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJBWV+Fz436w1gfOM6RtvoOneeQlsp7Iqp9yrBhmPSw=;
	b=cWdAglndsn5/Lwl+GkMJ3kXH/OrIBOjiLbc01AE7BrVXlAqIdd/Ej7+31uA2E37e7j5JeK
	OQ6HtA9xNwDGP46x21wgCaP8N/iabRSCuL4UlNW7cyZ8HQcn77UpsBvv05rxzVkIvUJDeB
	THRjRKmn7I4Ebifx9BDbsPtCy6ppT7M=
Date: Tue, 2 Jun 2026 11:28:57 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 05/14] resolve_btfids: Index BTF ID symbols by
 address
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Alan Maguire <alan.maguire@oracle.com>, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-6-ihor.solodrai@linux.dev> <ah7UQv87CmJ-LNMt@krava>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <ah7UQv87CmJ-LNMt@krava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13529-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:olsajiri@gmail.com,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCF8C631184

On 6/2/26 6:01 AM, Jiri Olsa wrote:
> On Mon, Jun 01, 2026 at 03:17:56PM -0700, Ihor Solodrai wrote:
> 
> SNIP
> 
>> +static int push_addr_sym(struct object *obj, Elf64_Addr addr, const char *name)
>> +{
>> +	struct addr_sym *arr = obj->addr_syms;
>> +	int cap = obj->max_addr_syms;
>> +
>> +	if (obj->nr_addr_syms + 1 > cap) {
>> +		cap = max(cap + 256, cap * 2);
>> +		arr = realloc(arr, sizeof(*arr) * cap);
>> +		if (!arr)
>> +			return -ENOMEM;
>> +		obj->max_addr_syms = cap;
>> +		obj->addr_syms = arr;
> 
> could you use libbpf_ensure_mem instead?

Hi Jiri. Thank you for prompt review.

Yeah.. a third copy-pasted push_* function is one too many.
I'll try adopting libbpf helpers in the next revision.

> 
>> +	}
>> +
>> +	obj->addr_syms[obj->nr_addr_syms].addr = addr;
>> +	obj->addr_syms[obj->nr_addr_syms].name = name;
>> +	obj->nr_addr_syms++;
>> +
>> +	return 0;
>> +}
>> +
>> +static int cmp_addr_sym(const void *a, const void *b)
>> +{
>> +	Elf64_Addr aa = ((const struct addr_sym *)a)->addr;
>> +	Elf64_Addr ab = ((const struct addr_sym *)b)->addr;
>> +
>> +	if (aa < ab)
>> +		return -1;
>> +	if (aa > ab)
>> +		return 1;
>> +	return 0;
> 
> nit, I recently spot following pattern:
> 
>         return (aa > ab) - (aa < ab);
> 
> jirka
> 
>> +}
>> +
>> +static const char *find_name_by_addr(struct object *obj, Elf64_Addr addr)
>> +{
>> +	struct addr_sym key = { .addr = addr };
>> +	struct addr_sym *res;
>> +
>> +	res = bsearch(&key, obj->addr_syms, obj->nr_addr_syms,
>> +		      sizeof(*obj->addr_syms), cmp_addr_sym);
>> +	return res ? res->name : NULL;
>> +}
> 
> SNIP


