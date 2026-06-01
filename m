Return-Path: <linux-kbuild+bounces-13465-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BVoIeMPHmoDhAkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13465-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 01:04:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D475D6262B2
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 01:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F9E23018BCC
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 23:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD01C32BF4B;
	Mon,  1 Jun 2026 23:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyrS6jkn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9DF224B15;
	Mon,  1 Jun 2026 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355014; cv=none; b=sHNKKrqrCFXW5GFKyJNvl4cT5jzlKpLrodh+gp/pAnKsloH1Zvs7aP1/IFV18r56BbRi/9KK2ELDAtOtpwB7XDtxrj/eUE/9+gwNO65B95VabenXxhrJ/uJMbUk5d0daSOWKALMUEazh3uF2m3xrGnDHqdTJzrZ6Xf838M0Vfac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355014; c=relaxed/simple;
	bh=isQPI1zRDgd+mM+LG3mk2/Xm9FHUEkkt1Z4KpTE/Gu0=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=umWm+EstUDrINfR7SfMm4JQTXzkH9/9kdg+nfqiDKO8SPe7QOpAZr1d1fmy1c3fnSvUZq/mLImN51v0MHJ7cH1Lm3oFaHH/vZe+Hbd32b9JEr0DT0O3a1BX/10PzzEvFkmWlmXVZZxpmRypjZt2+wnfsci2nn8QO5EbR0x60s1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyrS6jkn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E151F00893;
	Mon,  1 Jun 2026 23:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780355013;
	bh=9D4ES3ttROPEmcAx3NEIjqAzNpNeNiLF3KE5qJOXFx4=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=MyrS6jknW604Bzbt+k3Dv3LfpyqR8dXPAuYIZRlY47bqhL0XdrvduftsK6XVCXbHd
	 6HC4SY4bi37nQW+ELxfHRwxgApEWhV8GQwbWN7POqrLradU51e22gupEXKSlX0beyV
	 p3kSLiGEGrn2vRz1deBFz6UOyer0DT15VlOqMD8vEeGadDb7Lxrc6h/S6UxA5a1mfa
	 d7BN6vj+XcHOPKSr9D8bb/jB4ljo9Rx/vsvStARKnNzmqq6dApX5Z25k867d/haUv9
	 QCFIDOiEa/tBbiEAYIZxiEuoXbqkoU+bXYmNiqQcaSMCwki9fcP9stRmGd9GcrB46E
	 PJW/HIh+rtDfw==
Content-Type: multipart/mixed; boundary="===============0400380545981152819=="
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7aeb342f9c732340060de5e50d2e8fbb2af70ed53eb8d6309a4f96e94c95912e@mail.kernel.org>
In-Reply-To: <20260601221805.821394-6-ihor.solodrai@linux.dev>
References: <20260601221805.821394-6-ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v1 05/14] resolve_btfids: Index BTF ID symbols by address
From: bot+bpf-ci@kernel.org
To: ihor.solodrai@linux.dev,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,eddyz87@gmail.com,memxor@gmail.com
Cc: alan.maguire@oracle.com,jolsa@kernel.org,bpf@vger.kernel.org,linux-kbuild@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon,  1 Jun 2026 23:03:32 +0000 (UTC)
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13465-lists,linux-kbuild=lfdr.de,bpf-ci];
	FREEMAIL_CC(0.00)[oracle.com,kernel.org,vger.kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D475D6262B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============0400380545981152819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
> index f8a91fa7584f..43512af13148 100644
> --- a/tools/bpf/resolve_btfids/main.c
> +++ b/tools/bpf/resolve_btfids/main.c

[ ... ]

> @@ -480,6 +489,49 @@ static int elf_collect(struct object *obj)
>  	return 0;
>  }
>
> +static int push_addr_sym(struct object *obj, Elf64_Addr addr, const char *name)
> +{
> +	struct addr_sym *arr = obj->addr_syms;
> +	int cap = obj->max_addr_syms;
> +
> +	if (obj->nr_addr_syms + 1 > cap) {
> +		cap = max(cap + 256, cap * 2);
> +		arr = realloc(arr, sizeof(*arr) * cap);
> +		if (!arr)
> +			return -ENOMEM;
> +		obj->max_addr_syms = cap;
> +		obj->addr_syms = arr;
> +	}
> +
> +	obj->addr_syms[obj->nr_addr_syms].addr = addr;
> +	obj->addr_syms[obj->nr_addr_syms].name = name;
> +	obj->nr_addr_syms++;
> +
> +	return 0;
> +}
> +
> +static int cmp_addr_sym(const void *a, const void *b)
> +{
> +	Elf64_Addr aa = ((const struct addr_sym *)a)->addr;
> +	Elf64_Addr ab = ((const struct addr_sym *)b)->addr;
> +
> +	if (aa < ab)
> +		return -1;
> +	if (aa > ab)
> +		return 1;
> +	return 0;
> +}
> +
> +static const char *find_name_by_addr(struct object *obj, Elf64_Addr addr)
> +{
> +	struct addr_sym key = { .addr = addr };
> +	struct addr_sym *res;
> +
> +	res = bsearch(&key, obj->addr_syms, obj->nr_addr_syms,
> +		      sizeof(*obj->addr_syms), cmp_addr_sym);

If the ELF file lacks BTF ID symbols, obj->addr_syms remains NULL and
obj->nr_addr_syms is 0. Calling bsearch with a NULL base pointer is
Undefined Behavior under the C standard, which can cause issues with UBSan
builds.

> +	return res ? res->name : NULL;
> +}
> +
>  static int symbols_collect(struct object *obj)
>  {
>  	Elf_Scn *scn = NULL;
> @@ -573,8 +625,14 @@ static int symbols_collect(struct object *obj)
>  			return -1;
>  		}
>  		id->addr[id->addr_cnt++] = sym.st_value;
> +
> +		if (push_addr_sym(obj, sym.st_value, id->name))
> +			return -1;
>  	}
>
> +	qsort(obj->addr_syms, obj->nr_addr_syms, sizeof(*obj->addr_syms),
> +	      cmp_addr_sym);

Does this have the same NULL pointer issue as the bsearch call? If the
array is empty and obj->addr_syms is NULL, calling qsort here triggers the
same Undefined Behavior as described above.

[ ... ]

> @@ -946,43 +1004,41 @@ static int collect_decl_tags(struct btf2btf_context *ctx)
>  }
>
>  /*
> - * To find the kfunc flags having its struct btf_id (with ELF addresses)
> - * we need to find the address that is in range of a set8.
> - * If a set8 is found, then the flags are located at addr + 4 bytes.
> + * To find kfunc flags, scan BTF_SET8_KFUNCS entries and use the entry
> + * address to recover the corresponding BTF_ID symbol name.
>   * Return 0 (no flags!) if not found.
>   */
>  static u32 find_kfunc_flags(struct object *obj, struct btf_id *kfunc_id)
>  {
>  	const u32 *elf_data_ptr = obj->efile.idlist->d_buf;
> -	u64 set_lower_addr, set_upper_addr, addr;
>  	struct btf_id *set_id;
>  	struct rb_node *next;
> -	u32 flags;
> -	u64 idx;
> +	u64 idx, set_addr;
> +	u32 set_flags;
>
>  	for (next = rb_first(&obj->sets); next; next = rb_next(next)) {
>  		set_id = rb_entry(next, struct btf_id, rb_node);
>  		if (set_id->kind != BTF_ID_KIND_SET8 || set_id->addr_cnt != 1)
>  			continue;
>
> -		set_lower_addr = set_id->addr[0];
> -		set_upper_addr = set_lower_addr + set_id->cnt * sizeof(u64);
> +		set_addr = set_id->addr[0];
> +		idx = (set_addr - obj->efile.idlist_addr) / sizeof(u32) + 1;
> +		set_flags = elf_data_ptr[idx];
> +		if (!(set_flags & BTF_SET8_KFUNCS))
> +			continue;
>
> -		for (u32 i = 0; i < kfunc_id->addr_cnt; i++) {
> -			addr = kfunc_id->addr[i];
> -			/*
> -			 * Lower bound is exclusive to skip the 8-byte header of the set.
> -			 * Upper bound is inclusive to capture the last entry at offset 8*cnt.
> -			 */
> -			if (set_lower_addr < addr && addr <= set_upper_addr) {
> -				pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n",
> -					 kfunc_id->name, set_id->name);
> -				idx = addr - obj->efile.idlist_addr;
> -				idx = idx / sizeof(u32) + 1;
> -				flags = elf_data_ptr[idx];
> -
> -				return flags;
> -			}
> +		for (u32 i = 0; i < set_id->cnt; i++) {

When parsing SET8 symbols, the count is calculated as 'id->cnt =
sym.st_size / sizeof(uint64_t) - 1'. If sym.st_size is less than 8,
id->cnt (which is a signed int) becomes -1.

Because the loop index 'i' is an unsigned 32-bit integer, the comparison
promotes the signed -1 to 0xFFFFFFFF. Could this cause the tool to hang
spinning through 4 billion iterations if it processes a corrupted or crafted
ELF object?

> +			Elf64_Addr addr = set_addr + sizeof(u64) * (i + 1);
> +			const char *name = find_name_by_addr(obj, addr);
> +
> +			if (!name || strcmp(name, kfunc_id->name) != 0)
> +				continue;
> +
> +			pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n",
> +				 kfunc_id->name, set_id->name);
> +
> +			idx = (addr - obj->efile.idlist_addr) / sizeof(u32) + 1;
> +			return elf_data_ptr[idx];
>  		}
>  	}
>


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26786221491
--===============0400380545981152819==--

