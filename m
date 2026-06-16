Return-Path: <linux-kbuild+bounces-13773-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TZKIFj+pMWqBowUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13773-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:51:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A257A695031
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:51:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etsalapatis-com.20251104.gappssmtp.com header.s=20251104 header.b=Iw58xqZb;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13773-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13773-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1818304B7EB
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 19:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1BA37702A;
	Tue, 16 Jun 2026 19:51:23 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E340D376BEC
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 19:51:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639483; cv=none; b=TQA9uFDAd6+mu9mHOlcb8AJDA6uDy6q7rmeYaktf/cgMgSrDo7Ig6zTdzjW/X+6Bu56uHGXNe0YlSGid4xiYkiN8TtT51EDmKan/VfoVUMCpdQoktCcUpHK46XI5YhKh0O3/DwSVBjTY+j+Q/TZhAc4AVE+et7JSu1GqptcWpvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639483; c=relaxed/simple;
	bh=WD4l4sqCATU2gxWvx002zn8emoJS8OFuUuOurGlTKJ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=d/HTz/Az7M57tgOe64ZrlO8hn0hzjt4vvxYj0z0RW71cHGaeCfYfMC8fAO1OINCurPor+8llhzy9Y5gT4kZ9AaNfCuNSiKwH42LNmkHcDty+74rFICcWjcpxQG9sMz/V7ZcIRmxhTA3502xck0fo9RvHquq+8rEWhwNtP72YPqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=Iw58xqZb; arc=none smtp.client-ip=74.125.82.182
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304f590dd91so5714150eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 12:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781639481; x=1782244281; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNTzigFQwbFmsifrPrRSsqzfneDghrV3vzmjFHKgOuY=;
        b=Iw58xqZbE5bp3R64eT2r6zxPNaRkRVZNYaIVER4bTDMxPO+4yGm8MYLCU2T37Dr45q
         y239nMCPIh/NIlRXb5Dujtdkm/veztNXB5FsPlCEBu8ooHSOBI1QCEYN7K8nFyByrqH5
         qIv0Qlx4XapwpMgiRO8xlbCz3gDoHbUqZXgk468xqJ9lPq7AFTmyqpuq26PQdLe9QEd2
         txUEDydl3RGDDS9SKH+JR8UPifsbpa+ILgkmNq1OdagQpndhbaVKuKRxvBk3Z5VovasE
         tmnM4tGuYeQ3YZYEDwjeieqVjpdZ0sSjMSOTYPYZts+1h/uOVaDV07o3FQa+SWnd/Za5
         qaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639481; x=1782244281;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNTzigFQwbFmsifrPrRSsqzfneDghrV3vzmjFHKgOuY=;
        b=OSAIKJJxOZatz8PrI0ZBRzM4DPEsggP9pi6Ng6n7DXiOS04deTcdhHf5wwi6Wb8UUa
         14fIiieE27xoxX+RdNeHu+s8RC1dyS1uOWrXqaH6oVMqEDYrPUcF/Yk78PWZCoXvyOLg
         A5IGfmInkVkxl9/D4utkaDwMDUckXTIM0MMXjDLaoye43jAPSQ5LI0FqVtMuiaphu/fg
         opr+4GgTR92nua8JWmjkJ17fev6khUw3ztqx7P2p8MhTEpmCPGPiG7OXKBCEaIkiZhnt
         Bi60Wa1KcDPhAkUknoMUSprD3gfwNY4yAsx3bHiikw/qJEh3TI1FCzZjZOVRYP4OgFhN
         A4vQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Md1GIMQ9Ws5fMfV6bhgiGIgfPnf0yHdHQ/JEkip6srOgYuQ23GoezdpkZQaCTFbCnx9OHtet0hpOacNE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3P/1827AfD3dSCbKoyyza0c+KjFwXJhx8H9/m5i38NcFt6hK
	mqxQxqcbhpu2AsPTR7NA7w/aJhfRAB5fwwhAIvudQUZG1+3S7WLx2GBcddTYXwMJc4g=
X-Gm-Gg: Acq92OEiY1CdswynmiU3GggBWeFNeTN3vZJTLEoF3hXUFeWcuc5l1n+XOdSulwSk3Np
	slW/YLeQfgse0tGdjOE9lLoc9FoRuQzxrU9fmV+Lv6z6sEcXAMydWNkMwjX7AXvGDCxT1bOhCrb
	ib7Jslk9nNL0yJpvJUj584eb3HRD5YrfOZJ4uwtldHLzep4wu1TXXS04BMBylpBSRW77iwwwTBq
	6gL385IPDI3hQd/tS1nmQH+nIKllMNf5bLpbltjjkKrBwd3hMUh+buNv7Tv4K1eZL+j9GSPmHy8
	03ujvhS1KTnPqtcztRtzYN94IDhnCf3CYMYP9h2Igud0SkQL6lDovzQxNP5FZQQrRnZPI+JZgoh
	riFgXtKS+0jZanwc+ccjS0A1MA0dTTzLiJbo91NBA21HmAXtixOqkebTbHYS+kwjswEtZGFUa5Z
	gQlioPvI37QAK/L3Q=
X-Received: by 2002:a05:7301:6447:b0:307:91f5:8eee with SMTP id 5a478bee46e88-30bc9ab7f03mr529598eec.12.1781639480848;
        Tue, 16 Jun 2026 12:51:20 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::1a8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm2362945eec.22.2026.06.16.12.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:51:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:51:18 -0400
Message-Id: <DJAQHH1BGTIN.IKCRPQQXBBT1@etsalapatis.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Jiri Olsa"
 <jolsa@kernel.org>, <bpf@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 11/14] resolve_btfids: Process KF_ARENA_*
 flags in resolve_btfids
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-12-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-12-ihor.solodrai@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[etsalapatis-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[etsalapatis.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13773-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[emil@etsalapatis.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etsalapatis-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,etsalapatis.com:mid,etsalapatis.com:from_mime,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A257A695031

On Mon Jun 1, 2026 at 6:18 PM EDT, Ihor Solodrai wrote:
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
> =20
>  #define KF_FASTCALL (1 << 12)
> +#define KF_ARENA_RET (1 << 13)
> +#define KF_ARENA_ARG1 (1 << 14)
> +#define KF_ARENA_ARG2 (1 << 15)
>  #define KF_IMPLICIT_ARGS (1 << 16)
>  #define KF_IMPL_SUFFIX "_impl"
> =20
> @@ -1294,6 +1297,128 @@ static int ensure_decl_tag(struct btf2btf_context=
 *ctx, const char *tag_name,
>  	return push_decl_tag_id(ctx, new_id);
>  }
> =20
> +static bool is_arena_type_attr(struct btf *btf, u32 id)
> +{
> +	const struct btf_type *t =3D btf__type_by_id(btf, id);
> +	const char *name;
> +
> +	if (!t || !btf_is_type_tag(t) || !btf_kflag(t))
> +		return false;
> +	name =3D btf__name_by_offset(btf, t->name_off);
> +	return name && strcmp(name, "address_space(1)") =3D=3D 0;

The type is just called "arena" - address_space(1) is a different
attribute that is consumed by the compiler and is not visible in the BTF.

While we're at it, can we factor the name out into a #define?

> +}
> +
> +static s32 ensure_arena_tagged_ptr(struct btf *btf, u32 ptr_id)
> +{
> +	const struct btf_type *ptr =3D btf__type_by_id(btf, ptr_id);
> +	s32 tag_id;
> +
> +	if (!ptr || !btf_is_ptr(ptr))
> +		return -EINVAL;
> +
> +	if (is_arena_type_attr(btf, ptr->type))
> +		return ptr_id;

Another thing: Clang (very very) recently got support for adding
btf_type_tag for typedef'ed types. Do we nned to expand the check
to run in a loop like so:

while (btf_is_modifier()) {
	if type_tag()
		test();

	follow the chain
}

to find tags hidden within typedefs?

> +
> +	tag_id =3D btf__add_type_attr(btf, "address_space(1)", ptr->type);
> +	if (tag_id < 0)
> +		return tag_id;

Same here wrt name.

> +
> +	return btf__add_ptr(btf, tag_id);
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
> +	const struct btf_type *func =3D btf__type_by_id(btf, kfunc->btf_id);
> +	u32 proto_id =3D func->type;
> +	const struct btf_type *proto =3D btf__type_by_id(btf, proto_id);
> +	const struct btf_param *params =3D btf_params(proto);
> +	u32 nr_params =3D btf_vlen(proto);
> +	s32 arg0_type_id =3D nr_params > 0 ? (s32)params[0].type : -1;
> +	s32 arg1_type_id =3D nr_params > 1 ? (s32)params[1].type : -1;
> +	s32 ret_type_id =3D proto->type;
> +	s32 new_proto_id, id;
> +	bool changed =3D false;
> +	int err;
> +
> +	if (kfunc->flags & KF_ARENA_RET) {
> +		id =3D ensure_arena_tagged_ptr(btf, ret_type_id);
> +		if (id < 0)
> +			return id;
> +		changed |=3D id !=3D ret_type_id;
> +		ret_type_id =3D id;
> +	}
> +
> +	if (nr_params > 0 && (kfunc->flags & KF_ARENA_ARG1)) {
> +		id =3D ensure_arena_tagged_ptr(btf, arg0_type_id);
> +		if (id < 0)
> +			return id;
> +		changed |=3D id !=3D arg0_type_id;
> +		arg0_type_id =3D id;
> +	}
> +
> +	if (nr_params > 1 && (kfunc->flags & KF_ARENA_ARG2)) {
> +		id =3D ensure_arena_tagged_ptr(btf, arg1_type_id);
> +		if (id < 0)
> +			return id;
> +		changed |=3D id !=3D arg1_type_id;
> +		arg1_type_id =3D id;
> +	}
> +
> +	if (!changed)
> +		return proto_id;
> +
> +	new_proto_id =3D btf__add_func_proto(btf, ret_type_id);
> +	if (new_proto_id < 0)
> +		return new_proto_id;
> +
> +	for (int i =3D 0; i < nr_params; i++) {
> +		s32 param_type_id;
> +		const char *name;
> +
> +		proto =3D btf__type_by_id(btf, proto_id);
> +		params =3D btf_params(proto);
> +		name =3D btf__name_by_offset(btf, params[i].name_off);
> +
> +		if (i =3D=3D 0)
Nit: switch() {}?
> +			param_type_id =3D arg0_type_id;
> +		else if (i =3D=3D 1)
> +			param_type_id =3D arg1_type_id;
> +		else
> +			param_type_id =3D params[i].type;
> +
> +		err =3D btf__add_func_param(btf, name ?: "", param_type_id);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	pr_debug("resolve_btfids: added arena-tagged proto for kfunc %s: %d\n",=
 kfunc->name, new_proto_id);
> +
> +	return new_proto_id;
> +}
> +
> +static int process_kfunc_with_arena_flags(struct btf2btf_context *ctx, s=
truct kfunc *kfunc)
> +{
> +	struct btf_type *t;
> +	s32 proto_id;
> +
> +	proto_id =3D ensure_arena_tagged_proto(ctx->btf, kfunc);
> +	if (proto_id < 0)
> +		return proto_id;
> +
> +	t =3D (struct btf_type *)btf__type_by_id(ctx->btf, kfunc->btf_id);
> +	t->type =3D proto_id;
> +
> +	return 0;
> +}
> +
>  static int btf2btf(struct object *obj)
>  {
>  	struct btf2btf_context ctx =3D {};
> @@ -1321,6 +1446,12 @@ static int btf2btf(struct object *obj)
>  			if (err)
>  				goto out;
>  		}
> +
> +		if (kfunc->flags & (KF_ARENA_RET | KF_ARENA_ARG1 | KF_ARENA_ARG2)) {
> +			err =3D process_kfunc_with_arena_flags(&ctx, kfunc);
> +			if (err)
> +				goto out;
> +		}
>  	}
> =20
>  	err =3D 0;


