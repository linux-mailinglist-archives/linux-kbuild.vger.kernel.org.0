Return-Path: <linux-kbuild+bounces-13783-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t7M0IA/HMWrtpwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13783-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 23:58:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D56957EF
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 23:58:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=iQtVCzwm;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13783-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13783-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BF52300C7E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CBE3546CA;
	Tue, 16 Jun 2026 21:58:34 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DA739C636
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 21:58:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781647114; cv=none; b=kS3qedimmTwKzWdiIe5kXSd8FukKNC1jycW0ozlwrFDiehTxceEVjFddyWloqMCUnOdbNkzwnt1cTFgwabPtqW3H025X0soB9adE3eQrpc8Z8+/BOaAdB/5feCfxIQngWtnA5XPzhg0T306ulYc7uA93gNeOY52HGtTUZ3MLAXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781647114; c=relaxed/simple;
	bh=vCddid2Olj+Y2Ph3huIqPDbDHq3J2KlpEppeE5U8xk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqbvsptwKWvf/33s8Yp6gGknNHxT9dOEfoFFxrWFsdWAfX3w2WdSM552TWE3EC7BjzdJP3ITWDIvgztr4qjk9VZeUOA1hedBSu5Zy7oBmyZK2/4sky7rpgt8FQOSH4WWpgCU0JkpPfuWzzM5xi/oJRzvpq+jK4au+Ph6jH+/ZcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iQtVCzwm; arc=none smtp.client-ip=91.218.175.183
Message-ID: <62ed9e00-d047-46d3-9cd2-86327eee2249@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781647100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gli2mGJVn+dnUCoLwuVVJShhI966qL7Bl++w9B04jr0=;
	b=iQtVCzwmb8Ph8/Q1Rf69mQOnY9cSFx5sb8AqavDffKkYnFqyTR1/TLgEC+2Zg6OPjmAgn6
	AbfiR1MyLHOTaDnPpG8hgtRnWnoPWLSjGQoNT1Hq15VDuX+/XKnROKPynUZ7MmwniiS+qK
	oLW5ajFk/BRQti+fFDCkkJfaynUJM2M=
Date: Tue, 16 Jun 2026 14:58:15 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 11/14] resolve_btfids: Process KF_ARENA_*
 flags in resolve_btfids
To: Emil Tsalapatis <emil@etsalapatis.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-12-ihor.solodrai@linux.dev>
 <DJAQHH1BGTIN.IKCRPQQXBBT1@etsalapatis.com>
 <DJARFTIX5QQV.2F5ZEUTS7IBO0@etsalapatis.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <DJARFTIX5QQV.2F5ZEUTS7IBO0@etsalapatis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13783-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:emil@etsalapatis.com,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[etsalapatis.com,kernel.org,iogearbox.net,gmail.com];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 819D56957EF

On 6/16/26 1:36 PM, Emil Tsalapatis wrote:
> On Tue Jun 16, 2026 at 3:51 PM EDT, Emil Tsalapatis wrote:
>> On Mon Jun 1, 2026 at 6:18 PM EDT, Ihor Solodrai wrote:
>>> For kfuncs flagged KF_ARENA_RET, KF_ARENA_ARG1 or KF_ARENA_ARG2,
>>> address_space(1) attribute (type tag with kflag=1) needs to be emitted
>>> to BTF for the return type or arg type respectively.
>>>
>>> So far this has been done by pahole [1].
>>>
>>> Implement the emission of the arena attributes in resolve_btfids: for
>>> flagged kfuncs create a new function prototype with updated BTF types,
>>> adding tags as necessary.
>>>
>>> Similar to decl tags emission, the transformation is idempotent: if
>>> the types are already tagged with address_space(1), it's a noop.
>>>
>>> [1] https://lore.kernel.org/dwarves/20250228194654.1022535-1-ihor.solodrai@linux.dev/
>>>
>>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>>> ---
>>>  tools/bpf/resolve_btfids/main.c | 131 ++++++++++++++++++++++++++++++++
>>>  1 file changed, 131 insertions(+)
>>>
>>> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
>>> index f276200b1a68..aafbcfec755b 100644
>>> --- a/tools/bpf/resolve_btfids/main.c
>>> +++ b/tools/bpf/resolve_btfids/main.c
>>> @@ -162,6 +162,9 @@ struct object {
>>>  };
>>>  
>>>  #define KF_FASTCALL (1 << 12)
>>> +#define KF_ARENA_RET (1 << 13)
>>> +#define KF_ARENA_ARG1 (1 << 14)
>>> +#define KF_ARENA_ARG2 (1 << 15)
>>>  #define KF_IMPLICIT_ARGS (1 << 16)
>>>  #define KF_IMPL_SUFFIX "_impl"
>>>  
>>> @@ -1294,6 +1297,128 @@ static int ensure_decl_tag(struct btf2btf_context *ctx, const char *tag_name,
>>>  	return push_decl_tag_id(ctx, new_id);
>>>  }
>>>  
>>> +static bool is_arena_type_attr(struct btf *btf, u32 id)
>>> +{
>>> +	const struct btf_type *t = btf__type_by_id(btf, id);
>>> +	const char *name;
>>> +
>>> +	if (!t || !btf_is_type_tag(t) || !btf_kflag(t))
>>> +		return false;
>>> +	name = btf__name_by_offset(btf, t->name_off);
>>> +	return name && strcmp(name, "address_space(1)") == 0;
>>
>> The type is just called "arena" - address_space(1) is a different
>> attribute that is consumed by the compiler and is not visible in the BTF.
> 
> Nevermind, this is PEBKAC - please disregard. This is _completely_ different
> scenario, none of the above applies. Same for the documentation patch.

Yeah, I was about to write a few paragraphs explaining
"address_space(1)" thing in BTF.

FWIW you can learn more about generic attributes in BTF from a series
that was landed a while ago:
https://lore.kernel.org/bpf/20250130201239.1429648-1-ihor.solodrai@linux.dev/

TL;DR It is possible to represent an arbitrary __attribute__ in BTF by
setting the kind_flag on a type tag or decl tag. And this is what we
use to pass through the KF_ARENA_* flags.

> 
>>
>> While we're at it, can we factor the name out into a #define?
>>
>>> +}
>>> +
>>> +static s32 ensure_arena_tagged_ptr(struct btf *btf, u32 ptr_id)
>>> +{
>>> +	const struct btf_type *ptr = btf__type_by_id(btf, ptr_id);
>>> +	s32 tag_id;
>>> +
>>> +	if (!ptr || !btf_is_ptr(ptr))
>>> +		return -EINVAL;
>>> +
>>> +	if (is_arena_type_attr(btf, ptr->type))
>>> +		return ptr_id;
>>
>> Another thing: Clang (very very) recently got support for adding
>> btf_type_tag for typedef'ed types. Do we nned to expand the check
>> to run in a loop like so:
>>
>> while (btf_is_modifier()) {
>> 	if type_tag()
>> 		test();
>>
>> 	follow the chain
>> }
> 
> Ditto, completely different scenarios.
> 
>>
>> to find tags hidden within typedefs?
>>
>>> +
>>> +	tag_id = btf__add_type_attr(btf, "address_space(1)", ptr->type);
>>> +	if (tag_id < 0)
>>> +		return tag_id;
>>
>> Same here wrt name.
>>
>>> +
>>> +	return btf__add_ptr(btf, tag_id);
>>> +}
>>> +
>>> +/*
>>> + * Build a FUNC_PROTO for @kfunc with each arena-flagged return/parameter
>>> + * pointer tagged with address_space(1). Pointers already tagged are kept as is.
>>> + *
>>> + * If nothing needs tagging, the original proto id is returned unchanged.
>>> + * Otherwise a new FUNC_PROTO is created and its id returned. The original
>>> + * proto may be shared with sibling FUNCs, so it must not be modified in place.
>>> + */
>>> +static s32 ensure_arena_tagged_proto(struct btf *btf, struct kfunc *kfunc)
>>> +{
>>> +	const struct btf_type *func = btf__type_by_id(btf, kfunc->btf_id);
>>> +	u32 proto_id = func->type;
>>> +	const struct btf_type *proto = btf__type_by_id(btf, proto_id);
>>> +	const struct btf_param *params = btf_params(proto);
>>> +	u32 nr_params = btf_vlen(proto);
>>> +	s32 arg0_type_id = nr_params > 0 ? (s32)params[0].type : -1;
>>> +	s32 arg1_type_id = nr_params > 1 ? (s32)params[1].type : -1;
>>> +	s32 ret_type_id = proto->type;
>>> +	s32 new_proto_id, id;
>>> +	bool changed = false;
>>> +	int err;
>>> +
>>> +	if (kfunc->flags & KF_ARENA_RET) {
>>> +		id = ensure_arena_tagged_ptr(btf, ret_type_id);
>>> +		if (id < 0)
>>> +			return id;
>>> +		changed |= id != ret_type_id;
>>> +		ret_type_id = id;
>>> +	}
>>> +
>>> +	if (nr_params > 0 && (kfunc->flags & KF_ARENA_ARG1)) {
>>> +		id = ensure_arena_tagged_ptr(btf, arg0_type_id);
>>> +		if (id < 0)
>>> +			return id;
>>> +		changed |= id != arg0_type_id;
>>> +		arg0_type_id = id;
>>> +	}
>>> +
>>> +	if (nr_params > 1 && (kfunc->flags & KF_ARENA_ARG2)) {
>>> +		id = ensure_arena_tagged_ptr(btf, arg1_type_id);
>>> +		if (id < 0)
>>> +			return id;
>>> +		changed |= id != arg1_type_id;
>>> +		arg1_type_id = id;
>>> +	}
>>> +
>>> +	if (!changed)
>>> +		return proto_id;
>>> +
>>> +	new_proto_id = btf__add_func_proto(btf, ret_type_id);
>>> +	if (new_proto_id < 0)
>>> +		return new_proto_id;
>>> +
>>> +	for (int i = 0; i < nr_params; i++) {
>>> +		s32 param_type_id;
>>> +		const char *name;
>>> +
>>> +		proto = btf__type_by_id(btf, proto_id);
>>> +		params = btf_params(proto);
>>> +		name = btf__name_by_offset(btf, params[i].name_off);
>>> +
>>> +		if (i == 0)
>> Nit: switch() {}?
>>> +			param_type_id = arg0_type_id;
>>> +		else if (i == 1)
>>> +			param_type_id = arg1_type_id;
>>> +		else
>>> +			param_type_id = params[i].type;
>>> +
>>> +		err = btf__add_func_param(btf, name ?: "", param_type_id);
>>> +		if (err < 0)
>>> +			return err;
>>> +	}
>>> +
>>> +	pr_debug("resolve_btfids: added arena-tagged proto for kfunc %s: %d\n", kfunc->name, new_proto_id);
>>> +
>>> +	return new_proto_id;
>>> +}
>>> +
>>> +static int process_kfunc_with_arena_flags(struct btf2btf_context *ctx, struct kfunc *kfunc)
>>> +{
>>> +	struct btf_type *t;
>>> +	s32 proto_id;
>>> +
>>> +	proto_id = ensure_arena_tagged_proto(ctx->btf, kfunc);
>>> +	if (proto_id < 0)
>>> +		return proto_id;
>>> +
>>> +	t = (struct btf_type *)btf__type_by_id(ctx->btf, kfunc->btf_id);
>>> +	t->type = proto_id;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static int btf2btf(struct object *obj)
>>>  {
>>>  	struct btf2btf_context ctx = {};
>>> @@ -1321,6 +1446,12 @@ static int btf2btf(struct object *obj)
>>>  			if (err)
>>>  				goto out;
>>>  		}
>>> +
>>> +		if (kfunc->flags & (KF_ARENA_RET | KF_ARENA_ARG1 | KF_ARENA_ARG2)) {
>>> +			err = process_kfunc_with_arena_flags(&ctx, kfunc);
>>> +			if (err)
>>> +				goto out;
>>> +		}
>>>  	}
>>>  
>>>  	err = 0;
> 


