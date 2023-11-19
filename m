Return-Path: <linux-kbuild+bounces-74-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A79907F0706
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 16:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35A0FB2096D
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 15:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5328134A4;
	Sun, 19 Nov 2023 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NZgvpYRW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791AD12D
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Nov 2023 07:03:48 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53e3b8f906fso5058814a12.2
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Nov 2023 07:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700406227; x=1701011027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhgRPtKLHKyCASHu64uGyNWJNnaZJqXUqiVwYsPYYoU=;
        b=NZgvpYRW8YZncxiKBMikj8AV7NDU1UQkrq/yFlrg9obMLjl8cPTpyICwk+WJ4o1r2Z
         J4I69qV7Z+u44pMyq+PdpUH2LdiisV3aEHD+ke8Cra6fWzHeiJiGC0u5Z8cp35rUIgqJ
         b+kQ31hCbHxVILgScPhO9GmIOyszTAZRJGzyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700406227; x=1701011027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhgRPtKLHKyCASHu64uGyNWJNnaZJqXUqiVwYsPYYoU=;
        b=Y8fOagdV7A0q0ajCj4mf7UogoOUnZXSNzo5+CbH5wAev6SLJKzBY4gwZPR4zpAnM3m
         Okril23/W9k799oY+J5qBiq9/l+QHcJvjgHQvFFZoud537w5lQ3f10iodR6H36boZLMk
         i4OWiJD+OrtkNgXl4lFaIBaFS5/kgl+cO1iTc7r5wbhkDFpw+SQH4VZV2Rnh8q+9kYVB
         wVr9x0q1AJbQMEAAPC4xST5c0vFEmZtkVBf+bY73BGT6mlgZWItpW80m7w7p1nHbv68C
         udr5jek3IEU/PT/UUQ1eQr3o771TRlLUsPDUfBpfseA7qx4Lg87IuQ/gfXLElNwgT4wg
         XZHw==
X-Gm-Message-State: AOJu0YzCMO2xp5o+81Xg1PwxnTihCZ8wrp77ZZIKQB7+Lxip+MZaBPtm
	CXI9PY4UKwIiVNA26NAO9qzKlhi/hz1LzOskfx2r5w==
X-Google-Smtp-Source: AGHT+IGzFEU8YWTTy6VrQtmHjiot+wlxwXCg5vwgI/KdLmFFd5niB+Mx16ggwlizicPuNRRu/BhQLB81+rZ1kcxVG90=
X-Received: by 2002:a17:906:2ce:b0:9da:e694:e6a2 with SMTP id
 14-20020a17090602ce00b009dae694e6a2mr2846142ejk.4.1700406226754; Sun, 19 Nov
 2023 07:03:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231111002851.1293891-1-sjg@chromium.org> <20231111002851.1293891-3-sjg@chromium.org>
 <CAK7LNAQN_qGYztWGDmQyfg+eZ5P7RkM47mpgp0dQn_iuhvTSWg@mail.gmail.com>
In-Reply-To: <CAK7LNAQN_qGYztWGDmQyfg+eZ5P7RkM47mpgp0dQn_iuhvTSWg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 19 Nov 2023 08:03:35 -0700
Message-ID: <CAPnjgZ12nzMmpqJ5-=TzY+Dxu=4keFbJAB+RU99FqxKZfxjNUg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm: boot: Move the single quotes for image name
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, 
	Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Thu, 16 Nov 2023 at 04:19, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Nov 11, 2023 at 9:29=E2=80=AFAM Simon Glass <sjg@chromium.org> wr=
ote:
> >
> > Add quotes where UIMAGE_NAME is used, rather than where it is defined.
> > This allows the UIMAGE_NAME variable to be set by the user.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
>
>
> I applied this to linux-kbuild/fixes.
>
> I changed the subject to
> "kbuild: Move the single quotes for image name"
> because it is unrelated to arm.
>
>
> Thanks.

Thank you. I sent a v6 with a fix and without this patch.

Regards,
Simon

