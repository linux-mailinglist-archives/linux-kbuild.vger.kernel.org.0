Return-Path: <linux-kbuild+bounces-13554-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AHxlLn69IGqF7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13554-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:49:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B6D63BE92
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:49:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eRYFcd1h;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13554-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13554-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BC86302AE3A
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342154A2E03;
	Wed,  3 Jun 2026 23:46:23 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A402938425A
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:46:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530383; cv=pass; b=IsM+PB+3xjDWGMHLrm5i4cdZh4B+gerFCAehxTo1PFa4EVELc8nWuB08RJr4DOE73S+hQcNxTuMR7Q0ieDMzrDM6Cg9Vc9mg8NZITntswYJsbDdfapx+3EUZH7zuHR6nFpdmQ+tDWSDGXD9yUaldBji7IXWQq+aS7MsO3MCtRC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530383; c=relaxed/simple;
	bh=uEKPPLQfM4icf+qUY66iMp8/4n891RiLDCoONieODKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZAIBuXrl5frHOtfvEoTX52AnscyWDWoy63qY/GOiHxl9074OZOCu6zqIldrQ6aU2osetw+Yo80/IfFA1utjIGM3rSCEAKAtK23Ets6t/gt1uxeOT5wb+6L8da+t+8gefBM2NndaJ0adtTCwUvZeTASe/fcSSO46sLKu1ls5KCOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRYFcd1h; arc=pass smtp.client-ip=209.85.210.177
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842307472d4so25091b3a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530380; cv=none;
        d=google.com; s=arc-20240605;
        b=X3VZfsGM5OvrxQnMuCVjFxpkk60DrndY0jH9BWKMoXeZ5yIkflnQ/riryC3t0djmct
         W65pNlYal8BkhKXDP5zWdVhSc2VgicAt7xqYVjlbcTovCmjL90Gdf5QDinG3SVR5GVKY
         PcYp5PHHUtNTNnyEM89SD9Yi6aLp+R8Gd+xqYP7bEmztyx1s6tnMVXEW7r415gYCsFN3
         rLopFppb3H4UJGiGoOroAYDysR3WcX705M7EvUDU3Os3uOXebah6Rrc8EWxETINb5nsF
         z1UFTu9qGW73haz4wuD/v3KV4c6EHLw+dynsv2CN+1lD1pTSpFcDPdkD8vJsCQmY40+X
         4idQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wWifozZk3TtNmr926sSEkL+CQRYN/IPWUzdtFc43uDE=;
        fh=HnOx7RDfXxtntKQvtbxDQ5Sa6xgI6fSuDQru/ktngPw=;
        b=PYQ6+WaaJuP7V7B7sqyXF6BfewKr4oWlZo81gLP/d+Pos3yNIFDMbP8CCxXs15WSXe
         OSnGj7dn+xATd1J46fsEKYY3hrhQqXUYY9VNV4Xm1ZT3AfCsSSK+dTu1PpTx3AL+0FZJ
         8vjlKagBJsVvPT8eYpm6YOc/Cwzz7DYWGks/ouMWTVfNK4h7RG/wUL+WP6QLxY0p9Luw
         GCppAJO0ORtBDTAXeKwiai6vQMQ12FUNqGlMnkKEHxr4FjJdNnsS5A6LPbakMGMgBObz
         7dfqkGWBChD0wIX1M0O/DAEGydfIYkNBnI2uvvkZIOqs/NJftrcrESPBH5Fge0rpi9Vg
         fJSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530380; x=1781135180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWifozZk3TtNmr926sSEkL+CQRYN/IPWUzdtFc43uDE=;
        b=eRYFcd1htJzEiRyD7fjsZrDzr/JGlJmnXbZcDtTpUr65ZDJ2MekLqOIvno4UCedaw2
         H6385mJALOhKThbvUqy2qsG7Y2z9NABzo34xdQnTwC2HvTccmzqmV76n06imZjyuoduQ
         U7cit+x3jRgRlX9lpY9M8jgpZ9jegDhY0Z9xBSgD2RehfELYmAQJyR0gHEJJi2g9yLWd
         AkTmFFbLfCt52KHRVkS8BMg4uZDs2Vuixb7OThe51V5Y5cfMqSy1zwQdEbmr9aUxz/O7
         GuiygGImmsVK/Y057BPP1QReKhj4mEcQeCWmXAR6e4n9Onwjp7YO7OI9/qfdMR5Sy04/
         pMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530380; x=1781135180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wWifozZk3TtNmr926sSEkL+CQRYN/IPWUzdtFc43uDE=;
        b=cqDedXxEamLzJ5CaKg4F8+0s8TnGGLod8Ncx7TlVXZh2YvgKjyBCH1ZkIbU9knA9NM
         EG+GAYR8O2VI98CatgqF8v65NbZupVL2tNZxSuOMnK8YXSRnVFaLh4hNu6J1jnhLR5sW
         ioE8Yn3OF5OKOa7bvqNUqv1nb57LlEU3FRm2S4C2UHelLQIbxtAMik9u0QnU9xrr8r1/
         5669Q1/qu22ToECbyYmnClewKnmfXQL0wM+uXZJix2mrQviIFktAlkMdETRAByh+d++s
         4e14zEERtBFzJdd6T2foGL41xb3AkNINQeYq67jCFrqWgferhzeLLzs/niWcJnJcDif4
         mE/A==
X-Forwarded-Encrypted: i=1; AFNElJ9AOkuQEhUYMsE6anf4L94XXj7rqewC5+7KvBM1Xq4lGLM+YlTbEM4i+7dSt8KLW09LWUBX5jPAKpoOXjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEca3jv9RTwDSP2uSzdBFF+1G0PnYXNyF0AiGwEoVWxjyQT7VP
	0RPFoDl2DjBmfMNU/pWHxeanbetpnXaghDaUNkJ0T1KdLPxF0/A7priLQJglUhHoSpxUA8iyCeB
	t+2TTrwBSaDTDpwJIrYvVVaCwi67kd+4=
X-Gm-Gg: Acq92OFRCeLVHMykGwha4a+xECmBQGj9Hc1DDoCFprP+HQDnUdY/BnVhZVKpVd3Clhg
	Ld+fUWj2vZSRGLPrg2946+vb59PeII1vtTS+PmMTlvqDiSG/eXEZDjgFJIgHsMm6OyZz9jffSh/
	yTCj+YWwPIIfPCW5KpAAhPUwkoSkiTQ/xFaVeyokSxY9/e0cAq0xoAOloq3D41qRTmWGWVk/Xxv
	yVo3pdQdiPUcbZviLZHIvD0Sod0/S87UpIvSXrH0i3e0blMcOXe4yU4BGYDSKPu6AdboagQ+iZ3
	FFmg+1khJSKxuFcafdChzAU9PP4MEULKD+cvVELNpA5nScD/rVn/5fLpzuECTw01WNH+LJSkWQE
	=
X-Received: by 2002:a05:6a00:2d94:b0:836:3f6a:3e7a with SMTP id
 d2e1a72fcca58-84284ed934emr5074401b3a.26.1780530379860; Wed, 03 Jun 2026
 16:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev> <20260601221805.821394-7-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-7-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:45:52 -0700
X-Gm-Features: AVHnY4II1XspEqXUzLfqoHxyDZsyGuE1IrfFO2Nd3EGWuxYDmRs2Cj2n_EVwCTU
Message-ID: <CAEf4BzaLzX3mXvQzxv+gbmZOh84XvYofLjMSWFYghNjS-ohEZg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 06/14] resolve_btfids: Discover kfuncs from
 BTF ID sets
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13554-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13B6D63BE92

On Mon, Jun 1, 2026 at 3:19=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> collect_kfuncs() currently uses bpf_kfunc decl tags to identify the
> list of kfuncs. The decl tags are generated by pahole, which makes
> current implementation implicitly rely on those tags being generated.
>
> The authoritative source, used by the the BPF verifier for kfunc
> registration, of functions being BPF kfuncs are
> BTF_KFUNCS_START()/END() declarations. These are BTF_ID_SET8 under the
> hood. Currently resolve_btfids reads kfunc flags from these sets, and
> populates them with BTF IDs.
>
> Implement kfunc discovery from BTF_ID_SET8 symbols in resolve_btfids,
> removing the dependency on pahole's emmission of decl tags.
>
> Walk BTF_ID_KIND_SET8 sets, and use the address-to-symbol index to
> look up set entry's BTF_ID symbol name (before .BTF_ids is patched),
> recording the paired flags directly. This makes find_kfunc_flags()
> helper unnecessary, so it's removed.
>
> Kernel functions can appear in more than one set, which is legitimate,
> since kfunc sets are prog-type dependent in the kernel. So for btf2btf
> processing deduplicate kfuncs by BTF ID, accumulate (OR) the flags,
> and warn on flags mismatch to catch inconsistent declarations.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  tools/bpf/resolve_btfids/main.c | 122 ++++++++++++++------------------
>  1 file changed, 55 insertions(+), 67 deletions(-)
>
> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/m=
ain.c
> index 43512af13148..d35a7b2460e8 100644
> --- a/tools/bpf/resolve_btfids/main.c
> +++ b/tools/bpf/resolve_btfids/main.c
> @@ -970,6 +970,23 @@ static int push_kfunc(struct btf2btf_context *ctx, s=
truct kfunc *kfunc)
>         struct kfunc *arr =3D ctx->kfuncs;
>         u32 cap =3D ctx->max_kfuncs;
>
> +       /*
> +        * A kfunc can be listed in multiple BTF ID sets.
> +        * In this case, dedup by btf_id and accumulate kfunc flags.
> +        */
> +       for (u32 i =3D 0; i < ctx->nr_kfuncs; i++) {
> +               if (ctx->kfuncs[i].btf_id !=3D kfunc->btf_id)
> +                       continue;
> +

with hundreds of kfuncs, this O(N^2) approach is going to be a bit
slow, should we use rb tree for lookups?

> +               if (ctx->kfuncs[i].flags !=3D kfunc->flags) {
> +                       pr_err("WARN: resolve_btfids: inconsistent flags =
for kfunc %s: 0x%x !=3D 0x%x\n",
> +                              kfunc->name, ctx->kfuncs[i].flags, kfunc->=
flags);
> +                       warnings++;
> +               }
> +               ctx->kfuncs[i].flags |=3D kfunc->flags;
> +               return 0;
> +       }
> +
>         if (ctx->nr_kfuncs + 1 > cap) {
>                 cap =3D max(cap + 256, cap * 2);
>                 arr =3D realloc(arr, sizeof(struct kfunc) * cap);

[...]

