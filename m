Return-Path: <linux-kbuild+bounces-6111-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362DA5E928
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 02:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4EBA189B337
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 01:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBE48C1E;
	Thu, 13 Mar 2025 01:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdnxQnke"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8B610C;
	Thu, 13 Mar 2025 01:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741827765; cv=none; b=iQsRBMjpaynYc7nBCKEnV685gTTYpdzV6cfg1QMBkGrRHiyDxzsAWh93VBfmz/SXEH5RwspNMF0gm0uskhOFaSo6e6CaWAptLGKuBHyJfGgU4Fvisb52hgGMlWEG5nBxdbwE76Q9kj1ad9v28++DUH1+HVVDPd40DQ0n7LePxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741827765; c=relaxed/simple;
	bh=Q1aM5cKFYnCHCe+T3JOO7jfxAGoZ83bIHgGxGhIR7KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/H6MTaEaj1SWJmajPYl3XZBOsGFMJYPdnMq348XnyzPc0/wUQnSudFCcmqrutiNi30sBgxpjyVIcMAmuF5LUsEY4LDZb3gqqa6UNP7880CqGFwhJhRn6VIC6ZHpO1m1mSVTwVWTTbItdWeAIVwJ3DtDz/1LmtJ+a9v63jkkvgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdnxQnke; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6686C4CEDD;
	Thu, 13 Mar 2025 01:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741827764;
	bh=Q1aM5cKFYnCHCe+T3JOO7jfxAGoZ83bIHgGxGhIR7KI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bdnxQnke3jBtHWePuV7KUt/fojwaT4L3NoOnAKZFudZ3qcbujGYHj1u1QidUExrld
	 UuBunM5C7ZA8Tlj8Q35GWUBWQiFepi5/v45djtvHrq8an2w3b36iP/39QGpRJ2vtZR
	 tAnxSQsfO0Yx4rFN5xrqH84WpVitA5LJ2YYhXgUB5pcopST1DRcM1PvU0zGFCmO83F
	 mEvVti9UPh/mipArpdxMTxlgL7CtMimzhAIOR2qPXbXXeeADw5VbUnOLCzfqhatLC5
	 Kv686iQaNqUDfW8lcawDuMZNJ91iV67Uu7YxQ523stEXNN/MlB7Y+ybJGKhExEjKO+
	 ko1JGGEX1MVlg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-547bcef2f96so505370e87.1;
        Wed, 12 Mar 2025 18:02:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjy++1+5y2voJKzRU5s2whV0PNonJCJX3k1/0A08a01PNyWua+MwAlb3fYWhguQI9ysNJxiQMfSoA=@vger.kernel.org, AJvYcCWwOxayiRzZQH1AuEk9EOcXfx0LDpAORJu/yVjIglLP6I6XnhST4IKMgJZ4XoZMFyFLCNWiEnf3op2mUXRr@vger.kernel.org, AJvYcCXvRMtB6ZsfkukSVSp8UnFDNbIt2cQVGaTw68Uv+blASgYugQWki3fo2+WysrIocA+lGHObYu5HYFX8kqRk@vger.kernel.org
X-Gm-Message-State: AOJu0Yycv/9hdsPMpGwwKvmx+vPsDPs1Ub/WMbtGE6LchNYrng+EXgj6
	W9gO2TTQ3dR+zC+W4fX3N04rJLKOh0ckH1IsYIOkE0sOD3bWhlEWZoY7n2S3NMjG1i5XL6qZ7/V
	KizDmkIgV0UXvKL/Xshp18VXucSA=
X-Google-Smtp-Source: AGHT+IFhpoWAb7JEwtDxPPyUFo+XGguBg11A4gNdZlqOCCzXKIRoCEOHiOu8g3CZG/LuNlO8PKASOBCMoq+eLun8uEg=
X-Received: by 2002:a05:6512:6d6:b0:549:8d2a:8820 with SMTP id
 2adb3069b0e04-549ababf0ccmr3887313e87.17.1741827763390; Wed, 12 Mar 2025
 18:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311154535.56560-1-liukefan24s@ict.ac.cn>
In-Reply-To: <20250311154535.56560-1-liukefan24s@ict.ac.cn>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Mar 2025 10:02:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPdxFStU8=opM8_gZvwFL26F7SMKZ94uHDnUpZ=tpBbw@mail.gmail.com>
X-Gm-Features: AQ5f1JoFpbmptc9jMsV1ah9W40wua59RShx7QVusfFdHCzSV2gDwXlxV8K7646A
Message-ID: <CAK7LNAQPdxFStU8=opM8_gZvwFL26F7SMKZ94uHDnUpZ=tpBbw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/kbuild: Fix indentation in modules.rst example
To: Kefan Liu <liukefan24s@ict.ac.cn>
Cc: corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 12:46=E2=80=AFAM Kefan Liu <liukefan24s@ict.ac.cn> =
wrote:
>
> Correct the indentation in an example within the `modules.rst` file
> to improve readability.
>
> Signed-off-by: Kefan Liu <liukefan24s@ict.ac.cn>

Applied to linux-kbuild.
Thanks!

> ---
>  Documentation/kbuild/modules.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modu=
les.rst
> index a42f00d8cb90..d0703605bfa4 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -318,7 +318,7 @@ Several Subdirectories
>                 |       |__ include
>                 |           |__ hardwareif.h
>                 |__ include
> -               |__ complex.h
> +                       |__ complex.h
>
>         To build the module complex.ko, we then need the following
>         kbuild file::
> --
> 2.43.0
>
>


--=20
Best Regards
Masahiro Yamada

