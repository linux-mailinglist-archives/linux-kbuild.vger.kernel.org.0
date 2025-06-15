Return-Path: <linux-kbuild+bounces-7505-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B364ADA284
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jun 2025 18:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4C983ACFE5
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jun 2025 16:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE172620CD;
	Sun, 15 Jun 2025 16:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoWDrZu7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B8225D21B;
	Sun, 15 Jun 2025 16:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750003556; cv=none; b=AerH1buQ9p+2D6Xno/aIiDQ/cV7eWrDLGwR7S8NQHADbh9IdL+mWSAN0NEiw2zoN5KrBdaRrnTAKgKlk22C6smP+4SC+Anl+9a5eYAEmE6YyrCiF9qimE1RBVH3io0Ph+Zkdl9nmS9M9Fr0/YS5vrw/rfDfl4kYBxYL5T2aqQk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750003556; c=relaxed/simple;
	bh=hIcuuDvH+Jr4kAJ6lZLxhIvss8G5Fqgq7Izx26pkU94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nc+cMvF9yaxrA5Qzt0qYNpoQvmVZ2IuJFaXrs8hfzj27u+d1B+TxW/Z8yseR0eNA2oN5bjDTJ5olgYvoEsWgOhSjnobmYnwf7uYXFFXMZHiqHMNM/iMaEg3oK5/GI/D9KgJX5Xh8H+AVLr1yUicQNALlKksuCB0FDs6pNqywhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoWDrZu7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2C7C4CEE3;
	Sun, 15 Jun 2025 16:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750003556;
	bh=hIcuuDvH+Jr4kAJ6lZLxhIvss8G5Fqgq7Izx26pkU94=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UoWDrZu7tDkd8lgRkzn3YZL0pK/RL4RLkV1i5IEgQR9az+E5nSVJSaKMZbHd+ui1M
	 nLU62CkfU8xsb+FMnMgAo1lwffgl3EQbwWpa0yLoCgsoc/X/HvKLfrxS8FN1tEf92y
	 F3+OGwVo4GEs7lZxFEcvTYLAP3HvH4HP8RjGkCAlS9mRk/4DGtkQNjUk6Vw9ipQn3v
	 HPiRmg2o3iSoQ6YOYRAYP4TrWeoiImmc38+qmVKtMWRkJFyhvpIlGDy/It5Z8ZWX4z
	 FKSzyWiU4rDVB2gTp0/xiYjp4YqpTcHrG2nrpwg6dkRE3R9Q4+z+gjAJQf8D88l7ol
	 1c2fgqss8dSUg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5532a30ac45so3533910e87.0;
        Sun, 15 Jun 2025 09:05:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXW8s4yEpcKHBKJC7M1qBLwQy9RtBnK9ZBPw3LhlbGb9aek91lMYO5HUxIoaiq7NqFIVTABAiw5Fj6i2Rc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn95F7lGNZwQzA3YnkU+mBzwQbOMSF3ejn6E5cADCAL8psswCC
	iIg9XneY9X4vu3ARElngNefL4/NYqrtj9qp4I9vXgg38qVkp4g6qfdcNB4Z6JtHVxLupds87Cp4
	tC37T0z9YgSAbd3XvxQwhty+G2d7pOv0=
X-Google-Smtp-Source: AGHT+IHgJmyvz8vrRovPOjdpG6jG+rYLwACW5/FY7WujYQWwDfcaazvdU4vQFEHyyrX70A7cuAsVge5apCuSz45GI8o=
X-Received: by 2002:a05:6512:15a0:b0:553:23fe:fbeb with SMTP id
 2adb3069b0e04-553b67fffc7mr1427763e87.3.1750003554780; Sun, 15 Jun 2025
 09:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABGL3xcfdhDVt27MJCNs-2EhAnQ5EHm_W7RhE81YKhaq+j76=g@mail.gmail.com>
In-Reply-To: <CABGL3xcfdhDVt27MJCNs-2EhAnQ5EHm_W7RhE81YKhaq+j76=g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 16 Jun 2025 01:05:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYnS26EEuHobFRSXE8JMGmD-xKAbebJKf_H+zi6d8K3w@mail.gmail.com>
X-Gm-Features: AX0GCFsTK4lh1tJzxvb88DzfL5-etjFZk7JJfPCX9VtbU8EcuJFZjiY13pd-rIA
Message-ID: <CAK7LNASYnS26EEuHobFRSXE8JMGmD-xKAbebJKf_H+zi6d8K3w@mail.gmail.com>
Subject: Re: kconfig: include <strings.h> to fix bcmp build error on Clang
To: Z-Script Zs <zscript.team.zs@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 10:59=E2=80=AFPM Z-Script Zs <zscript.team.zs@gmail=
.com> wrote:
>
> Hi,
>
> This patch fixes a build error caused by missing <strings.h> when compili=
ng
> with Clang in strict ISO C environments such as Termux or Android.
>
> The function 'bcmp' is used in scripts/kconfig/confdata.c, but without
> including <strings.h>, the build fails under strict C99 rules due to an
> implicit declaration.
>
> I'm 12 years old and just starting to learn Linux kernel development.
> This is my first patch submission. I'd be very grateful for any feedback =
or corrections.
>
> Thank you for your time and for maintaining this incredible project.

Congratulations for your first patch submission, but
I prefer replacing bcmp() with memcmp() because
"man bcmp" recommends doing so:


SYNOPSIS
       #include <strings.h>

       [[deprecated]] int bcmp(const void s1[.n], const void s2[.n], size_t=
 n);

DESCRIPTION
       bcmp() is identical to memcmp(3); use the latter instead.



The patch already exists:
https://lore.kernel.org/linux-kbuild/rxsikukdh39.fsf@localhost.mail-host-ad=
dress-is-not-set/


When I communicated last time, I did not get v2 somehow.

I will apply that, updating the commit description myself.

Thanks.





--
Best Regards
Masahiro Yamada

