Return-Path: <linux-kbuild+bounces-3514-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A3A9750EB
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 13:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2790C1C22528
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 11:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C7B186616;
	Wed, 11 Sep 2024 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gr9Yifsz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BD515383B;
	Wed, 11 Sep 2024 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726054613; cv=none; b=mXptKiybKfAUpiMnFks+Tg5oztO4AAjG/UrB6JT9Lff/Xst179t5o7E1G/gap9DY4pkw0Oymb5l3rBpPruRiKPHWO3KOOcqF8Br52M60D9H/8GApeF1f7j8Sl8omoIaDEQhruEV6z0xfI2+OC3YnQLxiet2zwRiwkV43BR9U/0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726054613; c=relaxed/simple;
	bh=uP/hcLJEZP/TJAHD54TuMyibOkB264Tk+1K+dnbHQNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0t+ZO07gb1u3DAnlMk/vzqTZQKK1b73cfDBKF/Uhsr0NCCY/wafI5XMWh/vckoBvGMiKhOd6WmHbdSntC8rgKuS1lKefw0Ednwt4bwO8WIaPwXSaEnUC3L6ZHg0XY216kB/haE7Q6atEBRN3wa8jrQUMt5nMK1UaGd7MLIPY94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gr9Yifsz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E578EC4CEC5;
	Wed, 11 Sep 2024 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726054612;
	bh=uP/hcLJEZP/TJAHD54TuMyibOkB264Tk+1K+dnbHQNU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gr9Yifsz8Ksokkq8DxLzqU+ief/zlD3ncB1W0CSUW1Ex8Oe7yYEzr7Ld3BorBSYws
	 mLuATJRkXdxu3wJTHiz6IO4CWufVt9sD0qZDsCW9m36XlyRBEoc9PUwnQCu/UCPUYa
	 cqmzth7TEAFowygO75WfY6vFO/HQBilumcctC302/Zyq5cJuhoJgKmUYhtTS+LFeo3
	 kNJrqs2k+CTnYmSEQP2pYu5qWGQx3AcUDE7TJuohKrN2i30v13ad12MXCyJSkztKiC
	 X97AYfrohWXGAs/6g56Fj9Xbr7uDW2jS9VaPHRjjjooMdMCdrEN92QWxVKzuV/UOXf
	 5mZ8JnISrwFKQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53654dbde59so802070e87.1;
        Wed, 11 Sep 2024 04:36:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJG3qb0JQBx3vhm4JZPnd8XOpjvWMOcZGMdvAqjSF5D6RPysbpUT7vvWxN2YRCS+VkxXEbB88uQ7YaSSYl@vger.kernel.org, AJvYcCWRVTo/BPTem9OOyKFb0Sd2XIKVC1NANgKnAVL307ojbdFOuR/HNEiX2i9+8O6Hd/I9nztppEbDRdw=@vger.kernel.org, AJvYcCX6JVCIWDFv/7j5gPAOVSdiSqkkkXrkfsmR+QxulI/iy0opxjCQhjHvu6wnkutQEBQnugPLCpmXlX/ZxSyz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlvn6tLZaEdaalj9khL0APzGPto0kUAWcsESDdmw8AEgHtu6SR
	ioxNeRaH4Dq22Xqjx20DEeJQmUZB1sVYyxhcmHIZkIqRYKuNl+wKfIxNge6p9p/+n/1akbGnuk4
	Q2lwdzNk1xtAoG/TzJ1Zs6XiTgM4=
X-Google-Smtp-Source: AGHT+IHxLATiP9s2eKyDMW4ZO3zMT6QEFMY6J+Pt8BpxrhbUuRZHO7YwI9kdop2ZWM2lvEm9VX1t02p3BarDboW3dHk=
X-Received: by 2002:a2e:888e:0:b0:2f4:1d7:e286 with SMTP id
 38308e7fff4ca-2f7726f8ac5mr19638101fa.18.1726054611617; Wed, 11 Sep 2024
 04:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911112017.14427-1-3090101217@zju.edu.cn>
In-Reply-To: <20240911112017.14427-1-3090101217@zju.edu.cn>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Sep 2024 20:36:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNARw7aRYEfAJsgctJQVhHvc711ARMZDCFAkHeqkRv5nncw@mail.gmail.com>
Message-ID: <CAK7LNARw7aRYEfAJsgctJQVhHvc711ARMZDCFAkHeqkRv5nncw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Support separating source and output of the
 external module
To: Jing Leng <3090101217@zju.edu.cn>
Cc: nathan@kernel.org, nicolas@fjasle.eu, corbet@lwn.net, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 8:20=E2=80=AFPM Jing Leng <3090101217@zju.edu.cn> w=
rote:
>
> Revert commit "9a0ebe5011f4", originally when compiling external modules,
> the compiled output can be separated from the source code with the
> following command:
>     make -C <kernel_src> O=3D<kernel_out> src=3D<module_src> M=3D<module_=
out>
> It is used to https://github.com/lengjingzju/cbuild-ng (inc.mod.mk).
>
> But "src" is an internal variable, so this patch adds a variable "S"
> which is specifically used to change the default value of "src".
>
> Fixes: 9a0ebe5011f4 ("kbuild: use $(obj)/ instead of $(src)/ for common p=
attern rules")
> Signed-off-by: Jing Leng <3090101217@zju.edu.cn>


NACK.

Always sign, every time I receive a hack like this over and  over again.


--=20
Best Regards
Masahiro Yamada

