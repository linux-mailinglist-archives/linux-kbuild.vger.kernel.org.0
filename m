Return-Path: <linux-kbuild+bounces-107-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C397F3D1B
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 06:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAEE0B217A7
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 05:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE92F2BAEF;
	Wed, 22 Nov 2023 05:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaRMpUoa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120EC155
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Nov 2023 05:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37048C433D9;
	Wed, 22 Nov 2023 05:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700629616;
	bh=SMGTFpMUFlePRZDNEdBRTyt1TtPx97T5y1jxAfBIUSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GaRMpUoaPyy3aSywdp6J6l22pCBtNs3hRaJQRZASU9tAnhti0l0mDlEsIkQc3GhO6
	 djblblh5NoFSagsCE/4PaWxFrKAXRQTDNvB2ORoFb7XFDBuOIG2gNWcSUYnsGfH19O
	 o3Tj9tPXQ2vdFB8dwERopYuVdeonl4vsXhE6RmUio3mNsoA7NCrzbOkpwPv3RcYILo
	 Fu4qP1eqiXSIpa+ehx/y4X24in0Hj0vGNLv8qKKSXDzZtcC5S8kbOQLVc3BkizmB7o
	 qInxZYnJ0WLCVT2RdvOYERGmFmfhjNBB0Sbh6JtiAnZYzmun6u2mBF8xF5v5I10lLK
	 cV0ya4BLlKAbA==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5842ea6f4d5so4025042eaf.2;
        Tue, 21 Nov 2023 21:06:56 -0800 (PST)
X-Gm-Message-State: AOJu0YwF0kKMNI0MPi++9/UvHjEyJSDbvKosf96wwXUJuviXiRfFdWNd
	jy+gCTLsizpRvR76RJc0o2X3nVmuz2gKKvqnXOs=
X-Google-Smtp-Source: AGHT+IFfI0wltrJTCmjSnaFWjgTR0bE9i7u+a83ILZJxT8zkqo4A5hXAfq7+yqFlRkIw3OdhdV+yCULgGoDc4ULVp+o=
X-Received: by 2002:a05:6870:1612:b0:1f9:67db:2d51 with SMTP id
 b18-20020a056870161200b001f967db2d51mr1686219oae.31.1700629615555; Tue, 21
 Nov 2023 21:06:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
 <CAK7LNARAvH=tWpsXJ640y04Ju8UbPmDze_NC6ax1EKK4Xy73fw@mail.gmail.com> <5EB120AB-1F30-4403-B652-DC0D2772B25E@kernel.org>
In-Reply-To: <5EB120AB-1F30-4403-B652-DC0D2772B25E@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Nov 2023 14:06:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNARV5aCbvVr4GxWCorGbH-vvXy0NbbW1G6W4a0POGg=wZQ@mail.gmail.com>
Message-ID: <CAK7LNARV5aCbvVr4GxWCorGbH-vvXy0NbbW1G6W4a0POGg=wZQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: Kees Cook <kees@kernel.org>
Cc: ndesaulniers@google.com, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 1:47=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
>
>
> On November 19, 2023 9:17:20 AM PST, Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
> >On Sat, Nov 18, 2023 at 4:24=E2=80=AFAM <ndesaulniers@google.com> wrote:
> >>
> >> [...]
> >> Wake me when you need me.
> >>
> >> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > [...]
> >(The patch was addressed to Kees, so I will not touch it.
> >I think he will pick it up.)
>
> Yeah, I will snag this soon: I'm out this week for US Thanksgiving, but w=
ill get it to Linus shortly. (Unless someone else picks it up before then.)
>
> -Kees
>
> --
> Kees Cook


For the "KERNEL BUILD + files below scripts/" bit,


Acked-by: Masahiro Yamada <masahiroy@kernel.org>

--=20
Best Regards
Masahiro Yamada

