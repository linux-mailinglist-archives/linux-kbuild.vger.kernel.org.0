Return-Path: <linux-kbuild+bounces-6109-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A2A5E90D
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 01:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F29351899D0C
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 00:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF3C2E3395;
	Thu, 13 Mar 2025 00:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/r+agdZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67589C2D1
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Mar 2025 00:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741826611; cv=none; b=mesGE664qPMo3YPPSf8cHrnPecnnOuIDwRetRVL6jw++Nzsh9x9qNhr704hIKJplEKhrqHgioLy/eRt+V6bD2bgztdOraGxgT4bNI5NRkR/6S966SPRvjeplovVOZOi1pmyPAXmELTs0fK9F/7VIk96wlzUs3ItRR2TgPBZx1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741826611; c=relaxed/simple;
	bh=PvCydD8kjrtJgJt0sfGL27Y3KOAIjLcjJe5d1X01RpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7p9jWs/Ghc4ojnSr+uEOuzyXxNQL3gL4kRpxN11zGgYxkk6CLPIv3d6tObYmbJHedieodsRUDq70iRnFz3uCN/iJc2gQV1rehC9HwAmAKxX3ga4yLauT/mG54h33hSGVHBcqFkQoPbm7z1+dFyqeTxPtlTS4JHAVzpq17Nk7WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/r+agdZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C2EC4CEE3
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Mar 2025 00:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741826610;
	bh=PvCydD8kjrtJgJt0sfGL27Y3KOAIjLcjJe5d1X01RpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n/r+agdZD+2b0+VronMTO02eQ+rHfN/ypJDrd5PimWnh9cV1UxPoJYTqPoDNHBfZ9
	 FxhXRCkprdRDGhvWr9+K3oe42H1FPKJ1IK5z9sA1GMYnF7ttiXTYJoBogklTL5F7v/
	 FXeOKBoWMOxRI/PkiG/sUCcyfZCOKoMXpiUqQ515gxLdEgu0KTRa4FMrFLSwNazXYr
	 SJcAOgs7WXfP8eHpn1e/ZnUUz0lwFVFFmQKPi0cZpelOMVILrP8hEakjNDQrxr1VTk
	 tmxJe9RSLAUAlxXmLF+auNTxLfxRTiKkRPsIXFOP95aMV8vC61LDpbYM9xuV3bsRwn
	 7Udgxt/evYLxw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30795988ebeso4771691fa.3
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Mar 2025 17:43:30 -0700 (PDT)
X-Gm-Message-State: AOJu0YyMtuRy90fwTNTF87zJiHB5T1SmfCb6B0q2c5JGjvwM+xWZJGqu
	kJFePHC8h9WQ9qmiG4Ksl9xeNSntzPUzROrrRMjEhHMe+XdMIwyVof1rj2Dgu36gILUq+Y9G+It
	vrJd3rgGPf9N8U/qajvg7nIqAyIY=
X-Google-Smtp-Source: AGHT+IFz5k2c95AyeLtkpYgOmrZeOZcAtPBdMyDRnFYOqkFS0TN9qBoZVVu7rr+A49Cbm92V/+RaaqpZMSlnD1o4Uao=
X-Received: by 2002:a05:6512:3086:b0:549:8b24:9896 with SMTP id
 2adb3069b0e04-54990d9da71mr8617406e87.0.1741826609556; Wed, 12 Mar 2025
 17:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALfBBTv0S6HjsC007cFPCBawvm=awuUqm85TT9L_h+ud8xok2g@mail.gmail.com>
In-Reply-To: <CALfBBTv0S6HjsC007cFPCBawvm=awuUqm85TT9L_h+ud8xok2g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Mar 2025 09:42:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQm5MJ0rWa0FzPO0T2h=rF8p0Qv+WbYFmf-1KEMYyYy2w@mail.gmail.com>
X-Gm-Features: AQ5f1JrElo7yu1_kyH9y_xCDUTKxIb_XlkxLQHZwOdZfc8hbpbAZADk9jHp4UYs
Message-ID: <CAK7LNAQm5MJ0rWa0FzPO0T2h=rF8p0Qv+WbYFmf-1KEMYyYy2w@mail.gmail.com>
Subject: Re: MODULE_LICENSE Build Error
To: Maverickk 78 <maverickk1778@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 4:48=E2=80=AFAM Maverickk 78 <maverickk1778@gmail.c=
om> wrote:
>
>  Hello,
>
> Hitting the module build error on latest Ubuntu
>
>  The build works well with pre installed kernel and the associated header=
s
>
> But after building fresh kernel, trying to build the module again, its
> hitting this error.
>
> The MODULE_LICENSE and other declaration is all there but still
> hitting this build error
>
>
>
> MODPOST Module.symvers
>
> ERROR: modpost: missing MODULE_LICENSE() in nt2.o


Is this an eternal module?
I do not find this module in the mainline kernel.




>
> ERROR: modpost: "__modver_version_show" [nt2.ko] undefined!
>
> ERROR: modpost: "__SCK__might_resched" [nt2.ko] undefined!
>
> make[4]: *** [/opt/kernels/linux-kernel/scripts/Makefile.modpost:147:
> Module.symvers] Error 1
>
> make[3]: *** [/opt/kernels/linux-kernel/Makefile:1939: modpost] Error 2
>
> make[2]: *** [/opt/kernels/linux-kernel/Makefile:251: __sub-make] Error 2
>
> make[2]: Leaving directory '/root/NT2_AppLibDrv/nt2drv/Source/lindrv'
>
> make[1]: *** [Makefile:251: __sub-make] Error 2
>
> make[1]: Leaving directory '/opt/kernels/linux-kernel'
>


--=20
Best Regards
Masahiro Yamada

