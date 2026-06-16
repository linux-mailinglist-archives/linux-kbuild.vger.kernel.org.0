Return-Path: <linux-kbuild+bounces-13779-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 07OKHnXEMWpppwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13779-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 23:47:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AD052695763
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 23:47:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=uwl8PbE9;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13779-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13779-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4BDED3017EE2
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF20F37FF5D;
	Tue, 16 Jun 2026 21:47:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0EF331EA5
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 21:47:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781646442; cv=none; b=myAo2i4W6fdh3pz+o0MdexhznKqvNwJICGmiTqv1MB+P7wsIV7vxOjtdLxJ5yDjKZdqz4V2i11mwcHr9DEyLo4Jsb0OjEXQfua56VgJG2RcI2v565HivvwwhxBIsDaZxaAueb/tnMOeUYLlA2vvSw60zRysmOtDIn2mQk2V8RBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781646442; c=relaxed/simple;
	bh=EP8WzJM9f4tD04pJNHeXtemwXaQnAlZmGRo6vVnD3Jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9ms9DnrEU6goXhC8+DHoc/Dq8LOL/2q64/OZTD55S0XooM9t1f0/R1nR76IaySDCT0MdnE6HxLdo7q7o8Hb5gvFDj8UE6/Qk4z2mG7h7sEEtQ20IIr1MWb2chvVeeeww5cqVnoBE93xRJu7e6Ax9SGY4LBvyB+8mR5XmK1qZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uwl8PbE9; arc=none smtp.client-ip=91.218.175.181
Message-ID: <2d2329ac-5394-4eac-926a-990c83eabaa1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781646429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ytJJED0V5o5ZE5j301pDRjAf2BxYSXlReJ3reV7A+E=;
	b=uwl8PbE93vRyCphXxIKTObalSJjhQC84FTD2BR3+9HZ+eL8a5k2SA9N04kGOxX2B1vadQZ
	lD/lPioScu/ntlU3q+7jZxAar0I+0wuWLu6ntP5c8bcag+4iAyxCwdKlOQu/9j6qDNsTeN
	LPZKVB3JYg/uvYwHiCjU/7fWGJMO0KI=
Date: Tue, 16 Jun 2026 14:47:02 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 05/14] resolve_btfids: Index BTF ID symbols by
 address
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Emil Tsalapatis <emil@etsalapatis.com>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-6-ihor.solodrai@linux.dev>
 <CAEf4BzYevwUOY34KOdjRd9cv5uXdxEwy13+6vHmNo_h4ryyT5g@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <CAEf4BzYevwUOY34KOdjRd9cv5uXdxEwy13+6vHmNo_h4ryyT5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13779-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD052695763

On 6/3/26 4:45 PM, Andrii Nakryiko wrote:
> On Mon, Jun 1, 2026 at 3:19 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>
>> Keep an address-sorted index of parsed .BTF_ids symbols so code that
>> the original BTF_ID symbol name can be recovered from an entry
>> address.
>>
>> Use the index in find_kfunc_flags() to scan BTF_SET8_KFUNCS entries
>> directly and match each entry back to the requested kfunc.
>>
>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>> ---
>>  tools/bpf/resolve_btfids/main.c | 103 +++++++++++++++++++++++++-------
>>  1 file changed, 80 insertions(+), 23 deletions(-)
>>
>> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
>> index f8a91fa7584f..43512af13148 100644
>> --- a/tools/bpf/resolve_btfids/main.c
>> +++ b/tools/bpf/resolve_btfids/main.c
>> @@ -119,6 +119,11 @@ struct btf_id {
>>         Elf64_Addr       addr[ADDR_CNT];
>>  };
>>
>> +struct addr_sym {
>> +       Elf64_Addr       addr;
>> +       const char      *name;
>> +};
>> +
>>  struct object {
>>         const char *path;
>>         const char *btf_path;
>> @@ -150,6 +155,10 @@ struct object {
>>         int nr_structs;
>>         int nr_unions;
>>         int nr_typedefs;
>> +
>> +       struct addr_sym *addr_syms;
>> +       int nr_addr_syms;
>> +       int max_addr_syms;
> 
> nit: max seems misnamed, it's "capacity", so I'd choose
> "addr_syms_cnt" and "addr_syms_cap" naming (I believe libbpf does that
> relatively consistently)
> 
>>  };
>>
>>  #define KF_IMPLICIT_ARGS (1 << 16)
> 
> [...]
> 
>>         for (next = rb_first(&obj->sets); next; next = rb_next(next)) {
>>                 set_id = rb_entry(next, struct btf_id, rb_node);
>>                 if (set_id->kind != BTF_ID_KIND_SET8 || set_id->addr_cnt != 1)
>>                         continue;
>>
>> -               set_lower_addr = set_id->addr[0];
>> -               set_upper_addr = set_lower_addr + set_id->cnt * sizeof(u64);
>> +               set_addr = set_id->addr[0];
>> +               idx = (set_addr - obj->efile.idlist_addr) / sizeof(u32) + 1;
> 
> where is this +1 coming from? we have some reserved zero entry in
> .BTF_ids section? I'd understand if this was symbols table, where we
> do have zero entry, but I'm not quite following here...

We do a +1 in find_kfunc_flags() three times for slightly different reasons:

  // Here we extract the *set* flags from the header
  idx = (set_addr - obj->efile.idlist_addr) / sizeof(u32) + 1;
  set_flags = elf_data_ptr[idx];

  [...]

  // here we skip the btf_id_set header
  Elf64_Addr addr = set_addr + sizeof(u64) * (i + 1);

  [...]

  // and here we extract the flags from a pair
  idx = (addr - obj->efile.idlist_addr) / sizeof(u32) + 1;
  return elf_data_ptr[idx];

I think the way to make it less confusing is to cast the data pointer
to struct btf_id_set8 before inspecting it, and read the fields.

I'll do that in v2.


> 
> 
> 
>> +               set_flags = elf_data_ptr[idx];
>> +               if (!(set_flags & BTF_SET8_KFUNCS))
>> +                       continue;
>>
>> -               for (u32 i = 0; i < kfunc_id->addr_cnt; i++) {
>> -                       addr = kfunc_id->addr[i];
>> -                       /*
>> -                        * Lower bound is exclusive to skip the 8-byte header of the set.
>> -                        * Upper bound is inclusive to capture the last entry at offset 8*cnt.
>> -                        */
>> -                       if (set_lower_addr < addr && addr <= set_upper_addr) {
>> -                               pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n",
>> -                                        kfunc_id->name, set_id->name);
>> -                               idx = addr - obj->efile.idlist_addr;
>> -                               idx = idx / sizeof(u32) + 1;
>> -                               flags = elf_data_ptr[idx];
>> -
>> -                               return flags;
>> -                       }
>> +               for (u32 i = 0; i < set_id->cnt; i++) {
>> +                       Elf64_Addr addr = set_addr + sizeof(u64) * (i + 1);
>> +                       const char *name = find_name_by_addr(obj, addr);
>> +
>> +                       if (!name || strcmp(name, kfunc_id->name) != 0)
>> +                               continue;
>> +
>> +                       pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n",
>> +                                kfunc_id->name, set_id->name);
>> +
>> +                       idx = (addr - obj->efile.idlist_addr) / sizeof(u32) + 1;
>> +                       return elf_data_ptr[idx];
>>                 }
>>         }
>>
>> @@ -1575,6 +1631,7 @@ int main(int argc, const char **argv)
>>         btf_id__free_all(&obj.typedefs);
>>         btf_id__free_all(&obj.funcs);
>>         btf_id__free_all(&obj.sets);
>> +       free(obj.addr_syms);
>>         if (obj.efile.elf) {
>>                 elf_end(obj.efile.elf);
>>                 close(obj.efile.fd);
>> --
>> 2.54.0
>>


