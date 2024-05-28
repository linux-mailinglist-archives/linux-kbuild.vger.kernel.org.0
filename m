Return-Path: <linux-kbuild+bounces-1941-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6838D1C15
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 15:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 869431C23342
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 13:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4FA16F0E0;
	Tue, 28 May 2024 13:01:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A5F16D306;
	Tue, 28 May 2024 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901280; cv=none; b=HSzAoNU+TgTB2/SU5ZODJjs4GKnO9M/hrWImidXutQT62YKImjKEWR44avDe/orKgpM1SJ/UcQ3kwaBomRgLLUQgFMtjoEDjshZxbQAR3Iwx2qVligW/B/trKS6eNvHUjxQSAbQ6WbIU9OBOvxlxD4yujcYCudAjK1Q7ZKTaJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901280; c=relaxed/simple;
	bh=hLlgA6EbxtYz87mU4dCUKIO9tvggBl1Ci1zWFw44hyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gfq6rJzVtoOZTBJAT0hP/FKsTYVAa2yImPlCpmcvh5ltZDq0EI2mI+WaD0RNZDF3banXt6rKCzDp9nEnoYNv2lrmBcNj5Kn1Jqe4t3QPyDC+1wavUyjvv7c9GFlP/NCqGlfXe9+dom+/g134mIxlMmOJwWqi5mejqHlNV0LNg2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df771983aedso810099276.1;
        Tue, 28 May 2024 06:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716901276; x=1717506076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ca4QTPgVjg9hVugmet1g3QkdknEZA/c9v89K+9HMSV8=;
        b=UD1NQBJ11PT5kJHJ87R8jyBP806XaVTVOqHrYGOGjob+SFoaY+DS8NnnanT0MyoWt9
         cZ6sEq+0jGA2CaOB7FqIzjP6hs3J/51l1VwYPpLoFBssFKSFYT5wG9GCved9Ivz9ZUNh
         ndlXh5Nd5Tx5zeOsSCuRvCQU3bpokFayGx1XKvG0DVH5CNhlkl1fBnbR6MkItY8m8e//
         I+I0X7ihPDMRoFUg7i8CYgdF+bjtmvgj4wNgnTN8nVSXkR+rslXjxF4NfOzQIg8rJPR1
         rbnEghCQovbyypv+/vDgb0QJYbsDkPom9tUbcAj4nOWssHLrYhsmFXlqJqtLdiKcVBu2
         sW2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDtxaTMi3VwUgD0KL4L5l7DfoaZb5EQeRWg6BgaiN42oxFisVcZ4MlotXStDMgVy+hz+Zn2CoFoAbMDYvQaGbeCCGvWtNU8uMHdvT8juAx/wA+danlnB7zBlFKEeuhCIEkViaVWAJ3Xi7f
X-Gm-Message-State: AOJu0YxkGdpzHisIo7vTIcZCJAo5LKAb1ljuG6d9D8DkUSkPfgAno0Zp
	s6/XH668kzL4HKw0y7W0PfJUCUYo81b0sSU9DgcmWVVaAVKcUvfjKcxae4mn
X-Google-Smtp-Source: AGHT+IEB6kQXqyx3C0KiyHkOhyYCtlRHPqvU7nahgt0PT2gHdClS724hajEl+Jid49JSmJM6ZRhd0w==
X-Received: by 2002:a25:ae1e:0:b0:df4:df14:61bc with SMTP id 3f1490d57ef6-df7721b7236mr12812647276.29.1716901274732;
        Tue, 28 May 2024 06:01:14 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df7746accedsm1010360276.32.2024.05.28.06.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 06:01:14 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-df771983aedso810005276.1;
        Tue, 28 May 2024 06:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrXXsxvXziASXN4Q7cUuMyEWpBkqPW9zZ/pfNN/bmw5qirnvyxvhk07qDsXYsRHA8OyfwV17WaV/oDyVeVv+qffmN+Bk+naAUWMouBmgSdCHUAaQNJqmhP8DHpvhR2SN5wLeErNX9pgZ0P
X-Received: by 2002:a25:dfc2:0:b0:df4:e882:2808 with SMTP id
 3f1490d57ef6-df77225d6eemr11466590276.56.1716901273306; Tue, 28 May 2024
 06:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415122037.1983124-1-arnd@kernel.org> <20240415122037.1983124-4-arnd@kernel.org>
In-Reply-To: <20240415122037.1983124-4-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 May 2024 15:01:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXy2aH6nsZZr2qpqi83S=6_bXEk+qk3RKcDzOcvU13Z1A@mail.gmail.com>
Message-ID: <CAMuHMdXy2aH6nsZZr2qpqi83S=6_bXEk+qk3RKcDzOcvU13Z1A@mail.gmail.com>
Subject: Re: [PATCH 3/6] [v3] kbuild: turn on -Wrestrict by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, Apr 15, 2024 at 2:22=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All known -Wrestrict warnings are addressed now, so don't disable the war=
ning
> any more.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch, which is now commit 06bb7fc0feee32d9 ("kbuild:
turn on -Wrestrict by default") in v6.10-rc1.

With shmobile_defconfig and gcc version 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.0=
4):

    kernel/kallsyms.c: In function =E2=80=98__sprint_symbol.constprop=E2=80=
=99:
    kernel/kallsyms.c:492:17: warning: =E2=80=98strcpy=E2=80=99 source argu=
ment is the
same as destination [-Werror=3Drestrict]
      492 |                 strcpy(buffer, name);
          |                 ^~~~~~~~~~~~~~~~~~~~

Reverting the commit fixes the issue.

I assume you just forgot that this depends on "[PATCH] [v5] kallsyms:
rework symbol lookup return codes"?
https://lore.kernel.org/r/20240404143424.3279752-1-arnd@kernel.org

> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -98,7 +98,6 @@ else
>  # Suppress them by using -Wno... except for W=3D1.
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-but-set-variable)
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-const-variable)
> -KBUILD_CFLAGS +=3D $(call cc-disable-warning, restrict)
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, packed-not-aligned)
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, format-overflow)
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, format-truncation)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

