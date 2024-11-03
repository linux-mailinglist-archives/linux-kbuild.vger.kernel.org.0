Return-Path: <linux-kbuild+bounces-4492-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C01AB9BA57C
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 13:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60E2D281CC0
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 12:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B9E1632E0;
	Sun,  3 Nov 2024 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oz0cuCDk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460DA3C6BA;
	Sun,  3 Nov 2024 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730638621; cv=none; b=Ax3iZPzoKrCLKu5d24Fa1CQWQe6QAzQm/6YioTZHUxO848tviDwc355qw1uupHlp8aMhwHgMspdST2D1AfocnwgieLsaPf15l09qFqxGK9j09soKbCBx+DPoc9LD3DSUGT+mx1/1uqMawc2z6bbPqk052iUC96ehFGsRCgA4hss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730638621; c=relaxed/simple;
	bh=Ulo7nuPhsWAYT2Z4MZtXMIUNzaBvaVQ+PLkPkw/w3Vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgtVQBwPvLB3/jjrpkWPK8gOYypOK1IO0k1OA6dJZriyKqbg5ERuZKuoTzjJBumDCbzFditoVEwW4X222CNy+Xn8mHAo7f9WsL6hzL7F2a1uVXV6HH451Oa7/KGykxLdaAJ3Ifb0Lrxa11MXxYmHWn6RIhFViZhpb5OxIeUKi4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oz0cuCDk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD3CC4CED5;
	Sun,  3 Nov 2024 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730638621;
	bh=Ulo7nuPhsWAYT2Z4MZtXMIUNzaBvaVQ+PLkPkw/w3Vc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Oz0cuCDkAZFXhDfxaZdIElFslhXlBDHk2po/BLBB4gkgbe1fyrgy0BM8oSnouO5Jx
	 KrNPwfWe2gVjoSqbmEqbZz0VpjaT9ZQZzDkCr/GZTU6OSbWySvEGZP5R/CCGY0A26q
	 I5gF66IDDhMesJPtZClI2Mb7oiwVp/NIAlDOW1pG/DFmQGkrhV2dLn5dEWgCJMHqjo
	 86KXSR7R2a6oAXyWT0QOIZulbHnA9KhzISFMPlW43f20fLBuen0uznYl+xYUD6pMFa
	 /7alCHeYa1cX8HpKsX8qY9LzUcVDM80maH+MZ0CzIERJDbGqhUcWOkderP08UDvxeF
	 0z+5697E0jdaQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so40003501fa.1;
        Sun, 03 Nov 2024 04:57:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXI8uSwEw0FGI/R/m8+ZSmXFSX/7lJePK3lG+smnwYoy27oWFYXDXmOaPd0dJI9hPPnuf4VRkTAJiQpBSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUcBOB47C7Ie9jVYEmaDKlllW7Ig/rCiIQV278j0saqLHNIlpE
	cGcOXtmuvuf/fzEtZYu1r0iQSCeqHec4JkvIGi6KpJ1M/ZxVmkW9/b7dTlbx02nqba2hRdxJ76j
	wZaSM5q5WJHFNbF5a9cCkc3H9y6g=
X-Google-Smtp-Source: AGHT+IF06ebLEarwXDoKFppSamZPRLpZjX3Vu4ACQhXUqkAtck63Coa7NSwE2kFzu1rTbxRjEj4C8KRp8Xpjw9qbX5k=
X-Received: by 2002:a2e:bd12:0:b0:2fb:579a:fff with SMTP id
 38308e7fff4ca-2fedb3ed34amr32403311fa.8.1730638619693; Sun, 03 Nov 2024
 04:56:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241103124824.943659-1-masahiroy@kernel.org>
In-Reply-To: <20241103124824.943659-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 3 Nov 2024 21:56:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNASW1jrO-hENgbZS1QGiZcGeAFwOwZY6M6cAx6tafOfhqQ@mail.gmail.com>
Message-ID: <CAK7LNASW1jrO-hENgbZS1QGiZcGeAFwOwZY6M6cAx6tafOfhqQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: fix acpi MODULE_DEVICE_TABLE built with
 mismatched endianness
To: linux-kbuild@vger.kernel.org
Cc: Hanjun Guo <guohanjun@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	"Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 3, 2024 at 9:48=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> When CONFIG_SATA_AHCI_PLATFORM=3Dm, modpost outputs incorect MODULE_ALIAS=
()
> if the endianness of the target and the build machine do not match.
>
> When the endianness of the target kernel and the build machine match,
> the output is correct:
>
>   $ grep 'MODULE_ALIAS("acpi' drivers/ata/ahci_platform.mod.c
>   MODULE_ALIAS("acpi*:APMC0D33:*");
>   MODULE_ALIAS("acpi*:010601:*");
>
> However, when building a little-endian kernel on a big-endian machine
> (or vice versa), the output is incorrect:
>
>   $ grep 'MODULE_ALIAS("acpi' drivers/ata/ahci_platform.mod.c
>   MODULE_ALIAS("acpi*:APMC0D33:*");
>   MODULE_ALIAS("acpi*:0601??:*");
>
> The 'cls' and 'cls_msk' fields are 32-bit.
>
> DEF_FIELD() must be used instead of DEF_FIELD_ALIAS() to correctly handle

This is a typo:

 DEF_FIELD_ALIAS() -> DEF_FIELD_ADDR()



> endianness of these 32-bit fields.
>
> The check 'if (cls)' was unnecessary; it never became NULL, as it was the
> pointer to 'symval' plus the offset to the 'cls' field.
>
> Fixes: 26095a01d359 ("ACPI / scan: Add support for ACPI _CLS device match=
ing")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/file2alias.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 99dce93a4188..16154449dde1 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -567,12 +567,12 @@ static int do_acpi_entry(const char *filename,
>                         void *symval, char *alias)
>  {
>         DEF_FIELD_ADDR(symval, acpi_device_id, id);
> -       DEF_FIELD_ADDR(symval, acpi_device_id, cls);
> -       DEF_FIELD_ADDR(symval, acpi_device_id, cls_msk);
> +       DEF_FIELD(symval, acpi_device_id, cls);
> +       DEF_FIELD(symval, acpi_device_id, cls_msk);
>
>         if (id && strlen((const char *)*id))
>                 sprintf(alias, "acpi*:%s:*", *id);
> -       else if (cls) {
> +       else {
>                 int i, byte_shift, cnt =3D 0;
>                 unsigned int msk;
>
> @@ -580,10 +580,10 @@ static int do_acpi_entry(const char *filename,
>                 cnt =3D 6;
>                 for (i =3D 1; i <=3D 3; i++) {
>                         byte_shift =3D 8 * (3-i);
> -                       msk =3D (*cls_msk >> byte_shift) & 0xFF;
> +                       msk =3D (cls_msk >> byte_shift) & 0xFF;
>                         if (msk)
>                                 sprintf(&alias[cnt], "%02x",
> -                                       (*cls >> byte_shift) & 0xFF);
> +                                       (cls >> byte_shift) & 0xFF);
>                         else
>                                 sprintf(&alias[cnt], "??");
>                         cnt +=3D 2;
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

