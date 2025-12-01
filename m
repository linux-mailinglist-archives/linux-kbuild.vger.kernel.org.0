Return-Path: <linux-kbuild+bounces-9927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C70AAC98831
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 18:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A3FCC4E1AFA
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 17:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3F5337B81;
	Mon,  1 Dec 2025 17:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDHDxekv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3192131619C
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Dec 2025 17:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764610038; cv=none; b=hFVPhEa+hkbKNmGX1SjK1H610drzfLrZRYqzDDZBQJM2ZW85g7Wgi0CAlQqrWDxnBDL+IpxPbAs8T8xP79N3dw+stmPNC4k1WQ1EkLUu79bJLKL+rMVN96C62E9KxsOc7tA5NKA7KpN/Uesj0kuhsir8CT8p3i2OJLTQRbHeVHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764610038; c=relaxed/simple;
	bh=UKEcAU5XG9XTh0LArW+wQNvSNYiB+nKnM68aZ0vsVi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YhZa7NF8R4VrnzL2uJyQl0HVHYJi0kN+F3N+us1VAi9YvDXIV5VXKfcZSI4o/nbjTVrbthvY+2JhApZyv8wTf94Ci7Veuv8Eqj39b8BNbjUibfRSEhWukGM6ZK1k6l6jt1NHGwJX9q0DxaKBmvjFGNlK/+OM8NfWq/rK4dRfSt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDHDxekv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3436a97f092so5617296a91.3
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Dec 2025 09:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764610036; x=1765214836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijq5sdrlqJg37gB6OmgS7cKCkkSyxlmrkLtviwXuwno=;
        b=iDHDxekv4gVpeFGVHXCkHbjAFU5Dbw3m+XHVPOMWq1BNS+K7IX1RHNnnKUu4BLu6uI
         21ZCWI9LqrjGSfPChFUJRdCkVxZpRJohTyeIrTJajDnbX1V14FFyFwk1bzLhfXqOBBxS
         uisHkfBVsgmHbk6t7fEgi4YlkCH87v7I1UGLWBWCsV77fzHDa0oPAwxGyyV1wDm4YvHx
         lcDovKGVJmrKonM7g5AZWjPhmjIxpCv3ExyuSpoCQ82u0baI8CSbHimXM1VYklw0KqGU
         e7kb8HJDw6Wq3xtMYEODEJ3kR7gfj9F6YtC3YK2gIFfP4dOvL64dMBidoCiZoJcRfmBY
         aMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764610036; x=1765214836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ijq5sdrlqJg37gB6OmgS7cKCkkSyxlmrkLtviwXuwno=;
        b=Le8brCZ9000iKwp4WKcujNqqHrXGfOhprMeN4dz9DcDjVT+IcrBe9790jdZVNNRUzm
         Lih+CUzm9+uWaJtwrem9nEV1QwRR9mm8nwuzdwKqyVIEn/3yDLvRA6V5mmr4CRoK3jIQ
         xfAMA6AubX0CbbyJg147NsJR/a0zen4QSQnr50cDjpD2vp4dpxpNenhNCsQ9qxCyatuI
         T3HlYDsCp8XEyefPiNpARvDhXa1jpV9F7TwPc1PMt+tz3tnUWq+BL7Q+aPiNnLjGDGr+
         u1gnQOBAhQAOol7Ld70xZREXzZRKFwtCBod8EslX9XEC42MDnFaGajMf7xY5z9WeAcUk
         f/nA==
X-Forwarded-Encrypted: i=1; AJvYcCVw90XifwM3nTs9ohEEWkKAZijg+YfAOoFV3rd0wNuFKt0pJS7pDtIF0H5+CEv4tz5LcNVb5lslZU7pUNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLEFJcbOLuzPvcadGFECPJk4iP3Qh7p8ISzzLZgiS3G4qGldMM
	5OYz79eIxAp7rNpG9wPXMN1C/nGjE+su/uWsHkeeU7ubS5u6z/4YZpRitrAVfFWMW17njkBbLd2
	upkqhDI/GVz5VzQZ1C5rPFtQfnDgPKLI=
X-Gm-Gg: ASbGncvNUohsqi8AP1wyO/ZrcFgdOf4xWN4wdfVJU/QMEyDpquvPoO/TecD7clkfthl
	gEhrDf/nmgXaF/WBiLXzw3cr5QG5BJikdsK8ex7GjPJwNHpaXoFEG8x6MPkG7BmpTIAkhEmZV0y
	NPHU/g/3xSkOb4aRqXpIYdMrlmnFxdIwdoHidymCDitvPcbs9rTpSvoieBOx575mrM+UYVWyrNc
	jnoPtyK8cYyd/NTRJnZksfFk8s90JwAUW4I6py2jSGsHPSGD31Z9prB0Iia2h/THAG864nfvciD
	tCYmW+Ywtps=
X-Google-Smtp-Source: AGHT+IGx09HDUgaoADTduGqPajX6ASw2XvUan4kcA666p0ucXEytDotdQYFZNC19FTRcVAIVrhsi5V5N6apBj1QvUjk=
X-Received: by 2002:a17:90b:2781:b0:341:194:5e82 with SMTP id
 98e67ed59e1d1-3475ed5183fmr24662841a91.30.1764610036443; Mon, 01 Dec 2025
 09:27:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127185242.3954132-1-ihor.solodrai@linux.dev> <20251127185242.3954132-4-ihor.solodrai@linux.dev>
In-Reply-To: <20251127185242.3954132-4-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 1 Dec 2025 09:27:03 -0800
X-Gm-Features: AWmQ_bkjXdi8-UO2T_nJR5GKr0m3vFgYdnfm11dAyI-KtaylhiOL7YCwKriYRGE
Message-ID: <CAEf4Bza+L_RL_d7JFFLmzkYj2dbnT8rDgqwCat2zLOekToRm-g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 3/4] resolve_btfids: introduce enum btf_id_kind
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Donglin Peng <dolinux.peng@gmail.com>, bpf@vger.kernel.org, dwarves@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 10:53=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux=
.dev> wrote:
>
> Instead of using multiple flags, make struct btf_id tagged with an
> enum value indicating its kind in the context of resolve_btfids.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  tools/bpf/resolve_btfids/main.c | 62 ++++++++++++++++++++++-----------
>  1 file changed, 42 insertions(+), 20 deletions(-)

[...]

>
> -static struct btf_id *add_set(struct object *obj, char *name, bool is_se=
t8)
> +static struct btf_id *add_set(struct object *obj, char *name, enum btf_i=
d_kind kind)
>  {
>         /*
>          * __BTF_ID__set__name
>          * name =3D    ^
>          * id   =3D         ^
>          */
> -       char *id =3D name + (is_set8 ? sizeof(BTF_SET8 "__") : sizeof(BTF=
_SET "__")) - 1;
> +       int prefixlen =3D kind =3D=3D BTF_ID_KIND_SET8 ? sizeof(BTF_SET8 =
"__") : sizeof(BTF_SET "__");
> +       char *id =3D name + prefixlen - 1;
>         int len =3D strlen(name);
> +       struct btf_id *btf_id;
>
>         if (id >=3D name + len) {
>                 pr_err("FAILED to parse set name: %s\n", name);
>                 return NULL;
>         }
>
> -       return btf_id__add(&obj->sets, id, true);
> +       btf_id =3D btf_id__add(&obj->sets, id, true);
> +       if (btf_id)
> +               btf_id->kind =3D kind;
> +
> +       return btf_id;
>  }
>
>  static struct btf_id *add_symbol(struct rb_root *root, char *name, size_=
t size)
>  {
> +       struct btf_id *btf_id;
>         char *id;
>
>         id =3D get_id(name + size);
> @@ -288,7 +301,11 @@ static struct btf_id *add_symbol(struct rb_root *roo=
t, char *name, size_t size)
>                 return NULL;
>         }
>
> -       return btf_id__add(root, id, false);
> +       btf_id =3D btf_id__add(root, id, false);
> +       if (btf_id)
> +               btf_id->kind =3D BTF_ID_KIND_SYM;

seeing this pattern repeated, wouldn't it make sense to just pass this
kind to btf_id__add() and set it there?

> +
> +       return btf_id;
>  }
>

[...]

> @@ -643,7 +656,7 @@ static int id_patch(struct object *obj, struct btf_id=
 *id)
>         int i;
>
>         /* For set, set8, id->id may be 0 */
> -       if (!id->id && !id->is_set && !id->is_set8) {
> +       if (!id->id && id->kind =3D=3D BTF_ID_KIND_SYM) {

nit: comment says the exception is specifically for SET and SET8, so I
think checking for those two instead of for SYM (implying that only
other possible options are set and set8) would be a bit more
future-proof?

>                 pr_err("WARN: resolve_btfids: unresolved symbol %s\n", id=
->name);
>                 warnings++;
>         }

[...]

