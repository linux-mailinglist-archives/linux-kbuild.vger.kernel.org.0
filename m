Return-Path: <linux-kbuild+bounces-7574-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 115B2AE0B21
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 18:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D05D21BC63A0
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 16:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83ADE28B7F1;
	Thu, 19 Jun 2025 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puFSD/AL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5259121578D;
	Thu, 19 Jun 2025 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750349647; cv=none; b=qN8QmPKfVCeTbLoEe6a2EDUjCarbFqkbqRpSvh/oI1k/GZR9+Z66a2ezAXQo8CzB8PpHxfOc2NVXxGbnew8XEVBA2UizjQEF8nQQEkBVmtTuGLU+LiOHMXO3Jw00dgADQrkPSI/shF8wx0VQw3LJen7QelCsUvVzCPXuKR5uoZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750349647; c=relaxed/simple;
	bh=HTvFnmaXCYwrKHM23il5brwULJ+UpicHtMWvO0KQg+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvbXfeG5Ocu7jGEgm1SWL1/O97Vxnx3dTASYR3+Ncv8KeP3wNLVXjDbQGOqRfi2lua5UDz6SC+oAcXwtfItA5Q540Ac2KlL9zgpOXxzDwsldmtHkPwAxtcOnBae78lteQsO12n2ROFDJaiJp+vkcASwYBPIuZVkNNqdXGjiQ1l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puFSD/AL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C65C4CEEA;
	Thu, 19 Jun 2025 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750349646;
	bh=HTvFnmaXCYwrKHM23il5brwULJ+UpicHtMWvO0KQg+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=puFSD/ALCE3hpZjah+/BpCvdfQ0O2vfCFgGFTyLR48FRl2qIikIFe8AUCWw0Tymxr
	 /NXjzu+ngUxgft5UkoJgoqickBKg/vBFtIYxnbXTdM6hGo/0PezzxvMIiE99zp+9Uf
	 rVA4Y1GH+1bR5tBTQPsQnB2dHxPCgKHj/2juNcrnxCqIDmPfHgUKHiASto4IjnSfA0
	 zBv61VKC+xhSqwcu/3Z9hOOWdMZ3KoCbCvKexw9fZCw4jcjY/jAyMG6xsS5ZijpY7Y
	 XWrPmm1g9pLSpYApfORzWPIV2LPCqRBtURm/XUlQxJTLsN6D1ocKSp6k0jkhnt+/Pc
	 J3V8IDtIM2CCA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad88d77314bso184437266b.1;
        Thu, 19 Jun 2025 09:14:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJQyT9SSe2I9qokNCMDrA90Xr8bSA8JBAg2TyXM3K3Jk1cBFztycLtQS52OMCrIgbJzwE6a/mLnqa2@vger.kernel.org, AJvYcCUsQECDxeKE6t3QRvYEAb6S/XZwOTUT561Oyp010h4leArcvUENfWy+vAWNsf0WjOm8+fIiE61SD/v2BTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YygghOxgU0zaIr7oHCNPkbxMbDFcZMHp9U6pOd8B/+5s8sQiThj
	g5flllBJyP72jrqQ5ClQ69Skle3JROXZcNczeUdMUpdQHHlWbboysjfvMRzS6b9HSpQjoG9ObKL
	RrOAROJ+46cxi9L/XfG1OJZsXmD3pEI0=
X-Google-Smtp-Source: AGHT+IFR+DhoQCsJjaArKXcuQq2xOX6WDVElVlXvqNMOtsWtkqowVf/lZYfBlxQB+3yVtCXvQHvuIbIhKkYuxeCpyH8=
X-Received: by 2002:a17:906:6a1a:b0:add:f191:d851 with SMTP id
 a640c23a62f3a-adfad53b7camr2010003666b.32.1750349645633; Thu, 19 Jun 2025
 09:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601133230.4085512-1-masahiroy@kernel.org>
 <20250601133230.4085512-3-masahiroy@kernel.org> <20250619090100.39e37c5a@kernel.org>
In-Reply-To: <20250619090100.39e37c5a@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Jun 2025 01:13:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJdVRcUCKo2zEfJr_0Dc-1fzkjf01OsDpDQLH2+wZHCg@mail.gmail.com>
X-Gm-Features: Ac12FXwskyzVZs4j6AFEBz7Jylg6Zgty7W7DYv3x8YsGyQg_ZqW8jQvPmqFq0vU
Message-ID: <CAK7LNARJdVRcUCKo2zEfJr_0Dc-1fzkjf01OsDpDQLH2+wZHCg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] scripts/misc-check: check missing #include
 <linux/export.h> when W=1
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 1:01=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun,  1 Jun 2025 22:31:29 +0900 Masahiro Yamada wrote:
> > The problem was described in commit 5b20755b7780 ("init: move THIS_MODU=
LE
> > from <linux/export.h> to <linux/init.h>").
> >
> > To summarize it again here: <linux/export.h> is included by most C file=
s,
> > even though only some of them actually export symbols. This is because
> > some headers, such as include/linux/{module.h,linkage}, needlessly
> > include <linux/export.h>.
> >
> > I have added a more detailed explanation in the comments of
> > scripts/misc-check.
> >
> > This problem will be fixed in two steps:
> >
> >  1. Add #include <linux/export.h> to C files that use EXPORT_SYMBOL()
> >  2. Remove #include <linux/export.h> from header files that do not use
> >     EXPORT_SYMBOL()
> >
> > This commit addresses step 1; scripts/misc-check will warn about *.[ch]
> > files that use EXPORT_SYMBOL() but do not include <linux/export.h>.
> > This check is only triggered when the kernel is built with W=3D1.
> >
> > We need to fix 4000+ files. I hope others will help with this effort.
>
> IIUC you made the kernel spew nearly 5000 warnings on every W=3D1 build
> to "encourage" others to help fix a fairly innocuous problem.
> I appreciate the work that goes into separating the headers but it's
> hardly urgent enough to force others to scroll thru 5k warnings.
>
> Please LMK if I'm missing some context here, otherwise I think this is
> quite antisocial behavior, and the warnings should go back to W=3D2 until
> someone actually cares to fix most of them.
>
> Happy to hear from others.. CC: workflows


Please see commit a6a7946bd691940cfe7289ae6dfb1f077516df72


--=20
Best Regards
Masahiro Yamada

