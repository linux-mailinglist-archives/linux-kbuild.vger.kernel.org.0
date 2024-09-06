Return-Path: <linux-kbuild+bounces-3446-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F31D96F871
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 17:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35DAC1F26222
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 15:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9911D31B5;
	Fri,  6 Sep 2024 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+uGcia6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B4D1D2F56;
	Fri,  6 Sep 2024 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725637076; cv=none; b=Cq6SD0R953ADxRkQMT1ErgEsyQvAhWEjpSnHtlYCsrRrD3TE9Jr3KGjAI9y/2M8cuLIh8pkYwH2VSQOYw3rFQF3G9NHqB6WhXy+FZqIO7hV5wRKslG7pPCY3EOAUMy7qktiJeOaqiA5+ZteaJ32JsV6UVWe6H7KXmHnWu/dY74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725637076; c=relaxed/simple;
	bh=2UKmaZtNLMhEviH6IeYoUF4i0dN1ltzq9GMvMgOlDQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWYQ1JS4LchuQmfMcL3IqDEZPRV2ohnVQ0cRXtWRwtBgBUJn2RfKF8cvzcAo7a5s+OxOsoJWaWtfhYYI00YhvWXFXFTfBi2nEjF2GZIxlytYYt/j0fU1WQnnn/050ba6g+6GVDmC+2EPtEC4mMzNr5xxtfeZ7V6+P3WNuBLKw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+uGcia6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925CDC4CED4;
	Fri,  6 Sep 2024 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725637075;
	bh=2UKmaZtNLMhEviH6IeYoUF4i0dN1ltzq9GMvMgOlDQg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D+uGcia6C1rMFfGtzuNOkJuofRcalbpLcwqkWo4QCWmBvbKYPJGA/uSDWpwZjBbmB
	 njLZLd39uJ74CDwwpHnOywo+j9w6RfLW9osPDFdwmgM58Feg3ncW7nfU9kwamY+IMy
	 99Py1s10IMSqqtK6gyrueYStEJqVfklEmVG7fAAmOMmjp7xtwGpS2Qy70uF4wbani/
	 Arp55SZxjIHtg+pC2RSd0gh/dunKUeUaGhb0g6r6jx92vIQXhc9rNmXyDaGmHGxnxH
	 mMaAlC4PbOxH77iNGW7Pvshd1MvQ6r6pNMr6RuFr1dAs5SjdWnfJTeb/GI6MK/vsYd
	 QhGUIsjQ5VrGw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53655b9bbcdso1852613e87.2;
        Fri, 06 Sep 2024 08:37:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSdi9+yg8oR640MaKMr+L8OjTtt3gb/kInOUi0Rxl6FzRBBkSVRe/mY8v4IKNoVyhcJvnU1+SnPQVroMUA@vger.kernel.org, AJvYcCXWd8z8NBM41qGnn03OcrFOklYLb+tzGygMOltocrj7XBlqDmlahSzg8lGF4NhO4gjUIXGcCy/RPoNkvb0M@vger.kernel.org, AJvYcCXl/7Eb9KYLFA7B+CwzWbkQk6K+R+VJJtuov7a74KmsOhk51m7gu2EaqGvDYV/cfg5wQgMiTDOozDYeTK0=@vger.kernel.org, AJvYcCXlgBr5dL1OBk09iikjAdYJhP3L5S74vcfDsxbIZPNuiyylvbeP/EfqgY1lmWnr7C3gnFqBCwTiWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQW+e8da1cF6ObKVBSeTCB1vwarB+mKQbTjN6FXTrR0HEHDj5
	huMhHQc8sJ/w4olbd3HzSja7mzdUrNAERBeubxcFvOqTexOTRIc1k//ETlZb58DeX44SEigaVkE
	+iqPu+JlglWkfkJt3wZDcej+OaTo=
X-Google-Smtp-Source: AGHT+IFANMBQ3/Jcqmb4USNwfdW9Zoa8E3V2AYrxt1g8TZNZwyh6S+HB/OdPYQYnVIS/P9F4Mt5DF0hoACFuvJ/eFH4=
X-Received: by 2002:a05:6512:104f:b0:533:46cc:a71e with SMTP id
 2adb3069b0e04-536588103damr2074798e87.54.1725637073910; Fri, 06 Sep 2024
 08:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-7-06beff418848@samsung.com> <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
In-Reply-To: <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Sep 2024 00:37:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQytsDzaJfAJA0nL=KPjxj3DBCRLeuHUwgGDt8fTJ0fTQ@mail.gmail.com>
Message-ID: <CAK7LNAQytsDzaJfAJA0nL=KPjxj3DBCRLeuHUwgGDt8fTJ0fTQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] selinux: move genheaders to security/selinux/
To: Paul Moore <paul@paul-moore.com>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
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

On Fri, Sep 6, 2024 at 11:54=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Masahiro Yamada <masahiroy@kernel.org>
> >
> > This tool is only used in security/selinux/Makefile.
> >
> > There is no reason to keep it under scripts/.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  scripts/remove-stale-files                                    | 3 +++
> >  scripts/selinux/Makefile                                      | 2 +-
> >  scripts/selinux/genheaders/.gitignore                         | 2 --
> >  scripts/selinux/genheaders/Makefile                           | 3 ---
> >  security/selinux/.gitignore                                   | 1 +
> >  security/selinux/Makefile                                     | 7 ++++=
+--
> >  {scripts/selinux/genheaders =3D> security/selinux}/genheaders.c | 0
> >  7 files changed, 10 insertions(+), 8 deletions(-)
>
> Did you read my comments on your previous posting of this patch?  Here
> is a lore link in case you missed it or it was swallowed by your
> inbox:
>
> https://lore.kernel.org/selinux/3447459d08dd7ebb58972129cddf1c44@paul-moo=
re.com
>
> Unless there is an serious need for this relocation, and I don't see
> one explicitly documented either in this patchset or the previous, I
> don't want to see this patch go upstream.


I commented on the previous thread.


I will reword it as follows:


--------------->8--------------------
selinux: move genheaders to security/selinux/

This tool is only used in security/selinux/Makefile.

Move it to security/selinux/ so that 'make clean' can clean it up.

Please note 'make clean' does not visit scripts/ because tools under
scripts/ are often used for external module builds. Obviously, genheaders
is not the case here.
--------------->8--------------------






--
Best Regards

Masahiro Yamada

