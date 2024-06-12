Return-Path: <linux-kbuild+bounces-2095-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD4904AF6
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 07:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02EED1C22F34
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 05:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A71374CB;
	Wed, 12 Jun 2024 05:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWnrwXkE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE9C286A8;
	Wed, 12 Jun 2024 05:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170558; cv=none; b=FDZ2+uAOvhXFYymyhyp2NwIBTynppWEwZe9DuDh8ZpuJs0P70LLvcy5eClsGLPgyofJsLxmW0yR07cRyeMBTr9dMQ7lLroBFeZ5gYclq8CoDpPC7d2TSufW3lzsG0/ROeHY1a8a481Dtx31bBXTpl+USwIbQFyQVK/UbVm2FzNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170558; c=relaxed/simple;
	bh=7/kYWCF8jY7m1ZBPFDMBniSgK9LVHVKaxhjwzGyb8us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKcqVwwBr9qPtbdKNYhJg89NqiY9fRPNIe72bM1APwAcescRDsgq6OmH1NLVnKWkJpC3OIZj6rC30oG4QsTFNQEgITCc6M3/q2jxd8KvBL6QAch+dTfb7D0MxwSt3KNiKCsv0oWeNhgmYSiHOWCQo+nXaOy2nLRK2zLnCJmDuiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWnrwXkE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27577C32786;
	Wed, 12 Jun 2024 05:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718170558;
	bh=7/kYWCF8jY7m1ZBPFDMBniSgK9LVHVKaxhjwzGyb8us=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dWnrwXkEnKHjBLlRSbQZvgo5mi+6dMoEVTImNg7Nk0J7DWA5pUMsgJTMLl1gfMVYf
	 9XZJgVX88hvwVwx84tFW27SNrm+eVJ7D725oLvDz8VyEDPxdeh++fndHtoP4MjJEIA
	 rjnges9Tq4fM3qcFnacFps+ZmC2Hnh8o3IAGrbcWqQruXYh1zrsAQ3BbgjASL0dTIz
	 JIGgJzz0huhpUaHohhyLhIcXbeUF7YUrdH8L0MCWII+kW1KJ1gqAOj6f/ELDX+aZFl
	 OdDsJfHAJwXsKW8qMIaOWprlDQvmSDhN4xJPvnTCLo5ipJjRxmAME/lVfbm4crk9vc
	 V76ipllYQe4HQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe3fb5d4dso4804731fa.0;
        Tue, 11 Jun 2024 22:35:58 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywaro0O0GUN9rvWbAc2DBcHz5+s+vjFwVVrD/mVmW1Dod0OAnfC
	RB8XkHwclZcbBxcrOuxm5EnjCfgTAGNin203YAIOJUK+rcJ87E26R64du4Yo8cl4S0ROYmhGvKH
	Mi+/OEczgJav+yfwVEFwE49CIV0M=
X-Google-Smtp-Source: AGHT+IEG2QnYvDxM3+qCzBzqjMIbe4/nF96oijHgNPZjcXlAGGyny1QXdyzIYF+epIQIm0Mqr3lqT71xJ7JTMk0rIIk=
X-Received: by 2002:a05:651c:d5:b0:2ea:8895:ae8c with SMTP id
 38308e7fff4ca-2ebfc135cc5mr2060731fa.24.1718170556765; Tue, 11 Jun 2024
 22:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611175536.3518179-1-masahiroy@kernel.org> <20240611175536.3518179-7-masahiroy@kernel.org>
In-Reply-To: <20240611175536.3518179-7-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Jun 2024 14:35:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQFZu=z1ZT=6OUT8uiDN8mZS1++xGCNKc98Hc299cYqrQ@mail.gmail.com>
Message-ID: <CAK7LNAQFZu=z1ZT=6OUT8uiDN8mZS1++xGCNKc98Hc299cYqrQ@mail.gmail.com>
Subject: Re: [PATCH 06/16] kconfig: refactor choice value calculation
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 2:56=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Handling choices has always been in a PITA in Kconfig.
>
> For example, fixes and reverts were repeated for randconfig with
> KCONFIG_ALLCONFIG:
>
>  - 422c809f03f0 ("kconfig: fix randomising choice entries in presence of =
KCONFIG_ALLCONFIG")
>  - 23a5dfdad22a ("Revert "kconfig: fix randomising choice entries in pres=
ence of KCONFIG_ALLCONFIG"")
>  - 8357b48549e1 ("kconfig: fix randomising choice entries in presence of =
KCONFIG_ALLCONFIG")
>  - 490f16171119 ("Revert "kconfig: fix randomising choice entries in pres=
ence of KCONFIG_ALLCONFIG"")
>
> As these commits pointed out, randconfig does not randomize choices when
> KCONFIG_ALLCONFIG is used. This issue still remains.
>
> [Test Case]
>
>     choice
>             prompt "choose"
>
>     config A
>             bool "A"
>
>     config B
>             bool "B"
>
>     endchoice
>
>     $ echo > all.config
>     $ make KCONFIG_ALLCONFIG=3D1 randconfig
>
> The output is always as follows:
>
>     CONFIG_A=3Dy
>     # CONFIG_B is not set
>
> Not only randconfig, but other all*config variants are broken with
> KCONFIG_ALLCONFIG.
>
> With the same Kconfig,
>
>     $ echo '# CONFIG_A is not set' > all.config
>     $ make KCONFIG_ALLCONFIG=3D1 allyesconfig
>
> You will get this:
>
>     CONFIG_A=3Dy
>     # CONFIG_B is not set
>
> This is incorrect because it does not respect all.config.
>
> The correct output should be:
>
>     # CONFIG_A is not set
>     CONFIG_B=3Dy
>
> To handle user inputs more accurately, this commit refactors the code
> based on the following principles:
>
>  - When a user value is given, Kconfig must set it immediately.
>    Do not defer it by setting SYMBOL_NEED_SET_CHOICE_VALUES.
>
>  - The SYMBOL_DEF_USER flag must not be cleared, unless a new config
>    file is loaded. Kconfig must not forget user inputs.
>
> In addition, user values for choices must be managed with priority.
> If user inputs conflict within a choice block, the newest value wins.
> The values given by randconfig have lower priority than explicit user
> inputs.
>
> This commit implements it by using a linked list. Every time a choice
> block gets a new input, it is moved to the top of the list.
>
> Let me explain how it works.
>
> Let's say, we have a choice block that consists of three symbols:
> A, B, and C.
>
> Initially, the linked list looks like this:
>
>     A(=3D?) --> B(=3D?) --> C(=3D?)
>
> Say, '# CONFIG_B is not set' is specified by KCONFIG_ALLCONFIG.
>
> B is set to 'n', and moved to the top of the linked list:
>
>     B(=3Dn) --> A(=3D?) --> C(=3D?)
>
> The randconfig shuffles the symbols without a user value.
>
> So, you will get:
>
>     B(=3Dn) --> A(=3Dy) --> C(=3Dy)
> or
>     B(=3Dn) --> C(=3Dy) --> A(=3Dy)
>
> When calculating the output, the linked list is traversed. The first
> visible symbol with =3Dy is taken. You will get either CONFIG_A=3Dy or
> CONFIG_C=3Dy with equal probability.
>
> As another example, let's say the .config with the following content
> is loaded:
>
>     CONFIG_B=3Dy
>     CONFIG_C=3Dy
>
> The linked list will become:
>
>     C(=3Dy) --> B(=3Dy) --> A(=3D?)
>
> Please note the last one is prioritized when a decision conflicts in
> the same file. This is reasonable behavior because merge_config.sh
> appends config fragments to the existing .config file.
>
> So, the output will be CONFIG_C=3Dy if C is visible, but otherwise
> CONFIG_B=3Dy.
>
> This is different from the former implementation; previously, Kconfig
> forgot CONFIG_B=3Dy when CONFIG_C=3Dy appeared later in the same file.
>
> In the new implementation, Kconfig remembers both CONFIG_B=3Dy and
> CONFIG_C=3Dy, prioritizing the former.



prioritizing the latter.





> If C is hidden due to unmet
> dependency, CONFIG_B=3Dy arises as the second best.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---







--=20
Best Regards
Masahiro Yamada

