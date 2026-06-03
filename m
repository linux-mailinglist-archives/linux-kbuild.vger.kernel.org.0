Return-Path: <linux-kbuild+bounces-13559-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EBaCDhO+IGqi7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13559-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:51:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2063BEC7
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:51:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=algRIbVA;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13559-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13559-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 938E430207E6
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEAA4A2E03;
	Wed,  3 Jun 2026 23:48:32 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2784611E1
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:48:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530512; cv=pass; b=MOI3YmueWHCt345GlyQoivFUKzyhM1GARFqzcjnRVnSkrxAhbyeJ82gkWio55bTstirH1RJWe35FA+6kYywTc5eFG3fE0kPIbst5FmU7o1OS4b7uceGoGohjX/tw6wCsQsIOJzLp9HM1Fu/twRx8hYKLD2tnQPQ+zOhUqh9I+y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530512; c=relaxed/simple;
	bh=QWkpgbb3Sv9J1u6cdXHz6Jljw2OMAo8XoiFg7eS8a2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Af9RjBSjHtVdF0xL4PwARXsmXEVnYpfq+3fdHpFOBjjLotuKcqj/CDfo4g2mt4X83CozrrYYCJGTuc6HXkjFaAOWaQ1AoVb/bV4QCeLNcow9iYvR1QCvR0RguEn64Rpq6XwtvOgJJvng8niiWZpkc5lsFXhSPWBG/8HW4Ygv9QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=algRIbVA; arc=pass smtp.client-ip=209.85.208.44
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so134575a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530509; cv=none;
        d=google.com; s=arc-20240605;
        b=kn937leT7g+vdggZLUzcJVHCkzaYYgI1Y8xLoy3hVvZbIgchJnQJEmSOcS4EVz2L1i
         VLZWJ1lvaC8ESJ1S6otLuVRdRR6CTfUa6eEwx0hyefQFkjckly1trub2aymT2Jkp6f/4
         tTt9m3Qz9k1LOtBvP9s/YmDuFIqzwLrUHcyY3pLC6m3HL5nPCqrgz64ZXPYXeS2Wz2QS
         YbBqmO0PQ0qKZf82xdTidDqJmA0OuCci7teuyEfUquPu1QX9b6hxjWJ3OWXmMdscnCnv
         XURnartH90kZj7LsG66I7qF9b8Dd9zG4H6PFBjN9Xlob49snfSk0AX+/0Aww31hruOYs
         ALxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T90oynylW7AQk2MgYZP57oghSUfaSB8gw/FQu/tdAng=;
        fh=K4vC1coA2E4iRM4UUbRT9Y4GZ/9TI3z+wvYDZUhQu2M=;
        b=RPNxsfzQbrhYDqAv968HagLxMhs1ZIN5F8/mcv90sAyAMJNS4dgq7RQ8SMc5BCTqsT
         xQxItFNfb7wmAuXAOO3fvP4LYBFtWDwGnmWAAt+XZiUawJmDsBjZ08EPA9Z65/VsP70o
         66mEKOwkWeanvkKROPWhaEkvIheAUI4ddSQSxGOJFSPMW2DM48eaZN4sZh188OVV6+8M
         PlYEwpnEpmqqbU4cyjeBEFdqeKBTaPwjOdW7E5zwdO+WDQIVxnr0mIlr6Hp/bnZDs7gV
         OQ2ie+lJKWnnEPvcRZRIvS35rf/xYqpkLOJfC13c1UIhBjWRXqgNR7DMU5c6Vaf1kVvu
         30pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530509; x=1781135309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T90oynylW7AQk2MgYZP57oghSUfaSB8gw/FQu/tdAng=;
        b=algRIbVABR7io4W547Mg7Z0HhCc9Ed99mp7dIYLYuF0OOHMf4+g4e5I3LVAVP/Anpm
         Kvn7tTpQQjjI7YRuVe9kf9dpKKl4dNsa2eHgPn589zen1QesEVjvUQ6dVFbWhClLfoLH
         Ai3K+hOcgN/ttKqI1KMnt/90hrJnfxsTM1wFPIH6K2DokZeGiCVg/dvE8E0Me74Nh5iM
         dbFGcdchIP8ofXTiJzMSjjyRUtytA6zKAfqrlYHowMEMaDu0Zl2DRDt7e8jNODHHpTNl
         h4VBbBDAgn/z3Oh+HNgUdoFnVRIS7UoJILjffB67LUq0zm+R7oldfiGVKV9JSGGy++uO
         Z2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530509; x=1781135309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T90oynylW7AQk2MgYZP57oghSUfaSB8gw/FQu/tdAng=;
        b=sop+tR/R18KipuOw2qdFzW0YokxtTNP2avTUdxl3siNGlfOKf3pAHFhLV9+FwUU6td
         SpMmkRSlQcisBLTTyfRmZfYcgEMeIpKyy3RNK8LRHFFmrKAqI49t/2kaUwvB4rYyDqKZ
         sKv7r2oaWCs19ubrlPufB3E99+PHCxVsyeChfn10dZTgxsYm+5bJM/6jyQIpzsAD9e0i
         FWiY2a5/t4J1CKPz85U7/3LKZP8OgfdTWM/5HkghtCZU3WpcHJMZlplMKr5Xh1QDfeLT
         7B8IJU+UUB9S0zR9kX6sUZnMG7v5twjlGIIRW7mp39TNUSuCUS0Yx3B9d4aUIpdtjKzs
         BU+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+SyXNVTwXf+kpnltUo4OKASV4Q7F0Dr68avjQXXHPr0i5KW8JEhZ0JYd9xMU7EG0sn5wICDwamGELUtSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwf/V2P3h8Ezdr40bwtIklfjhvlpE9cpgQZThXPwYyNlKk1ADA
	tmZ6GXtayJ4znK9KTppYE+s1jXVplC8jXxNAbAAiC9S4zJ0k2TptG9BiggvV6IezBEf52442+bP
	NJCU8R4gipFujy//JNH3YEZ1G5oD0k8g=
X-Gm-Gg: Acq92OHGh+qmfey9Sc2lpR8euo/a1i4D4u/e4wg8eAXS8fMmAuylvk2kDr23bcaaTvM
	YyAckyklkbwqCQRMOAA/ZBBzgetIYIzmnCFER2nYFM7gGLHiq4OySJt3yBZFSvujehfbZPEhZ7U
	MMY7S0mjJZWRlUh2vQDbWmeVR3B666QtUwsVAuSLRhwNGi/xf4b/q+jvN7rqZRpVV8dVgPeVGNx
	qkU08sLiGbx1qzcZUTQ6IFfdbbkPIDooxY4NJE/73M/piRago/0AJz+Tzfvzl18b1LC5+pJsdcU
	wF0xOs/PUW+9eGjnjafbs66DTQC2gCwl3vJrlux7+XHsGjLlCsy2CltCHnfr1FKo+ZZ/l6Kyfao
	=
X-Received: by 2002:a17:907:689c:b0:bf0:2253:ad67 with SMTP id
 a640c23a62f3a-bf0b3ca9707mr195111966b.46.1780530509262; Wed, 03 Jun 2026
 16:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev> <20260601221805.821394-12-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-12-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:47:58 -0700
X-Gm-Features: AVHnY4LrNMNdKc8g-Y1siuv0xrZhlenvEq2LHaMzMA9GySUdDudubnJqhAdGsIQ
Message-ID: <CAEf4BzYeKAnQUb3nsxNZ1FEVtare4xrx6sBErCrxncCzKsi4-Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 11/14] resolve_btfids: Process KF_ARENA_*
 flags in resolve_btfids
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13559-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBC2063BEC7

On Mon, Jun 1, 2026 at 3:19=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> For kfuncs flagged KF_ARENA_RET, KF_ARENA_ARG1 or KF_ARENA_ARG2,
> address_space(1) attribute (type tag with kflag=3D1) needs to be emitted
> to BTF for the return type or arg type respectively.
>
> So far this has been done by pahole [1].
>
> Implement the emission of the arena attributes in resolve_btfids: for
> flagged kfuncs create a new function prototype with updated BTF types,
> adding tags as necessary.
>
> Similar to decl tags emission, the transformation is idempotent: if
> the types are already tagged with address_space(1), it's a noop.
>
> [1] https://lore.kernel.org/dwarves/20250228194654.1022535-1-ihor.solodra=
i@linux.dev/
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  tools/bpf/resolve_btfids/main.c | 131 ++++++++++++++++++++++++++++++++
>  1 file changed, 131 insertions(+)
>
> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/m=
ain.c
> index f276200b1a68..aafbcfec755b 100644
> --- a/tools/bpf/resolve_btfids/main.c
> +++ b/tools/bpf/resolve_btfids/main.c
> @@ -162,6 +162,9 @@ struct object {
>  };
>
>  #define KF_FASTCALL (1 << 12)
> +#define KF_ARENA_RET (1 << 13)
> +#define KF_ARENA_ARG1 (1 << 14)
> +#define KF_ARENA_ARG2 (1 << 15)
>  #define KF_IMPLICIT_ARGS (1 << 16)
>  #define KF_IMPL_SUFFIX "_impl"
>
> @@ -1294,6 +1297,128 @@ static int ensure_decl_tag(struct btf2btf_context=
 *ctx, const char *tag_name,
>         return push_decl_tag_id(ctx, new_id);
>  }
>
> +static bool is_arena_type_attr(struct btf *btf, u32 id)
> +{
> +       const struct btf_type *t =3D btf__type_by_id(btf, id);
> +       const char *name;
> +
> +       if (!t || !btf_is_type_tag(t) || !btf_kflag(t))

!t can't (shouldn't) happen, let's not check for things that are not
supposed to happen, because we'll start double-guessing what are the
situations where this is valid and whether we deal with that
correctly.

It's kernel build, we can assume valid BTF.

> +               return false;
> +       name =3D btf__name_by_offset(btf, t->name_off);
> +       return name && strcmp(name, "address_space(1)") =3D=3D 0;
> +}
> +
> +static s32 ensure_arena_tagged_ptr(struct btf *btf, u32 ptr_id)
> +{
> +       const struct btf_type *ptr =3D btf__type_by_id(btf, ptr_id);
> +       s32 tag_id;
> +
> +       if (!ptr || !btf_is_ptr(ptr))
> +               return -EINVAL;
> +
> +       if (is_arena_type_attr(btf, ptr->type))
> +               return ptr_id;
> +
> +       tag_id =3D btf__add_type_attr(btf, "address_space(1)", ptr->type)=
;
> +       if (tag_id < 0)
> +               return tag_id;
> +
> +       return btf__add_ptr(btf, tag_id);
> +}
> +
> +/*
> + * Build a FUNC_PROTO for @kfunc with each arena-flagged return/paramete=
r
> + * pointer tagged with address_space(1). Pointers already tagged are kep=
t as is.
> + *
> + * If nothing needs tagging, the original proto id is returned unchanged=
.
> + * Otherwise a new FUNC_PROTO is created and its id returned. The origin=
al
> + * proto may be shared with sibling FUNCs, so it must not be modified in=
 place.
> + */
> +static s32 ensure_arena_tagged_proto(struct btf *btf, struct kfunc *kfun=
c)
> +{
> +       const struct btf_type *func =3D btf__type_by_id(btf, kfunc->btf_i=
d);
> +       u32 proto_id =3D func->type;
> +       const struct btf_type *proto =3D btf__type_by_id(btf, proto_id);
> +       const struct btf_param *params =3D btf_params(proto);
> +       u32 nr_params =3D btf_vlen(proto);
> +       s32 arg0_type_id =3D nr_params > 0 ? (s32)params[0].type : -1;
> +       s32 arg1_type_id =3D nr_params > 1 ? (s32)params[1].type : -1;
> +       s32 ret_type_id =3D proto->type;
> +       s32 new_proto_id, id;
> +       bool changed =3D false;
> +       int err;
> +
> +       if (kfunc->flags & KF_ARENA_RET) {
> +               id =3D ensure_arena_tagged_ptr(btf, ret_type_id);
> +               if (id < 0)
> +                       return id;
> +               changed |=3D id !=3D ret_type_id;
> +               ret_type_id =3D id;
> +       }
> +
> +       if (nr_params > 0 && (kfunc->flags & KF_ARENA_ARG1)) {
> +               id =3D ensure_arena_tagged_ptr(btf, arg0_type_id);
> +               if (id < 0)
> +                       return id;
> +               changed |=3D id !=3D arg0_type_id;
> +               arg0_type_id =3D id;
> +       }

else scream loudly, this is not supposed to happen. we are being too
lax about these violations here

this is a good place to check and emit human-readable errors about
invalid kfunc declarations, so let's do it

and again, let's not do the ensure pattern, add unconditionally, don't
check "changed" (it will), etc

> +
> +       if (nr_params > 1 && (kfunc->flags & KF_ARENA_ARG2)) {
> +               id =3D ensure_arena_tagged_ptr(btf, arg1_type_id);
> +               if (id < 0)
> +                       return id;
> +               changed |=3D id !=3D arg1_type_id;
> +               arg1_type_id =3D id;
> +       }
> +

[...]

