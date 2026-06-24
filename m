Return-Path: <linux-kbuild+bounces-13870-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZtRYCwMsO2qqSAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13870-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 02:59:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 529C26BAC21
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 02:59:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=QMrdSV7D;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13870-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13870-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 899F4300F618
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 00:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0AF32938D;
	Wed, 24 Jun 2026 00:59:40 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54BF3290C7
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2026 00:59:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782262780; cv=none; b=FBoAFbgYDmaKqwLe5vrxXgS5VKj9kNM/bkh4K1ztFvUD1nVK+OWZEWHdeMDMfty6dBjlQHmCSQs4YNKH185HHNoKRCtF31+zzR2ERGIzbogYJLVpp0D5CNAmBghRWL7W5WC9gct8y6DZ/VLp9Vt9bTCrswchy3xkomCN2vSqRek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782262780; c=relaxed/simple;
	bh=nQIwXgwQtQb7ULfLTF2xhE1CjeK5B39z7Jzs/dq3Xpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1mn3z2roVETgNTTJz/cnbh0Uv5qJ/+MILUrCdfUqeAwz0rqjAbKoHRegvfaMBVBppqJibpwTISgR3eiQ+k6lvxvUJVS8XwmaDHiRFLW18uBG7L4hZMUWDtxqA53cC7jE6skFFKDTQr+4WmOfFTF1yXCkXcmJi1E49NtqBnSETM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QMrdSV7D; arc=none smtp.client-ip=95.215.58.188
Message-ID: <16f991c7-eb45-48a2-b1d6-fe01ba6ff454@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782262767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ImmX9+zLu4TiH9gtqXiXpawSaNEsZ/ibzBQdMPAw/s=;
	b=QMrdSV7DqGY/Gkit/0x+eUqnPMyv40pH/fR2ivAmP9tWcaljLIq24whXBu/dBBM4KUvzM7
	GH9AFmH9Xy/jND4EsP5d45PvM+MnnmqM4vNCU6viiiF0XbaHOofR5LRLoG5sYp5+jq2UBv
	7BoNkAAUCwC9DvHYa2/rntbuIhLm22I=
Date: Tue, 23 Jun 2026 17:59:13 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 4/4] selftests/bpf: Add kfunc set test to
 resolve_btfids
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Alan Maguire <alan.maguire@oracle.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
 <20260617210619.1562858-5-ihor.solodrai@linux.dev> <ajPlJ81PL_YaHsBo@krava>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <ajPlJ81PL_YaHsBo@krava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13870-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olsajiri@gmail.com,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:emil@etsalapatis.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,etsalapatis.com,vger.kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,etsalapatis.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 529C26BAC21

On 6/18/26 5:31 AM, Jiri Olsa wrote:
> On Wed, Jun 17, 2026 at 02:06:19PM -0700, Ihor Solodrai wrote:
>> Extend the resolve_btfids selftest to cover kfunc sets defined with
>> BTF_KFUNCS_START/BTF_KFUNCS_END.
>>
>> The test verifies that resolve_btfids correctly processes BTF_ID_FLAGS,
>> resolves function IDs, and checks the kfunc set is sorted.
>>
>> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>> ---
>>  .../selftests/bpf/prog_tests/resolve_btfids.c | 63 ++++++++++++++++---
>>  tools/testing/selftests/bpf/progs/btf_data.c  | 10 +++
>>  2 files changed, 66 insertions(+), 7 deletions(-)
>>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
>> index 6bcadee50bb8..65ede3ac5845 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
>> @@ -12,6 +12,10 @@
>>  
>>  #define BTF_DATA_FILE "resolve_btfids.test.o.BTF"
>>  
>> +#ifndef KF_FASTCALL
>> +#define KF_FASTCALL (1 << 12)
>> +#endif
>> +
>>  struct symbol {
>>  	const char	*name;
>>  	int		 type;
>> @@ -28,6 +32,17 @@ struct symbol test_symbols[] = {
>>  	{ "func",    BTF_KIND_FUNC,    -1 },
>>  };
>>  
>> +struct kfunc_symbol {
>> +	const char	*name;
>> +	s32		 id;
>> +	u32		 flags;
>> +};
>> +
>> +static struct kfunc_symbol kfunc_symbols[] = {
>> +	{ "kfunc_a", -1, 0 },
>> +	{ "kfunc_b", -1, KF_FASTCALL },
>> +};
>> +
>>  /* Align the .BTF_ids section to 4 bytes */
>>  asm (
>>  ".pushsection " BTF_IDS_SECTION " ,\"a\"; \n"
>> @@ -35,9 +50,9 @@ asm (
>>  ".popsection;                             \n");
>>  
>>  /*
>> - * test_list_local and test_set are .local symbols placed in .BTF_ids by
>> - * inline asm, and are read here directly by C name. To the compiler they
>> - * are plain, default-visibility extern objects.
>> + * test_list_local, test_set and test_kfunc_set are .local symbols placed
>> + * in .BTF_ids by inline asm, and are read here directly by C name. To the
>> + * compiler they are plain, default-visibility extern objects.
>>   *
>>   * When test_progs is linked as a position-independent executable (PIE),
>>   * taking the address of such an extern is routed through the GOT. The
>> @@ -69,6 +84,11 @@ BTF_ID(struct,  S)
>>  BTF_ID(union,   U)
>>  BTF_ID(func,    func)
>>  BTF_SET_END(test_set)
>> +
>> +BTF_KFUNCS_START(test_kfunc_set)
>> +BTF_ID_FLAGS(func, kfunc_a)
>> +BTF_ID_FLAGS(func, kfunc_b, KF_FASTCALL)
>> +BTF_KFUNCS_END(test_kfunc_set)
>>  #pragma GCC visibility pop
>>  
>>  extern __u32 test_list_global[];
>> @@ -92,6 +112,8 @@ __resolve_symbol(struct btf *btf, int type_id)
>>  	if (!ASSERT_OK_PTR(type, "btf__type_by_id"))
>>  		return -1;
>>  
>> +	str = btf__name_by_offset(btf, type->name_off);
> 
> should we assert str != NULL like below?

Andrii commented earlier that there is no point in double checking
strings returned by btf__name_by_offset(), we should always expect a
valid string. Crashing is fine if it's not the case.

The check below is removed.

> 
> jirka
> 
>> +
>>  	for (i = 0; i < ARRAY_SIZE(test_symbols); i++) {
>>  		if (test_symbols[i].id >= 0)
>>  			continue;
>> @@ -99,14 +121,20 @@ __resolve_symbol(struct btf *btf, int type_id)
>>  		if (BTF_INFO_KIND(type->info) != test_symbols[i].type)
>>  			continue;
>>  
>> -		str = btf__name_by_offset(btf, type->name_off);
>> -		if (!ASSERT_OK_PTR(str, "btf__name_by_offset"))
>> -			return -1;
>> -
>>  		if (!strcmp(str, test_symbols[i].name))
>>  			test_symbols[i].id = type_id;
>>  	}
>>  
> 
> SNIP


