Return-Path: <linux-kbuild+bounces-2334-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 133489263D0
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 16:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1DCE284933
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 14:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D00172BCE;
	Wed,  3 Jul 2024 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcFbI+Z6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821417B41F;
	Wed,  3 Jul 2024 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720018218; cv=none; b=eIa5nIRbp7Csc5cUgudD30T/tLHpGt8zOuPfdB8gGfqVphwvNCBIxsEWmzybDqZxI0TWQazJy+A5k9VipURizHF0+06r+Xc1F16QQyjgb0dzxlKrCLV57TT7ktPo1tgtKqBFVh/NIhr31dn43/ZxCmPNhrbXus4mfePeYSvCX2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720018218; c=relaxed/simple;
	bh=DiZJ0dILrXy2O013iz+bCGWZocmbBOMiap6sH6MRS2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTIZh9dk76LAtLvl8/S69NO+57+40ywGbG523BDEdPLwdyVdDqxFYG+xUdENgUBaFyMkK2JFFF6neBz5flLTdFtTkf/N/s3cfL2Qt2vXXGMJXiC+OpcLGMsQcCY5hA4fGnDZOuetLLNisfcTQQYNje8xKdNLjPN8pOZZNCuduYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcFbI+Z6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEAFC4AF07;
	Wed,  3 Jul 2024 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720018218;
	bh=DiZJ0dILrXy2O013iz+bCGWZocmbBOMiap6sH6MRS2s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jcFbI+Z6lRD3WEZSda4ofZtQCQaCdDIk96edMJ+s6TxX/U4DfAJtrLLzHna3j79OG
	 tPpjAXpi3Nd+aO3IJKBFW7Q4u+QH2J8UjKAP/kTgwS7rFTEilIjoqsdTzuKkr42LZN
	 2JpI0ojfYh1w52bIW1na6U5VAEZ46Uv1yFcGNqLw+Qmv0WUE1/teG4Cn9C/IX2qYID
	 /FWRd+Njfy+VNi+TsKvmkcf/evGUmFJ/rFFPWNEWYXQsFiX+qdWIxO/s7h/wse3o+6
	 RNlbfv7klYn46Lz6nWgKk8zozcKxXIWNzTTYuI7MZ88aSXTpA/AhOs18U3bnB3zade
	 tYPpEAcm+S+jw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec52fbb50cso53622321fa.2;
        Wed, 03 Jul 2024 07:50:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu0D/1X6NwdgiXAcNy4sH5ebURn/yhnatzJiRrEWWVhAVr+nr8nKyeUtR/r+ceLHDnDo6r3rx/cTt+BEJyviJavzRTDQz1Id3HsdbxYjbJrUF7fKrJvR82+3JgvzaIIrqu+khpFMKptB20
X-Gm-Message-State: AOJu0Ywnuldx695UttZHFwzv15I0F9O12m6ZDKlANhEULMwSRKDEx91a
	7OIZDpPI4GTYzYSmlcpCA3MmX5GDjee2rpa/7KW0xNRh5OtdNDeXI93yBoXALvGlL26VS3ofr2h
	LVkZHnEIjo4O1STpJ7gz5tLcj8kU=
X-Google-Smtp-Source: AGHT+IEIWx0ohubc/gEMbIlq7uaD+5IUVCdvsx24gzXDTf+BCAo6XWw/fWojD8I4j0YT/KHy8zlrPKTeoiWu61pmhgs=
X-Received: by 2002:a2e:bcc5:0:b0:2ee:7b7d:66ed with SMTP id
 38308e7fff4ca-2ee7b7d68cdmr29931121fa.10.1720018216931; Wed, 03 Jul 2024
 07:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702234008.19101-1-richard.weiyang@gmail.com>
 <20240702234008.19101-2-richard.weiyang@gmail.com> <20240702185230.9ff500bf6a89db888207f8f1@linux-foundation.org>
In-Reply-To: <20240702185230.9ff500bf6a89db888207f8f1@linux-foundation.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 3 Jul 2024 23:49:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS+TgSo6CCrvKQ=n8=pFPDTJ3wq2chq1-p9KgSSv=N9Ww@mail.gmail.com>
Message-ID: <CAK7LNAS+TgSo6CCrvKQ=n8=pFPDTJ3wq2chq1-p9KgSSv=N9Ww@mail.gmail.com>
Subject: Re: [PATCH 2/3] modpost: .meminit.* is not in init section when
 CONFIG_MEMORY_HOTPLUG set
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 10:52=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue,  2 Jul 2024 23:40:07 +0000 Wei Yang <richard.weiyang@gmail.com> w=
rote:
>
> > .meminit.* is not put into init section when CONFIG_MEMORY_HOTPLUG is
> > set, since we define MEM_KEEP()/MEM_DISCARD() according to
> > CONFIG_MEMORY_HOTPLUG.
>
> Please describe how this changes modpost behaviour.
>
> Something like: "we're currently not checking for references into
> meminit and meminitdata when CONFIG_HOTPLUG=3Dy, which may cause us to
> fail to notice incorrect references.".  But I don't think that's
> correct.  So what *is* wrong with the current code?
>


Sigh.

If you do not understand, you should not apply it.

I am surprised that there exists a person who
attempted to apply this.



--=20
Best Regards
Masahiro Yamada

