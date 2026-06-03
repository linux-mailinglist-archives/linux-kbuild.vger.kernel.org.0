Return-Path: <linux-kbuild+bounces-13557-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1PRyHau9IGqQ7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13557-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:50:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ACB63BEA7
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:50:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ev1KpUro;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13557-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13557-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8BF93019BBE
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCADF44CAE0;
	Wed,  3 Jun 2026 23:47:01 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B14640759D
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:47:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530421; cv=pass; b=GPffNz/JNiaYdQNOSrf+nfzL0xqDI6YNOJ9yqUEB7ooVTzEZhsOR0KQRtvbK1gbhE+LdgxZqR003RYyxaW5Hk9SCeD6RR6LHB14Q2hj40DwH+8cn6p6C7BDTCOChEdAZHFVBzNCFOxvPnMLySM8e7OohUjXziMdDxQJlYwnBy6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530421; c=relaxed/simple;
	bh=DCp3v9l+FMS7NINNd7W7HntSmsBGnknae4Q2CV0fksc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VFVFNYT9D/cTAXWT+fc/NqHQzWryX5UGAOygSfbsIT8ohiB9bNbi4zeyIaljPGKVZGlvoRFI9+NJ9zMekTqXx0BVU5P5jdzcCOVU2mYjAN8dlc6JclDTEyeTKx6CD663YlIfuv+IHpa169VM0Dsgp4HdbOSw5AH07H4EvHWduh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ev1KpUro; arc=pass smtp.client-ip=209.85.210.175
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-842848fd613so48066b3a.3
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530420; cv=none;
        d=google.com; s=arc-20240605;
        b=Fbmtv5a+jRKIMjWJkwYlxKTOfqmhKcuZ6Hqlt1d7iDk+Ag+oUVcCBWFGZ7TBxtVsD7
         Jz7FCladsvQj6S/vCYHfwtUiKeIBujxS+P2bRGNv9v0qHnza7ABNpjkwqI6ylK5nhAAw
         SikMtQuu2vDMqWIXs5MdamBirsWxD7MjbbisKPHCjKbSt+ShVIVpC2sinNKuBB/v9VSF
         HrdJ1x5SaA+CYnq9nkLENqaXU4LTy8jT1rWkxAv8ckWsXordx9hfUfDl2Nidk1gW8Cay
         V/z5J8g4IrNv1Ihylkw0FACDgZET+gCf0swzvCPtBRni7RKNrPB/iwchvhhs17+17jnP
         Q63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PRQr144oVhotnRScCZDWsFCvp93dWQllt04uhG0kBxE=;
        fh=gv5Gh6RqBZmOXP5y29U7Rq1dXICc1H7zC2T2HvSKNDY=;
        b=MB29rY19F0XGl9DAQCujj48BorLbpy5KHhuTX5DCndu0I5cliVK93vE5GP7s/ZL8hU
         vaJ7RqwtnrJsFe/HVJVTIAXeVtH3no6wZP64De3WyCqmx2dlh80V08pOwbDIloHScIYA
         guMQwMCl0axF/xkh4QwxHBXCRf3G+6Gfdjfu90I/vb34tO0v6A1/65FTMIE6xM7F1g1/
         S2rNdr9JYhEllVi1Z7gxAcAODAnr4iJVcnrAArQRSjEXiNx5IJ0IZAiuRORUp4O4vBO4
         UFjSRSq3LndSXXyjYsvIoeazUOp4oyxtTZHTxT5Uw6K9Ybco1UpojEYR5NMYmUIammLv
         NOnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530420; x=1781135220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRQr144oVhotnRScCZDWsFCvp93dWQllt04uhG0kBxE=;
        b=Ev1KpUrowU53YF+UACz+/2pJYtyWITUaz6K1qfk5YazJ8Er4DxEkFnUrKcHW2UTlWW
         GfMjcXfPTjV4EoyfyE7X35NRb5pY76ZrAGFc+ckqKeASJIAKG3IzHTGdG80BNyMHJkHn
         DOlrppCQW2ko7qFNLT89TyKYW0k5MSHSKVswJYlKNwhz8C8mEeCTiHdj8alGjoZcglry
         e0NMNWQef4heF38VrkJXS1WWj/0zWSehVHTf9gXGAnVtzNOdGK41A8C5qqNVaFZyCkFD
         sIV814ugFhypTTpS48nmM5LAO9a8dVFJJgamcZ/HzyonUsUUiDSE6qVBMBVBlxGCzS6/
         H0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530420; x=1781135220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PRQr144oVhotnRScCZDWsFCvp93dWQllt04uhG0kBxE=;
        b=mFF00alLLNrPXQn061wO+ESGm6sbsA+d9MO9FSoWInwSNsU9SmiloHfsq3n/j0oOgG
         OAftZbx7Xlg0ttkFT0hRZ7tooci8mra6jqiJTn1gdRsRuuivYZAAfY1nNAX0MWcm7IA5
         kgCqJ1VUVmm6bAr2PyCODOfWry/v+Z1A0Tizg5ubQHuzO+rnbW3VgQ0Mg7MXBKni3cFx
         lLhrVRQ2lqb8+5YnpCoXTsVlZATyGmc8ciVrRU5DxoJywtOyLtaoHhxTRo6v2v8M5h4O
         TouFEH+dHN5PsN8UX9jrRyHHKzwEQzJUDIqo9ZvnjzevJjFdZG9ibJy26oMPCLLj9aWr
         hTKA==
X-Forwarded-Encrypted: i=1; AFNElJ8StIzfra+F5sLpSMgziXorma/HA1qovwWsa+zxP9YpKnMxqSSOcZqDFLzS4Y9F4kgrdgtYnDvNqHBNZNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHHcx5dal5fFp6izGTdQDLxjlf0BCz+NyT/99vQuE9E2f+RyyM
	6lEGKlg5a/d31+2JKOoNK0G7E4TRSh1bGf3Ao091mQlaB9hB0SER0xjsu8Ud3XX66R0vb3npFhg
	bSBoD/l8aoImnH+FjSRulQsRDuEkaRxQ=
X-Gm-Gg: Acq92OFkMqFe+Mnd0vsvgdxEvYANACU8AYFL3lhxLzV2vXL76mxFX1kjKY8mgZUNNHB
	Lu8CfvUXcY9sNEGFvV329GULxSCP70yDYDhX0XmGP71oswQSfc9Wr3gyurT0+AOBi9cgPPxrOiL
	uu+7UpnZQ5Ls4U5hlJPMAns8+Oe9YWqBFhEkr6NpAiZJmdskRt/aDdF39ChroNiOljqhovVPAxC
	Fr6Z/t0GdU5w7Da9mIQUMSHSJPzFhCFV0IhcMNea6s8l2ke+MoB/mBEb0t65QxTdua7DbgFRLJ1
	Ry3f64zSRbbVfBSLZfbNYaxtlooCBQL2ET9AcYpKQY+ZKwZJCUCT2ynPV9reDDL6YKXAv0ABKQA
	=
X-Received: by 2002:a05:6a00:a21e:b0:842:3801:47f with SMTP id
 d2e1a72fcca58-84284e1a23bmr4856513b3a.17.1780530419730; Wed, 03 Jun 2026
 16:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev> <20260601221805.821394-13-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-13-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:46:45 -0700
X-Gm-Features: AVHnY4IQDbz3ReZJFNHbtHz-9E83Cjslix00uXOBreU20DsKEz2wz7UdcnKiRyY
Message-ID: <CAEf4BzapFqXxGj-rSuNZ-_0GWpUCGcyi+UKd3ei6xaa5AKDbaA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 12/14] selftests/bpf: Verify arena type tags
 in resolve_btfids test
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
	TAGGED_FROM(0.00)[bounces-13557-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: C4ACB63BEA7

On Mon, Jun 1, 2026 at 3:19=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> Extend test_resolve_btfids() to assert that resolve_btfids emits the
> address_space(1) type attribute (a BTF_KIND_TYPE_TAG with kflag=3D1) on
> the return type and/or arguments of kfuncs marked with KF_ARENA_RET,
> KF_ARENA_ARG1 or KF_ARENA_ARG2.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  .../selftests/bpf/prog_tests/resolve_btfids.c | 59 +++++++++++++++++++
>  tools/testing/selftests/bpf/progs/btf_data.c  | 10 ++++
>  2 files changed, 69 insertions(+)
>

[...]

> @@ -178,6 +191,22 @@ static bool btf_has_decl_tag(struct btf *btf, const =
char *tag_name, s32 target_i
>         return false;
>  }
>
> +/* True if @id is PTR -> TYPE_TAG(kflag=3D1, "address_space(1)") -> poin=
tee */
> +static bool is_arena_tagged_ptr(struct btf *btf, __u32 id)
> +{
> +       const struct btf_type *ptr, *tag;
> +       const char *name;
> +
> +       ptr =3D btf__type_by_id(btf, id);
> +       if (!ptr || !btf_is_ptr(ptr))
> +               return false;
> +       tag =3D btf__type_by_id(btf, ptr->type);
> +       if (!tag || !btf_is_type_tag(tag) || !btf_kflag(tag))

drop !ptr, !tag, etc, BTF is not malformed (and if it is, test_progs
crashing is not a big deal, IMO)

> +               return false;
> +       name =3D btf__name_by_offset(btf, tag->name_off);
> +       return name && strcmp(name, "address_space(1)") =3D=3D 0;
> +}
> +
>  void test_resolve_btfids(void)
>  {
>         __u32 *test_list, *test_lists[] =3D { test_list_local, test_list_=
global };
> @@ -253,6 +282,36 @@ void test_resolve_btfids(void)
>                                                      kfunc_symbols[i].id)=
,
>                                     kfunc_symbols[i].name);
>
> +       /* Check resolve_btfids wrapped exactly the arena-flagged return/=
args with
> +        * the address_space(1) type attribute, and left other pointers/r=
eturns
> +        * untouched.
> +        */
> +       for (i =3D 0; i < ARRAY_SIZE(kfunc_symbols); i++) {
> +               const struct btf_type *fn, *proto;
> +               const struct btf_param *params;
> +               const char *name =3D kfunc_symbols[i].name;
> +               u32 fl =3D kfunc_symbols[i].flags;
> +               __u32 nr;
> +
> +               fn =3D btf__type_by_id(btf, kfunc_symbols[i].id);
> +               if (!ASSERT_TRUE(fn && btf_is_func(fn), name))
> +                       continue;
> +               proto =3D btf__type_by_id(btf, fn->type);
> +               if (!ASSERT_TRUE(proto && btf_is_func_proto(proto), name)=
)
> +                       continue;
> +               params =3D btf_params(proto);
> +               nr =3D btf_vlen(proto);
> +
> +               ASSERT_EQ(is_arena_tagged_ptr(btf, proto->type),
> +                         !!(fl & KF_ARENA_RET), name);
> +               if (nr > 0)
> +                       ASSERT_EQ(is_arena_tagged_ptr(btf, params[0].type=
),
> +                                 !!(fl & KF_ARENA_ARG1), name);
> +               if (nr > 1)
> +                       ASSERT_EQ(is_arena_tagged_ptr(btf, params[1].type=
),
> +                                 !!(fl & KF_ARENA_ARG2), name);

I'd add {} around all multi-line if bodies

> +       }
> +
>  out:
>         btf__free(btf);
>  }
> diff --git a/tools/testing/selftests/bpf/progs/btf_data.c b/tools/testing=
/selftests/bpf/progs/btf_data.c
> index 8587658012c3..ec34f7a6e038 100644
> --- a/tools/testing/selftests/bpf/progs/btf_data.c
> +++ b/tools/testing/selftests/bpf/progs/btf_data.c
> @@ -58,3 +58,13 @@ int kfunc_b(struct root_struct *root)
>  {
>         return 0;
>  }
> +
> +struct root_struct *kfunc_c(struct root_struct *a, struct root_struct *b=
)
> +{
> +       return a;
> +}
> +
> +int kfunc_d(struct root_struct *a, struct root_struct *b)
> +{
> +       return 0;
> +}
> --
> 2.54.0
>

