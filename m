Return-Path: <linux-kbuild+bounces-13553-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VVoYHz69IGpw7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13553-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:48:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC0B63BE81
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:48:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WhqMKk1K;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13553-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13553-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20E38300E26D
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7CB4A2E03;
	Wed,  3 Jun 2026 23:46:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E75C38425A
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:46:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530374; cv=pass; b=GWam3yo//g64nU0r8OIQ6bDyDL3UBfz73iE30sNk2SdNLUJMqpYkrnv4841m7h8ZGD5Gr78gGfiaeujYxxiTe3Nuguz8TzjXvLeCxILuWvOd6XWw/3cQT2a6uHj0cLfDmOYKRyMp/NL50jPQLaPw1dqD6LbXe09Ld6c6Fg7Y+n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530374; c=relaxed/simple;
	bh=lBXZh2NozQ0exShExkwC/4/tgxNGFEWumpbLV/iaQdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIzjY1aYur8jj9lg2tCpg6uHqFSjwUiTUgwtn+mh7RgjwK8wGqxVIRkw32PCFyE1vxfI0MtqESMGQoYQsDyhwqkE31JXGgIApMiF8EhRU6YFZJu0ZBcOYgX+gyGg6lugqV+ett9542JGS4RIjeOlfOhfQ+SgkYs6TraGRHJvza0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhqMKk1K; arc=pass smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36b900f350fso73057a91.0
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530373; cv=none;
        d=google.com; s=arc-20240605;
        b=g0zPuPaZFaOH9fc+fevSjPMHUnkCqgMCQ5gx3JH8jFqyB2sfSNrMkdGD8pEDCZjYd9
         Eho1g4oOYqRRbNFD2QQFC4nAGjjkf0mYCOdVgdqqPhcYOys59f3qnAza8rNzF88U1M9w
         jvwghLfM10c63AV9wLSzrmuQxdD3JGBAqRUs+B7G41i9A/yRc8Zq5x7n/Okxr0fsnSKE
         GayNdTo/2d0/X6l62Ja2g5b7DTlTZpNu5UHt8F7Krx/Vf+5zDPN03j1RJnupOy849vZ5
         RoYPRKCOVT1kd+C8ymb4El3cSYKvLXh5jgmvUuemC8bM9NRZE9DwgNVl4JRC+RFGnRT6
         7CtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y63ff5AlkUaWhekNyytDJI6efbM0EkMkt6aQJdoaHyE=;
        fh=L1hG/rv+XZWZX5Px4ZZHW5G+dFBN7r3wpXM65J0gQVk=;
        b=gNYW92qNu+Pv7+VX4v6Q0JFa06XONfPBiNznM1K9KOWC5mHwIoc9Wf1XqdOoND9WMe
         2J6ATKJqgwz2VlolwKDFHYJHSR3nczSaWNwcHEF8CiG7wNNe3+F9iZgv1M9HQxsS3zJt
         7FM7a01EQqo0+v9xnp8w1r9erpMsWW07QnXC4TCfz110oviORNUKeHIf9+l3Wg+F8J6f
         JZ+IqItsvglOjB/mrHv/Kx7/xijk1iN1QZXA44Vf9kqBj9D+GY3vP1//25YuXRIE7mht
         Xu2ByObYqg6ddKB9GLG9jw+H1lYCA7o8JuQCK89rumxG76GaSTMZS7qLQ4U0XYIisRFM
         rRiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530373; x=1781135173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y63ff5AlkUaWhekNyytDJI6efbM0EkMkt6aQJdoaHyE=;
        b=WhqMKk1K+u2gNKNm+3eYdt/Sn0A7ER4tM+OGndV73FSg7KVx4Pyn+pSpu947kGpwNe
         XO5XsNDHyT46v1CKJ3F7B2j/FezaMm5vdmWZRYEfzG924LDL9mbakfo8adSjMDBInmeG
         dnPJb+LUW1O2fdmgvUXqX4j5YS+Z1y9b083ftY6Rw+7Mka1hd3sdg2vLjtwTnEimUANn
         KZTBFCbPnwp8xli7uxzKU4R8T3dXQ1QWJCuRWE4R+gqxCtpUsZraf49CBm9KR/BKctwJ
         SYl7IIppdAWuDNGp1ift8Y8KPJOJhXr80hpHe2W68BJDeG5fm3DVgxFj/A69wDDQj06y
         pA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530373; x=1781135173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y63ff5AlkUaWhekNyytDJI6efbM0EkMkt6aQJdoaHyE=;
        b=MNpSpm96R1SPacy9cZ/YqXPw+rYcRmrcnoCQYyMx/QGKqsxmVNCenXst5EOpdGgm/5
         HyGZCLKzl80ml0PIM/uAMkvl4qJOxgZYP9zp4vA8ghRJOVx8axgjflcMlnOwkrYnqdxj
         /XKKxChlMuPIdoGdbaLtsNWMfzCL7tDDrRE+sc6QTYFvU1+mU48OpClHUbjAW5cNGif+
         v0Wlo4NhCM0qrhXcQTFPI9c2JQCARNq8XRyaPQKdExvkVyw+pUGuEKlgE1mzCeq/5UGE
         LdPqky8Aao36DIVIPUDTpCgkPQrkawd8mVJljIvttvM655J0UejpdI4OGQYmGdiCzQQI
         gqkg==
X-Forwarded-Encrypted: i=1; AFNElJ87ZNwDNreOUU0o3gel+DM/9VpHwJj0q6ShDTNgOBKLDzkP4GI8aLYuQyTXcZLU+0Pi1Zdsu4xfODSVXiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6CAegmQb62H/TOIBHVKy+vgpvl/EZEXsnWQasLSU7YyOmxd09
	9xbb9mURyIxAL6ZEDImPG4kQcLet3zmIKAvwbwmUxTqB5OvHTFnL6GbTchn4aWwaDaLBsQBi4Va
	EHYrbkd1CwL2Dex772NAXJjKXjvtDdNg=
X-Gm-Gg: Acq92OGJAhKBd5isQj5q+Lge9bxZwjqUsJn/AuvpdmAveYkGaZN0tBRn2LK/6LyAhE+
	Dvjnh3V/D0oKtaWJtX4E6AK4xKrxjvQItueuDnANS6RiPQlUfEkm+JXhgUQ49R4Dc4JICBMDeIJ
	v2m/Uva7t+ZssQAN4M/tviskFwAUX0C7fv+XYWlJKhrchhG4EPjnFSwEdoR5qZK3SZnChsu48Uu
	GbCuYPuK7LEIZM5so/KpToQwQr03QdFcWY+kHR+eyfzIrid4bkG8PouKkp1hB4bM5U0D6ReQMIx
	b/zl0SoRnCXA+YFXemF8sfLi0yCz05mN5+7NSVseBFy9RbHK1IHwn7hAKqS5QebWCE31BomLTRk
	=
X-Received: by 2002:a17:90b:1e0a:b0:368:b724:6d53 with SMTP id
 98e67ed59e1d1-36e2f2c534bmr5789291a91.4.1780530372809; Wed, 03 Jun 2026
 16:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev> <20260601221805.821394-5-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-5-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:45:48 -0700
X-Gm-Features: AVHnY4LwPtNevVlaHNv_71moB5w_FpbOcNHZHIo47BShPBdaaGG7ixbGVKHRtuo
Message-ID: <CAEf4BzbywmmyPBcntAAS-=cbBfoXHPN4AZqwwK9K_sN7ejUfBg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 04/14] selftests/bpf: Add kfunc set test to resolve_btfids
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
	TAGGED_FROM(0.00)[bounces-13553-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAC0B63BE81

On Mon, Jun 1, 2026 at 3:18=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> Extend the resolve_btfids selftest to cover kfunc sets defined with
> BTF_KFUNCS_START/BTF_KFUNCS_END.
>
> The test verifies that resolve_btfids correctly processes BTF_ID_FLAGS,
> resolves function IDs, and checks the kfunc set is sorted.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  .../selftests/bpf/prog_tests/resolve_btfids.c | 56 +++++++++++++++++++
>  tools/testing/selftests/bpf/progs/btf_data.c  | 10 ++++
>  2 files changed, 66 insertions(+)
>

[...]

>  static int
>  __resolve_symbol(struct btf *btf, int type_id)
>  {
> @@ -108,6 +129,18 @@ __resolve_symbol(struct btf *btf, int type_id)
>                         test_symbols[i].id =3D type_id;
>         }
>
> +       if (BTF_INFO_KIND(type->info) =3D=3D BTF_KIND_FUNC) {

we have btf_is_func() for this in libbpf's btf.h

> +               str =3D btf__name_by_offset(btf, type->name_off);
> +               if (str) {

can't be NULL in non-corrupted BTF (it will be at least ""), and if
BTF is corrupted then let's crash

> +                       for (i =3D 0; i < ARRAY_SIZE(kfunc_symbols); i++)=
 {
> +                               if (kfunc_symbols[i].id >=3D 0)
> +                                       continue;
> +                               if (!strcmp(str, kfunc_symbols[i].name))
> +                                       kfunc_symbols[i].id =3D type_id;
> +                       }
> +               }
> +       }
> +
>         return 0;
>  }
>

[...]

