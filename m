Return-Path: <linux-kbuild+bounces-6264-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5ECA6A930
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 15:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36439188E8CB
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 14:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DDA1DE3BA;
	Thu, 20 Mar 2025 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDvPvyd3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AA71E570D
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Mar 2025 14:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742482108; cv=none; b=W0Ls+jAWhjafmjWy3+jgjz4c9wgyX0Z08BLr2L98A3fqPzTv+0UbGn75ARi1xS6I7P/ItWyKL0vkORu89xmr+o2OJVIrXRWxRt6+AIo7u20hVPI6AR2HYmd5YgVSOBRe7DZYkw0LYkh4VqiAzQLovbfTZfRABV3vUOLfw0M93zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742482108; c=relaxed/simple;
	bh=Xvoeh58s70vSFOLYaEKZQIUIe+G13ylJJ3EalvjGLyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXo9F94uOO//8gyhvEd+h4wFLsDEpOvG2awHHxmUyyuUdEoHDthZG3Gn2djYBWCgeWoDZIlxU1PWHJqoO5aTH2MY5VbOtXUf19MSj7t0kejh3YabD7p/Tr7TpajlIHh9r1qJnArB0haWLVq3wJ06beB9JlMRffZ78p0V5P5+aQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDvPvyd3; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e50bae0f5bso11628a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Mar 2025 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742482105; x=1743086905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pc7LWVo/l2ikFRF6JI5IUe/xyv1LbtKtAfas94oyDwQ=;
        b=aDvPvyd3q+wZG27bJWw89djpO1zNuNCeOhw3xixHxkrDdPVtk/7X9P7GGLazS+YwRJ
         7vFsiOMVOPZ9SdmqBiU1M0pnFOc66i3dWPBN1YOXVWfrKoMGTHLxQbCyKPLCkTXomS49
         zuT2Ql7cMv3dp74TCL+yhaTSW1sehnjVUSDiNK7s3PMReanXyQ9/5495AYLvU3E4tyGd
         51RLXrfGMtNGp59uLUOBZ19DrSFiK2L0UZozPG0dMlERU/I3vh1tFtixA4VKXlKC6g2x
         HmHEJgQWhwiMzzBgs8OWhJZNWT2eUXPP7AnI2vn35Xr2lKPBp8t7p6rdJ1RhtZ5paobD
         Yv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742482105; x=1743086905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pc7LWVo/l2ikFRF6JI5IUe/xyv1LbtKtAfas94oyDwQ=;
        b=S2sLay7eu+dmiUanfi11ShuoBgBOMLjhj2UYsZ7g6mwVOwNii0uevBqI1cGhQ6YObP
         LgL/drgV+5VzjVFCpPZ/z0DBVC9sN1PABPtXPrA1TF3PL5J8RPXKZsaSkioJmD0hbGJN
         GCS5hBr8AS2mZFQ4Ff3h8ytTtWHkff2AvtsaggUMgEz2heZVTa4nsgQaJAi+4OgO9A5p
         cJJrsem8jfjoENpT7e59E7UgRFsqUywCfL03zM07awjGhSVuX4E5j8IvVKyked5eYx2i
         wodessqxW3qxcsf5ZXGL8ofQu+eBlGJN25JhRfDB2IO89tRMyYxkzzs4IEPUsO0HVea7
         Y4Pw==
X-Gm-Message-State: AOJu0YwVbnx039JEqLYAilN7WK+8QYRI2ME067zwqxDw+mnSfsx0DfT0
	jyYmUuKDP1LTy3rpRrEQCviBweBVevWOjyrQZOADcupXYWL3iUedKRhQU/uaRaLN1t7Dh/EzGpK
	ZJkn3BJBe4IVvIUszTwf63OURxAsM5CgSTdr5
X-Gm-Gg: ASbGncth5r2/mgf06HjGvdaps06oAa7em0vYj5Clhc6tnGxSGYK1lyLSRCZZ1cxhsjL
	UJxbnRef/IKaZt65H03A0ALqvnzuCWUiu/hqVgbudIKpgsBqJPnd1K4LMtPYhnMvdMprQRIx6kh
	mwF8JKHArJcdxewMmbqmlmlCg=
X-Google-Smtp-Source: AGHT+IE5TWNd/Vn/eGNs1ct2+2GVfdCyxg9KzHKVtZFkDJanZ7RkGtPsYWgpLLFGF1WfvZvw22+sC7Foc+75tIr2aoY=
X-Received: by 2002:a05:6402:345b:b0:5e4:9ee2:afe1 with SMTP id
 4fb4d7f45d1cf-5eba1d74a32mr114329a12.2.1742482105108; Thu, 20 Mar 2025
 07:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320070746.101552-2-ardb+git@google.com>
In-Reply-To: <20250320070746.101552-2-ardb+git@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 20 Mar 2025 07:47:46 -0700
X-Gm-Features: AQ5f1JqdC0SpHlFRwhfopgVKLQiqPyjIO4aG0554rqOSsUNlwLJtgLXYWuod9Ew
Message-ID: <CABCJKuc3zZOG4qgoFca_g80GMkzviVRemGLJB8GaA88u27Mt8A@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: define __GENKSYMS__ when processing asm-protoypes.h
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, brgerst@gmail.com, x86@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, linux-kernel@vger.kernel.org, 
	nogikh@google.com, Ard Biesheuvel <ardb@kernel.org>, 
	syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard,

On Thu, Mar 20, 2025 at 12:07=E2=80=AFAM Ard Biesheuvel <ardb+git@google.co=
m> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Ensure that __GENKSYMS__ is #define'd when passing asm/asm-prototypes.h
> through the compiler to capture the exported symbols. This ensures that
> exported symbols such as __ref_stack_chk_guard on x86, which is declared
> conditionally, is visible to the tool.
>
> Otherwise, an error such as the below may be raised, breaking the build
> when CONFIG_GENDWARFKSYMS=3Dy
>
>   <stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_guar=
d'
>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Reported-by: syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  scripts/Makefile.build | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 993708d11874..7855cdc4e763 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -305,6 +305,7 @@ $(obj)/%.rs: $(obj)/%.rs.S FORCE
>  getasmexports =3D                                                       =
         \
>     { echo "\#include <linux/kernel.h>" ;                               \
>       echo "\#include <linux/string.h>" ;                               \
> +     echo "\#define  __GENKSYMS__" ;                                   \
>       echo "\#include <asm/asm-prototypes.h>" ;                         \
>       $(call getexportsymbols,EXPORT_SYMBOL(\1);) ; }

This works with gendwarfksyms since __GENKSYMS__ is defined after the
EXPORT_SYMBOL() definition, but I'm now getting warnings with
genksyms:

  AS      arch/x86/lib/clear_page_64.o
<stdin>:3:10: warning: "__GENKSYMS__" redefined
<command-line>: note: this is the location of the previous definition

Sami

