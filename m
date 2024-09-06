Return-Path: <linux-kbuild+bounces-3442-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D696F81A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 17:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 459C41F21B67
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 15:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A9A1D27B3;
	Fri,  6 Sep 2024 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osppqcWR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3701D04B6;
	Fri,  6 Sep 2024 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635992; cv=none; b=hqX3/lHvnSqHr5+e0cf2dy3t9vcZEO/J99OVcO8cFBjxfCkofMC/y3Exky1WOGparI41qh05AVkkDTANxAPTbvdH7gJ2kE7APZ1oXEhfYK6sNzqA8SoJVcr2O7KARQKUDDtUPNIjT532oFm5yWtVC4ox7EzvIe7xsNR/J/AStmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635992; c=relaxed/simple;
	bh=JyacMJD70gR0U5F0uVaLkrOHMWLDezzMTuRGb7oMANk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eu9uXv0iWu+TSv3VBkMTjR9agSfCIDvBXBhApQwVRwV/AY3bBKf7NX6kb+xD+tTj08GteVbjT2qlMrZv3HrtOwdzOXo3UCKRV26CbQsejObh815MKTPuliLqMy+79GMbDznAYNrLITBmYMQIsufxHCKZQESzN/wucxlUCqJCHWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osppqcWR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3624C4CEC6;
	Fri,  6 Sep 2024 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725635991;
	bh=JyacMJD70gR0U5F0uVaLkrOHMWLDezzMTuRGb7oMANk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=osppqcWR2HkbAzfiVFpY50YGS3TLv3PLzd8LgNNZsFN3LYqnOqY3ldPqlrjiNYJ+d
	 JI3tREKRWXf3RtxmLqnrpF3kBj9p2+rW0iNul0aHr8Zhx+eaa9k5JbK0H/M5PCL4/P
	 QWbYqwI/bYbeV81xiURp8qwd9LPctUeVj4S2+bU7ZFI315BXz4sP/QOxtuK21f+YHu
	 vCVFJSRYTE3q44qOxydkHmnJS9ke6gHuDa4AZUNokWAKJSEmoFQr51/IusexBAulcu
	 zwjSa027gTmm+LnPcUdugMrzMEhJOO/rhDkK5zYcBBtxm0GtqORGkKHq+pQwzuTpHk
	 yxu6oU0iidvsg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f7529203ddso8178291fa.0;
        Fri, 06 Sep 2024 08:19:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMh9n388QU75f11kK4Fxm1xPie2x/JK58ZciGkmiPR3pFofyVBprgXSt8g4h1F7FbU7MkhjkEolA==@vger.kernel.org, AJvYcCUfE7muvUFVLh4u/Uv/XX7/rHH0xZp9WYo8C325NSx6HSIh6JKPTibbxLD9qt+57HcJfez6TiUSt4dg+/sv@vger.kernel.org, AJvYcCX4GuFfSWAtShF/2ZIoeEpPgiBB/y/mJZ4wTYzrsDpipaaXZ2ZjeMLT5KknUbXT+ugv9wLJxO3ee/5dgiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT9SKqDYgelqxnWzFqT+qI8iUl1/DgT/xoaLD8xRK+Nr2MPwB8
	9QvC0luGlT/YARsdfW9eaHjvtuchRk6nnYb8vRxYaSgDyU7CpJza9yFuAe4fJCkaf22mcw4sQrn
	d4xbr6M7CTDAAtR0EbtefEmaKV50=
X-Google-Smtp-Source: AGHT+IHkLbSBiZW38wTZaaWM08grre0I0Datokcan677tEHxnny0JbuWOd2fR1NTCJwojYf19Go6ayQJETR9UzWIhi0=
X-Received: by 2002:a05:6512:3b10:b0:535:639d:e3e0 with SMTP id
 2adb3069b0e04-53657fdd284mr1037095e87.24.1725635990440; Fri, 06 Sep 2024
 08:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809122007.1220219-3-masahiroy@kernel.org> <3447459d08dd7ebb58972129cddf1c44@paul-moore.com>
In-Reply-To: <3447459d08dd7ebb58972129cddf1c44@paul-moore.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Sep 2024 00:19:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS4Q1_4T2vafu6wTYsmFsY1h+TA8irqDAqwfoSyw7X=Rw@mail.gmail.com>
Message-ID: <CAK7LNAS4Q1_4T2vafu6wTYsmFsY1h+TA8irqDAqwfoSyw7X=Rw@mail.gmail.com>
Subject: Re: [PATCH 2/2] selinux: move genheaders to security/selinux/
To: Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 6:22=E2=80=AFAM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Aug  9, 2024 Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > This tool is only used in security/selinux/Makefile.
> >
> > There is no reason to keep it under scripts/.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  scripts/remove-stale-files                                 | 3 +++
> >  scripts/selinux/Makefile                                   | 2 +-
> >  scripts/selinux/genheaders/.gitignore                      | 2 --
> >  scripts/selinux/genheaders/Makefile                        | 3 ---
> >  security/selinux/.gitignore                                | 1 +
> >  security/selinux/Makefile                                  | 7 +++++--
> >  .../selinux/genheaders =3D> security/selinux}/genheaders.c   | 0
> >  7 files changed, 10 insertions(+), 8 deletions(-)
> >  delete mode 100644 scripts/selinux/genheaders/.gitignore
> >  delete mode 100644 scripts/selinux/genheaders/Makefile
> >  rename {scripts/selinux/genheaders =3D> security/selinux}/genheaders.c=
 (100%)
>
> As long as there is no harm in keeping genheaders under scripts/selinux,
> and based on your cover letter it would appear that there is no problem
> with the current location, I would prefer to keep it where it currently
> lives.


'make clean' is meant to clean up the tree, but keep
build artifacts necessary for building external modules.


See the help message:


  clean           - Remove most generated files but keep the config and
                    enough build support to build external modules




'make clean' does not clean up under scripts/
because tools located scripts/ are used in tree-wide
and often used for external modules as well.

So, scripts/selinux/genheaders/genheaders is left over.


genheaders is locally used in security/selinux/.

'make clean' will properly clean up security/selinux/genheaders.




--=20
Best Regards
Masahiro Yamada

