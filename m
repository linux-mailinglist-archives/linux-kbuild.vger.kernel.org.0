Return-Path: <linux-kbuild+bounces-7621-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C0CAE48AD
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 17:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5788718863EC
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 15:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EEB7E792;
	Mon, 23 Jun 2025 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M2fAiRSo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55D228A708
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Jun 2025 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692210; cv=none; b=l7CXAC7hKQPV3XHn+80eha1RqMBoJ48ZhxVF0zkRhQdMhuzKqlZZ6XAKkaElu4vVE9W1BA2csMEF3eYvvW/68c5Wa2emlbGY5d45//WEd+pS0l3F7sIxVjg5y73gsFYG9iYm5Yu8wwJw0sJVgkatgdwNNYOtCn/Sq0KysPDQygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692210; c=relaxed/simple;
	bh=SVVhYZvptRHvWy6ECNSSMwCz2nb8b9mlJe/B4F5PLGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfexajvgT9M64cHsImwj2Ek4Wb8slE2PrVwWFEqD2BMmK9ua3NliR19UwYS/haiON15lpvmuvHSpvWiWtU4Uw+QJGwYWz4oVkhl0Hu0ZxsOmNBw16GqViGihhGkrQxQtq+r7w9e/TB+c3mZcMDAAtxGbOKmbHc6FZeNQs5QMBMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M2fAiRSo; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235e389599fso347475ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Jun 2025 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750692208; x=1751297008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xKVYEt/1XAG/rDm3Qsq30ciDg7bGFCanzViwOcaGes=;
        b=M2fAiRSoRH/yEdLHXPLjY01Lk434/zOqJuhTtvLt/PGncXuYdFn0pnNo5R5p8pa51K
         dG/o7RKcjFrPYeLEWOeWiU3vRY3Qjhnz8YTOv89PeS4c6CW5VgelMUbaE0y6tAtBqK+7
         dMFk9raViN9EBYvKHeAv+GMEBaaynaeTnLaaD24lSJ/kqmsxu+J/eN3kRAUm0T9Ql4b0
         LOYM2wK0xF8Wfdsumxuj9ALp6UX+9kFxvagvawHuGOsGGAhLdmCDvVvjYmQTbCFljVNM
         prM6N4aWWOR+7OteVl26UjBjUjyqerKXt9kinX4mkTWZ4vwiUOLKCXMS6icTgzU+0Wpf
         BriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692208; x=1751297008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xKVYEt/1XAG/rDm3Qsq30ciDg7bGFCanzViwOcaGes=;
        b=qZSXPsXak557AVy/6N5LaYNV4biufuxW2u1Td1mzq209bf1i2eJSQAsjo4QJ24UgJm
         1jA3eMCq3CtTYPCTZ3Y51OfW93bVWCPcUjLW/LLLirA989OZ76vqOCW5aM6pkIJ5PgdC
         LrCmJ+71NWcGXuU/H9OLML6YAKYn602/jmzNvweji7iuX1FljCIkcPg4IecOWEfST9LQ
         Z5qhGw7hX+A0ATiGse4jy+A+q/R61rTDU+dzSQV9yT14+168U5YLMlP9iPBBirCKDEZ1
         TaX0HzYIG0mgVAKKQtwVtw92mEkTsUxhIyRqgYf+ZBsuioiTBnY/cclSi0IlopNHvbXS
         mtvg==
X-Forwarded-Encrypted: i=1; AJvYcCXudhFpT7JADp+KJz+tqew5RD6kXBJZ7w88hkPQx1xXVjGtLN8idlgYnFVkkrtsgHPP94kAvEJQK8XehFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmkWJpNQU5gTyLOpoXsHQ80hGAcFVnlrP9CJHi9CNzoodh1Ehe
	FC5dej7jOxzHpz7wN+I3bN1GIKRoOgRU+LbGWRXIWno0a5F5KAj7jIueqS7OsRZPYauEDF77dzn
	D2cjNLbwM6+zKer9zHmgULOigkBjEcDwFQV7N9GyaP9hbUan5CuSKT7RK
X-Gm-Gg: ASbGncvDDDrXuen50eZmly8jrRxa2PGP2NaMWyAzHteZ5PHEBCzHBWoc5AEZnPP0Vc3
	7FPFo847tLOLtK9ItZmKPEKt3huhoT91UDlUd/EdoiSLnzFjejNahOeDGAvJT+kob8exBHYZgK7
	8mjbCQ1vz9ZDuX6dxcsDw8pXhzkaMhNCVwRQRCCKuHdUqacYyWtww=
X-Google-Smtp-Source: AGHT+IGKDqfw73zBONPMhWTBZq5sn8fIPJr6XNb97m1huHThSghMFLDPcjpDBONMI3PYmS2dmvUHHdzvcgJaT8blGQg=
X-Received: by 2002:a17:902:ecd2:b0:235:e1e4:efc4 with SMTP id
 d9443c01a7336-237e47a607dmr4681835ad.14.1750692207615; Mon, 23 Jun 2025
 08:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623092350.3261118-2-gprocida@google.com>
In-Reply-To: <20250623092350.3261118-2-gprocida@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 23 Jun 2025 08:22:50 -0700
X-Gm-Features: AX0GCFsxTT0ix79BDZcTXttlcbRoLHw5kXN43iSZKxn3LLTNwWtw8gubZbmerQY
Message-ID: <CABCJKucSF7O8m6-QM4-J7-qTNTvFFax3=_v_kFy_3qRZZ6ym_Q@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: make -T symtypes output be in name order
To: Giuliano Procida <gprocida@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giuliano,

On Mon, Jun 23, 2025 at 2:26=E2=80=AFAM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> When writing symtypes information, we iterate through the entire hash
> table containing type expansions. The key order varies unpredictably
> as new entries are added, making it harder to compare symtypes between
> builds.
>
> Resolve this by sorting the type expansions by name before output.
>
> Signed-off-by: Giuliano Procida <gprocida@google.com>
> ---
>  scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.=
c
> index 7bd459ea6c59..51c1471e8684 100644
> --- a/scripts/gendwarfksyms/types.c
> +++ b/scripts/gendwarfksyms/types.c
> @@ -6,6 +6,8 @@
>  #define _GNU_SOURCE
>  #include <inttypes.h>
>  #include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
>  #include <zlib.h>
>
>  #include "gendwarfksyms.h"
> @@ -179,20 +181,41 @@ static int type_map_get(const char *name, struct ty=
pe_expansion **res)
>         return -1;
>  }
>
> +static int cmp_expansion_name(const void *p1, const void *p2)
> +{
> +       struct type_expansion *const *e1 =3D p1;
> +       struct type_expansion *const *e2 =3D p2;
> +
> +       return strcmp((*e1)->name, (*e2)->name);
> +}
> +
>  static void type_map_write(FILE *file)
>  {
>         struct type_expansion *e;
>         struct hlist_node *tmp;
> +       struct type_expansion **es;
> +       size_t count =3D 0;
> +       size_t i =3D 0;
>
>         if (!file)
>                 return;
>
> -       hash_for_each_safe(type_map, e, tmp, hash) {
> -               checkp(fputs(e->name, file));
> +       hash_for_each_safe(type_map, e, tmp, hash)
> +               ++count;
> +       es =3D xmalloc(count * sizeof(struct type_expansion *));
> +       hash_for_each_safe(type_map, e, tmp, hash)
> +               es[i++] =3D e;
> +
> +       qsort(es, count, sizeof(struct type_expansion *), cmp_expansion_n=
ame);
> +
> +       for (i =3D 0; i < count; ++i) {
> +               checkp(fputs(es[i]->name, file));
>                 checkp(fputs(" ", file));
> -               type_list_write(&e->expanded, file);
> +               type_list_write(&es[i]->expanded, file);
>                 checkp(fputs("\n", file));
>         }
> +
> +       free(es);

Looks like a nice improvement. Thanks for the patch!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

