Return-Path: <linux-kbuild+bounces-5340-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417EA00BD2
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 17:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89CC41884CAA
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 16:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9741B532F;
	Fri,  3 Jan 2025 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGFm8why"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F531A8F9A;
	Fri,  3 Jan 2025 16:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735920266; cv=none; b=hFuqHNgWEahMm0SnXkNFMhBI/3Y1fEPUDnpBusSjZw8seMCCrt/cS6N26Pbfwko+cHjIQRRKnuY7LbAoPjeb0VQDS09f7AHS4esiamqKx6bbvpY4XlvvvD/9IS90SX6b+T3Q0RHnM+iR3FVuTPzPTD90hbU7xUNCzCgZXPxqx7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735920266; c=relaxed/simple;
	bh=j6NVA6F2GO4p2ka/ReBD2niFkhktzSehRJZnbmCGtQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4jeormoo+ygKwdANh76hWtEWtcDqLtaFBPwSCege1sTUU4yMBSscTp8dMRWb/9UP8NJ1UHPzJNUFCnP7Pav7lrITh//cKY9s3b6qNJcCAUSs6KJ6xEMLjYQgC2ORu8IXUlPagyd0PQ0mKPW9RAy0by4LzNv0Lszr4Vb33dVfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGFm8why; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C98C4CEDC;
	Fri,  3 Jan 2025 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735920265;
	bh=j6NVA6F2GO4p2ka/ReBD2niFkhktzSehRJZnbmCGtQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nGFm8whyWLJGGw/Gk2chFtICHWwhKRaDCepD7gnnJV1GyUII4EitRsbBYKXddm3kH
	 1OQIs1TpmICzP5E6L6c4FxCnTR4SMazi2MwvV+q5hUH1mzVeifNuhNOajVUT3/sayj
	 6PQcUtGsCokJpt7IBe7lrzqiSXIkx0eaOgJEx87zaK5SNGeaZEs7xM0ytKfSlrwIKI
	 jjCP8UddtQHIbsBAGyVWsyO5yvWOnrIfaxB3AKnH6WY8ChvlvxQ1x56U2MLgpXimze
	 5elwTYMY0sKRLFmN1E68NuMjs7ZCA/wEkYQGhpFoC0Wgq1qH1QQaN8ylAxEwZcqdXC
	 laMwDBlisczQA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-540215984f0so13087222e87.1;
        Fri, 03 Jan 2025 08:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWR2HSYd78jRwHDmLr5LTGsT/w1Z4gWRhLLBlu+XklN2RPPTOBQ/4xWoghDd9P0CJpLuNOgw9O7aFmmKm0=@vger.kernel.org, AJvYcCXYTgqlhSVu9sgpvkDWejZTOwi5P9gPOmhbEN9x0WUOZ3oW6l5TbK2cIEbnFZo/FirAlaLSOBYa3+eZ50qaxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyleCDTAg4ncCLqH3CLMyzhJpl1z7ggNE+rE3LsylQE/gmDGEsm
	Y/foUoEJvrgPacWYJFOTGetLkbhUPU6lLnLa+8zvOmyNZh/mrBzxv+++lhvZCQbRbJzrd0vDsai
	cAKyW9oGj4miCPQgiCwBQ0uBeE2E=
X-Google-Smtp-Source: AGHT+IGpkeoWEdio4uvBiKMfJB/GOyzc0DIrd25EPkP7aIXpSPZa/om70FdRA60SzWv18Oin0hQQeDcwaPDpb0hvg5g=
X-Received: by 2002:a05:6512:3b26:b0:540:3566:5b37 with SMTP id
 2adb3069b0e04-542295aa1cdmr15412985e87.57.1735920264048; Fri, 03 Jan 2025
 08:04:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228154603.2234284-1-masahiroy@kernel.org>
 <20241228154603.2234284-2-masahiroy@kernel.org> <f9b9795a-ab0c-49b6-92a1-b887f923279b@suse.com>
In-Reply-To: <f9b9795a-ab0c-49b6-92a1-b887f923279b@suse.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 4 Jan 2025 01:03:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQqvkRL7BDKW=tCxFatU01t268adsu5VXW1ZRWBQnCq4w@mail.gmail.com>
Message-ID: <CAK7LNAQqvkRL7BDKW=tCxFatU01t268adsu5VXW1ZRWBQnCq4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] module: get symbol crc back to unsigned
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2024 at 11:02=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> On 12/28/24 16:45, Masahiro Yamada wrote:
> > Commit 71810db27c1c ("modversions: treat symbol CRCs as 32 bit
> > quantities") changed the CRC fields to s32 because the __kcrctab and
> > __kcrctab_gpl sections contained relative references to the actual
> > CRC values stored in the .rodata section when CONFIG_MODULE_REL_CRCS=3D=
y.
> >
> > Commit 7b4537199a4a ("kbuild: link symbol CRCs at final link, removing
> > CONFIG_MODULE_REL_CRCS") removed this complexity. Now, the __kcrctab
> > and __kcrctab_gpl sections directly contain the CRC values in all cases=
.
> >
> > The genksyms tool outputs unsigned 32-bit CRC values, so u32 is preferr=
ed
> > over s32.
> >
> > No functional changes are intended.
> >
> > Regardless of this change, the CRC value is assigned to the u32 variabl=
e,
> > 'crcval' before the comparison, as seen in kernel/module/version.c:
> >
> >     crcval =3D *crc;
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
>
> I understand the plan is for this to go through the kbuild tree with the
> rest of the extended modversions + Rust support.


Yes.

Now applied to linux-kbuild.


--=20
Best Regards
Masahiro Yamada

