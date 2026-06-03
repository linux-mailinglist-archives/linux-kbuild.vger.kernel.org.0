Return-Path: <linux-kbuild+bounces-13555-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qgYRANm8IGpX7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13555-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:46:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E557763BE5E
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:46:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PoTGy5n+;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13555-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13555-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D4D2300D79F
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C071E4B8DC0;
	Wed,  3 Jun 2026 23:46:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F24DBD9D
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:46:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530384; cv=pass; b=hNN+gkvM6WQA378dWatEwCfFeCEe00cb+a9OPt/Xg9vR29VeAxgD8vBmzrCC1U2PPTxWhXAKyR2qBxqoknNQz0j6csI7/VmkhgtrkewukjYN2lOGORD9QBXtMOEGU6L6+1Xyj1tbAWxJsgMthMUSfQN3bWZVCUdtHbv77vdU6mA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530384; c=relaxed/simple;
	bh=2OsX9xrQkx5Cw7QY9LKXYujkkjGcngs8n91bjdXwvg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVNN001PUuTzavIONca2Wd3RwSWZLo1ZLTyGlAzAg9w/JKGkll+VwMNXSDl8xHXsv/bvLp4g0XyWM3+YvbD3dlJTPhqENhLqx9a5QrpE+11lCstJx7jAheGoGO9p5v/830dgg1BQaq0WLrxViOx1AmlMk1+SpD046z8H63ckWHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoTGy5n+; arc=pass smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso37034a91.0
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530383; cv=none;
        d=google.com; s=arc-20240605;
        b=OxyW7BpCJuVcloK/E4T+up/p/IXVfYWE8wklkBCI9DLlaurvybCQl1aQPA14Nvrzdw
         5LdvGBH1zAM8ygJSpNSqSe/kgH7y08PBg77f/llKAjrT5pmnD25jyKMOqCehXY6QR5To
         /cujsjvb69G7c1oMSuKbBWowtdbGYI85WxU/oNG3Yka6BmK6BQM0aq5j1ZOZr2j/MmB9
         jpY0Zfht9WkV8HmSzev0fgbxV20lCo4mQUPtOiZBwwkujOyzvsPa7/V5QO3Xv4qYWAUR
         D6K0VMoe/x43DWJzoBnS1fQ7owLl8x9KnnBNL4EmHYFkkIc9oShppENd2PcHyTSWtyy3
         Fn3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oDqq79L2KNI1fcXdkS7SY6qPxkZmqKsIeFSaYmJ87+I=;
        fh=DFvIyL5T/SvjpMhNbP7xIQGj8/GkQ7cC8UzRLB49PC4=;
        b=er6bWszgqsKWC5ZLN9R4yNYqdk+AeGuTB3wG42Q7sb/Q1yYzsneYkhoNpvdD2vBBTg
         6X4tIgWZkv7u8EfnQznPCzRgXuVxvhbhp3/RSwdDqMskSh7bq5CISQOOmJfrt2iNuLEx
         2TPvMNtyVbtZHCH/8m0fbMr4RVfI/9JudJGn/KD7GvE9/fU6Ta5sUK+cDtWFowRg5tXV
         vSLJuU1MW6cienJcs1ahghUWihARggb4KXc0kFEfsR2TcyqDBJyFRKxZ8CnOjSgEdxXo
         GxL+5zL6fYX19K1kXaq2O0Nipew0ZPyH+pvdqm+cWn5A2sgk9ffAuCZHOpDdBf4Z8RrF
         w2Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530383; x=1781135183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDqq79L2KNI1fcXdkS7SY6qPxkZmqKsIeFSaYmJ87+I=;
        b=PoTGy5n+ne9RqA617+Xq9bMfQYfLLOLuh6K53Aid5WquiqR9NJcEXoGPO5snv6b+xe
         TCYrBsJiYDIhv67L0GtulbsavVHAT72bQPXOjlIDyVuetKmkwJd3m6SyyhVzEP+KdX6D
         ptvVXIyn9nxYZzHC1MB8BqR+jrX8IdnxxRNz0eq5bDDxeL9WyxjTuD8R1K3B7oGrB/L1
         bUFUyEjZr1sIIgUuTAeU1QsvyJUFOyAfKkHvueYh30Jsn4fAIYB7SOZwsaC7p9mc1I1o
         hRKVb7dvOQBNj3xzAygupO3DuqbTq1i8KABSTc7Zwgbd0oVJuPkPq/7T/k2P6b1PbZ1W
         HcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530383; x=1781135183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oDqq79L2KNI1fcXdkS7SY6qPxkZmqKsIeFSaYmJ87+I=;
        b=TdQWmvG3mVxsnrywS7mNsB0JIaByhn3foJtSlveszbvhF+YtQr21hwZNdNt8r9nSD8
         dpaVxwKTGFTY4yptAi+KXMBJLq9pKmwIExHIhwkuC4DCZRwmB8/068JyJ/LxaB8XmK8a
         mSQCGVDYIvGNa2nj620r6JwFf5KZ+YLa7Q2tDAJr6qHyzp3ynrl52vYlnlyIpYA9EaLl
         SdgW5kqgXxiNEJuyuRWvngRPT+62DeeTwpuJHBs3G8pDnGv86fwobB2CRtRMrKnoR6Vq
         guTvztESZvoFvLuMzU030xzxK56fIMkwHc6n6r9Ki7tHwdiu87hQSqurKwnZhympdtz3
         OPXA==
X-Forwarded-Encrypted: i=1; AFNElJ8jlYr0nY0EHFJM6ZsTrBwofg5CfAi5I/k8kP8jlv9/elM0V+fIhqR1t0WtClxOrKRO1uI80gTd75vr+yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOU75hoxExys7NQpY6/tiCHoM5t4ZTqutHWBBslzax4FENxytK
	Wv5i6qq3ywcxARvneeHgTp6FrhG+EltEM9yeSsLpj/DV5c8wWpyjrADoWCIwD99VQ1Y9XRuRnsL
	YAj9d+nj7H1qZoWvhOgDIj7xvjMHb94o=
X-Gm-Gg: Acq92OHTiHEN9QntDePdmcFqjR8fC8aIebrTJcPbDVof6u1K8q9wSxEDwrVrK7xpKPO
	4Waxrpr2zwcVkCqBdjsUo/f+jzjV0in9iCfyfxOdQB4Pjd7EDJhPJm4SulZQnPKRZiMywiUcRtZ
	oVI7IDVQkZJ25Ga696sNk81+qHkAfoJMD3pLPzHQPIEvyjvOJCLcL60Gkxv0AWsu0EISwpJEcNV
	rh2SO0NS70qWvEQ9vYZ1FGDi+dVLdoLP/BC4fNa4WkNfsTJqI6ncwyXg8OecD7B6CoIS7AUVwVQ
	igcrczDwyMPsOiJoexP4bp0QNFjD3AbDMkk70Gsyy12U1pwhppif6vR/oZNXs8lHkrcugYg7QR8
	=
X-Received: by 2002:a17:90b:55c5:b0:36d:bc21:4ae1 with SMTP id
 98e67ed59e1d1-36e33ba4a37mr5389366a91.27.1780530382688; Wed, 03 Jun 2026
 16:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-7-ihor.solodrai@linux.dev> <ah8-6CNIHPCJxAOM@krava> <3ba6ed89-82b3-4dbb-99d4-5e34e496fc33@linux.dev>
In-Reply-To: <3ba6ed89-82b3-4dbb-99d4-5e34e496fc33@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:45:45 -0700
X-Gm-Features: AVHnY4J5wyC2MeMT_qZAFOzQr-pOLtU2IeLlkAkvBiLJsMe6_YTKdKXFgXdBid8
Message-ID: <CAEf4Bzaq5w33tqNwXeSbi0FoP2q6qSEnyZqWoY2RwUzs_M+sEg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 06/14] resolve_btfids: Discover kfuncs from
 BTF ID sets
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Jiri Olsa <olsajiri@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Alan Maguire <alan.maguire@oracle.com>, bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13555-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,iogearbox.net,oracle.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:olsajiri@gmail.com,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E557763BE5E

On Tue, Jun 2, 2026 at 2:09=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> On 6/2/26 1:36 PM, Jiri Olsa wrote:
> > On Mon, Jun 01, 2026 at 03:17:57PM -0700, Ihor Solodrai wrote:
> >> collect_kfuncs() currently uses bpf_kfunc decl tags to identify the
> >> list of kfuncs. The decl tags are generated by pahole, which makes
> >> current implementation implicitly rely on those tags being generated.
> >>
> >> The authoritative source, used by the the BPF verifier for kfunc
> >> registration, of functions being BPF kfuncs are
> >> BTF_KFUNCS_START()/END() declarations. These are BTF_ID_SET8 under the
> >> hood. Currently resolve_btfids reads kfunc flags from these sets, and
> >> populates them with BTF IDs.
> >>
> >> Implement kfunc discovery from BTF_ID_SET8 symbols in resolve_btfids,
> >> removing the dependency on pahole's emmission of decl tags.
> >>
> >> Walk BTF_ID_KIND_SET8 sets, and use the address-to-symbol index to
> >> look up set entry's BTF_ID symbol name (before .BTF_ids is patched),
> >> recording the paired flags directly. This makes find_kfunc_flags()
> >> helper unnecessary, so it's removed.
> >>
> >> Kernel functions can appear in more than one set, which is legitimate,
> >> since kfunc sets are prog-type dependent in the kernel. So for btf2btf
> >> processing deduplicate kfuncs by BTF ID, accumulate (OR) the flags,
> >> and warn on flags mismatch to catch inconsistent declarations.
> >>
> >> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> >> ---
> >>  tools/bpf/resolve_btfids/main.c | 122 ++++++++++++++-----------------=
-
> >>  1 file changed, 55 insertions(+), 67 deletions(-)
> >>
> >> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfid=
s/main.c
> >> index 43512af13148..d35a7b2460e8 100644
> >> --- a/tools/bpf/resolve_btfids/main.c
> >> +++ b/tools/bpf/resolve_btfids/main.c
> >> @@ -970,6 +970,23 @@ static int push_kfunc(struct btf2btf_context *ctx=
, struct kfunc *kfunc)
> >>      struct kfunc *arr =3D ctx->kfuncs;
> >>      u32 cap =3D ctx->max_kfuncs;
> >>
> >> +    /*
> >> +     * A kfunc can be listed in multiple BTF ID sets.
> >> +     * In this case, dedup by btf_id and accumulate kfunc flags.
> >> +     */
> >> +    for (u32 i =3D 0; i < ctx->nr_kfuncs; i++) {
> >> +            if (ctx->kfuncs[i].btf_id !=3D kfunc->btf_id)
> >> +                    continue;
> >> +
> >> +            if (ctx->kfuncs[i].flags !=3D kfunc->flags) {
> >> +                    pr_err("WARN: resolve_btfids: inconsistent flags =
for kfunc %s: 0x%x !=3D 0x%x\n",
> >> +                           kfunc->name, ctx->kfuncs[i].flags, kfunc->=
flags);
> >> +                    warnings++;
> >> +            }
> >
> > hit few of those
> >
> > WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_allocate_con=
text: 0x5 !=3D 0x25
> > WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_release_cont=
ext: 0x2 !=3D 0x22
> > WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_hw_request: =
0x0 !=3D 0x20
> > WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_hw_output_re=
port: 0x0 !=3D 0x20
> > WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_input_report=
: 0x0 !=3D 0x20
> >
> > I'd think flags like KF_SLEEPABLE might vary in different sets for the =
same kfunc,
> > IIUC you don't need to use KF_SLEEPABLE for syscall hook, because sysca=
ll programs
> > are already sleepable.. not sure there are other examples
>
> That's a good point.
>
> I think from the PoV of resolve_btfids what matters is the mismatch of
> flags that trigger BTF changes, like KF_IMPLICIT_ARGS. We could check for
> the specific flags here, or filter out acceptable inconsistencies (KF_SLE=
EPABLE).
>
> Any other ideas?

I'd only collect and check inconsistency of flags we care about (and
those should be consistent) and ignore the rest.

>
> >
> > jirka
>

