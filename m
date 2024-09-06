Return-Path: <linux-kbuild+bounces-3441-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9137696F7D5
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 17:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4851B28332F
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 15:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064C41D1F77;
	Fri,  6 Sep 2024 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="gPntb3te"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571EA1C9EA4
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Sep 2024 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635301; cv=none; b=ivYPIbSY9a/yKEfxi4dqR/neDDz/9uu8fcBvXPKMhAXNBj20mgszsY/OfCZllxFK0HcwDfVwtnJW0Dv4m5dNEfG6VT5MjnW8YSYO3yt5KC9DBW+NmxxDxS4xIUWjfXijphky86HWHNqoC/LzYQMO8K8xE9qNLZ+vpOD6ljFiHKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635301; c=relaxed/simple;
	bh=CfwA+7g+HrXEdbWCSTlc/6vfhCHNjAmjh8fb1L7ct9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOkKwqfD+7aCUdeOvaCLceFXHzgH6/JCMzgxzGnxC3F31mB6/qUCZo70ZiLs7aEU7RnCpyAwPMj1qCN2eR2be3Z8Pq1h2IBbhc/4cMj+nCc3pgLFcWMaE6PzT30RqISZZJHlY7yGv8qVhl9DDNyPTzInj4yxsmjRi6CegYxt08M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com; spf=pass smtp.mailfrom=kruces.com; dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b=gPntb3te; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kruces.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so291104066b.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2024 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1725635299; x=1726240099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8bMi8neSlk0H33MBuzRIDN5M+I0beTdNpKiekVDuiU=;
        b=gPntb3tebZJATK5fL7ndBC01PsTB42YlHF0sGstq2pZvipVEWMVFbgKDcLY3LBTlI6
         81eRnLl3IDof0i2YDajnEh5XHdqKwWmTu/EJ4u3PUtt5+k92ZMtP3isuSTsxBT49RXf5
         fVuxpdA3C2KwdoSKhvxyIx0JXpQ4qWJmXUjqxBmSMVdEFI4AgkDP0oy+M5fSUmMTwYbU
         C0NEdCUmDjM4G31bEqqQDm0hvCR5MEI4CajF87lB9Hx8odEYFWekdKnr97K+1WShzXSN
         1za+yWZYjNdSBHXRA0HDobthVXbE5pBXs0/edWUAvhDIxRlbIZ6m3gXaEcZXlu4Ignc6
         4IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725635299; x=1726240099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8bMi8neSlk0H33MBuzRIDN5M+I0beTdNpKiekVDuiU=;
        b=Gw6/LQ+XyfAdojgABgmPh/B6fwCIVWsy2MzexnTO8ap8pjzZZmkvVkFLbVB9+prJ/p
         OPXhYkVbrY0voLiv64kXB4GJhHYOqjDI9FVRwjN3XB5rZBt9fgxNQeGxJ+M0ojVRgjg8
         cBmhf8Aoqhho+q+zLlyGINdoDBnD9bw0TwB2cdrcOokEtwKPhn7CiZCkfj8WpYkDGCqt
         5oUP1/HBzWXXIJ/S2Yk2c70Dpbr6MyJtUGCks9pjXMRfVAhTtzelEufk3DtpvyHSM3s5
         ZoMApNXfkuzfIB/SP55B71+SAodDxdH9eEmH1XJ6/yU/anFF8koNAWp+giP3kJPZl6as
         DF7A==
X-Forwarded-Encrypted: i=1; AJvYcCViGhNWaeFBvYBAmt9K2yjtjkjoiaoF3xAkBvbE/jzWRxFai4QNGZQvPIZV/TsWdFEnBE2+zM4mgi2j0cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwGXpa0svtAFSXD3RIhds1dij1guqn3+OgOdbhjSaE2TfWdO4/
	B4Aqgz7VBjtwaNpk1a2G2cGWJv26stJMO3UaKmG/Q+nEMncavD/yTwYGgKchc1YQX/jTF2M2ov3
	WhvoUhxSb3n5Up3KKp2esvdVYPBKfn8KiRXlDzw==
X-Google-Smtp-Source: AGHT+IGUA1wnLPvaqVG65cpWb2qjjv+ZYvS15NsPxrxeFhQA7Z9cxOvMhyKovH+37PHRvGwnr/HounhIwA1d4bXQ4q8=
X-Received: by 2002:a17:907:ea7:b0:a7d:89ac:9539 with SMTP id
 a640c23a62f3a-a8a42f8af35mr889231466b.7.1725635298533; Fri, 06 Sep 2024
 08:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-6-06beff418848@samsung.com> <CAHC9VhRpHgqN2fp1J3x9=zBqNr3QHsSDgUnoZ7M-SuOQ6hQ4nw@mail.gmail.com>
In-Reply-To: <CAHC9VhRpHgqN2fp1J3x9=zBqNr3QHsSDgUnoZ7M-SuOQ6hQ4nw@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Fri, 6 Sep 2024 17:07:52 +0200
Message-ID: <CABj0suDY3duFeZx8ghEJm3vTuJvcVuoYZ6BpYn9SCaHetw3oNA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] selinux: do not include <linux/*.h> headers from
 host programs
To: Paul Moore <paul@paul-moore.com>
Cc: da.gomez@samsung.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
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
	Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 4:56=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Commit bfc5e3a6af39 ("selinux: use the kernel headers when building
> > scripts/selinux") is not the right thing to do.
> >
> > It is clear from the warning in include/uapi/linux/types.h:
> >
> >   #ifndef __EXPORTED_HEADERS__
> >   #warning "Attempt to use kernel headers from user space, see https://=
kernelnewbies.org/KernelHeaders"
> >   #endif /* __EXPORTED_HEADERS__ */
> >
> > If you are inclined to define __EXPORTED_HEADERS__, you are likely doin=
g
> > wrong.
> >
> > Adding the comment:
> >
> >   /* NOTE: we really do want to use the kernel headers here */
> >
> > does not justify the hack in any way.
> >
> > Currently, <linux/*.h> headers are included for the following purposes:
> >
> >  - <linux/capability.h> is included to check CAP_LAST_CAP
> >  - <linux/socket.h> in included to check PF_MAX
> >
> > We can skip these checks when building host programs, as they will
> > be eventually tested when building the kernel space.
> >
> > I got rid of <linux/stddef.h> from initial_sid_to_string.h because
> > it is likely that NULL is already defined. If you insist on making
> > it self-contained, you can add the following:
> >
> >   #ifdef __KERNEL__
> >   #include <linux/stddef.h>
> >   #else
> >   #include <stddef.h>
> >   #endif
> >
> > scripts/selinux/mdp/mdp.c still includes <linux/kconfig.h>, which is
> > also discouraged and should be fixed by a follow-up refactoring.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  scripts/selinux/genheaders/Makefile              |  4 +---
> >  scripts/selinux/genheaders/genheaders.c          |  3 ---
> >  scripts/selinux/mdp/Makefile                     |  2 +-
> >  scripts/selinux/mdp/mdp.c                        |  4 ----
> >  security/selinux/include/classmap.h              | 19 ++++++++++++----=
---
> >  security/selinux/include/initial_sid_to_string.h |  2 --
> >  6 files changed, 14 insertions(+), 20 deletions(-)
>
> Similar to patch 7/8, please read my comments on your previous posting
> of this patch, it doesn't appear that you've made any of the changes I
> asked for in your previous posting.

Sorry for the noise, Paul. I=E2=80=99ll review this one as well.

>
> https://lore.kernel.org/selinux/317c7d20ab8a72975571cb554589522b@paul-moo=
re.com
>
> --
> paul-moore.com

