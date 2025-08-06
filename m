Return-Path: <linux-kbuild+bounces-8299-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46113B1BDEF
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 02:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 020A9625AEB
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 00:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A64042A99;
	Wed,  6 Aug 2025 00:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biM8N0UP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60721E49F;
	Wed,  6 Aug 2025 00:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754440484; cv=none; b=sZXU0aJn+/UCITvuFfkhILTl3ZuMG2zz9LtZqkz6UhmoLm4jjEvvrg3A6YKSXKqj/I2LgPpEfbjI+H8UxXOxDTqjvSONbQ94lVXdHZ0iWKEqY8lpw4ryt45RK64dWqQD983CQiVC5VUygXDIobyRWEPVpK6WKXMBAyfWFyZASac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754440484; c=relaxed/simple;
	bh=u0RSZ4ns4ZcEEiJSIV/Adiz+2k4XJ99G/8aqEpzsLGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvK8LxzGL7qiXu42lEk2DGhjLD8a5g2DP3sjAHRGXTIUlPmLyVcdMk0Q0AXqlJXVztA4g2BKI7AFVOGvD1xuIyhRuGbGgc5xDjJeo6qdGt/9RmWx01lHSOYYdcmhKW+HOk2pGPdemXafRNv/UrJ/+vi8Ve3f9/sUsNgNWkl2lag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biM8N0UP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5694AC4CEF9;
	Wed,  6 Aug 2025 00:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754440483;
	bh=u0RSZ4ns4ZcEEiJSIV/Adiz+2k4XJ99G/8aqEpzsLGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=biM8N0UP0U83XDIhbvaRu1obPpxm+9bUgKjF32pUjzTIg3qT+Q/rYDJMQAcM3C8Tv
	 6LGWnzTCPpAjXfwoeTfB2FGAgRebOw/hh0nQSZ4eUcoPeEidXCB34jSwPrNUgX0GM8
	 CytXCf3dro6O1CcEceyELtOrChLcB0KNlM4457t6UWITnkwyH8loL5YWnAKyq0Jaxj
	 E2WjEmni3qO6EXkvWOPabB1BoOeeTYcn/F6pDyBwem8zVha4DtXqYXF52uim05ejlA
	 G71ymm3HTcjiGYCP1zwEm6R3MdKywH1CvEOPF/MWVTlouaoffmdfJ9Y/5oEABbMhQZ
	 8ZMnz1/Mcm2ww==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55b978c61acso4516446e87.2;
        Tue, 05 Aug 2025 17:34:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUb90//4v0PhYp3mr3rVzJhN+D9egDyBTpKOcaXvzI07T5pZh4JQR72vBEwFuRR/r29+j/H3jHUE1Qz3q+c@vger.kernel.org, AJvYcCUgzLS8E0WBxB7+3W1JN67SciAmgs6gpFBfXdzgaUrSDMjFTdJdOK+ixPoQvo/faPJMwD8YGAtYS7pLSiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6KnWGAuPS6hTIDRwnFPdvavvnmdU6Bn3EjG2L1E5K6PHUAmU
	J0vcZsBAhCh82IDtaQwvgyXnLcDjLBKb33hICsczEpAji3d3x9etVvTJugHj3jyKxXXA18jPi5n
	QGg2NrR3YQOi9H+Z4pJ9zzcCNnbdKZK8=
X-Google-Smtp-Source: AGHT+IG6VY29SUz5zPDvAUUzrh+A1U/8cl2hsfc52fYgsRNGa0KM4HCfLcybLMJw1vb5R5rift9Iw/SguVf8lPor4ww=
X-Received: by 2002:a05:6512:304b:b0:55b:8833:ac76 with SMTP id
 2adb3069b0e04-55caf51df2fmr245751e87.9.1754440481988; Tue, 05 Aug 2025
 17:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQW8b_HEQhWBzaQSPy=qDmKkqz6URtpJ+BYG8eq-sWRwA@mail.gmail.com>
 <20250806030434.10663c09@canb.auug.org.au>
In-Reply-To: <20250806030434.10663c09@canb.auug.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Aug 2025 09:34:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNARZivfd7=vU_vD4dtuLVXecYNyMv+TS+O99YGv1E0qR_Q@mail.gmail.com>
X-Gm-Features: Ac12FXwEaTCB-0Uv8CO75ou11GvkllC748q7knVKK_ouuRFVNCjwPmrmTwfyB74
Message-ID: <CAK7LNARZivfd7=vU_vD4dtuLVXecYNyMv+TS+O99YGv1E0qR_Q@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.17-rc1
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 2:04=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi Masahiro,
>
> On Wed, 6 Aug 2025 01:27:35 +0900 Masahiro Yamada <masahiroy@kernel.org> =
wrote:
> >
> > ----------------------------------------------------------------
> > Alexey Gladkov (6):
> >       s390: vmlinux.lds.S: Reorder sections
> >       scsi: Always define blogic_pci_tbl structure
> >       pinctrl: meson: Fix typo in device table macro
> >       modpost: Add modname to mod_device_table alias
> >       modpost: Create modalias for builtin modules
>
> Did you miss this: https://lore.kernel.org/linux-next/20250730161223.6378=
3458@canb.auug.org.au/

Sorry, I missed that, because it was not sent to kbuild ML.

I will pick up and send a pull request take 2.




--=20
Best Regards
Masahiro Yamada

