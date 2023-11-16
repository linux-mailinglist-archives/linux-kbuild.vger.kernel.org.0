Return-Path: <linux-kbuild+bounces-33-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891367EDF81
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 12:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B421B1C20A61
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 11:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B322E406;
	Thu, 16 Nov 2023 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIX94orK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6352E403
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2023 11:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63285C433C8;
	Thu, 16 Nov 2023 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700133587;
	bh=sVE1ZhzgF+azIDjaftC09+KcqFN6b/NyebhVcP3716U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pIX94orK0kXxh1o6FUN7miEOMvbCikG2L6fD47MqChba1soczCS4jplycsG0sIWn5
	 wlxUJLoYG/LkBnX7yrwdGJIlbten+wPkUWGmKkVCxj6fyIaQBGyUNLRlIqEfiNENU9
	 s/tkAHNDhhboJWuPPJa/rl9mjLnwCQ9InX1WA8udM6LQPeBC15vdECGAuGVMh1SVs6
	 jR5B0xv2P9dP+So1iJUBCKZf8V/FlvWvS8v9zMnIZWENLOk96Df29YUGkNKIadYX5H
	 +e58XhFLNinm99TLcZpnUMyw3tHYUFydHafmDHbqlqTTEYKFeuTvOpDs7VOg9sVEG1
	 ISzA0zgGhWELw==
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b2e73a17a0so378694b6e.3;
        Thu, 16 Nov 2023 03:19:47 -0800 (PST)
X-Gm-Message-State: AOJu0YyzudoRS9Sq97S+OYp/pBq0202oo2WN/oKdz9wvoXU0BC0yalP2
	3mEh8HUVO7+UVQo0mZL2+r/T/HGdNw44jq7s3Fw=
X-Google-Smtp-Source: AGHT+IG5EHn9aQcDgToPoaTjqqvcP1a1M4t+aOZpOsigb6MoTuHcsgwxABvfoX/iZim1ptpeZmWNZZ2Q2xY3URFCfWs=
X-Received: by 2002:a05:6871:a508:b0:1e9:9989:33a5 with SMTP id
 wc8-20020a056871a50800b001e9998933a5mr18170787oab.5.1700133586781; Thu, 16
 Nov 2023 03:19:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231111002851.1293891-1-sjg@chromium.org> <20231111002851.1293891-3-sjg@chromium.org>
In-Reply-To: <20231111002851.1293891-3-sjg@chromium.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 16 Nov 2023 20:19:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQN_qGYztWGDmQyfg+eZ5P7RkM47mpgp0dQn_iuhvTSWg@mail.gmail.com>
Message-ID: <CAK7LNAQN_qGYztWGDmQyfg+eZ5P7RkM47mpgp0dQn_iuhvTSWg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm: boot: Move the single quotes for image name
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, 
	Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 9:29=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Add quotes where UIMAGE_NAME is used, rather than where it is defined.
> This allows the UIMAGE_NAME variable to be set by the user.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---


I applied this to linux-kbuild/fixes.

I changed the subject to
"kbuild: Move the single quotes for image name"
because it is unrelated to arm.


Thanks.



> (no changes since v4)
>
> Changes in v4:
> - Add a patch to move the single quotes for image name
>
>  scripts/Makefile.lib | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 68d0134bdbf9..1a965fe68e01 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -487,14 +487,14 @@ UIMAGE_OPTS-y ?=3D
>  UIMAGE_TYPE ?=3D kernel
>  UIMAGE_LOADADDR ?=3D arch_must_set_this
>  UIMAGE_ENTRYADDR ?=3D $(UIMAGE_LOADADDR)
> -UIMAGE_NAME ?=3D 'Linux-$(KERNELRELEASE)'
> +UIMAGE_NAME ?=3D Linux-$(KERNELRELEASE)
>
>  quiet_cmd_uimage =3D UIMAGE  $@
>        cmd_uimage =3D $(BASH) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
>                         -C $(UIMAGE_COMPRESSION) $(UIMAGE_OPTS-y) \
>                         -T $(UIMAGE_TYPE) \
>                         -a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \
> -                       -n $(UIMAGE_NAME) -d $< $@
> +                       -n '$(UIMAGE_NAME)' -d $< $@
>
>  # XZ
>  # ----------------------------------------------------------------------=
-----
> --
> 2.42.0.869.gea05f2083d-goog
>


--
Best Regards

Masahiro Yamada

