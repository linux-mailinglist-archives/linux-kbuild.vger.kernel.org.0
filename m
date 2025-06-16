Return-Path: <linux-kbuild+bounces-7516-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E19ADB113
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Jun 2025 15:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3581889B47
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Jun 2025 13:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3728E2DBF4D;
	Mon, 16 Jun 2025 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xnj3p54D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1213A2DBF4B
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Jun 2025 13:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079139; cv=none; b=VfN5I2y5HcsHMsUMAu/1nPpykG5mwfDIvuUaOFmp2cr2kp08Fgskc7rhAKMoLOJcBznybN5aAjq8nBUQKRKSqcCGV7PHkxHyIA+b4LED0t5D5SfWlbx2LspVW1J/1HsjslVQjuFKWNtXE9354r4s1bFsTWhnFOT7ktdXF2mp5nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079139; c=relaxed/simple;
	bh=XD84ixc4i6AAXu5tD1TQl9Bo67mNoZRT8vFXgBQycrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btLhfOu5LZkbIyaNFgcacFUYryjNvobUKNCa5D6a0oc29GXLAdnCwxC9gTuoz6jtTyk5aBMQzXFF4WuOTrgUpT8ZsMXievEt2NCTrf7pEC/THuM5cj+0PFVIstqdhPMuI/rmu6zigbRpKQPJBaH13jqrgxJVFd3yTO3iCnXAZTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xnj3p54D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3CDC4CEF1
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Jun 2025 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750079138;
	bh=XD84ixc4i6AAXu5tD1TQl9Bo67mNoZRT8vFXgBQycrg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xnj3p54DDCMbCNaa1E+5qx72Vu9PHIhKZz/90d5yVzW+MInOMxCbZ33O4GLYOpzCh
	 qMeD9TfVXGFTY3r6o42cbKFUBAt21l3BtygLbqyhX4RbnQfgQAvoaiAPfXLIlU9P38
	 nRcOAgKBP5UgeGN5bdmgi7xtU9dMi4GUlmUSzc47Y5pLHo7YA1qgBKaaVxPqmEjzJl
	 YYjR/68KuKn14kTVeWbHXtSkD0pBcFOc54Wr6LGRWzmd9wrZsqnF6C5NxPNxw1PEVU
	 cxMNgSB4IodHqgzV27THgmGCfLoAgbagWDniwH8f4IAr6CW0CqDNVkSeksXK4FYgiB
	 jF5ygl6QRPniA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b6a349ccso2111924e87.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Jun 2025 06:05:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YzPRTAZgQ0giTheHnww4IXvGI9eJsKn3ZJezZLnbq/Rrsc3n0ql
	yAbOj+qbytXvE97/f6upAqcmEFQecmKtEDZWrdBrZTh1oneO7L/Aa7CJkFsx+x48zmfRPw8u10B
	Y1ANE8N5ViaUPIccRl2slKdZN5UN/F6s=
X-Google-Smtp-Source: AGHT+IFlsWqv3BrxmkFAoYzggA1gu+6r2OLyt+ik0Jj6mWl3mD+WbFiYxu59y5RYh/QZ2rlFjsCny9HgtzA9cZSEr3I=
X-Received: by 2002:a05:6512:3b86:b0:54f:bf00:6f38 with SMTP id
 2adb3069b0e04-553b6f46c60mr2255477e87.45.1750079137201; Mon, 16 Jun 2025
 06:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604183539.425053-1-martellif67@gmail.com>
In-Reply-To: <20250604183539.425053-1-martellif67@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 16 Jun 2025 22:04:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAROMO2686KPbt+ZquymcZC-RLr0aX5x477uF1DaesUkCQ@mail.gmail.com>
X-Gm-Features: AX0GCFs-eyS9zpQD9aBDyFvOuK7d9kn7FVSdm_TUk920fO0kQD0HcTchB2bldNY
Message-ID: <CAK7LNAROMO2686KPbt+ZquymcZC-RLr0aX5x477uF1DaesUkCQ@mail.gmail.com>
Subject: Re: [PATCH v2] Kconfig: Added compare capabilities for mconf Ver. 2
To: Franco Martelli <martellif67@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 3:36=E2=80=AFAM Franco Martelli <martellif67@gmail.c=
om> wrote:
>
> Signed-off-by: Franco Martelli <martellif67@gmail.com>
> ---
>
> Dear Linux hacker,
>
> I've written a patch that allows to compare the tristate value of two
> .config files inline, symbol by symbol, in mconf (make menuconfig) only.


I do not understand why this needs to be implemented in
menuconfig.
scripts/diffconfig is already available.

I think the comparison mode is rather distracting.






--=20
Best Regards
Masahiro Yamada

