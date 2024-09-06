Return-Path: <linux-kbuild+bounces-3439-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 968C696F78A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 16:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4E851C2192B
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 14:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDE81D1F7B;
	Fri,  6 Sep 2024 14:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fX/BeLPk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B221D1F4E
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Sep 2024 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634607; cv=none; b=YGl85c/J6tIMThLtatoIeA01JbscfSHZjUqNf9LzAopygUVgt4hDN7TnW4Bm3icY/vIyDcVpWNbdzzcmJwNr5Kvz8EDpufHpWlMT4+HPsGFNDjVqbrASE/g/GPKRHtzMZF91MwTIuF9yg3nOH/jx0V/vAc51oaudqrtbXedrvO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634607; c=relaxed/simple;
	bh=Z4WKeJmpOYFiYE7cCHqfI5S+mHBFpdvOr74BGZhwPJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uRMbv92mdEz7566ovKb3XT7ee47NbnHs+cpQGcaTUwIDmacYxP/QIaBV8q9ei/eI+LQA/C06rRTP3MpHFbVpRFH2j1CGK+WVlniHnGxOm76opjET8bus/0OkzQ5x6sE3bx88tA0HEM7EGxy7hbehzX2m4VopqVnPyl9DJWbIve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fX/BeLPk; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-502ae81b4daso201242e0c.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2024 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1725634605; x=1726239405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8DQFAISHS7i5IP3gsOeV2GhBMoOIKb1H2ynRnefFiA=;
        b=fX/BeLPklJ3TmlNwwRWISchAp7HRYNqY6dXUsSIIJldZZf6s0kvTvLgXg51cmPH4b2
         N8ELqNwCwjPnNIg3sQo8R3L/eHcoEalymtblwAcqP/BWKcXfuKg+ej1UI+ZlMkGB1Wdo
         ojWpR3JLBI1Av98+L2SF3RDpiqUWIvLcjrZ7ZqEnd8Bj38uVzc1NdzjbCYa+Zr2fGHu7
         mH2XXNknaDOsliy1ZBduX4EyGVqEwiUGXky1rgaxuh0bgfXD1jExECbOjtD79qY1wW7G
         fpqvnTCQ1BeJ0VMrQW8TqZDjihtCeZQDPIejcYwhGWkGSzijfEQVYbke9a9X9B84U8Mt
         ZHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725634605; x=1726239405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8DQFAISHS7i5IP3gsOeV2GhBMoOIKb1H2ynRnefFiA=;
        b=qsDqzPYTXvrwFYHFtCm8qxhlagtA1nZArkZH1lApmZ94wlVwywQI7GpsOpqbW3wJkI
         Ct+0/Mv9FKZsv61+QlGi7rf7+1M/Qput05Rexs3/IOKiI43hlnMARpVHGQyU6lbtseE7
         6l8LzAuTtyKTB3qT+eSMmy0gk4NwSXtMtqxXa/+iaxOmkOY6M4sXq2zZwWj5UX/Yy2/T
         Bl5nG+op6XE/IkT8o5HyB3GBSAoIgIGKh1T4WbF9QNaVuPzIfsiwiZ8qHYibQqnIKJTS
         21ePRKs7LxxEiOrdtJQr8KgMakv7pOMZxQzsTm03PBuTQsNbFCjkxqX2GZ8X4AboohLN
         cExA==
X-Forwarded-Encrypted: i=1; AJvYcCXlVBSvuvu2xeSDe5u0dld6T/aT+/4Hw7hVCQmQ9072Jwf0RhKYHvWNNsB4OMzJ7EeIdVNNbtYjTqOST8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9yGxYmPzgC1PaZU0ytYHfW7Y33DPgOvjsLIqLGdrerl8H6Trm
	2gdOuMdqChyxpb2WyxY6tx3K0xZ73ZM8UaEvcJRwdJmjle4wtd7ixHzsU6SzBP5PYe/kwCPsiMe
	xucoNN9Zvqh/1EJ+QCfE9TXfU/qd3GWnjXCyL
X-Google-Smtp-Source: AGHT+IHq7ZiORKnHJ7OGW0/x1cWaLstSbHVVP69Jhc2KtxHBDUWP5W0/AltVyanWWqQY/QWC4tnW0snbDbe3WIJv/jg=
X-Received: by 2002:a05:6122:3b17:b0:501:2842:428a with SMTP id
 71dfb90a1353d-50128425272mr4021883e0c.8.1725634604866; Fri, 06 Sep 2024
 07:56:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com> <20240906-macos-build-support-v2-6-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-6-06beff418848@samsung.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Sep 2024 10:56:33 -0400
Message-ID: <CAHC9VhRpHgqN2fp1J3x9=zBqNr3QHsSDgUnoZ7M-SuOQ6hQ4nw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] selinux: do not include <linux/*.h> headers from
 host programs
To: da.gomez@samsung.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	speakup@linux-speakup.org, selinux@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Masahiro Yamada <masahiroy@kernel.org>
>
> Commit bfc5e3a6af39 ("selinux: use the kernel headers when building
> scripts/selinux") is not the right thing to do.
>
> It is clear from the warning in include/uapi/linux/types.h:
>
>   #ifndef __EXPORTED_HEADERS__
>   #warning "Attempt to use kernel headers from user space, see https://ke=
rnelnewbies.org/KernelHeaders"
>   #endif /* __EXPORTED_HEADERS__ */
>
> If you are inclined to define __EXPORTED_HEADERS__, you are likely doing
> wrong.
>
> Adding the comment:
>
>   /* NOTE: we really do want to use the kernel headers here */
>
> does not justify the hack in any way.
>
> Currently, <linux/*.h> headers are included for the following purposes:
>
>  - <linux/capability.h> is included to check CAP_LAST_CAP
>  - <linux/socket.h> in included to check PF_MAX
>
> We can skip these checks when building host programs, as they will
> be eventually tested when building the kernel space.
>
> I got rid of <linux/stddef.h> from initial_sid_to_string.h because
> it is likely that NULL is already defined. If you insist on making
> it self-contained, you can add the following:
>
>   #ifdef __KERNEL__
>   #include <linux/stddef.h>
>   #else
>   #include <stddef.h>
>   #endif
>
> scripts/selinux/mdp/mdp.c still includes <linux/kconfig.h>, which is
> also discouraged and should be fixed by a follow-up refactoring.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  scripts/selinux/genheaders/Makefile              |  4 +---
>  scripts/selinux/genheaders/genheaders.c          |  3 ---
>  scripts/selinux/mdp/Makefile                     |  2 +-
>  scripts/selinux/mdp/mdp.c                        |  4 ----
>  security/selinux/include/classmap.h              | 19 ++++++++++++------=
-
>  security/selinux/include/initial_sid_to_string.h |  2 --
>  6 files changed, 14 insertions(+), 20 deletions(-)

Similar to patch 7/8, please read my comments on your previous posting
of this patch, it doesn't appear that you've made any of the changes I
asked for in your previous posting.

https://lore.kernel.org/selinux/317c7d20ab8a72975571cb554589522b@paul-moore=
.com

--=20
paul-moore.com

