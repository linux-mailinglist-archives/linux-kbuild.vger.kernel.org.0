Return-Path: <linux-kbuild+bounces-13556-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i0lBIJy9IGqO7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13556-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:49:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1930E63BE9F
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:49:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="FQMk/OUh";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13556-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13556-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4424E30374BE
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22EE4B8DC0;
	Wed,  3 Jun 2026 23:46:29 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7206338425A
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:46:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530389; cv=pass; b=cwDEGqiU9MesMXoyQsIFMNxCzD4TSIh+3F+UO6JJlgpXSInbPgGUXFhWlLreAsB5+aSh+dKdq9mSxI8+n1f4S8t+tHPBNSj07Jv4q+MByJV2cJQ1YhoLQx7leQiT18E2yGEzlYWOakL2W/YthGgeiTJP3pl9g2yJv39nfMr2nGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530389; c=relaxed/simple;
	bh=oAiHPvkefT22A2SNqLflUZDL0oxDXGexjwhGo842xsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMdzrOcsmgmQBau6brqAMrwE8eF8vwrT3BXvR7j0ill0BlIp3BXSf7SBhEy9c/5BAiPeDb7MkGFm1CDDKJzBwXZVSEYNCDi8zlayb70GlWC//Wisf6Sfdi4h1ERkXmy6oNqhK5R1gkTTeaQ6Qamh8XxtuD2vCLtRqtBVwr6dy18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQMk/OUh; arc=pass smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so678812a91.1
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530388; cv=none;
        d=google.com; s=arc-20240605;
        b=hV9KirhBvv4kYO0abjMs47GAtUqcM26Gzu2o0gyC1PQ67/xQn9DDZiM8EuYVfm64ys
         AE9cIZ14dm53Tw6wiL5yL7HjLCAfSF5/RJSfviehLAOc0DSWjK6p6ZVC6/TIC+xtEY9A
         FM2swtA1U7gxxjCVxIQ2VlH4ZFF1H7wq6qqggg0x3GruLbgSDs6kcjhAFiSavG2+LGDD
         npDLk/C88PZokmGpTXtxktWLTYy06X5tbdBBnYCqMqjCEODrsBfhI2srlBDJaqi7s0W4
         7mqGNGuvxyEl66DfCTnMclxOoiKhWMGzh1Y8Z5UvFjNHplMnKz1eImh60ayJvj9W4cAh
         WmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+EP701GHq2NT2f+Tlg71zxl274vK+GPzaF1Gl25QX8=;
        fh=q46nhTH7PNflATK1qkZkVlVE+KN7wiiXa9abGMjKBRw=;
        b=PEnG1Dx5epCA0P0L+aIhw4rJh/G81obSYjSEwXYSgxCz7zRcQfAl8mjfssdeW0vNd+
         MG/CZEQObIpbShc2KRHgwC6xsM2CZPAuVTd0bgqxmSmqNwD/VIOKm54+cPRTjQoIWsqB
         /AIBaJLF8W1KtlzH2dDq3vSofj/aUW/i2w322Rldq0z5zY9GAKgNDHXrQpVdP7Uongr9
         +mk1gQ4JWmo5TWpHVt0+4f5S3zu5AcLiZ4TxG7lNWkmUcSZV9u91no734+7PZpEBuIzF
         kcNH0pTj8mxEDEGnphouOyAMg7bl3Qwj/vvk2p2RQbeA4goB2GTFZdj2zIUk1tHneW6u
         HahA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530388; x=1781135188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+EP701GHq2NT2f+Tlg71zxl274vK+GPzaF1Gl25QX8=;
        b=FQMk/OUhyxf3R4OtLoR8WNnUp1XdbpZdJHe8WMvWatVNDVsKqcX1kuaYz0yNytHkr1
         06o2jl2F13yLaYXwiATKIBIpHQcPbzIl68xiFB+HsvGhwWLYCwaQYK02NPQvc+ivbaBO
         9GJxQBn6LONHIQ90dBHctA9Dyq0xU8uc4TLj/Szmb3lA+cS96Bv41A1CZdJ5LlUtjSsk
         o9zZPe/vtUQlWogJOQvU5xiuOjSUI3/GJekzc/80dDFEK52abFdTFfSoMDJ5j4aU24K1
         ysyQm6RMqXN1il3Ica4Vb3ULzQENShp28zoTzcPsx1awGSYnpZmIfnTAWe9T0dsAr6R0
         X5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530388; x=1781135188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+EP701GHq2NT2f+Tlg71zxl274vK+GPzaF1Gl25QX8=;
        b=bdsLUrXe1Lz6yR3K6DalQcqVaFV5MVeldlsVj/rB7fs+QD7zF8RJNYEPC0Y9Czkp3I
         at3z1YmgLwMjhse4UpTeVRBfXaoheaDA0NJ6xxji7qjPv7c1uQHsuWGX2lbTFIUR9ZiZ
         jKEq/9y2LnrsuVqVtyXbz2bTIXkCHs3H4cz9K4mbgBf55R32J377votCGOOV3IB7/tQV
         eAIuCgIKu2+X/CraMscKbHVW3UO5QM+gDn4btxkUIdpNw8GEYrrSY4o42qsy111peT9r
         PF9sxde1imt4nBCq9bEW3RBSXsAGea6n/w7Ya7Sxt4kfZ9sva8MGS0JThd1HyfmJ8pEP
         y5tQ==
X-Forwarded-Encrypted: i=1; AFNElJ9d+6qc3vs6XnwV9jMesGvttZbQEEmKy7rECET4L/20QmkkQY+GZdfJ+qXWsKfGZIZP3FJ+ZxXWJiKoM/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YylJrQ8swoXTam47qugeSONlGggWKR8r0Cqisti1KeKIAP80oi6
	K4Gr9D48FYfF38fyXexxVC0brD4iSHb/ZesbwZKPNGhMgAmvsel+3EsRRC5jAFvQQDSfxePYU16
	TklLZXFAcgG+Bfq0y+NmFsqKJ1kV/8hk=
X-Gm-Gg: Acq92OFGxRPdE57xYBnCnr6CJmXubV/OvZ6V+shsfeb80eUDcy2VR+sq4jPoWb1GigK
	XyXcuVCAjBqq69Ihig7jbcGdF4OTwupU8UVAHn2VouyNkuT4e94ALpmFnbWMyEnjvmKJctCnJRR
	cfp/4KXNHekc09udXnQhBLZMiEQ380ONXvVwQ2HAGj0Js98P7WKkPUXInQwy4TkR5ddfXY9jmgP
	8Ej5DI6y2TSq7hapx2cmmi8ja3Bv0JTSOLxFe/zIuURvyHO7om4R+uJyuShdIIcuCToTjG6H6Ae
	Mnn9kwNMBiqBBycR9PTkXrxgBNffaVVBfMUjsGLP3rKz4qKYY7gaWj4ZydkUBOHYNKYSDxX+CAU
	=
X-Received: by 2002:a17:90b:3fc3:b0:369:9469:aeba with SMTP id
 98e67ed59e1d1-36f76481151mr954581a91.1.1780530387689; Wed, 03 Jun 2026
 16:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev> <20260601221805.821394-8-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-8-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:45:55 -0700
X-Gm-Features: AVHnY4Jo_VADawYPd5pXnQ_e_kHVo5REZQ64FS2sXI_sZCZGGKSN-ZvmGE4jQGQ
Message-ID: <CAEf4BzYtx5-6gpy=2BL0-f8ZggNdNUUmf7mddf_uSWG4dZ_tSA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 07/14] resolve_btfids: Emit bpf_kfunc BTF decl
 tag for discovered kfuncs
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13556-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
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
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1930E63BE9F

On Mon, Jun 1, 2026 at 3:19=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> Now that collect_kfuncs() discovers kfuncs from BTF_SET8_KFUNCS sets,
> resolve_btfids can also be the source of truth for the bpf_kfunc decl
> tag in BTF.
>
> Today pahole emits it under --btf_features=3Ddecl_tag_kfuncs; moving the
> emission in-tree lets that flag be dropped from the kernel build once
> the rest of the kfunc annotations follow.
>
> The implementation in resolve_btfids is idempotent: if a decl_tag
> exists in the input BTF, no new tag will be emitted. This allows to be
> more independent of pahole's version and runtime flags used to
> generate the BTF.
>

As I mentioned in cover letter reply, I think this is unnecessary and
we shouldn't do this. What's the real situations where this is
*necessary*?


> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  tools/bpf/resolve_btfids/main.c | 49 ++++++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/m=
ain.c
> index d35a7b2460e8..30a07ec4ebb6 100644
> --- a/tools/bpf/resolve_btfids/main.c
> +++ b/tools/bpf/resolve_btfids/main.c
> @@ -1255,6 +1255,44 @@ static int process_kfunc_with_implicit_args(struct=
 btf2btf_context *ctx, struct
>         return 0;
>  }
>
> +static bool btf_has_decl_tag(struct btf2btf_context *ctx, const char *ta=
g_name,
> +                            u32 target_btf_id, int component_idx)
> +{
> +       const struct btf_type *t;
> +       const char *name;
> +
> +       for (u32 i =3D 0; i < ctx->nr_decl_tags; i++) {
> +               t =3D btf__type_by_id(ctx->btf, ctx->decl_tags[i]);
> +               if (t->type !=3D target_btf_id)
> +                       continue;
> +               if (btf_decl_tag(t)->component_idx !=3D component_idx)
> +                       continue;
> +               name =3D btf__name_by_offset(ctx->btf, t->name_off);
> +               if (name && strcmp(name, tag_name) =3D=3D 0)
> +                       return true;
> +       }
> +       return false;
> +}
> +
> +/* Add a decl tag if an identical one is not already present. */
> +static int ensure_decl_tag(struct btf2btf_context *ctx, const char *tag_=
name,
> +                          u32 target_btf_id, int component_idx)
> +{
> +       int new_id;
> +
> +       if (btf_has_decl_tag(ctx, tag_name, target_btf_id, component_idx)=
)
> +               return 0;
> +
> +       new_id =3D btf__add_decl_tag(ctx->btf, tag_name, target_btf_id, c=
omponent_idx);
> +       if (new_id < 0) {
> +               pr_err("ERROR: resolve_btfids: failed to add '%s' decl ta=
g for BTF id %u: %d\n",
> +                      tag_name, target_btf_id, new_id);
> +               return new_id;
> +       }
> +
> +       return push_decl_tag_id(ctx, new_id);
> +}
> +
>  static int btf2btf(struct object *obj)
>  {
>         struct btf2btf_context ctx =3D {};
> @@ -1267,12 +1305,15 @@ static int btf2btf(struct object *obj)
>         for (u32 i =3D 0; i < ctx.nr_kfuncs; i++) {
>                 struct kfunc *kfunc =3D &ctx.kfuncs[i];
>
> -               if (!(kfunc->flags & KF_IMPLICIT_ARGS))
> -                       continue;
> -
> -               err =3D process_kfunc_with_implicit_args(&ctx, kfunc);
> +               err =3D ensure_decl_tag(&ctx, "bpf_kfunc", kfunc->btf_id,=
 -1);
>                 if (err)
>                         goto out;
> +
> +               if (kfunc->flags & KF_IMPLICIT_ARGS) {
> +                       err =3D process_kfunc_with_implicit_args(&ctx, kf=
unc);
> +                       if (err)
> +                               goto out;
> +               }
>         }
>
>         err =3D 0;
> --
> 2.54.0
>

