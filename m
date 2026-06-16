Return-Path: <linux-kbuild+bounces-13782-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m2x1HQDGMWrZpwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13782-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 23:54:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6426957D3
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 23:54:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=sCQO4gpl;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13782-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13782-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DE63314A745
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415A239B96A;
	Tue, 16 Jun 2026 21:54:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFB37FF5D
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 21:54:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781646845; cv=none; b=tXl/x9KYtJHKP8CLEyho/hUIQLNpGdqxTEw8GKMiPZjw8lJfvhvAenJh0rGlGrn3xOYZjDCNzdOVEar2mq37PwGy7khmd8d69PJthOHIjZNWfA+/DhL/GNRFvy0lXLhmwDz7hMIC32AxLUkTaAYY75TFWq2BTUkyJZzc2jdWZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781646845; c=relaxed/simple;
	bh=iSvbOn8LMH0gjakyL1/+N6jmWCxG+mnK/sg5InzcWPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdl5rZHPFRxcdQcjyxUUqjOndBef5Qj+ehMNLQ9O/gAuUsaakEG+ERvJU3DJyTy2vK8NEnvdruantDyHrqxsa30LhBoDAgUIHWR9qvly8iHKxWQ3ILltbXAxDfz2QZl6SZgzThG3unCg6sfzl2676TsCoeKmxkpmAO8etZ2VKME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sCQO4gpl; arc=none smtp.client-ip=91.218.175.172
Message-ID: <97b735d8-ed83-49d0-bfec-27b8bd078fff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781646841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2pWuXjo9jEXUMyM/7ju79/6mRLJtpmrpM5ncW2TqoI=;
	b=sCQO4gplPovkO8MqIS2sPUGrog2JRfwNCjFEzp38hxjX8y8/4EW6duZCRMxFCskw4GxbW7
	sgnMB39Ay5+FJI4T3WDizOGB2prtMlAE30BVBHoLB18S/OiRMN+N+Zv2Hc6HPgvEsl3O2D
	pVDkM69eiocRBJq7INBlVMnyzqxQ/V4=
Date: Tue, 16 Jun 2026 14:53:56 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 05/14] resolve_btfids: Index BTF ID symbols by
 address
To: Emil Tsalapatis <emil@etsalapatis.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-6-ihor.solodrai@linux.dev>
 <DJAP3FDYA9GP.O5139CT1RYW3@etsalapatis.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <DJAP3FDYA9GP.O5139CT1RYW3@etsalapatis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13782-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[etsalapatis.com,kernel.org,iogearbox.net,gmail.com];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:emil@etsalapatis.com,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC6426957D3

On 6/16/26 11:45 AM, Emil Tsalapatis wrote:
> On Mon Jun 1, 2026 at 6:17 PM EDT, Ihor Solodrai wrote:
>> Keep an address-sorted index of parsed .BTF_ids symbols so code that
>> the original BTF_ID symbol name can be recovered from an entry
>> address.
>>
>> Use the index in find_kfunc_flags() to scan BTF_SET8_KFUNCS entries
>> directly and match each entry back to the requested kfunc.
>>
>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> 
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> 
> Some notes on clarity below.
> 
>> ---
>>  tools/bpf/resolve_btfids/main.c | 103 +++++++++++++++++++++++++-------
>>  1 file changed, 80 insertions(+), 23 deletions(-)
>>
>> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
>> index f8a91fa7584f..43512af13148 100644
>> --- a/tools/bpf/resolve_btfids/main.c
>> +++ b/tools/bpf/resolve_btfids/main.c
>> @@ -119,6 +119,11 @@ struct btf_id {
>>  	Elf64_Addr	 addr[ADDR_CNT];
>>  };
>>  
>> +struct addr_sym {
>> +	Elf64_Addr	 addr;
>> +	const char	*name;
>> +};
>> +
>>  struct object {
>>  	const char *path;
>>  	const char *btf_path;
>> @@ -150,6 +155,10 @@ struct object {
>>  	int nr_structs;
>>  	int nr_unions;
>>  	int nr_typedefs;
>> +
>> +	struct addr_sym *addr_syms;
>> +	int nr_addr_syms;
>> +	int max_addr_syms;
>>  };
>>  
>>  #define KF_IMPLICIT_ARGS (1 << 16)
>> @@ -480,6 +489,49 @@ static int elf_collect(struct object *obj)
>>  	return 0;
>>  }
>>  
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
>> +
>>  static int symbols_collect(struct object *obj)
>>  {
>>  	Elf_Scn *scn = NULL;
>> @@ -573,8 +625,14 @@ static int symbols_collect(struct object *obj)
>>  			return -1;
>>  		}
>>  		id->addr[id->addr_cnt++] = sym.st_value;
>> +
>> +		if (push_addr_sym(obj, sym.st_value, id->name))
>> +			return -1;
>>  	}
>>  
>> +	qsort(obj->addr_syms, obj->nr_addr_syms, sizeof(*obj->addr_syms),
>> +	      cmp_addr_sym);
>> +
>>  	return 0;
>>  }
>>  
>> @@ -946,43 +1004,41 @@ static int collect_decl_tags(struct btf2btf_context *ctx)
>>  }
>>  
>>  /*
>> - * To find the kfunc flags having its struct btf_id (with ELF addresses)
>> - * we need to find the address that is in range of a set8.
>> - * If a set8 is found, then the flags are located at addr + 4 bytes.
>> + * To find kfunc flags, scan BTF_SET8_KFUNCS entries and use the entry
>> + * address to recover the corresponding BTF_ID symbol name.
>>   * Return 0 (no flags!) if not found.
>>   */
>>  static u32 find_kfunc_flags(struct object *obj, struct btf_id *kfunc_id)
>>  {
>>  	const u32 *elf_data_ptr = obj->efile.idlist->d_buf;
>> -	u64 set_lower_addr, set_upper_addr, addr;
>>  	struct btf_id *set_id;
>>  	struct rb_node *next;
>> -	u32 flags;
>> -	u64 idx;
>> +	u64 idx, set_addr;
>> +	u32 set_flags;
>>  
>>  	for (next = rb_first(&obj->sets); next; next = rb_next(next)) {
>>  		set_id = rb_entry(next, struct btf_id, rb_node);
>>  		if (set_id->kind != BTF_ID_KIND_SET8 || set_id->addr_cnt != 1)
>>  			continue;
>>  
>> -		set_lower_addr = set_id->addr[0];
>> -		set_upper_addr = set_lower_addr + set_id->cnt * sizeof(u64);
>> +		set_addr = set_id->addr[0];
>> +		idx = (set_addr - obj->efile.idlist_addr) / sizeof(u32) + 1;
> 
> Is the +1 because the set8-global flags are in &((char *)btf_id_set8)[4]?
> If that's the case, can you add a comment that you're checking the
> set-global flags to decide whether to skip all of it?

I explained this here:
https://lore.kernel.org/bpf/2d2329ac-5394-4eac-926a-990c83eabaa1@linux.dev/

I'll try to rework this to avoid mysterious +1 increments.

> 
>> +		set_flags = elf_data_ptr[idx];
>> +		if (!(set_flags & BTF_SET8_KFUNCS))
>> +			continue;
>>  
>> -		for (u32 i = 0; i < kfunc_id->addr_cnt; i++) {
>> -			addr = kfunc_id->addr[i];
>> -			/*
>> -			 * Lower bound is exclusive to skip the 8-byte header of the set.
>> -			 * Upper bound is inclusive to capture the last entry at offset 8*cnt.
>> -			 */
>> -			if (set_lower_addr < addr && addr <= set_upper_addr) {
>> -				pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n",
>> -					 kfunc_id->name, set_id->name);
>> -				idx = addr - obj->efile.idlist_addr;
>> -				idx = idx / sizeof(u32) + 1;
>> -				flags = elf_data_ptr[idx];
>> -
>> -				return flags;
>> -			}
>> +		for (u32 i = 0; i < set_id->cnt; i++) {
>> +			Elf64_Addr addr = set_addr + sizeof(u64) * (i + 1);
> 
> Same here, can you point out that the +1 is to skip the set header?
> 
>> +			const char *name = find_name_by_addr(obj, addr);
>> +
>> +			if (!name || strcmp(name, kfunc_id->name) != 0)
>> +				continue;
>> +
>> +			pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n",
>> +				 kfunc_id->name, set_id->name);
>> +
>> +			idx = (addr - obj->efile.idlist_addr) / sizeof(u32) + 1;
> 
> This seems to be the same calculation as we do for the whole set8 flag,
> but AFAICT the context is different and here we're indexing into the pair. 
> Can you add a comment for this?
> 
>> +			return elf_data_ptr[idx];
>>  		}
>>  	}
>>  
>> @@ -1575,6 +1631,7 @@ int main(int argc, const char **argv)
>>  	btf_id__free_all(&obj.typedefs);
>>  	btf_id__free_all(&obj.funcs);
>>  	btf_id__free_all(&obj.sets);
>> +	free(obj.addr_syms);
>>  	if (obj.efile.elf) {
>>  		elf_end(obj.efile.elf);
>>  		close(obj.efile.fd);
> 


