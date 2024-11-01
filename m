Return-Path: <linux-kbuild+bounces-4458-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C57589B9641
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Nov 2024 18:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F68CB236A4
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Nov 2024 17:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F329F1AA781;
	Fri,  1 Nov 2024 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSoVk5ke"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05491CB522;
	Fri,  1 Nov 2024 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480833; cv=none; b=LZzgwRQPNacTakJe+rODpDHqgohGVtSteosC7U+O1hE3+2cASyf2jCVSYVnhLx70gC1+JRLwcxH/8bRlD97drA84zy8zm6tiU4EO4HRZrHr8zBmRkR1hAFzPaCAH6OvDpRzooWsJpefg+Z8kC1yuejYh7WyGL8vSpEKVaz9KnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480833; c=relaxed/simple;
	bh=c5RjBwy2/ZzeI+8sZXGbT9Lmc3XaBafqJICctDClA1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8EWWp10bzGJbGgZ1lErK50mOCtDv1DWcJWDFpu28MoIYIDdsWr/al5AixKLOpA9qzXg+8u/NWN0+KWAr5M7Hbz3LOt5cr7deFZM8PrgqVfwhsVYlzi7ddczv8M4cRqNT4W9neg2WmvjEG7H8aH5M3ze70nPptsqLWxTBFD2els=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSoVk5ke; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E88FC4CED4;
	Fri,  1 Nov 2024 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730480833;
	bh=c5RjBwy2/ZzeI+8sZXGbT9Lmc3XaBafqJICctDClA1g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KSoVk5keCxHYDKCDMWSwiaUi4dgINhDwkEWXyeSLrdPNOQDoWfVmDMP9eTtBGu+AQ
	 qwzw4qISgTn9i+8uPrDriaLRKdXFmCUQLh42AV9GRVyBfD7f6Uj80a/LzadFgfkmPo
	 DPfbpn3TiTM8iXj40jsKBHmF7xZtfeT0fX0szPJkdOcrqQvHTHuKFuggYAJGRApuYl
	 CWdNXk72o+E27leTgcL75oWHXYlvVOvH6IMLMh8ddW1ONbl+6r8gZKjTdZ2qW3JlgK
	 cnCiT1BDEV4N+wIGRIgYwfpTzr1yFZs6pw1F9gcJP2/xhWiSu4xTiK0w+P+E8Ohcg9
	 3nFi3K7LD34xA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb599aac99so19759071fa.1;
        Fri, 01 Nov 2024 10:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6D7otq1VD/dywtV9xX3timsmHsPOzgs9B0YFnUhD3sJ1ug5JxYCNW2PNfWp+ysFhK9XZtUAOZblKRpCbhaQ==@vger.kernel.org, AJvYcCWklnGaQrXcVRHOhobeOcNKP8svY8CoyAGTz+WlIXfGrPqztbC6ydnp9+93H6uwavYPi6dhVPOapubC7biy@vger.kernel.org, AJvYcCWxt4SZlgD3gsc3aZFRAfL6+zSTS77wQscBHSp9FY3Bxz8bh/G5aRjL5LV5v+ML3J8g+pwcUj+5zwQarHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUTKXW+o7LhsbhaI3xJXppi8hUY2aF4jKX6PaWCOiybyVLK94a
	msi0greK8FCx02KwVkUy6XWNhnIayBdb+JEvs5Fb972CRDU/I7x4iRtOz+62ntOTem6Uf8gqtYb
	VozlRSwPubCKK+xjbzz7vULXvmK8=
X-Google-Smtp-Source: AGHT+IFJbh21nMSzyY4LWjpg0FdN+aePTm30Mv5jKneXaJdXqfTHzQKTcqfGebToofjtSkYpersALiQEO8xVZwNcn3c=
X-Received: by 2002:a05:651c:b13:b0:2fc:9622:794b with SMTP id
 38308e7fff4ca-2fedb7ce02emr24063391fa.24.1730480832183; Fri, 01 Nov 2024
 10:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-remove-export-report-pl-v2-1-f289ab92bd2e@google.com> <ZyMIDieFsLC-MiA0@bombadil.infradead.org>
In-Reply-To: <ZyMIDieFsLC-MiA0@bombadil.infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 Nov 2024 18:06:32 +0100
X-Gmail-Original-Message-ID: <CAK7LNAT8n_YMOR_+wn5R3n3+RHiLuONtiJnD7Qy-9_oueCc5UA@mail.gmail.com>
Message-ID: <CAK7LNAT8n_YMOR_+wn5R3n3+RHiLuONtiJnD7Qy-9_oueCc5UA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Remove export_report.pl
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 2:55=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org>=
 wrote:
>
> On Wed, Oct 30, 2024 at 05:16:34PM +0000, Matthew Maurer wrote:
> > This script has been broken for 5 years with no user complaints.
> >
> > It first had its .mod.c parser broken in commit a3d0cb04f7df ("modpost:
> > use __section in the output to *.mod.c"). Later, it had its object file
> > enumeration broken in commit f65a486821cf ("kbuild: change module.order
> > to list *.o instead of *.ko"). Both of these changes sat for years with
> > no reports.
> >
> > Rather than reviving this script as we make further changes to `.mod.c`=
,
> > this patch gets rid of it because it is clearly unused.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> Thanks! Applied and pushed!
>
>   Luis

Acked-by: Masahiro Yamada <masahiroy@kernel.org>


--=20
Best Regards
Masahiro Yamada

