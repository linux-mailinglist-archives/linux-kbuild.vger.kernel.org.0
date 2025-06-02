Return-Path: <linux-kbuild+bounces-7334-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D828EACAA11
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 09:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6F367A69A4
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 07:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75510191F7F;
	Mon,  2 Jun 2025 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0IOkhFi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956B12B63;
	Mon,  2 Jun 2025 07:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748850375; cv=none; b=sZAPh6Axi+O2ijW9shi+6rKuD8l5TBY2qv41nWQL8kvwif70HlshE4vlRreEsrAZ5XAQvc17BFmU+evV2rijKK6kzywxX0wewmxAKTsq8Q8t2Sxg7V3yGnAgknQJ0d3/T34dJtsoK3aPSHLg/K/s51g0FKYbp0Ee2Yw427Mzmpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748850375; c=relaxed/simple;
	bh=uVAozsXr/oNj+YFTr6OY6Oik9BlTn3N71tlKGqsiVt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLJ70BUlKH5C8KNoi7KE1XquuecFLp5Ev2YmxDUkVHOZmmRZghKsy06wI4ncbjVZjSmnlf72PHFpmQnt0GfrZOrVWMHTGN8pb4JF9K5pPr/utxo2h13JPptdTcCumUMEXyGnoOOSue4yrQDPPSFf+sMq7DIgJqtrmNaufSkC3N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0IOkhFi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA221C4CEF1;
	Mon,  2 Jun 2025 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748850374;
	bh=uVAozsXr/oNj+YFTr6OY6Oik9BlTn3N71tlKGqsiVt4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k0IOkhFiHLF5kqSD5xKmEQgUboiSSaEY+++B5Fh6a6ODVbdXU0ddhlPL0MF2yh/aw
	 83x8zGTOg2fBwxmdvca0sOoaLCyrbr/aYFCZ6C65saO9feyjJUemd31sKokSFO5rVK
	 0srBMNd7laIIW1Kw7l61En2PBAvMTFcTuG4CVBWxumNT0KSkXg4OAS9sRXV6t8mqpl
	 3Kg18DzdESjMjO21t4IJttcOcrdHQP39hd1yxeZAvyB6yuqaujieYifR+np3fB+Nml
	 QoU8GHowlVXQo4UuuJh6fpiVED8YPkVmIyuMpShZWVewlR77M6dWRrr4MBeHbsB6QH
	 sIU8UTeXU8sJw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-552206ac67aso4643220e87.2;
        Mon, 02 Jun 2025 00:46:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvXk7ydfRN8mi03C038MAJORyyGnKe+5bKl4B7sibKKJI9OEfXoD9tkJhGxHC7SL19mQAuavOvK/53tfkoLQ==@vger.kernel.org, AJvYcCXeP60PKqyvuf8TbsUljNKeg/DKFGMRMV9xXH1AwZ8GwIju2rQCbStKIUkPdBg2k+nADFU2L+9B4QjInlQe@vger.kernel.org, AJvYcCXuk1s42pEc6fE+8p2GJ938/KoTzT8+DlMU+Ssm3+8uxaNG+ng+//6zhu1HBEkb4VR2dcp7sINhl+MeDQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyudbfhbIlQeGxcZU7sR2DeXixY8fd5qMrih/9zWRyjStn7agk
	A22iXeSJsrWuuoZGTGiZnyJ3v/dTX0+fZMLmJmupdkRrXvtGqWEGx9bvKdB3DvMWglsGUKEPyaK
	hqTWqGWZDCMr4FKkU9alksxKaQAVJWcw=
X-Google-Smtp-Source: AGHT+IGKqgJX+VzS8lV08fTwK9CM4TagFtsvhcZZ/s/fHmQEPH2wR0EGnZeZLj3rgvZ8b4/Gm0fI5Hv89uGDVtbCqno=
X-Received: by 2002:a05:6512:3b89:b0:553:2868:635e with SMTP id
 2adb3069b0e04-5533d16bf33mr2717254e87.23.1748850373433; Mon, 02 Jun 2025
 00:46:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748335606.git.legion@kernel.org> <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
In-Reply-To: <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 2 Jun 2025 16:45:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARkhc40UfrmmqsqmqkCn60=7zHc=pDFGR4o=k2p7CsABA@mail.gmail.com>
X-Gm-Features: AX0GCFsbkhuJESm6mcSj7ybga10eKsiKOu4FrMnfYxsLs-CpksPCTsdLzOcjEcE
Message-ID: <CAK7LNARkhc40UfrmmqsqmqkCn60=7zHc=pDFGR4o=k2p7CsABA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 6:08=E2=80=AFPM Alexey Gladkov <legion@kernel.org> =
wrote:
>
> In order to avoid symbol conflicts if they appear in the same binary, a
> more unique alias identifier can be generated.

Why must this be unique?

What problem would happen if the same symbol names
appear in MODULE_DEVICE_TABLE()?


>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  include/linux/module.h   | 14 ++++++++++++--
>  scripts/mod/file2alias.c | 18 ++++++++++++++----
>  2 files changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 88048561360f..e7506684069d 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -249,10 +249,20 @@ struct module_kobject *lookup_or_create_module_kobj=
ect(const char *name);
>  /* What your module does. */
>  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _descr=
iption)
>
> +/* Format: __mod_device_table__<counter>__kmod_<modname>__<type>__<name>=
 */
> +#define __mod_device_table(type, name) \
> +       __PASTE(__mod_device_table__,   \
> +       __PASTE(__COUNTER__,            \
> +       __PASTE(__,                     \
> +       __PASTE(__KBUILD_MODNAME,       \
> +       __PASTE(__,                     \
> +       __PASTE(type,                   \
> +       __PASTE(__, name)))))))
> +
>  #ifdef MODULE
>  /* Creates an alias so file2alias.c can find device table. */
> -#define MODULE_DEVICE_TABLE(type, name)                                 =
       \
> -extern typeof(name) __mod_device_table__##type##__##name               \
> +#define MODULE_DEVICE_TABLE(type, name)                        \
> +extern typeof(name) __mod_device_table(type, name)     \
>    __attribute__ ((unused, alias(__stringify(name))))
>  #else  /* !MODULE */
>  #define MODULE_DEVICE_TABLE(type, name)
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 00586119a25b..dff1799a4c79 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1476,8 +1476,8 @@ void handle_moddevtable(struct module *mod, struct =
elf_info *info,
>  {
>         void *symval;
>         char *zeros =3D NULL;
> -       const char *type, *name;
> -       size_t typelen;
> +       const char *type, *name, *modname;
> +       size_t typelen, modnamelen;
>         static const char *prefix =3D "__mod_device_table__";
>
>         /* We're looking for a section relative symbol */
> @@ -1488,10 +1488,20 @@ void handle_moddevtable(struct module *mod, struc=
t elf_info *info,
>         if (ELF_ST_TYPE(sym->st_info) !=3D STT_OBJECT)
>                 return;
>
> -       /* All our symbols are of form __mod_device_table__<type>__<name>=
. */
> +       /* All our symbols are of form __mod_device_table__<counter>__kmo=
d_<modname>__<type>__<name>. */
>         if (!strstarts(symname, prefix))
>                 return;
> -       type =3D symname + strlen(prefix);
> +
> +       modname =3D strstr(symname, "__kmod_");
> +       if (!modname)
> +               return;
> +       modname +=3D strlen("__kmod_");
> +
> +       type =3D strstr(modname, "__");
> +       if (!type)
> +               return;
> +       modnamelen =3D type - modname;
> +       type +=3D strlen("__");
>
>         name =3D strstr(type, "__");
>         if (!name)
> --
> 2.49.0
>


--=20
Best Regards
Masahiro Yamada

