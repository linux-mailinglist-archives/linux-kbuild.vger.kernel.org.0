Return-Path: <linux-kbuild+bounces-2825-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B519488E1
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 07:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 146D61C221CF
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 05:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C96B14901F;
	Tue,  6 Aug 2024 05:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYoPdNvn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A281C32;
	Tue,  6 Aug 2024 05:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722921709; cv=none; b=eU59g6WVzkNWLhX1PdVUi1VQRvKFYJZEhJqryit2DEwtlwK71hp12mA5tbxhvd6BwnpYopCcy5W9SKWItdgj1/1KVqrsq/sslu072Eu10ppsqaj5JjzwMX4XiobGmWm94eDdXCN734F2vFubmG9cqUYPuTZytKFiic/WjeZgwHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722921709; c=relaxed/simple;
	bh=gdvgR0M7GuaF+jIyMakKqoNnx8xRdznY78SgP9B1AkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5Ga5o7G9XJtjxyniLWZfwE0molnak7FNV8GsYWj3dTYI6/3zzNvo0VMzapKbUszb0cEtzqcBUZHdjS/3Pvp/WwR4Lk6t9QFOqUhnGEErJJVFO8HMgRiyhCHdbaVpHLLkkweJm4Kr3SYmG3iqaXtVLJjilZB+1ctwHSWLQSzQcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYoPdNvn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4C6C4AF0F;
	Tue,  6 Aug 2024 05:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722921709;
	bh=gdvgR0M7GuaF+jIyMakKqoNnx8xRdznY78SgP9B1AkE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YYoPdNvn1go9D9PtBxs9z46ZdcVOdHXIEkZffbfRGaT8bKOTjG4pHTiXwUAmRfRTQ
	 D/6DG107OpbbCqxWIa9r+5sE+xehvqEHkE+viQSlwqaNQYYAMQ6FOYn1RiIoLyL3b4
	 8E5A1iqnaCwQ868Bm9pIeMbzPqO+poHuo69uS4j8e4UzyIynv5+GQwo9kfSS4WciAf
	 DzWeKonQR/j5ecJ5Dxa/9NFN8fazu2BN0XXClLGd7GP6Q7/Q4CR9G2R6S1NLmerE1L
	 82VP+XYO6TQYprSk9LNQdvdvZcny4wf4xbwp8AykadMmQLoIH1XNIqmiXFIhIxg0SK
	 q8qVH6BZsX2+w==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efdf02d13so322918e87.2;
        Mon, 05 Aug 2024 22:21:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbAr0sfJnX+RhHATzWIqDWVZ0E6nq30ptS6YMzzlrI1o7MHTauzoHTK3C4yPcuYhVU5IoBxN7jlQ02wX5nlTTmd5jdYiiok5m3Jvr0
X-Gm-Message-State: AOJu0YwAwZQJwNz3daIJFFym6w3LNPYh6HJ9+7+ov5sr96UKhzu+YndU
	qCTnO9McN5puJ116tjBARzPDw3QEGUMLCe4J2JN41C+mFQKNxXuCpoq8KdArUkoNWWvvzPXRtnB
	2fgS/4iWbe+dBcCFjoCFrcuJ5I2U=
X-Google-Smtp-Source: AGHT+IGlwTXR026+z3PL1PdmiGdQDWh/rndlCBXxaWjyHBZUnzdAxOGOBmn54jLSJYDrfFLarnpwjn4Hq7VCOaVfa0c=
X-Received: by 2002:a05:6512:104b:b0:52e:932d:88ab with SMTP id
 2adb3069b0e04-530bb38c968mr12151755e87.23.1722921708112; Mon, 05 Aug 2024
 22:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805090901.53986-1-gprocida@google.com> <CAGvU0Hnm5V1EpY+TfWqq5XHVJUSSxa=wHCZ+yVNb9+Ln=7mbkw@mail.gmail.com>
In-Reply-To: <CAGvU0Hnm5V1EpY+TfWqq5XHVJUSSxa=wHCZ+yVNb9+Ln=7mbkw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 Aug 2024 14:21:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6PFm1rnir0jRAdxeGRe3Zu5U9_f9andqL7vHKcBenWw@mail.gmail.com>
Message-ID: <CAK7LNAQ6PFm1rnir0jRAdxeGRe3Zu5U9_f9andqL7vHKcBenWw@mail.gmail.com>
Subject: Re: [PATCH REPOST] lib/build_OID_registry: do not embed full $0
To: Giuliano Procida <gprocida@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	kernel-team@android.com, elsk@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 6:13=E2=80=AFPM Giuliano Procida <gprocida@google.co=
m> wrote:
>
> Please ignore this. I see other people have already posted different
> fixes achieving much the same goal.
>
> Though my change was much simpler!


True.

There were suggestions to replace this with a fixed string:


https://lore.kernel.org/linux-kbuild/CAK7LNASa-KedA_CTww6unckAGkJCQTctdbk0d=
-MUsN7wQpM=3DkQ@mail.gmail.com/
https://lore.kernel.org/linux-kbuild/ZfP1xdcYlUawm3uV@bergen.fjasle.eu/



A needlessly complex patch was applied, unfortunately.










>
> On Mon, 5 Aug 2024 at 10:09, Giuliano Procida <gprocida@google.com> wrote=
:
> >
> > Using $0 makes the output of this file sensitive to the Linux build
> > directory path. This is problematic for reproducible builds as it can
> > affect vmlinux's .debug_lines' section and vmlinux's build ID.
> >
> > Signed-off-by: Giuliano Procida <gprocida@google.com>
> > ---
> >  lib/build_OID_registry | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/build_OID_registry b/lib/build_OID_registry
> > index d7fc32ea8ac2..06f242202036 100755
> > --- a/lib/build_OID_registry
> > +++ b/lib/build_OID_registry
> > @@ -35,7 +35,7 @@ close IN_FILE || die;
> >  #
> >  open C_FILE, ">$ARGV[1]" or die;
> >  print C_FILE "/*\n";
> > -print C_FILE " * Automatically generated by ", $0, ".  Do not edit\n";
> > +print C_FILE " * Automatically generated by build_OID_registry.  Do no=
t edit\n";
> >  print C_FILE " */\n";
> >




--
Best Regards
Masahiro Yamada

