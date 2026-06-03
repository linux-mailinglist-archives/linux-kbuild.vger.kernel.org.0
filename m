Return-Path: <linux-kbuild+bounces-13552-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EYDyCPa8IGpc7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13552-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:47:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7246263BE73
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:47:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ivOzzdmx;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13552-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13552-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44D493023DF0
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054F03D904E;
	Wed,  3 Jun 2026 23:46:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ACD38425A
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:46:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530362; cv=pass; b=qhYZvDDTZeRYjS85mKSawWmitkxJ6KmpN8bjPQYZ4gxhtP2R4+yLk/S4ND6hf/9H62Wpt2YapjmL0L4EXXzJoE2P9vIWCueCpGp7U00wnhK/nc+dVEUmKd7293t/om07RnuTr87ftk7U1+tJkwtP8RGS94fokZiMFBOdrhGIlFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530362; c=relaxed/simple;
	bh=d01pYYztsqtr84UOeep+EAdKFvu5qQUMAqF0BPgwHCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tA+OTPmsWCM+cY3b5KD6q9tXKXk7RzO/Zj4y0F6aTz4HBluwpMhjTTaB/7uoVedM9wyNVHiR/pDFZ/8GjcvrlTNAfwLLro5pfd/LK9ulJMQG/C0mu4qwCM5Rkh/jtOegjdcM9sA1vKdHfMXlJaOTSB57OHVNjPPzd00pMSW520k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivOzzdmx; arc=pass smtp.client-ip=209.85.215.174
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so35612a12.3
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530361; cv=none;
        d=google.com; s=arc-20240605;
        b=UOfiVuIBHZzKQDQSSf1t2HQLmjbIsechpRl7nvRELhAtqyJ/DAu+FpnuI0RC0qdi7f
         SONgabFB5oqqlie3Iy88t+oqDkagsy40CuT9YYribgcbNibBBhXv1FPzBT5Jz5Dxdv6Q
         yZYXx9g8v+6NIGonX2YdbRYxobSe4Ii2/ursiXXQ3cxoleg8YB3XANvtRc7irMi+NmLi
         +Ytdca5xDmFbpMJDxuf0p5iGQf0b4OzflX7IeHu0KNlqiArm7ac+fkL5bvUXNnop2zaV
         xGFFhDOFxCRqsetJzrgzhz2VoAMSJJu2tlJnngnIwVkBFXb+07bdE4bxwqmMeiG+ANH8
         0mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pG3L/vpuUNwUku1IpHlYEh732YQ2/gOWib0SuE0t7Yg=;
        fh=WMLUaJm7jLEs7RDFBIa3amHUhYsHICIt9eK1AYybaK8=;
        b=lLhviOUyZJ32DVm9d0JcUEOd7uUWI73KVUQH/Nr7ha5/cQjg+A12H1UfEWZGt3AI1r
         cOUFPAf45IG1MVIDEMJ7Woqj0a0gA0uh0KCKtOc4BUdPnf4ErnSY51agu3eXyU8uYSjB
         9vPFY+AtNr8RHe04qPn6uAcEa4bLPnKpmGknhlvfJjcWkFEP3YIMmwvmjgg5eEna0wPm
         W25EbtLncqezuHhZhsMr7nIAkXFS0THWkFK0aGqhlerBnKnMdlB0wFGYuK9RgVyTSoH+
         QjkoPW+ZhdyLKV59Ajtckoxq6DlH8FDQNgyOThH5oVhn06ISsQKKUqKkJjcPxEmwPokh
         rqSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530361; x=1781135161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG3L/vpuUNwUku1IpHlYEh732YQ2/gOWib0SuE0t7Yg=;
        b=ivOzzdmxa+KWAhYzkiuTuxBJdOZGPzZ7iHdJ37yZktGxF7ZaVTnD+SCFgqPaUrl6q9
         f1cP63vPeRi9vWXUgARe8EwvsnLRy0zCfhmUybtipIC+6rIAvF1hejlk/XFqXRu23pfD
         vqonU9kEQSXgXiG8ym5eTMfdZyemOblxvBcni2pGgAJbAUIwMzkjLdjP1RTcqSJ9xZL+
         iQ6MMgY0zlKO0HdKlLt74+kHPC90qPlwPbZmtpUsIv6sn21IVvMiTfif2Z8iMKCwh1TS
         qVO06NVKkLsv+OK6KWtVbqPdbF6Laww4b7L3K1yl5nm29U2cRzp+Ivi9yQCpqlybMr/F
         FhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530361; x=1781135161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pG3L/vpuUNwUku1IpHlYEh732YQ2/gOWib0SuE0t7Yg=;
        b=jDHLBzYdfj6nbrHNthLtkf1Pxp6aKVwGGq7CnM//eTiMYMQauAaR4MvtUIcpLH3fmV
         T5zhhAanOQjsje1TZKKzmHB/N2sL1cJLGd44HSuTAQwUCClezfNAH9BkDQggoosltqBM
         RoyGE8lXjQ1KT1sPrmE5MrID1iGeABMN0kv5/4D8SFBXp4+SSle3nbqiuMKe1MH2U9J2
         QCmi/2/jMue5KEML0ZIwjhxdcmY+jzrZhCrkPGK58gJNflJ76nNrBxqWXk4MUeAHDqEo
         IObi3FIeHlA7ckJzdkNkZQhebIjwET7I1TFro6LzNCLKLhC6qrAgF8rlO/dTpEwAruHi
         e4BA==
X-Forwarded-Encrypted: i=1; AFNElJ988EzTBbostmWbKVlvhZECZtlJoDz0xWi9DcMhP1vU20MMlU2DWRSkX0IR+R6+Na51qAAnACZ0zEek6+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqx0b96PaiE/vlhCZQws9M5Z6ufHqJtcdXxXJ+u7nritFrUd9M
	IhXMal1EjolTGbVf+b03LPP3ms2LKuX1nAI5z9vHZb3M7mObDTLCbUE+RvjgnKcyGKAW8OypWmP
	B5n2225kEHNVtVHWBZ5Lgiumrbi9ja54=
X-Gm-Gg: Acq92OGN56vzLBRPsLONrncOdAaHE+nIyYDJo7ngHhSSDgRTjM2zGjPFspsWEbTwljF
	5zb428odvVBxuIM6Ej/WUvonpt4S4pMOKLaHcr32EIb78xsqT2IX3+3i0wPJg5heo1FbJ6lWko0
	oZvFvqyH9AyUx1APOtqkzN0fUSsK6JWWrFrTVdTnRRMsqH5nye+Kwq7Vf0GRpH2Mjsy9GEneZIf
	ylbSzAwtMdp3+ZT/fY8ZXIz+iJqwGhjH/IDEO+FgS5fpzs3oDf84nZR4hu3ZebN/CUwwTvFh5k2
	E7HG+EjHm6Pl1c7HOvHoVSpBaCsZArEUMKtnTGJxxFIfI+H3j6UttC3CD3dHhsGAxHCqCFWh1JQ
	=
X-Received: by 2002:a05:6a00:32cb:b0:82f:559d:ece3 with SMTP id
 d2e1a72fcca58-84284e83f69mr5353450b3a.15.1780530360964; Wed, 03 Jun 2026
 16:46:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev> <20260601221805.821394-6-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-6-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:45:42 -0700
X-Gm-Features: AVHnY4JoceXTvB7eW-rSH2G2YnG2z-sIqzLAb-759Doc4bsSrdh08lc3JaZQhkg
Message-ID: <CAEf4BzYevwUOY34KOdjRd9cv5uXdxEwy13+6vHmNo_h4ryyT5g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 05/14] resolve_btfids: Index BTF ID symbols by address
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
	TAGGED_FROM(0.00)[bounces-13552-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7246263BE73

On Mon, Jun 1, 2026 at 3:19=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> Keep an address-sorted index of parsed .BTF_ids symbols so code that
> the original BTF_ID symbol name can be recovered from an entry
> address.
>
> Use the index in find_kfunc_flags() to scan BTF_SET8_KFUNCS entries
> directly and match each entry back to the requested kfunc.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
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
>         Elf64_Addr       addr[ADDR_CNT];
>  };
>
> +struct addr_sym {
> +       Elf64_Addr       addr;
> +       const char      *name;
> +};
> +
>  struct object {
>         const char *path;
>         const char *btf_path;
> @@ -150,6 +155,10 @@ struct object {
>         int nr_structs;
>         int nr_unions;
>         int nr_typedefs;
> +
> +       struct addr_sym *addr_syms;
> +       int nr_addr_syms;
> +       int max_addr_syms;

nit: max seems misnamed, it's "capacity", so I'd choose
"addr_syms_cnt" and "addr_syms_cap" naming (I believe libbpf does that
relatively consistently)

>  };
>
>  #define KF_IMPLICIT_ARGS (1 << 16)

[...]

>         for (next =3D rb_first(&obj->sets); next; next =3D rb_next(next))=
 {
>                 set_id =3D rb_entry(next, struct btf_id, rb_node);
>                 if (set_id->kind !=3D BTF_ID_KIND_SET8 || set_id->addr_cn=
t !=3D 1)
>                         continue;
>
> -               set_lower_addr =3D set_id->addr[0];
> -               set_upper_addr =3D set_lower_addr + set_id->cnt * sizeof(=
u64);
> +               set_addr =3D set_id->addr[0];
> +               idx =3D (set_addr - obj->efile.idlist_addr) / sizeof(u32)=
 + 1;

where is this +1 coming from? we have some reserved zero entry in
.BTF_ids section? I'd understand if this was symbols table, where we
do have zero entry, but I'm not quite following here...



> +               set_flags =3D elf_data_ptr[idx];
> +               if (!(set_flags & BTF_SET8_KFUNCS))
> +                       continue;
>
> -               for (u32 i =3D 0; i < kfunc_id->addr_cnt; i++) {
> -                       addr =3D kfunc_id->addr[i];
> -                       /*
> -                        * Lower bound is exclusive to skip the 8-byte he=
ader of the set.
> -                        * Upper bound is inclusive to capture the last e=
ntry at offset 8*cnt.
> -                        */
> -                       if (set_lower_addr < addr && addr <=3D set_upper_=
addr) {
> -                               pr_debug("found kfunc %s in BTF_ID_FLAGS =
%s\n",
> -                                        kfunc_id->name, set_id->name);
> -                               idx =3D addr - obj->efile.idlist_addr;
> -                               idx =3D idx / sizeof(u32) + 1;
> -                               flags =3D elf_data_ptr[idx];
> -
> -                               return flags;
> -                       }
> +               for (u32 i =3D 0; i < set_id->cnt; i++) {
> +                       Elf64_Addr addr =3D set_addr + sizeof(u64) * (i +=
 1);
> +                       const char *name =3D find_name_by_addr(obj, addr)=
;
> +
> +                       if (!name || strcmp(name, kfunc_id->name) !=3D 0)
> +                               continue;
> +
> +                       pr_debug("found kfunc %s in BTF_ID_FLAGS %s\n",
> +                                kfunc_id->name, set_id->name);
> +
> +                       idx =3D (addr - obj->efile.idlist_addr) / sizeof(=
u32) + 1;
> +                       return elf_data_ptr[idx];
>                 }
>         }
>
> @@ -1575,6 +1631,7 @@ int main(int argc, const char **argv)
>         btf_id__free_all(&obj.typedefs);
>         btf_id__free_all(&obj.funcs);
>         btf_id__free_all(&obj.sets);
> +       free(obj.addr_syms);
>         if (obj.efile.elf) {
>                 elf_end(obj.efile.elf);
>                 close(obj.efile.fd);
> --
> 2.54.0
>

