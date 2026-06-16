Return-Path: <linux-kbuild+bounces-13770-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eLfuNC6aMWr4nwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13770-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:47:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE569477D
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 20:47:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etsalapatis-com.20251104.gappssmtp.com header.s=20251104 header.b=vPHFnLJg;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13770-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13770-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B53A31A4505
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 18:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0954143CEC7;
	Tue, 16 Jun 2026 18:46:02 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D434C3CFF55
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 18:45:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635561; cv=none; b=cKJfJgXRwJk8sNVIAnPRsG0CvB5Qd0UBW4iHBWHMxvWgqOUcXVR0eQsODCgxG0loLS/yjGG0WjvXuOVi+TYM1KP2+LHCZK8l3StHcHygMiM2wRGc+u/3jUKWaLArvu1hT5cb6aMjZBdgU8mQn6xr4AvxCV88iAWLBhujIXBd2t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635561; c=relaxed/simple;
	bh=xRAnsk63hEPHzAYY/5s1W+Y7VqNWc6G6rnpC5TQG6+c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nDqvvvK3N2xKN6+JuQBGy/5YdwEqhr6vOBw4lY6TrLkJ2g3TLJ/r4xsdqoe2q/I8JOc1/P6T7YcW5Rqv95Iklws4gn6NmdJdDmoZDRn3xbO25cdr5zvX4Gd3NiIq2TJyIzJdRwd/NlcfWu04TzNiP8yT9Ut1A47MocM2xlTWswU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=vPHFnLJg; arc=none smtp.client-ip=74.125.82.41
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-13721dfd471so5437564c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 11:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781635559; x=1782240359; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NLIEWJdLWivuk8iq8yhitx8CxAOZpJDc0aqqsb3250=;
        b=vPHFnLJgZbn3SXz9pTeix6doV7dtQ3y/1bNMUZSffyr16W/L+rx0OwNIi+lwgIe1Yd
         sAw6I1WjhHUNaPD9ep9W+AXzw3LsqSitXrYqCSAU8aczRXwx3guRjMjg8RTvWXtfBfkV
         Awb3KF3iy8mjZHzd4Jt6+Y7gqiK5jCnifAetw9gG32KUmNU9pOsulzN7BkWGWljtyacb
         yZolZJp0BSwKoiCynFNTgjFijPISBW0YXl9so9bJZioTG/d3QGy9rip6qTyXfCXAZyNa
         OGrDdmQbkt9o16CRVrWAN/V8yk0tK5BPClI0eMEp9qiFBYGKrl6hGF2KpQdMAXjvIHbv
         mj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781635559; x=1782240359;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1NLIEWJdLWivuk8iq8yhitx8CxAOZpJDc0aqqsb3250=;
        b=Rd20GjYj4ZxaMPNPlxoclejo9JIbm+Yn6UIXzypzw+osoUu+Vg4fR/Sdzk9fdqfJmP
         uPnWKDjIdkEgkjKJRS/VdQx1gKy4zIBwAofODOKfwRra6rYcMZRu/HagykqZEdw1s2mb
         86LWE6C8jdJ2JXQibDiMi9XMPHuLXn5BxFAXa1x7c4wKjK59gK3i1vD5WA+bj83v2olk
         dV3QucElMWZMOSZGI+4I5V0y3oSgktd3V5mYvtBlb9xA+YXAJD+2i0/7DFKwW3bSLewf
         9/Xr3NtGiLzF8iHT2pv9gRuLAt8oRC34DShjN3FqArZT9Ci7VsB5tROT5E5mejWo6bKo
         56rw==
X-Forwarded-Encrypted: i=1; AFNElJ97nmalAQjjOqh322IiEcQBuKD9NTD/PJUsDZ6wNDkkMywuKSrFLVgDiEs39jalFOoh6CQYXyl/kU0APsE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/0OWbrBJieYbOsWrb6bgmhJauj1IuuFmYEs/n8k/SV2KVmAw
	5q3XJ49pm8zMmBNAAiMrQQFu7/pmMk68Vd0ShtCLegygbHjTxNE2BaYH0TwkSBOSev5SfvS9TJB
	Kf9HdKbVr/Q==
X-Gm-Gg: Acq92OH9ZbXPnH2iSsa5MdAC0E9piXu8UutDOvMpEoz4SZXCojHNC4sQ/mvRoKulQ5N
	MYvFL3KeQ5I/5vfZAvHMxK2x1gTOwuVwM/jmA4dtxe1IvByOCpFFwuH+EAhZYYu7YlYlrPGpM72
	E3NTqqvaDitxBcizmqOSc88OxA6FhdBRyfIhRKFZPCjU5iBZj+IqJqtsY7LqqN7sPRYozDr0SY4
	g+TPqEWJOKZ91ln2ioTESEoSrmKNtIANKjL0IkK13sa87mm0mZ2gURIvD3RzKtFjzLcwjoR/xE5
	QNDJBN0whb7Xwf/d0mwRTPfV9UYGdBj7MQ3A8SwLDOmcuGslnji2mGsQ1u//qt5kdPRv4ig1fgJ
	zd6PevuUDWpiazIEtDOIGMiUjqUc4StBiFYbGW6Itni1szwcReQxbmTVZsOzn7RH7zS9UOwRst0
	V9iZEg
X-Received: by 2002:a05:7022:f92:b0:135:f5ed:868 with SMTP id a92af1059eb24-1398f6c9a68mr109659c88.17.1781635558681;
        Tue, 16 Jun 2026 11:45:58 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::1a8e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b910c51sm14191480c88.4.2026.06.16.11.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 11:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 14:45:56 -0400
Message-Id: <DJAP3FDYA9GP.O5139CT1RYW3@etsalapatis.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Jiri Olsa"
 <jolsa@kernel.org>, <bpf@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 05/14] resolve_btfids: Index BTF ID symbols
 by address
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-6-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-6-ihor.solodrai@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[etsalapatis-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[etsalapatis.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13770-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[emil@etsalapatis.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etsalapatis-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[emil@etsalapatis.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,etsalapatis.com:email,etsalapatis.com:mid,etsalapatis.com:from_mime,linux.dev:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34BE569477D

On Mon Jun 1, 2026 at 6:17 PM EDT, Ihor Solodrai wrote:
> Keep an address-sorted index of parsed .BTF_ids symbols so code that
> the original BTF_ID symbol name can be recovered from an entry
> address.
>
> Use the index in find_kfunc_flags() to scan BTF_SET8_KFUNCS entries
> directly and match each entry back to the requested kfunc.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

Some notes on clarity below.

> ---
>  tools/bpf/resolve_btfids/main.c | 103 +++++++++++++++++++++++++-------
>  1 file changed, 80 insertions(+), 23 deletions(-)
>
> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/m=
ain.c
> index f8a91fa7584f..43512af13148 100644
> --- a/tools/bpf/resolve_btfids/main.c
> +++ b/tools/bpf/resolve_btfids/main.c
> @@ -119,6 +119,11 @@ struct btf_id {
>  	Elf64_Addr	 addr[ADDR_CNT];
>  };
> =20
> +struct addr_sym {
> +	Elf64_Addr	 addr;
> +	const char	*name;
> +};
> +
>  struct object {
>  	const char *path;
>  	const char *btf_path;
> @@ -150,6 +155,10 @@ struct object {
>  	int nr_structs;
>  	int nr_unions;
>  	int nr_typedefs;
> +
> +	struct addr_sym *addr_syms;
> +	int nr_addr_syms;
> +	int max_addr_syms;
>  };
> =20
>  #define KF_IMPLICIT_ARGS (1 << 16)
> @@ -480,6 +489,49 @@ static int elf_collect(struct object *obj)
>  	return 0;
>  }
> =20
> +static int push_addr_sym(struct object *obj, Elf64_Addr addr, const char=
 *name)
> +{
> +	struct addr_sym *arr =3D obj->addr_syms;
> +	int cap =3D obj->max_addr_syms;
> +
> +	if (obj->nr_addr_syms + 1 > cap) {
> +		cap =3D max(cap + 256, cap * 2);
> +		arr =3D realloc(arr, sizeof(*arr) * cap);
> +		if (!arr)
> +			return -ENOMEM;
> +		obj->max_addr_syms =3D cap;
> +		obj->addr_syms =3D arr;
> +	}
> +
> +	obj->addr_syms[obj->nr_addr_syms].addr =3D addr;
> +	obj->addr_syms[obj->nr_addr_syms].name =3D name;
> +	obj->nr_addr_syms++;
> +
> +	return 0;
> +}
> +
> +static int cmp_addr_sym(const void *a, const void *b)
> +{
> +	Elf64_Addr aa =3D ((const struct addr_sym *)a)->addr;
> +	Elf64_Addr ab =3D ((const struct addr_sym *)b)->addr;
> +
> +	if (aa < ab)
> +		return -1;
> +	if (aa > ab)
> +		return 1;
> +	return 0;
> +}
> +
> +static const char *find_name_by_addr(struct object *obj, Elf64_Addr addr=
)
> +{
> +	struct addr_sym key =3D { .addr =3D addr };
> +	struct addr_sym *res;
> +
> +	res =3D bsearch(&key, obj->addr_syms, obj->nr_addr_syms,
> +		      sizeof(*obj->addr_syms), cmp_addr_sym);
> +	return res ? res->name : NULL;
> +}
> +
>  static int symbols_collect(struct object *obj)
>  {
>  	Elf_Scn *scn =3D NULL;
> @@ -573,8 +625,14 @@ static int symbols_collect(struct object *obj)
>  			return -1;
>  		}
>  		id->addr[id->addr_cnt++] =3D sym.st_value;
> +
> +		if (push_addr_sym(obj, sym.st_value, id->name))
> +			return -1;
>  	}
> =20
> +	qsort(obj->addr_syms, obj->nr_addr_syms, sizeof(*obj->addr_syms),
> +	      cmp_addr_sym);
> +
>  	return 0;
>  }
> =20
> @@ -946,43 +1004,41 @@ static int collect_decl_tags(struct btf2btf_contex=
t *ctx)
>  }
> =20
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
>  	const u32 *elf_data_ptr =3D obj->efile.idlist->d_buf;
> -	u64 set_lower_addr, set_upper_addr, addr;
>  	struct btf_id *set_id;
>  	struct rb_node *next;
> -	u32 flags;
> -	u64 idx;
> +	u64 idx, set_addr;
> +	u32 set_flags;
> =20
>  	for (next =3D rb_first(&obj->sets); next; next =3D rb_next(next)) {
>  		set_id =3D rb_entry(next, struct btf_id, rb_node);
>  		if (set_id->kind !=3D BTF_ID_KIND_SET8 || set_id->addr_cnt !=3D 1)
>  			continue;
> =20
> -		set_lower_addr =3D set_id->addr[0];
> -		set_upper_addr =3D set_lower_addr + set_id->cnt * sizeof(u64);
> +		set_addr =3D set_id->addr[0];
> +		idx =3D (set_addr - obj->efile.idlist_addr) / sizeof(u32) + 1;

Is the +1 because the set8-global flags are in &((char *)btf_id_set8)[4]?
If that's the case, can you add a comment that you're checking the
set-global flags to decide whether to skip all of it?

> +		set_flags =3D elf_data_ptr[idx];
> +		if (!(set_flags & BTF_SET8_KFUNCS))
> +			continue;
> =20
> -		for (u32 i =3D 0; i < kfunc_id->addr_cnt; i++) {
> -			addr =3D kfunc_id->addr[i];
> -			/*
> -			 * Lower bound is exclusive to skip the 8-byte header of the set.
> -			 * Upper bound is inclusive to capture the last entry at offset 8*cnt=
.
> -			 */
> -			if (set_lower_addr < addr && addr <=3D set_upper_addr) {
> -				pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n",
> -					 kfunc_id->name, set_id->name);
> -				idx =3D addr - obj->efile.idlist_addr;
> -				idx =3D idx / sizeof(u32) + 1;
> -				flags =3D elf_data_ptr[idx];
> -
> -				return flags;
> -			}
> +		for (u32 i =3D 0; i < set_id->cnt; i++) {
> +			Elf64_Addr addr =3D set_addr + sizeof(u64) * (i + 1);

Same here, can you point out that the +1 is to skip the set header?

> +			const char *name =3D find_name_by_addr(obj, addr);
> +
> +			if (!name || strcmp(name, kfunc_id->name) !=3D 0)
> +				continue;
> +
> +			pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n",
> +				 kfunc_id->name, set_id->name);
> +
> +			idx =3D (addr - obj->efile.idlist_addr) / sizeof(u32) + 1;

This seems to be the same calculation as we do for the whole set8 flag,
but AFAICT the context is different and here we're indexing into the pair.=
=20
Can you add a comment for this?

> +			return elf_data_ptr[idx];
>  		}
>  	}
> =20
> @@ -1575,6 +1631,7 @@ int main(int argc, const char **argv)
>  	btf_id__free_all(&obj.typedefs);
>  	btf_id__free_all(&obj.funcs);
>  	btf_id__free_all(&obj.sets);
> +	free(obj.addr_syms);
>  	if (obj.efile.elf) {
>  		elf_end(obj.efile.elf);
>  		close(obj.efile.fd);


