Return-Path: <linux-kbuild+bounces-4760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 033319D4397
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 22:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3A731F2293D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 21:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EA115B97E;
	Wed, 20 Nov 2024 21:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtSw+IkE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3C31C7299;
	Wed, 20 Nov 2024 21:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732138529; cv=none; b=qqyn2N1VssdcdllcMzHfFzBd3Nf3z06PHKpFWZ6JXMYMG/4xcWgww+HmIQPuuLVXazRR0PtG5AJT7e2N+UssAfRNCmbgY4UniRXHteytdmpBds6IHgI3XwsjS8e/BejdQD9ChH3iTlYAhuRkjfAAAoMvSAlkqdfvMpGhpaSAtjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732138529; c=relaxed/simple;
	bh=221kYit23f9QJxeOwC9neMdzrf/0CgYCMcgmEKVkURI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0CUYFTbcFtC+rGVsH5lskADRAdZ/EOBS/crg0Pv2x1bgfmV4sryxCNwOBShrUI1/rJawgSf4VygdRXn1Cw7uZoAD4BmF0tU/6RLmUWI332TyWrnhrm3ez6fqUYqVtShtWT+V14bk4se4JiKFzws8YDjHYvijQfWkPtdeGMZ3eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtSw+IkE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6DEC4AF09;
	Wed, 20 Nov 2024 21:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732138529;
	bh=221kYit23f9QJxeOwC9neMdzrf/0CgYCMcgmEKVkURI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AtSw+IkENfdI0iMOfNeq7N4J+o6eLyrxtLEhUpNLjN764qstmpkWErj6nM+WDxFvC
	 KS7baZBiPlfQLyoTVQ/ZbCUOmn1KwYvwDisz4fYt+46LgWWwFgmx87JbRw81D8U5VW
	 /5aAVRIkoBGzlVt7DEabGrd7tK2chDyXUo80bw8xJNFQGGdwwYIDozvkEdrWk6O2KO
	 0QX/rMGIZG8oH7EK2KxZJ8jACWLVQAzonzZUsCGBSf5Y/fg/NkAxhEHeHWB2dQYD1u
	 IyN5E9jT3qy/B84GjPNFhwk0Nth3O31+HsseGvRqzl+zYnc3Nnsv2Pvc/Iyxu/OsXc
	 M4Zk+a4/J6gug==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e8607c2aso195065e87.3;
        Wed, 20 Nov 2024 13:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmdwXnrLET9AydrxnZAnovR6UF/xvw7egMww+DpDX9YIikJOv6ev3mbiq8k3yHjr2wqZqaeFyTB7jsdYY=@vger.kernel.org, AJvYcCWps12JrTX5bcMJu2+lFb4YYqfOnEfj43OULMNyLiUDvPzleqq0L1TARnsrecIrD00U6//aIxFrxFLXaMt6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/QcBc/LtFtGOAmsKQ6gK9IIR7HrEQdjwIPSMlVDSUmoNt4xns
	NEhPMaNOQthPxzMgYT+OiOOmUYZx8dDRo+WhTfikJvJw7PcrLh2tLEkmniGxah+GOY6248rx6Jx
	dHZmZOgpCX8p+6hHG73YDxWEZ/5A=
X-Google-Smtp-Source: AGHT+IFtmpACgo2WdBjeF3KSeMaOZg3iR6IINYTuzz6B/NBI3VQXA/HLNEHHfQg9tbjwQt/LklOU87alu/iYAe/eofU=
X-Received: by 2002:a05:6512:3d8f:b0:53d:ab15:1aee with SMTP id
 2adb3069b0e04-53dc136dc37mr2166462e87.49.1732138527773; Wed, 20 Nov 2024
 13:35:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz>
In-Reply-To: <20241120204125.52644-1-pvorel@suse.cz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 21 Nov 2024 06:34:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
Message-ID: <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 5:41=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
>
> It will be used in the next commit for DRM_MSM.
>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v3->v4:
> * Move definition to the end of the file


I prefer to not check the tool.

Why don't you install python3?




>  init/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index fbd0cb06a50a..c77e45484e81 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2047,3 +2047,6 @@ config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>  # <asm/syscall_wrapper.h>.
>  config ARCH_HAS_SYSCALL_WRAPPER
>         def_bool n
> +
> +config HAVE_PYTHON3
> +       def_bool $(success,$(PYTHON3) -V)
> --
> 2.45.2
>


--=20
Best Regards
Masahiro Yamada

