Return-Path: <linux-kbuild+bounces-5654-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E573BA2BD96
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 09:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19DAD3A9BD6
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 08:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BF11A7264;
	Fri,  7 Feb 2025 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBnAA/qB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131A816088F;
	Fri,  7 Feb 2025 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915824; cv=none; b=K0i2AJgL6birCPL4ikHm2aCR5lWHJrVw4wcPZwTyrCR7MYybVEbhjvNTU3AGJGuczrkQ3IQyPXNAzytX7B9mGGK6ZiUmauwur95VTHoH32aQ/P3yS4SiOP+nbfBMZH6E/vGH2yQRgi+5b1UggN0tj/Ai6DKKGTQ9b0IL8Bl2CAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915824; c=relaxed/simple;
	bh=+2h32vCsFsCVR2UeqvdByI3SDEN4kJzFmNB19aAc2j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uy/GsRPdEINN3YPV/V/uGyurjBVhzm2ye1B9qSqDSi/AMugra3//j9bhvZLg5LdoYzx/urTiEtkYVlUwfipjVQNw6jJhXqSlodOkXPChNEipCWyU65m4gP1yEF5S+Zxl/YLDRmof5d/E4GuZulDSiqC1yVwsJkM6lQoe+vJAe1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBnAA/qB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DF5C4AF0E;
	Fri,  7 Feb 2025 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738915823;
	bh=+2h32vCsFsCVR2UeqvdByI3SDEN4kJzFmNB19aAc2j8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UBnAA/qB4Ex72toYR9gBNuCHGz3IGTvkcYb5mP4q78QGBYZf3DkuoZZzVjDxO9yPy
	 ZGxGrreCFzY7FibNRpx7P9d4jYaAQGWHOvhOpRV7ipZJIgWMgA7Pq+9xJPTgprWrzf
	 9bYw33SFKr79smex0frlseIc5glwJ+LiDrFNzHjZvAsu8rYcZLTi6BrosUnLwanii0
	 PZ9go5q5u/WAea0k5vCv/LcA7h2uD6IwAZuueopqVW+uUVTxljC0u3KnaYN3e0MWwq
	 vHO0/du9EOIRtAM8q4YCrJ0mLSd3j96SDMNvxFz7HN6kC+bb2b5aQRb3OZDfVJgQY7
	 16OBDbdxETRWQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e3778bffdso1857118e87.0;
        Fri, 07 Feb 2025 00:10:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVecrYbAhG+tINLxS81K4jJWoWyC8dUl2FjweyGooKHp8wYxh7RK50PISiRaZAmwXBKGMgfLTvRemgCjCD9@vger.kernel.org, AJvYcCW0FtPciJBNNwIdIYHp8x9ux+oxbAjloA1XFHPWhnq3hmmoZ4bYvTQdjoRZTws0hVieHa1bQX2yqb2UmGoItw==@vger.kernel.org, AJvYcCXrEYtrhCmGGIrWJKUQrZleE9TapJsv3g5D6xDFTGmAl/CZwa0aS8icHYqmgd4m5+Fq8qwTl9V7O0F3E+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgErZrG+ziMwzG6nedYxGmguiiYVExfvf/vZjIVGOYjJajjPJR
	hF0PrtgiqwbW83F1Sxd2f77jfKP3vxzAnOYhmT48okh41u0/lTwzeqhkLF1tI7EZ6Lt2riPGuef
	YiboLxkY5MHEq65dYzE4PPlz5cbg=
X-Google-Smtp-Source: AGHT+IEHGiAPFG3S4/fmLtEuoeqzMSwk+73x6T1FNxc9URebwvw4k3C9lvtOMmSvSOvBIMS+WTDnvPP/KnGfVRxBtsQ=
X-Received: by 2002:a05:6512:31d5:b0:540:1a40:ab0f with SMTP id
 2adb3069b0e04-54414aa8777mr616664e87.27.1738915821800; Fri, 07 Feb 2025
 00:10:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145946.108093528@infradead.org> <20241202150810.713959190@infradead.org>
In-Reply-To: <20241202150810.713959190@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 7 Feb 2025 17:09:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNATaf=HyCBhZu-CPCGDG6PqHDVMXJFaiygBH3s-BmZE8tA@mail.gmail.com>
X-Gm-Features: AWEUYZlhy01T_ZhUUMzhXs6P6i5eRskQitdnvDLcTUh-ZFze9KOXJhefIKSR7y0
Message-ID: <CAK7LNATaf=HyCBhZu-CPCGDG6PqHDVMXJFaiygBH3s-BmZE8tA@mail.gmail.com>
Subject: Re: [PATCH -v2 7/7] module: Provide EXPORT_SYMBOL_GPL_FOR() helper
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 12:11=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>

Commit description is needed.


[bikeshed]
Perhaps, I slightly prefer EXPORT_SYMBOL_GPL_FOR_MODULES().




>
> -#define ___EXPORT_SYMBOL(sym, license, ns)             \
> +/*
> + * LLVM intregrated assembler refuses to merge adjacent string literals =
(like

 "intregrated"  is a typo.




> + * C and GNU-as) and chokes on:
> + *
> + *   .asciz "MODULE_" "kvm" ;
> + *
> + * As would be generated when using EXPORT_SYMBOL_GPL_FOR(foo, "kvm"), u=
se
> + * varargs to assemble it like so:
> + *
> + *   .ascii "MODULE_", "kvm", "\0" ;


But, you do not need  comma separators, right?



The following less-invasive diff worked for me with LLVM=3D1.



diff --git a/include/linux/export.h b/include/linux/export.h
index a8c23d945634..546279f4d0c2 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -24,11 +24,17 @@
        .long sym
 #endif

+/*
+ * LLVM integrated assembler can merge adjacent string literals (like
+ * C and GNU-as) passed to '.ascii', but not to '.asciz' and chokes on:
+ *
+ *   .asciz "MODULE_" "kvm" ;
+ */
 #define ___EXPORT_SYMBOL(sym, license, ns)             \
        .section ".export_symbol","a"           ASM_NL  \
        __export_symbol_##sym:                  ASM_NL  \
                .asciz license                  ASM_NL  \
-               .asciz ns                       ASM_NL  \
+               .ascii ns "\0"                  ASM_NL  \
                __EXPORT_SYMBOL_REF(sym)        ASM_NL  \
        .previous

@@ -85,4 +91,6 @@
 #define EXPORT_SYMBOL_NS(sym, ns)      __EXPORT_SYMBOL(sym, "", ns)
 #define EXPORT_SYMBOL_NS_GPL(sym, ns)  __EXPORT_SYMBOL(sym, "GPL", ns)

+#define EXPORT_SYMBOL_GPL_FOR(sym, mods) __EXPORT_SYMBOL(sym, "GPL",
"MODULE_" mods)
+






--=20
Best Regards
Masahiro Yamada

