Return-Path: <linux-kbuild+bounces-7347-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA40ACB96B
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 18:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF321189A8AD
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 16:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418B922541B;
	Mon,  2 Jun 2025 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjnnLwXT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139DF2253EE;
	Mon,  2 Jun 2025 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881145; cv=none; b=XQZJ7no2Udr1r/cfWj9L/MKYPCECvU47uTx1/RxYI3cSmp1sCNuCOJuSoWqHxTL1QbIEwE3dF/iuceW+xCviWeHYoLSoxClyL8T0DsPNmHskRapxGTZo/2xrXjfpEGRDqXy2wECsWuihHoW5rI0AvGbBgKTDtg/d+g3OuGRaGoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881145; c=relaxed/simple;
	bh=w4GNZGKCnMuVrnT2luhPZIvQbPqpJNG/7BjnllWT5J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2WuYnROiSvacRjz8qx4f/Qqb50IqWW7tQ0WhfZ3GARc4H1ErNFdkXK1JYL90FDYtWWe+JkSefUW1OKUvoQud7ePoiwTKrmpwD+6zOyP0BSXgrpVQb2rQ2BNYlayQh/VHdwu8cD/PbguV98LhSJHbroH9876i4yS/YOFgwbI5Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjnnLwXT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7D2C4CEF3;
	Mon,  2 Jun 2025 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748881144;
	bh=w4GNZGKCnMuVrnT2luhPZIvQbPqpJNG/7BjnllWT5J8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AjnnLwXTNTfj3ZpcAcudTqg1eFKgo6IzWCaJn6P3jPxV47DKiWRKmyFEQaEtlF4Ym
	 V+h6tU73KAvdNc7s57qzIbynzTnR/QVEe6SqA2Qgq1FYShkFnb0crP5WBMY5FTsKzB
	 BIGgDvDaO3gON/+JWoJ2yXcFSwCu1lns+g27hAvgp4/mrJKtvMjXO6Ta8NiPyOhLUP
	 pOCzWAaXEJlKx5tZYcEI2iKE+VqqHTgSoVQXI6AnZ2hMbmvoUxSuP+yaUYWyOTvWDs
	 fVCTxUUMWGVHLpulrXe3WIiDn/7Hy2kTjuRvdYtI3JKmHK5nOdZBLNLz/zSUyi63I+
	 UrSp1arkvy50A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso5987107e87.3;
        Mon, 02 Jun 2025 09:19:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUx4JSV0Lpm/Z+IqJcWcHSlcJPZegOrNIQWkg2dk6AyokCa+h0W36yVUTEWTa57ilW5hUxZgnQsIVgC5pJ7sw==@vger.kernel.org, AJvYcCXMgQJSxiLMJUH/JMXx9aISEQVbaka65BJR1isgSjR7bSPBFLLGKD45wtOfijUNuAu0UBEAYnJ6hr64fX2o@vger.kernel.org, AJvYcCXkdrIOc125kdCac52vb+MUFmIrR4FEvk0oq5nXQEjPMWmanb/ZYBwfxbslU7CuwS/7N71cgcygDXJsrGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz08Vka8diEZNTX9Flt1e86uAhTbdIrEAo0C2k3gP+BFr1iEhTp
	fp+4a/GFeEpaULIVG7Dgc1T+JU/urS3PgD4lCtpZEa3xP7/PLTtCWlBJb2h0rWWb19kidtxHe1m
	bkS26aciDrWVielM8Uhuyyq0PjHqLYXg=
X-Google-Smtp-Source: AGHT+IGYPFecV61XbkyteZ3KbMYJTnWYcLpwrId9KrTbGw/PikbnEzIYnXGjLoYT7Hf9e+3yU0F49e2jJDEhxrmPnZU=
X-Received: by 2002:a05:6512:3350:b0:553:51db:69d4 with SMTP id
 2adb3069b0e04-55351db6b88mr170859e87.2.1748881143554; Mon, 02 Jun 2025
 09:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748335606.git.legion@kernel.org> <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARkhc40UfrmmqsqmqkCn60=7zHc=pDFGR4o=k2p7CsABA@mail.gmail.com>
 <aD1bozP0l67f_wbs@example.org> <CAK7LNAQmQtvB4PfmH4MkRM123wySON6cF6TG79fi0WER1sz4Gw@mail.gmail.com>
 <aD2vSnZhofEPilcL@example.org>
In-Reply-To: <aD2vSnZhofEPilcL@example.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Jun 2025 01:18:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNATfUzCXmCb5kKOJOKOw=CJvk7viGgYtrGLwbSAkq7VtyA@mail.gmail.com>
X-Gm-Features: AX0GCFvC8AkwemNi9HM5_Ul-zmuk0WhYExH4YAV8wbXFYLlxEH8AxRqP-u1kWcA
Message-ID: <CAK7LNATfUzCXmCb5kKOJOKOw=CJvk7viGgYtrGLwbSAkq7VtyA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 11:04=E2=80=AFPM Alexey Gladkov <legion@kernel.org> =
wrote:
>
> On Mon, Jun 02, 2025 at 07:58:41PM +0900, Masahiro Yamada wrote:
> > On Mon, Jun 2, 2025 at 5:07=E2=80=AFPM Alexey Gladkov <legion@kernel.or=
g> wrote:
> > >
> > > On Mon, Jun 02, 2025 at 04:45:36PM +0900, Masahiro Yamada wrote:
> > > > On Tue, May 27, 2025 at 6:08=E2=80=AFPM Alexey Gladkov <legion@kern=
el.org> wrote:
> > > > >
> > > > > In order to avoid symbol conflicts if they appear in the same bin=
ary, a
> > > > > more unique alias identifier can be generated.
> > > >
> > > > Why must this be unique?
> > > >
> > > > What problem would happen if the same symbol names
> > > > appear in MODULE_DEVICE_TABLE()?
> > >
> > > Before these patches this was not a problem as non-unique characters =
are
> > > in separate object files when the module is compiled separately.
> > >
> > > But when the modules are compiled into the kernel, there is a symbol
> > > conflict when linking vmlinuz. We have modules that export multiple d=
evice
> > > tables from different object files.
> >
> > This is because the __mod_device_table__* symbols are global, but
> > I suspect they do not need to be.
> >
> > Let's test this
> > https://lore.kernel.org/lkml/20250602105539.392362-1-masahiroy@kernel.o=
rg/T/#u
>
> I tested this patch with the config:
>
> make allmodconfig
> make mod2yesconfig
>
> and it works.

Good.
Then, __COUNTER__ is unnecessary.



--=20
Best Regards
Masahiro Yamada

