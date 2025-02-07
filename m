Return-Path: <linux-kbuild+bounces-5656-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD64A2BE64
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 09:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 545E77A543A
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 08:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5941ACECD;
	Fri,  7 Feb 2025 08:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2QHpYRw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24511A23BC;
	Fri,  7 Feb 2025 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918249; cv=none; b=NpOWU51c/T1TGOG/Td4XiCD6uoOQ8HOVZ690RRbdnktAz5Aw0Y6Sc+gb357MOphpd9VvIJ3VT+u/T91Rr2pUSGEd67/1R1qe28Vtrv46DZGzL3scaTAFdotAI+AD0nwWafNVDNZ6g5JTS06rbbTtOOcJ3NaAIjsKS5cYx+JqBd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918249; c=relaxed/simple;
	bh=2NYGvJ8k2kDtJsKxYGkFZIq42074PrA5IiFENHQoLhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JF2RZEln4d7sfiSkhKLCAegjQ9qN/whPghqnXPPzoT4Cd7pv8Mde/greEUIVxiDCbgpEfmg2+Mgo4iZV+Y8SyFwFcMX74wIZtHlJkRvtgiwa/NlcdBDSrM3jcdPt6oVy8ttT0+EDHn4F5S37Wd3Kqx/oESbd+QZR6lMPEbzpplc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2QHpYRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592BAC4CEE2;
	Fri,  7 Feb 2025 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738918248;
	bh=2NYGvJ8k2kDtJsKxYGkFZIq42074PrA5IiFENHQoLhY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J2QHpYRw5kBg+K9bD7z8O16Cih4jartY4DQxwbQlAEtF7PtoN8HXPtu19SqmUgR3r
	 usXvcSHfr3905IwBW7iDvDX+muzE47SLxWpGhzvs5tfd4fiDXyXTQRod4GIF0TyQpu
	 0f+Fj+Y0dvhzXOZmbvEKNZ56AVleAG5uBcGtreEsDwIROApMaispJ5b05svrBFcwib
	 Pu0oHmsVEl7CY0or0KDBpfj5WKrL4CLI6ifiONLwS6jkFGJClLtXk3aYA2lVr8qOeu
	 G7HPjzX0E1iPise6Qcs17MEtogTTrKPNjbeUZVTnMd/PVBGEQUH3Gi1Y3dzNDhuZFN
	 1A2KKgWlWe5LQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-307d9a13782so15379191fa.2;
        Fri, 07 Feb 2025 00:50:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlsLafqXtKbH6WpvWpR9+nTG5ZQzPyJC1s2xuANx9Y20HsYVYyZPKAjXcf/++IYIxH3/EQzIqRCUegYABf@vger.kernel.org, AJvYcCX/i40ZEy15ePMr17XZ96cABojDji1ZNOL+KZCTVbQSfNrfE3HyGBxej0uDJX4wOb3BrPbwHBxnM2Uv5KXAyQ==@vger.kernel.org, AJvYcCXD5pLH6SWUjnSAmIP4Gb0wVMkMa5fzKaT6IiqAjLdZYQHwQFuItchUuqOUVsCS3tSEPe0aDvl3PdBSUEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFi3GUCcJrQkmwEwbHgFaD9LjoG0rDy73uScYx6qzEf0AlB1FS
	lRzsliiIrUEiD8mTelnSOs2hS/QooeRcKOGlfXsD2wILpYn3gK7fsr/rATbNnaBrsDloYVz+F1h
	BU5WAmcIz2CeHVgpr/HTSAn0TxnU=
X-Google-Smtp-Source: AGHT+IEhylhvD50ZinMer+/FHksfGWAXZZxGKTpiDuqpjGbDY7Ce2JJbrsI9Mb7Mkl9OM6TlostOZw9fLxUlSxh2S68=
X-Received: by 2002:a2e:be8d:0:b0:302:34da:ac30 with SMTP id
 38308e7fff4ca-307e5806e73mr6720831fa.18.1738918247060; Fri, 07 Feb 2025
 00:50:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145946.108093528@infradead.org> <20241202150810.160972089@infradead.org>
In-Reply-To: <20241202150810.160972089@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 7 Feb 2025 17:50:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS2ZgDeu4SgUco8_hoHaKf5XtnB+bEB7LskCXuOQ3nhXw@mail.gmail.com>
X-Gm-Features: AWEUYZkkff0uOVhw_9r99_kY9P-cx2Tepl3Ix0DbloxvTuSERO4OSqQ-ep_diBE
Message-ID: <CAK7LNAS2ZgDeu4SgUco8_hoHaKf5XtnB+bEB7LskCXuOQ3nhXw@mail.gmail.com>
Subject: Re: [PATCH -v2 2/7] module/modpost: Use for() loop
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 12:11=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:


Please add a commit description.


>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  scripts/mod/modpost.c |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1586,12 +1586,9 @@ static void read_symbols(const char *mod
>                         license =3D get_next_modinfo(&info, "license", li=
cense);
>                 }
>
> -               namespace =3D get_modinfo(&info, "import_ns");
> -               while (namespace) {
> +               for (namespace =3D get_modinfo(&info, "import_ns"); names=
pace;
> +                    namespace =3D get_next_modinfo(&info, "import_ns", n=
amespace))


[Bikeshed]

Personally, I tend to indent a long for() as follows:


 for (namespace =3D get_modinfo(&info, "import_ns");
     namespace;
     namespace =3D get_next_modinfo(&info, "import_ns", namespace))



>                         add_namespace(&mod->imported_namespaces, namespac=
e);
> -                       namespace =3D get_next_modinfo(&info, "import_ns"=
,
> -                                                    namespace);
> -               }
>
>                 if (extra_warn && !get_modinfo(&info, "description"))
>                         warn("missing MODULE_DESCRIPTION() in %s\n", modn=
ame);
>
>


--=20
Best Regards
Masahiro Yamada

