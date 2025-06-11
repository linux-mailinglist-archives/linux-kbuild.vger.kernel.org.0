Return-Path: <linux-kbuild+bounces-7457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B63AD571D
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 15:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC93D1888413
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 13:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D1028A70C;
	Wed, 11 Jun 2025 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izdWAQ9y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F14535897;
	Wed, 11 Jun 2025 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648785; cv=none; b=pDNoS2qdDDPN3bMTJp8HLL/hgWJ778RSIB6FdqrvXk4BY95GKDJPSoz8PTuE1N1cDUtqL01EeCrj18eJRnwBL0+okEp2DX1oKjzJSo/q4w/0YVlD23I7rOd4qrBE0B4YqbxdBdUB6C8ntUDbKo68HiH4xZddXbrR7D/IJROU4Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648785; c=relaxed/simple;
	bh=joeF+vcWw9jF2hVUV2wLUIYdu3wA0qlKcnITq1MB8Ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnYP8A6lz5ga0tiM+EYACq9VpMVseBu+CwwPTZlO0PNi8eXKboBLJMgY5AraS4kGfBJgoTOcjMxm7leRmsHHcSoRE7yJ8cQC5/NLseYgtTsX+IP6deNtEgVQWmgms7qlSIqkBdjyFmU3BWAetxEfLWOKTkg79n26u/biNzI1ZDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izdWAQ9y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0996DC4CEF0;
	Wed, 11 Jun 2025 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648785;
	bh=joeF+vcWw9jF2hVUV2wLUIYdu3wA0qlKcnITq1MB8Ng=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=izdWAQ9yIMMRAb8osi6/jac08Tcx8sCXgwCZvX4vZoN3SbZZdt0B40+r+hvncRUAk
	 dAy+VTSEh8uSGAShYdZUW0htisB0HAj9mjs43tlVgj9TVvf3Ydyp+oCwx248mGFXOI
	 l+6im02n+Cyiz6/3ZIK5ff7HQPZwjtr0eGmXQXItkddBT/AMIgeiAv5OsGuAo9s3DL
	 9v0C58abDmdDvFJE8r2GUX+SgK9b7FN9l4G6ns/XpQ1FW7K/J+ysDg3Dne5A/6AAvf
	 0RM+TbyilD8bXCZNjkDud1DJo6ASBggonSicmTvUlTFJaNpAlnhMYIX1JFhG3ObuGr
	 jreZDT3VBwqDw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55351af2fc6so8030513e87.0;
        Wed, 11 Jun 2025 06:33:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVU1D6+/8TiRWiqZCN220tvnIrHKxH27ckErJxa8q45TXIQM8GLDV+F4v7yaZkjlDGp/amG3bqb+Zun3r8=@vger.kernel.org, AJvYcCWp7/m//vc+Mqo6Q8QfHzBE+Nl5hDHBaNg8xxhKVihYl/Kwn8b0SF4azdli7KEXPsieRviHOB6u58fpnU9g@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqw8j40xCsARjIRfoGsrJDNFhgH+0ZoGEooFG2ICr+O4YboS/W
	cfL7pF8F/uAWU9FaDKn/6D+gHsJz1FN0nCPpyt4YtwJR/mW/f5pD3sOh/F8MpNToiy/g8hMz2lV
	Tb+98KrRF6QhY0KWqN/bq0xMPOqkfyzc=
X-Google-Smtp-Source: AGHT+IFNVUN7XuIjpfYPJwgta4Gjv8qv2eyOJbAM/h6iUR3e1inIgTF4rSFilLfAOPCrklG0evUg7R4g3PK9YR6GrL8=
X-Received: by 2002:a05:6512:3e22:b0:553:20f2:2e77 with SMTP id
 2adb3069b0e04-5539d55dc4cmr801852e87.55.1749648783718; Wed, 11 Jun 2025
 06:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
 <20250611075533.8102A57-hca@linux.ibm.com>
In-Reply-To: <20250611075533.8102A57-hca@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Jun 2025 22:32:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNASSeuZWAXS6tDGL1T8S1N9fmg4DND616BL6uco4gnYFqA@mail.gmail.com>
X-Gm-Features: AX0GCFv0jbbR-vbqIHzHbknTnj-UPv7EfuyqK0wlyWTgl-XQejmGq6KCE6rdppc
Message-ID: <CAK7LNASSeuZWAXS6tDGL1T8S1N9fmg4DND616BL6uco4gnYFqA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 4:55=E2=80=AFPM Heiko Carstens <hca@linux.ibm.com> =
wrote:
>
> On Sun, Jun 08, 2025 at 01:41:18AM +0900, Masahiro Yamada wrote:
> > Kbuild updates for v6.16
> >
> >  - Add support for the EXPORT_SYMBOL_GPL_FOR_MODULES() macro, which exp=
orts a
> >    symbol only to specified modules
> >
> >  - Improve ABI handling in gendwarfksyms
> >
> >  - Forcibly link lib-y objects to vmlinux even if CONFIG_MODULES=3Dn
> >
> >  - Add checkers for redundant or missing <linux/export.h> inclusion
>
> As you write in commit a934a57a42f6 ("scripts/misc-check: check missing
> #include <linux/export.h> when W=3D1") this adds now 4000+ extra warnings
> for W=3D1 builds, which makes such builds more or less useless for me.
>
> Also the commit only describes what you want to achieve, but not why.
> I can only guess that you want to reduce header dependencies(?).

Yes.

Here, more numbers.
There are around 32000 *.c files in the tree, but only about 6000 of them
actually export symbols.
However, most of them end up including <linux/export.h>,
even though only 20% of them truly need it.

Header dependency cleanup is necessary.
Many a little makes a mickle.

> Don't get me wrong, I can address all of this trivial churn for s390, how=
ever
> enforcing so many extra warnings to everyone with W=3D1 builds doesn't lo=
ok like
> the right approach to me.

This is what W=3D1 is for.
0day bot detects a new W=3D1 warning, so we can avoid new warnings coming i=
n.

People do not know which headers should be included when.
So, this warning must exist at least until we can get rid of
#include <linux/export.h> from include/linux/module.h,
include/linux/linkage.h etc.


--=20
Best Regards
Masahiro Yamada

