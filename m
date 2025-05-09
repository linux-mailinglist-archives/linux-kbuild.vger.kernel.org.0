Return-Path: <linux-kbuild+bounces-7056-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 904E6AB1444
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 15:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F358817BE4F
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 13:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF3C290DBC;
	Fri,  9 May 2025 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="da4ZvDNg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F37290BA8;
	Fri,  9 May 2025 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746795789; cv=none; b=GhyUwmd6VlJp6+IOw6qvC06182LaHNGZ/OWAvGCqwAC4Kb3WOH2lRInCPL7g5tQ3dmZVBucIhfOv7xehDmb6Cq11sdF2PER42C2Sbsg2/pRSPeUaVWCAqFA4AhCyJVE9MAKim72sUL2wbwAJRLqB9VpliuRa/H+t5IvLfH1lzEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746795789; c=relaxed/simple;
	bh=bKgelLxq/7nrfD41fXbBHePtUVzoCjeOB0T7WldjoS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1Q8RSe7VRgHvJAGFk22aezZuIey0JknukKWO6vbn6VWF9uKW4n7rbnIwWjLRftrPxIuoDr66W2KiFE+j85DLAbEeYQWNSy9euYb478+CC3a0ZqBaFGFfcdnA3c2QFnZZ4or3+W1hA7MR7TugA/lNacFMNokvTXJ0noCqZD7Nlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=da4ZvDNg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B5BC4CEEB;
	Fri,  9 May 2025 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746795788;
	bh=bKgelLxq/7nrfD41fXbBHePtUVzoCjeOB0T7WldjoS0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=da4ZvDNgtE4+81R+2hxFT6KODec4oEWexfj81sf4c5yYlrQaYwld0fCvjhRPfWJYF
	 6J5hbHHvsVRBFn0QOa4RwAXpz5s09ojZ43dqBfbIeiFJdlieQSJGV078sNK3nuwUdk
	 jyRmePzo3u47SZQSnE9q0H0Y/oM9LC0UBT3unt0V6eNcbanwBEJ61BmyuJcwI7+ziw
	 W8k8L1GyxCryMuVfqtTyujrqhqbR297u8L80jvJQomVTkaVhRgA4WkYof69OIsYnEO
	 H5c9yiGqDbs2/oYwYoI0xmxVzt0en4lzciecMgogtJ1XYYea3G0b3iRw0EE2aHC1j7
	 RbhqGFcZBsjIA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so2393117e87.1;
        Fri, 09 May 2025 06:03:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4JFjXbnR83+tYEkInoW6pCElvTp2TE4J29NiiLbhieXTQeyrC77jGA3iwpKiOwMyjOnkEw/jd@vger.kernel.org, AJvYcCVbKMQPN4tg/3CDiqWpCtJbtPoQyh3m0qwQJzk+JOT2FrhoK4J38xKipCGCvUdbJWyGpGQCaqgdprWBid5H@vger.kernel.org, AJvYcCW2Cmgb19eT9x8k9rlHUn2j9Wqh/I0Kp1etydlhoxpq1MayRdRNgHjUjqh6AV5cl7ZiVgRZ6TGi0+T3fFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOZowT8joz2Zrl8f8P/9JPw19kfFLCZpqQHV73sIJhb4GO3Eng
	fUo4vlritowSIbGnrSWwh33qO/Wl9Meh1H9zocdW6C8laULYt4g2NXbIunlztY4U6/mSseVvUpJ
	s1pnKyjyPL+1XD4kRAWNARwN9FFI=
X-Google-Smtp-Source: AGHT+IHgwmcTdWzbJkicLmyo6Ig8U8cctsH/HIvxTUJXIvVZWi0h82pM4lmTtOSJr3otkasVRGoLcB59CPKSG2PJ35Q=
X-Received: by 2002:a2e:be9c:0:b0:30b:b7c3:ea71 with SMTP id
 38308e7fff4ca-326c45da855mr11813311fa.15.1746795787504; Fri, 09 May 2025
 06:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org> <20250501-default-const-init-clang-v1-1-3d2c6c185dbb@kernel.org>
In-Reply-To: <20250501-default-const-init-clang-v1-1-3d2c6c185dbb@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 9 May 2025 22:02:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNASDpr49SWKwWdqD5sStEM+aSK0ofLd2Cp14KuPpt1Pt_Q@mail.gmail.com>
X-Gm-Features: ATxdqUF8-28UH2nNPk_uf0bw8J8vAbCvvAHBzOQbkRpvkQvxvG1PFsipHw2lFL4
Message-ID: <CAK7LNASDpr49SWKwWdqD5sStEM+aSK0ofLd2Cp14KuPpt1Pt_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Disable -Wdefault-const-init-field-unsafe
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Marcus Seyfarth <m.seyfarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 8:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> A new on by default warning in clang [1] flags several places within the
> kernel where a const member of an aggregate type appears to be
> uninitialized:
>
>   include/linux/list.h:409:27: warning: default initialization of an obje=
ct of type 'union (unnamed union at include/linux/list.h:409:27)' with cons=
t member leaves the object uninitialized and is incompatible with C++ [-Wde=
fault-const-init-field-unsafe]
>     409 |         struct list_head *next =3D smp_load_acquire(&head->next=
);
>         |                                  ^
>   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_lo=
ad_acquire'
>     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
>         |                             ^
>   arch/arm64/include/asm/barrier.h:164:59: note: expanded from macro '__s=
mp_load_acquire'
>     164 |         union { __unqual_scalar_typeof(*p) __val; char __c[1]; =
} __u;   \
>         |                                                                =
  ^
>   include/linux/list.h:409:27: note: member '__val' declared 'const' here
>
>   crypto/scatterwalk.c:66:22: error: default initialization of an object =
of type 'struct scatter_walk' with const member leaves the object uninitial=
ized and is incompatible with C++ [-Werror,-Wdefault-const-init-field-unsaf=
e]
>      66 |         struct scatter_walk walk;
>         |                             ^
>   include/crypto/algapi.h:112:15: note: member 'addr' declared 'const' he=
re
>     112 |                 void *const addr;
>         |                             ^
>
>   fs/hugetlbfs/inode.c:733:24: error: default initialization of an object=
 of type 'struct vm_area_struct' with const member leaves the object uninit=
ialized and is incompatible with C++ [-Werror,-Wdefault-const-init-field-un=
safe]
>     733 |         struct vm_area_struct pseudo_vma;
>         |                               ^
>   include/linux/mm_types.h:803:20: note: member 'vm_flags' declared 'cons=
t' here
>     803 |                 const vm_flags_t vm_flags;
>         |                                  ^
>
> In all audited cases, the members are either not used in the particular
> call path, modified through other means such as memset() / memcpy()
> because the containing object is not const, or are within a union with
> other non-const members. Since these are technically false positives,
> the warning was split out from its main group [2] to allow the kernel to
> disable it while keeping the variable aspect of the warning enabled.
>
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/commit/576161cb6069e2c7656a8ef=
530727a0f4aefff30 [1]
> Link: https://github.com/llvm/llvm-project/commit/00f9ef282c7482754a0fea4=
97417604d1deca9fa [2]
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/CA+G9fYuNjKcxFKS_MKPRuga32XbndkLGcY-PVuoS=
wzv6VWbY=3Dw@mail.gmail.com/
> Reported-by: Marcus Seyfarth <m.seyfarth@gmail.com>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2088
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---


Applied to linux-kbuild.
Thanks.

>  scripts/Makefile.extrawarn | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index d88acdf4085524b672c69fb75148ee87c30f88d8..b4d8265e587082687bc1d3de3=
fcc70e4a3f4f50d 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -37,6 +37,13 @@ KBUILD_CFLAGS +=3D -Wno-gnu
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D111219
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, format-overflow-non-kprint=
f)
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, format-truncation-non-kpri=
ntf)
> +
> +# clang emits a warning when a const member of an aggregate type is not
> +# initialized but there are several places in the kernel where this is
> +# intentional because the field is never used within a particular call p=
ath,
> +# the field is within a union with other non-const members, or the conta=
ining
> +# object is not const so the field can be modified via memcpy() / memset=
().
> +KBUILD_CFLAGS +=3D $(call cc-disable-warning, default-const-init-field-u=
nsafe)
>  else
>
>  # gcc inanely warns about local variables called 'main'
>
> --
> 2.49.0
>


--=20
Best Regards
Masahiro Yamada

