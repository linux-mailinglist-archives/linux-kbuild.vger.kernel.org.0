Return-Path: <linux-kbuild+bounces-13532-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bbQTHYZGH2oBjgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13532-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 23:09:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB99F632049
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 23:09:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=xZkjmCQq;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13532-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13532-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D534304FFCF
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 21:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B14C366066;
	Tue,  2 Jun 2026 21:09:11 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1593395D8E
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 21:09:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434551; cv=none; b=UkUBDKudqN5yV665Svg5rhQ74NxA1tyZ1B2exAswWesnkn1uGi+/Drb6O3R9qt7GRHHuUdg3x3Yja8PMgY4Yn7EdO5WWmaoRJvvey8oW9GJwgQvT7aK6pr0dzK8yVnVfrbVFjQKxZo0UI36P6o/173Hj2E5SlUFV1rkRVpWiNBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434551; c=relaxed/simple;
	bh=dNGkSx2tM1qxsXApQVddpm2XfsR6us8p4reR7Pi9/q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFF4Q90OaJU/WYGPgPALflKwFOhYUxFUSRviJ3fy6cZWZKdqBZc0o/xsBqM6lKGPQZvv6WG6CC7HzLP1n15Djx9d92zLURsgSeZT6834Nu465EMcUAIAC7+yiGuX+7ETbPdZMqO6OOqyIGaPsCFMmymlNZOUUNRqvn29d2Z4Lao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xZkjmCQq; arc=none smtp.client-ip=95.215.58.182
Message-ID: <3ba6ed89-82b3-4dbb-99d4-5e34e496fc33@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780434537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zeurb2c9F7oUWsVkVTj1COrkRc3hnNlwZ2PJ3T6Sw8o=;
	b=xZkjmCQq172aGjiyhf3GfFYl9aAefj82joEGbZtlKGCeKicndPOVdXRKGsDNN9QHmebHfv
	Na8Spkj50s3WgWsBbFKXUO53I8ZloIbh3qbAec5FWZ8qp5lncFIffmTBQEfnUMAckBRDFq
	qkqtGnh97m1eoJtWZpC+o27MrRIaxX0=
Date: Tue, 2 Jun 2026 14:08:46 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 06/14] resolve_btfids: Discover kfuncs from
 BTF ID sets
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Alan Maguire <alan.maguire@oracle.com>, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-7-ihor.solodrai@linux.dev> <ah8-6CNIHPCJxAOM@krava>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <ah8-6CNIHPCJxAOM@krava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13532-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olsajiri@gmail.com,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.dev:mid,linux.dev:dkim,linux.dev:from_mime,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB99F632049

On 6/2/26 1:36 PM, Jiri Olsa wrote:
> On Mon, Jun 01, 2026 at 03:17:57PM -0700, Ihor Solodrai wrote:
>> collect_kfuncs() currently uses bpf_kfunc decl tags to identify the
>> list of kfuncs. The decl tags are generated by pahole, which makes
>> current implementation implicitly rely on those tags being generated.
>>
>> The authoritative source, used by the the BPF verifier for kfunc
>> registration, of functions being BPF kfuncs are
>> BTF_KFUNCS_START()/END() declarations. These are BTF_ID_SET8 under the
>> hood. Currently resolve_btfids reads kfunc flags from these sets, and
>> populates them with BTF IDs.
>>
>> Implement kfunc discovery from BTF_ID_SET8 symbols in resolve_btfids,
>> removing the dependency on pahole's emmission of decl tags.
>>
>> Walk BTF_ID_KIND_SET8 sets, and use the address-to-symbol index to
>> look up set entry's BTF_ID symbol name (before .BTF_ids is patched),
>> recording the paired flags directly. This makes find_kfunc_flags()
>> helper unnecessary, so it's removed.
>>
>> Kernel functions can appear in more than one set, which is legitimate,
>> since kfunc sets are prog-type dependent in the kernel. So for btf2btf
>> processing deduplicate kfuncs by BTF ID, accumulate (OR) the flags,
>> and warn on flags mismatch to catch inconsistent declarations.
>>
>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>> ---
>>  tools/bpf/resolve_btfids/main.c | 122 ++++++++++++++------------------
>>  1 file changed, 55 insertions(+), 67 deletions(-)
>>
>> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
>> index 43512af13148..d35a7b2460e8 100644
>> --- a/tools/bpf/resolve_btfids/main.c
>> +++ b/tools/bpf/resolve_btfids/main.c
>> @@ -970,6 +970,23 @@ static int push_kfunc(struct btf2btf_context *ctx, struct kfunc *kfunc)
>>  	struct kfunc *arr = ctx->kfuncs;
>>  	u32 cap = ctx->max_kfuncs;
>>  
>> +	/*
>> +	 * A kfunc can be listed in multiple BTF ID sets.
>> +	 * In this case, dedup by btf_id and accumulate kfunc flags.
>> +	 */
>> +	for (u32 i = 0; i < ctx->nr_kfuncs; i++) {
>> +		if (ctx->kfuncs[i].btf_id != kfunc->btf_id)
>> +			continue;
>> +
>> +		if (ctx->kfuncs[i].flags != kfunc->flags) {
>> +			pr_err("WARN: resolve_btfids: inconsistent flags for kfunc %s: 0x%x != 0x%x\n",
>> +			       kfunc->name, ctx->kfuncs[i].flags, kfunc->flags);
>> +			warnings++;
>> +		}
> 
> hit few of those
> 
> WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_allocate_context: 0x5 != 0x25
> WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_release_context: 0x2 != 0x22
> WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_hw_request: 0x0 != 0x20
> WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_hw_output_report: 0x0 != 0x20
> WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_input_report: 0x0 != 0x20
> 
> I'd think flags like KF_SLEEPABLE might vary in different sets for the same kfunc,
> IIUC you don't need to use KF_SLEEPABLE for syscall hook, because syscall programs
> are already sleepable.. not sure there are other examples

That's a good point.

I think from the PoV of resolve_btfids what matters is the mismatch of
flags that trigger BTF changes, like KF_IMPLICIT_ARGS. We could check for
the specific flags here, or filter out acceptable inconsistencies (KF_SLEEPABLE).

Any other ideas?

> 
> jirka


