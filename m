Return-Path: <linux-kbuild+bounces-5661-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B3CA2C90E
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 17:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB301650C1
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 16:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D09818DB09;
	Fri,  7 Feb 2025 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFqaNwJx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5AC23C8DE;
	Fri,  7 Feb 2025 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946372; cv=none; b=DsozGRsGT/oIORsuO/YTr7Pr+LeL9w2Wsk9ioDSZZxLiWYH1XjhH5W1XlvWYoaNVk5UE/svmOVx6h0SKzFXOa7N/sUrwtXDZPNillWjawFuG6Oh7pkUaPFrOCs890qaBKuzQxbnZOqVTG635AT4wx+FlNULYrpDBal61Rypr7Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946372; c=relaxed/simple;
	bh=C93Ar0OUMhlatbU/xgJriXUtaoW/woq7HZZVVyCc3Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ig6sT6UcJPGuXv9irEYAEzsNmJE148pvi281Ty5QKVZmh+uL7mr9mMmmaTcNrgbz+ENsTJP+XCpD3RRSsa5m273/uypzwCzyC1kGPkp8DClvtt83+gKnY6tyMRvkPOWM3u+aQPmj5+oANCpO/WfVdJMO0/uNpa4YbBnwXQZO7sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFqaNwJx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF961C4CEDF;
	Fri,  7 Feb 2025 16:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738946371;
	bh=C93Ar0OUMhlatbU/xgJriXUtaoW/woq7HZZVVyCc3Ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fFqaNwJxZrRRETkx1vIb0oePN93Fk/uDBq1Qe9ugWsOXIcQr1zu2g2ssN8sxxkm+x
	 AP2XR9T4GHtWSn04bBkMomJx7Qe3GtEXoLgY2qmQYm+AZf3LL+cT4X8sE6o8NqjwZA
	 +6Za0zvk5zYThrDycUTCMBZGQW5QSijfvcCSxr2626c3x2NlYNUhjrKdWBRk3JE+Lh
	 ZqrKm3GoOVuwGOmNbGU7gVnRR4K52GoDPxWF3LcmYHKpplXdVWxmtGRjdbHbH6s6NL
	 R4iM3Cxq/PcUUgDBtb8+5AfNaHXsrwNKg/gpYULsx6JqbAYFq6Iqgfe6eTceHOGn+O
	 IfVkfTKlQMLsw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5439a6179a7so2442445e87.1;
        Fri, 07 Feb 2025 08:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVy6upZjYj288KGszBGYFH+Bbd+NvgzS2SWdrrS4zHPmgDxjOhkGD0bqv5XrrVmt5U4IqiLDf6GxWUWu060@vger.kernel.org, AJvYcCW6EvosZzS9zN0POYa6oogixqw/DnzrLdBzA57YUfJWr6NGP6D8LjI2itqhb4dVmZgBFQrr524e87p38Aj5EA==@vger.kernel.org, AJvYcCWF8ZB9wvguHWqqS3rJmTXha8aWZOemSGPSzBITXniu2Cvyx0k2U+sVnF/Bvax8F2WLoag9VNJeCh2o33Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykezs9f0HKw9i36a7DIcCQ7+Z6mNDaZGZqeVQKZDCjd8Nz+K3q
	peuAoyoibXJu/fmzy8jh5UAgtIPkiAG8x+UoCbPl4Gyvfs1LuEY6zXAhsmWd1mDz6GiUdi3vqzg
	i2kUHZi2XJsP1s6dKaDeGmMVTN0o=
X-Google-Smtp-Source: AGHT+IEJA0eBAzMswdnQXgXUE3WHYC1kVYv4aGKd+lz0n8pzxs4VJcx1cIbCfL243+Z+SQrtSRjOaMLX3kKvJBHoZJI=
X-Received: by 2002:a05:6512:3484:b0:542:91a5:4df with SMTP id
 2adb3069b0e04-54414a7f94cmr880865e87.5.1738946370614; Fri, 07 Feb 2025
 08:39:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145946.108093528@infradead.org> <20241202150810.160972089@infradead.org>
In-Reply-To: <20241202150810.160972089@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Feb 2025 01:38:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyuJSgm2gb36saoeyOJmFSMuT_qmz+HrsdQuiC4WF8Rg@mail.gmail.com>
X-Gm-Features: AWEUYZluhka-8FcjcuL9y4PYkm8KRFSSAGbQPIL9MESBGPp5HRihV4V9n4Kmmak
Message-ID: <CAK7LNAQyuJSgm2gb36saoeyOJmFSMuT_qmz+HrsdQuiC4WF8Rg@mail.gmail.com>
Subject: Re: [PATCH -v2 2/7] module/modpost: Use for() loop
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The commit subject prefix should be "modpost: "
instead of "module/modpost: "

You are touching only modpost in this patch.


On Tue, Dec 3, 2024 at 12:11=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  scripts/mod/modpost.c |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
--
Best Regards
Masahiro Yamada

