Return-Path: <linux-kbuild+bounces-2643-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A6893B153
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 15:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0EF1B2450F
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 13:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05665158D82;
	Wed, 24 Jul 2024 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGQnzA+n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B6F158A3F;
	Wed, 24 Jul 2024 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721826247; cv=none; b=ihCJGBvn6/T3yY8pDF1PNd992LQIbzH/v399ZOLa8aZKzHFW6cVIZ+HTW3t2YI7oaa7/1ZZZ/DEywyk1HHsjLpqYD3ZgKlM8Qy238XoXuy1963gjkrJIJuGYgu7wc/TThvexBlBNZ5GsFCTMWIySaZWlVklPMOFsGeOUoSOOevg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721826247; c=relaxed/simple;
	bh=SK+DOmLJc/ue0vsJ6423FL6tZ2bV6g4TSFvtgyXEVTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzTu8u2C5hcTSOeDyCSkC5kkqorBjWaMLUsYbK/uc8QlDFC/a0h7Ip/YZNXhjE49LLDhU15URU1UqTD4tgE0L0CgeZccg9SYxGW3fOUQpXk5lx/r0UFtB+Ku3HaB8p68xgpR6TS5gMBUuVMRgM2dhy34vslxszdpF1CuMH4h+cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGQnzA+n; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f042c15e3so866616e87.0;
        Wed, 24 Jul 2024 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721826244; x=1722431044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bljvE5p8E2fuL+G0yrs5WslWh6Pe6aAZ5VufWGqELb4=;
        b=EGQnzA+n3hFsKibPKNFVthinV+0sHNTmM0VXlt/CkoW6/uHVtx4W+6ePnrrsmvy7Fq
         Ls8Y8H0xoSMDN6fxDqaPHivzbIPS2HeyvlRlWZMzx7iy6LJI2mw/X+R5ZB7jzFU5TmpZ
         P4fNFPQxvp6v+7z+HgxE0JDWzBRI/cSuCp3xxYNiVmcS0Zfz/+bcKEUZb0yJvMwHjPFN
         21Z+0rBS3atzBTVGgG0daL78b6df1RzGjBdUZ77Ckae6rNUPUgcyTih9Jg1220xPoM9n
         c7I3qc+INximat8GMPvMwHvZVNJLMohghRhnHXgFinKLUUwsRDzcnY+Guo9+8N2FPoJP
         PGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721826244; x=1722431044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bljvE5p8E2fuL+G0yrs5WslWh6Pe6aAZ5VufWGqELb4=;
        b=agnkVmOoEKgGrJNqaHxUHeIkxaHAPVvgAsdyg5fIr9wZupJvaaLo7cZiSP4fUXZMB2
         grhZr8dxkqJRhk6v3I80dpochfABO94lnR8G3wfiU5EIfFynEiuRmrEcG0+epZXGUo46
         pF06WYHmuxcZfdOe1onaUGiZjqhTXLjAzIvLrCqyfzQmeIahAlC24ZsBGspNSO8YT+DH
         lGl89WURfiyewqNLlSO/8CqA92HTUhHKynvBcgF3+k1ZnFm3wMUnpUuXzTABD16X0kw0
         S4pifNPQ7cnD6fLz/ZGrWn1h6p+W+5cLXjKLdkIfh+F3cMQo0CMaQIPQrtf++hhnBtwV
         PUMg==
X-Forwarded-Encrypted: i=1; AJvYcCXmPWl3NMC8/SB6jEfmN9pY3hnCVpAgXhfwQtd0GZZsHVeEUWwMcPZkEjMW0gTrjzB/A24NhhOik/TIAc1orxaergmr7jbUQIF77uMe
X-Gm-Message-State: AOJu0YwH1QB6wplo4hVcjAhOevOCDg7xbDdKNbXLLTeJS3qtXl1M4T0Y
	j5TJYujkTlkJ5W6a+AHG6uwPaLbJDuoMrO4Mw1rIEP/aBdTyPyom8Ifp6pznQoLAGUccOSX6Rd8
	TKJZJP0MvS6kZ5cwcO9EslPeccMWGhH0D
X-Google-Smtp-Source: AGHT+IEd1gM87JcBCb6u1nMiH/YCYsEqLowkGyMVnKjXR75BdndTu+bG/jl/jyZBLFqiTEVV68DQexzKw8he+TOdVUA=
X-Received: by 2002:a05:6512:124d:b0:52e:fb8b:32c6 with SMTP id
 2adb3069b0e04-52fcf8b0589mr573186e87.10.1721826243858; Wed, 24 Jul 2024
 06:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724125904.15601-1-jgross@suse.com>
In-Reply-To: <20240724125904.15601-1-jgross@suse.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 24 Jul 2024 15:03:26 +0200
Message-ID: <CA+icZUW0nKvn-TPaw_81Xm6nxFM3KXbh4=VnpgHX7OhA_RCM9g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix broken "make binrpm-pkg"
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 2:59=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> Due to a typo "make binrpm-pkg" isn't working when using e.g. german
> locale. rpmbuild will tell me:
>
>   error: bad date in %changelog: Mi Jul 24 2024 Juergen Gross <jgross@sus=
e.com>
>
> Reason is that setting "LC_ALL=3DC" must not be followed by a semicolon
> in order to affect the following "date" command.
>
> Fixes: 301c10908e42 ("kbuild: rpm-pkg: introduce a simple changelog secti=
on for kernel.spec")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  scripts/package/mkspec | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index ead54d67a024..4dc1466dfc81 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -50,6 +50,6 @@ fi
>  cat << EOF
>
>  %changelog
> -* $(LC_ALL=3DC; date +'%a %b %d %Y') ${name} <${email}>
> +* $(LC_ALL=3DC date +'%a %b %d %Y') ${name} <${email}>
>  - Custom built Linux kernel.
>  EOF
> --
> 2.43.0
>
>

Fixed in kbuild.git#fixes

https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/=
log/?h=3Dfixes
https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/=
commit/?h=3Dfixes&id=3Dba6c664081afd18da86ac49cb22ceb266f89a561

-Sedat-

