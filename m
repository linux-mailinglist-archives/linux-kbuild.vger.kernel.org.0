Return-Path: <linux-kbuild+bounces-6156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A55A2A628D5
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 09:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92E7219C10FF
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 08:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6608519067C;
	Sat, 15 Mar 2025 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GK4uQr7N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F8F151985;
	Sat, 15 Mar 2025 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742026610; cv=none; b=aLwlsyy3U+k9W7zp/wMxUL9uSaur7z7fAR+iUjuF9blZoVAW5xo+bItTq9LzRZu2bXyQJat784ubFMdPYwyB5a2MmY5HhbREgv0bbvG04ucJoyStIA8y/zhASyZBTvXYiQekCzca32itu0M2TaE8l8mWdDNfeatAfE+xmkHnpJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742026610; c=relaxed/simple;
	bh=ao9vo4fQE7iQ/RB94t5y5WpjNEYCbfcag69ThiZSo/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVlPKVhKvVPxIv/VWmwR0o89Hbd+xLE0mUzzCG2cj3LTHbsJZYjRQFh9SdPMS9cw6f81AONAgb63cB3z1Y1ikyGwUTLRDMpf5n3ItdF4+kv/GklXOP1feosXhMerFy9Wqae6b8rZUUM4g5dleVTTQmUqs7bz+Vh//ddjmpXxaPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GK4uQr7N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09431C4CEEF;
	Sat, 15 Mar 2025 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742026610;
	bh=ao9vo4fQE7iQ/RB94t5y5WpjNEYCbfcag69ThiZSo/Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GK4uQr7NE2dXp1cPe9xeM/8BFdRpQ0aM97NZNWIHESwpRA4mvRQxgaAzWMMNg3xUv
	 4EGj+ykxzQ5ziTpb9JPFJdeq4wygloGd2mKgCVjJpsx9zfD/T3B2B9NVSsXpQ6PZxQ
	 FFXLvoVkSq7pqbZ4Ds6zq759lyz7kDvXaoZQIKwd9+mh/8GHvKjTBROu8JyF1sL2te
	 fmY0uLlQRCM7xKqPLn9JnIO9dSFyiqNcxfvnYYO2R2gLnJft1CsNNC0B7zNUYHDiXv
	 GwDqK1EdDIIgkmH8LhMsAuU53SN/U5nyPeAEcI7YZZuaDoQBHEEbU4WwpVzz3ixrkS
	 KFQdOHp5uwCng==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-548430564d9so3181953e87.2;
        Sat, 15 Mar 2025 01:16:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrNeHY+BdWgSVA8fl6nFP1jSdK5JxjXHfrJqbZSMuHZvm+GRdj7CbG6C+W3LF/A23KOLlJ0zkan+4eRXAY@vger.kernel.org, AJvYcCV7gI2xNxqYhdJpFVVj0mqddTB8s9FN7d3u+76FCP7Opqb7ACs5MVUz7y9lJtWVJeNl9L32VK4pyydbcZtD@vger.kernel.org, AJvYcCXUVC72U4jn+2XUNYzQyJVSQ5OYGix8e4Bpjb2BkBy7S9Abigbhk48pyavxViObCA1AY6vy6F7lVkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YziSGcYS8avkJbvAr6NZCxG0Mmb6pfBgKog3efiSAcxC9jYLEue
	1Ot749Jgm/8YJxulXQjZnlq4t2jW3s9gnj0iM4vJMViKt6JgkGlwouvFiMQcM3JlZlAQmB/l4mh
	nQ/hv+Hi0L7+FCLbxOFaTwOYCEiw=
X-Google-Smtp-Source: AGHT+IHIndr6Dyb3hyscyHlKnk8YEPp58mbPzWv4WjZye6PuFg/ESGQpIhTLkL/wAJhAs2i2aGPE/sNYkOTX6VjWfFY=
X-Received: by 2002:a05:6512:b0e:b0:545:3032:bc50 with SMTP id
 2adb3069b0e04-549c38fb8f3mr2268349e87.19.1742026608701; Sat, 15 Mar 2025
 01:16:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net> <20250313-kbuild-prefix-map-v1-4-38cea8448c5f@weissschuh.net>
In-Reply-To: <20250313-kbuild-prefix-map-v1-4-38cea8448c5f@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Mar 2025 17:16:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNATuGr39YSsr0e6pB6wD7shyZVL12GMuE3HaWfXFXuRd4w@mail.gmail.com>
X-Gm-Features: AQ5f1JrnLaJP5BG8QA-d4kU3Clc92zZ6RsCEQUQtW5xV0-qljmvI43IFJy4vOdw
Message-ID: <CAK7LNATuGr39YSsr0e6pB6wD7shyZVL12GMuE3HaWfXFXuRd4w@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86/boot/compressed: Switch to -ffile-prefix-map
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi X86 maintainers,

Is it OK to pick up this to kbuild tree?
Ack is appreciated.


On Fri, Mar 14, 2025 at 12:59=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> -ffile-prefix-map is a more general variant of the currently used
> -fmacro-prefix-map. It is also what the top-level Makefile is using now.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  arch/x86/boot/compressed/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed=
/Makefile
> index 606c74f274593ebaf6200b7d307a453e2c6e872e..73a67366cb706658f9680cd50=
864a68546d3dc98 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -38,7 +38,7 @@ KBUILD_CFLAGS +=3D -fno-stack-protector
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, address-of-packed-member)
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, gnu)
>  KBUILD_CFLAGS +=3D -Wno-pointer-sign
> -KBUILD_CFLAGS +=3D $(call cc-option,-fmacro-prefix-map=3D$(srctree)/=3D)
> +KBUILD_CFLAGS +=3D $(call cc-option,-ffile-prefix-map=3D$(srctree)/=3D)
>  KBUILD_CFLAGS +=3D -fno-asynchronous-unwind-tables
>  KBUILD_CFLAGS +=3D -D__DISABLE_EXPORTS
>  # Disable relocation relaxation in case the link is not PIE.
>
> --
> 2.48.1
>


--=20
Best Regards
Masahiro Yamada

