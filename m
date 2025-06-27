Return-Path: <linux-kbuild+bounces-7732-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F6AEB808
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 14:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC3B63A8841
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 12:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD87B29993D;
	Fri, 27 Jun 2025 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtHMOKQO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85631292B5F;
	Fri, 27 Jun 2025 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028453; cv=none; b=lUNctrzUqdcjCL3QL/83ZQnJdcl34FbKtRnag3qW+MdtahZDmdh70d2ZYwlzhwAKK014onuqLyBLa+KJHL2pa9OFaWww01XRibzdeenTSkNgdKDFF5ba50MI9LtH36mhoFAbRpkMT7ESeHAQOeKhsCZ2u2LqDxf5UbK+NPaHHHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028453; c=relaxed/simple;
	bh=RHnpDW03IRZcP7aLxiSEWRuZFYtq/tavx2Yg8FmvHnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7gWG403FTXt+stoCgDcKXW+bI/bK/UGsOt/1YezTvRsMVHZfju2XQ+W11MiU6Qf//OWb4QaUTAwAan38/n3qa8IakLoAxWqF5J8e0L6sGhU5sBqV06KzlyFoKHY2X8ZJ5NhzR8KPQZNrx7ifQdhaoimVR5qWVidDv9iKg+edPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtHMOKQO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09330C4CEE3;
	Fri, 27 Jun 2025 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751028453;
	bh=RHnpDW03IRZcP7aLxiSEWRuZFYtq/tavx2Yg8FmvHnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EtHMOKQOEEE9sdrFLi8zzcoHc7jDfG/Ycz+zjAJJm309Yy+2KwFdvFq5y/blqrg7O
	 as5E7tu/PIUX25uTMs98AyXjancLlPNx+KTWVbVgjyDs3DGpG4mgSJPHnt+7THBH+G
	 L7kx/sn8rXsBjlmMqFI58cNRUQpK+vg0LNslb5aqbRcWdoqCNcCJWTCEDvNrDfCJPx
	 Tm36hBoPy0SIuqDDfvs2/b7Xe3tarZp/hwHlpA3psbn6QdGyJT32zhRcemRwuHdjfU
	 lxYlrXdKhG8M6SDbF4jw4hd6TM1mz7tRbHwH4es5r7Tcx4ZMQ9YEKbd0wGPRSoixyM
	 VVyngKV1urIzw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5533303070cso2121774e87.2;
        Fri, 27 Jun 2025 05:47:32 -0700 (PDT)
X-Gm-Message-State: AOJu0YyBC4AA9uPhfv/aIPvA9UPCftHzcOE5TbQQ3JbbYee1Sm90ZWqn
	vDdbeEm7tGo2iK4fiBPcNtus9fHrTUvPShXM0fa7dE7OrD2Ae4wXSiW64Kc4f2vLT7B+FNcYM+A
	GDN51cpOa3FU+hF7drv+F1IN/lzqYf5Y=
X-Google-Smtp-Source: AGHT+IG5s02G/yMFYdWcxSuuJD4qBNXZiUTvsLww3XZ0JjmOSJ3cbV4A0mZ/bCWei1aD8n4sykChE3eRY3/pHaei7sg=
X-Received: by 2002:a05:6512:b03:b0:553:2a6a:884b with SMTP id
 2adb3069b0e04-5550b81fb5amr1077155e87.23.1751028451713; Fri, 27 Jun 2025
 05:47:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624150645.1107002-1-masahiroy@kernel.org> <20250624150645.1107002-53-masahiroy@kernel.org>
In-Reply-To: <20250624150645.1107002-53-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Jun 2025 21:46:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNARWU8JF_8ZkkhfwwhDsvoKw9tx4RWihLYDK1szE8Qmi5A@mail.gmail.com>
X-Gm-Features: Ac12FXzDUh_-jyGGprpUwjCLFpZ72lLqCU8BTzSeVOyyUGtuPnB0yLjvTwgATQw
Message-ID: <CAK7LNARWU8JF_8ZkkhfwwhDsvoKw9tx4RWihLYDK1szE8Qmi5A@mail.gmail.com>
Subject: Re: [PATCH 52/66] kconfig: gconf: remove fixup_rootmenu()
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:09=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> The MENU_ROOT flag is a hack used for SPLIT_VIEW mode. Top-level symbols
> have no parent menu, so they are displayed directly in the left pane.
>
> Show the rootmenu, allowing top-level symbols to have a proper parent
> menu and be displayed consistently in the right pane.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

I will drop this.

This does not work when a menu is created under a non-menu entry.

e.g.)

config A
        bool "A"

if A

menu "menu"

config B
        bool "B"

endmenu

endif




--=20
Best Regards
Masahiro Yamada

