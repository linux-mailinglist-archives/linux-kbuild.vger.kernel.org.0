Return-Path: <linux-kbuild+bounces-13781-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wfd1FKjFMWrOpwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13781-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 23:52:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9506957C8
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 23:52:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=MIqZE+pa;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13781-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13781-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19F0C301BEE7
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375E53A7186;
	Tue, 16 Jun 2026 21:52:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696B03803E8
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 21:52:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781646755; cv=none; b=cF2ABw6wXunz373fZIIbkDU7k/Rpq7ZlcTkAXDxcvOwrnI2PS5HNJ6LEH4x9t8PeTppTQ6WvmKKPBDCEYGZ73ENcNZ1zkHBtkkRSOgPGlBdgULba741tp07FsUpjUxgcTWJp6ee/6kasyO+ONk/Bq6Z5xarZVM0ELEkmjQMAJwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781646755; c=relaxed/simple;
	bh=z+t4qkijg4CpkkdTqMNRfW+GyguQxNEapD7X/cNfeng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jHOUJQG9BXJDpH7locaS/CZdThq19hBeG4zj7tXTJIYr2/XRNeNRU9eRRORLzCvsdeuOYCNRf+AUYkgESBU9LCsyU8154vBThOtTsJjP0oudrLwHMc+JCTZNAC1u5kOCjmi+Ta35XGa5dLKZqUtRAJDfCwUMBA7XndCfYWw2YZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MIqZE+pa; arc=none smtp.client-ip=91.218.175.171
Message-ID: <e3660e76-37d0-4ec7-bae9-4270fc0a2915@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781646751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDxbC/IU2QNTXprhJNFycvo1KwXX0Aehgiqa57nWk5s=;
	b=MIqZE+pa2wIsX7LIp3BTB7zea9yIWeKxwIUot9zi8uAgfe7GYvqPse0pxvOiG+Xfqzf/FI
	BdQB0rj04711mtTEIw7xIbTW7P/M2fW7TLqrw6sr+IMlDUQVH5vV/eWm+VpTy9CQvv5xNK
	9OsYBSn3ezsNO0pChGdGL3RkHflMn9s=
Date: Tue, 16 Jun 2026 14:52:26 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 04/14] selftests/bpf: Add kfunc set test to
 resolve_btfids
To: Emil Tsalapatis <emil@etsalapatis.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-5-ihor.solodrai@linux.dev>
 <DJAA8M3U5PJ7.W84BYRNJA7UY@etsalapatis.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <DJAA8M3U5PJ7.W84BYRNJA7UY@etsalapatis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13781-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD9506957C8

On 6/16/26 12:07 AM, Emil Tsalapatis wrote:
> On Mon Jun 1, 2026 at 6:17 PM EDT, Ihor Solodrai wrote:
>> Extend the resolve_btfids selftest to cover kfunc sets defined with
>> BTF_KFUNCS_START/BTF_KFUNCS_END.
>>
>> The test verifies that resolve_btfids correctly processes BTF_ID_FLAGS,
>> resolves function IDs, and checks the kfunc set is sorted.
>>
>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> 
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> 
> One nit below.
> 
>> ---
>>  .../selftests/bpf/prog_tests/resolve_btfids.c | 56 +++++++++++++++++++
>>  tools/testing/selftests/bpf/progs/btf_data.c  | 10 ++++
>>  2 files changed, 66 insertions(+)
>>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
>> index d0e51979d455..f6fd79b9dd23 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
>> @@ -10,6 +10,10 @@
>>  #include <linux/btf_ids.h>
>>  #include "test_progs.h"
>>  
>> +#ifndef KF_FASTCALL
>> +#define KF_FASTCALL (1 << 12)
>> +#endif
>> +
>>  struct symbol {
>>  	const char	*name;
>>  	int		 type;
>> @@ -26,6 +30,17 @@ struct symbol test_symbols[] = {
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
>> @@ -77,7 +92,13 @@ BTF_ID(union,   U)
>>  BTF_ID(func,    func)
>>  BTF_SET_END(test_set)
>>  
>> +BTF_KFUNCS_START(test_kfunc_set)
>> +BTF_ID_FLAGS(func, kfunc_a)
>> +BTF_ID_FLAGS(func, kfunc_b, KF_FASTCALL)
>> +BTF_KFUNCS_END(test_kfunc_set)
>> +
>>  #pragma GCC visibility pop
>> +
>>  static int
>>  __resolve_symbol(struct btf *btf, int type_id)
>>  {
>> @@ -108,6 +129,18 @@ __resolve_symbol(struct btf *btf, int type_id)
>>  			test_symbols[i].id = type_id;
>>  	}
>>  
>> +	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC) {
>> +		str = btf__name_by_offset(btf, type->name_off);
>> +		if (str) {
> 
> This can be rewritten to collapse the nesting:
> if (BTF_INFO_KIND(type->info) != BTF_KIND_FUNC) 
> 	return 0;
> 
> str = btf__name_by_offset(btf, type->name_off);
> if (!str)
> 	return 0;
> 
> <the rest>
> 

Hi Emil, thank you for the reviews.

I'm going to drop this string check following Andrii's suggestion, so
this condition will be removed.

Good nit though.

>> +			for (i = 0; i < ARRAY_SIZE(kfunc_symbols); i++) {
>> +				if (kfunc_symbols[i].id >= 0)
>> +					continue;
>> +				if (!strcmp(str, kfunc_symbols[i].name))
>> +					kfunc_symbols[i].id = type_id;
>> +			}
>> +		}
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> @@ -162,6 +195,29 @@ void test_resolve_btfids(void)
>>  			ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check");
>>  	}
>>  
>> +	/* Check BTF_KFUNCS_START(test_kfunc_set) */
>> +	ASSERT_EQ(test_kfunc_set.flags, BTF_SET8_KFUNCS, "kfunc_set_flags");
>> +	ASSERT_EQ(test_kfunc_set.cnt, ARRAY_SIZE(kfunc_symbols), "kfunc_set_cnt");
>> +
>> +	for (i = 0; i < test_kfunc_set.cnt; i++) {
>> +		bool found = false;
>> +
>> +		for (j = 0; j < ARRAY_SIZE(kfunc_symbols); j++) {
>> +			if (kfunc_symbols[j].id != (s32)test_kfunc_set.pairs[i].id)
>> +				continue;
>> +			found = true;
>> +			ASSERT_EQ(test_kfunc_set.pairs[i].flags,
>> +				  kfunc_symbols[j].flags, "kfunc_flags_check");
>> +			break;
>> +		}
>> +
>> +		ASSERT_TRUE(found, "kfunc_id_found");
>> +
>> +		if (i > 0)
>> +			ASSERT_LE(test_kfunc_set.pairs[i - 1].id,
>> +				  test_kfunc_set.pairs[i].id, "kfunc_sort_check");
>> +	}
>> +
>>  out:
>>  	btf__free(btf);
>>  }
>> diff --git a/tools/testing/selftests/bpf/progs/btf_data.c b/tools/testing/selftests/bpf/progs/btf_data.c
>> index baa525275bde..8587658012c3 100644
>> --- a/tools/testing/selftests/bpf/progs/btf_data.c
>> +++ b/tools/testing/selftests/bpf/progs/btf_data.c
>> @@ -48,3 +48,13 @@ int func(struct root_struct *root)
>>  {
>>  	return 0;
>>  }
>> +
>> +int kfunc_a(struct root_struct *root)
>> +{
>> +	return 0;
>> +}
>> +
>> +int kfunc_b(struct root_struct *root)
>> +{
>> +	return 0;
>> +}
> 


