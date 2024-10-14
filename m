Return-Path: <linux-kbuild+bounces-4105-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD93B99D8E5
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 23:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2400B1F222B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 21:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A7B1D12FE;
	Mon, 14 Oct 2024 21:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VNDBMS6n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADAE156661
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728940627; cv=none; b=iCGPyEuiAsEZEN3jzgRpiCAOBf23cZcC69MByct4OvwSfASOjxnWVNWO3liLq5EHK2e30KO7zLiCjQ5kDDMMYIJa7JY5187OCclCnxXxkGWPZNOOkvD2DS55F+bhjviNcthUvEJwWmEJ0iZ1XgkAkCSZOuGVXZWdbre6M2PuagY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728940627; c=relaxed/simple;
	bh=ZI3U8sCOJ726YZ30gGwRvvoQ5UXBS01WMq3brNnRKuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSvugY5ej4pquHSOk4MIwLvQzU153J77tQoLdrL2o3Kdde3ZskCGedtokqigwRQaZTDN3fQvW1Knyd+t01uU2Iqxl0E7rhcSP4N1jq5KCvB8EFVaQI+WUqMDxSiergYP55MIYnBYDNtSZW42XZTSGuyJW0HJKMtx6DnofuUgC28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VNDBMS6n; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4603d3e0547so493551cf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 14:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728940623; x=1729545423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHb7NtoAh9gjfT6eZG97rGp2AF3tFOHSjIj6ouJz5Jk=;
        b=VNDBMS6nJtQsXHg1tmol9WWSGlyG+8HKOyLI3+5ffjrN0BuVhvNyw8W57qRjsgDuie
         8W6vjW23IftYn7I8a8LzjOa/akFZTBugmgNeGM1Jn6lEoxG1Fe9ATRBiVF1nOQgYIuzw
         3Dea06z1BLeZFjjMzm2ie1veuhaCx1tvfweUzK0Ww6auubTgSDYvE28zjfsZod/8WeWh
         2i0KOk8cm9ov3KEJlsTEgIWJHhXJ7ev35dB1HQZpNUx6ixf4ZCLQKpm9m9v2CEGQEyYK
         VgFD70ezaM4HV5lFjJ6mZtdeU47CQZ+ZG3AzdlL2Qtp3x/WSZJXQtkwwE/3Z9aZI6GNu
         +7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728940623; x=1729545423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHb7NtoAh9gjfT6eZG97rGp2AF3tFOHSjIj6ouJz5Jk=;
        b=BdKJP7zbSIkmxBTtq3WHpXyJa/7rmdVsnF1WlyMxs+Khoiw0WAOha4VhRL+/wZ6HDI
         orB7R+aUV7DtPjOODdojk1YSBBCOYTbNa7pAF5t5/TZezbxRt22v3wbzkngvNfT+Xha9
         s3bbx4Q2k7CMZry+uwUuQu/MrMuPokado6eYRMxncovMiVhii3hJbdP9ZkEwyr0kpgJt
         E+Ii0/ier9Xkh4Vg6SZbVPfQmR7J7U59UCvkbnCXFv+941gPSmkuo3GoGnrw9w9HDrUx
         hJyBXwZKNNGjg+3xDzUl0ST+0ysQXbCrLU0WcvG20lzNvaabCVL45iWAuqWLiAHyD9Dt
         kroQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7CblKZWe/26qAvK1gzRL9kAcclaydKTzpcUBHKP1rnaSW56rzqlBIeodvWY6IEIjQ3vzBbvfFv7aR4BA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYOYwb5LWhNRDU93tyqT9tFosRjcM2x2nsZ2K3Reo1V8J7p9c
	HlcRaSAZ6Yu62uNePCPb4+TLqCIAWqn5me4voBYP5klcyyJT2sUPhrwEKFz8ZCNoQb0I3s1U2Ef
	4GirFeBF/fm4pllO8GbWDU2F/TH3fNn99tJV3
X-Google-Smtp-Source: AGHT+IG1b7oU0kZLAEWD5hgOJFQGchfVhmH4qbX+aT93IIjRDuRwkmmDWWwjoBxrsP4yYyMAPebwXvZWRqMK+tLF+yE=
X-Received: by 2002:a05:622a:7d0b:b0:45e:fea6:a3b1 with SMTP id
 d75a77b69052e-46059c78199mr5347011cf.19.1728940623190; Mon, 14 Oct 2024
 14:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014125703.2287936-4-ardb+git@google.com> <20241014125703.2287936-5-ardb+git@google.com>
In-Reply-To: <20241014125703.2287936-5-ardb+git@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Oct 2024 14:16:52 -0700
Message-ID: <CAJuCfpGXBH0FQppLppSkCLeRwCJsAGUMWL6F+G1TdqU4d=q4og@mail.gmail.com>
Subject: Re: [PATCH 1/2] codetag: Use dot prefix for section name
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 5:57=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Sections typically use leading dots in their names, and deviating from
> this breaks some assumptions in the existing code, e.g., in strip_relocs
> on x86, which filters out .rela.* and .rela__* sections.
>
>   [65] alloc_tags        PROGBITS         0000000000000000  03a57958
>        0000000000026340  0000000000000000  WA       0     0     8
>   [66] .relaalloc_tags   RELA             0000000000000000  08dbb868
>        0000000000044c40  0000000000000018   I      280    65     8
>
> So use a leading dot for the alloc_tags sections.

No issues with renaming the section but please note that I posted a
patch [1] today that will have conflicts with this renaming.

[1] https://lore.kernel.org/all/20241014203646.1952505-3-surenb@google.com/

>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  include/asm-generic/codetag.lds.h | 2 +-
>  include/linux/alloc_tag.h         | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/asm-generic/codetag.lds.h b/include/asm-generic/code=
tag.lds.h
> index 64f536b80380..dcd18351ba2f 100644
> --- a/include/asm-generic/codetag.lds.h
> +++ b/include/asm-generic/codetag.lds.h
> @@ -5,7 +5,7 @@
>  #define SECTION_WITH_BOUNDARIES(_name) \
>         . =3D ALIGN(8);                   \
>         __start_##_name =3D .;            \
> -       KEEP(*(_name))                  \
> +       KEEP(*(. ## _name))             \
>         __stop_##_name =3D .;

I think leaving the SECTION_WITH_BOUNDARIES() definition as is and
changing its users to pass the name with the dot would be more
explicit and more flexible.
The only user today is CODETAG_SECTIONS() at [2], so I would add the
dot in there instead.

[2] https://elixir.bootlin.com/linux/v6.12-rc2/source/include/asm-generic/c=
odetag.lds.h#L12

Thanks,
Suren.

>
>  #define CODETAG_SECTIONS()             \
> diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> index 1f0a9ff23a2c..d45a8a582970 100644
> --- a/include/linux/alloc_tag.h
> +++ b/include/linux/alloc_tag.h
> @@ -76,7 +76,7 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _shared_allo=
c_tag);
>
>  #define DEFINE_ALLOC_TAG(_alloc_tag)                                    =
       \
>         static struct alloc_tag _alloc_tag __used __aligned(8)           =
       \
> -       __section("alloc_tags") =3D {                                    =
         \
> +       __section(".alloc_tags") =3D {                                   =
         \
>                 .ct =3D CODE_TAG_INIT,                                   =
         \
>                 .counters =3D &_shared_alloc_tag };
>
> @@ -85,7 +85,7 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _shared_allo=
c_tag);
>  #define DEFINE_ALLOC_TAG(_alloc_tag)                                    =
       \
>         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr)=
;      \
>         static struct alloc_tag _alloc_tag __used __aligned(8)           =
       \
> -       __section("alloc_tags") =3D {                                    =
         \
> +       __section(".alloc_tags") =3D {                                   =
         \
>                 .ct =3D CODE_TAG_INIT,                                   =
         \
>                 .counters =3D &_alloc_tag_cntr };
>
> --
> 2.47.0.rc1.288.g06298d1525-goog
>

