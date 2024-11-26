Return-Path: <linux-kbuild+bounces-4863-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7129D9105
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 05:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42E24169C21
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 04:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822542107;
	Tue, 26 Nov 2024 04:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHN2OJzc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B20110E6
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Nov 2024 04:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732595210; cv=none; b=g97mFi/zWOy17szD6eplzy83OcvwubKF/g1K1wk5/7tckTAqSRUHH0aGJJ+Jtl59WF8fUEVgmuyNoP+wZgoW6/IrZ8UVqOqSFmI5siW56OvkGAEyObZcTJOBc6/TBWFF6kiH1aIdD/8Eu2pgjmV2jcVuaHSOsostK+gL1sVZJ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732595210; c=relaxed/simple;
	bh=rS9TrH8Ljjgoh7Psm77vX4a8h4L+yZv7na58TWyZD0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZ8GWQLuLmuykq7ZFGUJeeCxw0VCEVAitPGjkYqL/SuTHgJymnByjl9o/LQBR9X7To0uYPo7T3LjNELNZmxyGaPLVa4gwdrgJS9eMz0zXudtf34iLzb6xeh1bb10qF4vj+3gDQ9SmQjG71U3LBULkymH2vPBAoUp0lGbvKshyak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHN2OJzc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F353EC4CECF
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Nov 2024 04:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732595210;
	bh=rS9TrH8Ljjgoh7Psm77vX4a8h4L+yZv7na58TWyZD0Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iHN2OJzc4Gtt7o3oNsbQzq2jcxvIYMz3lNv/eGEufXVyp6oTk2e2Ys3eTseTAxAVN
	 r+WX2RUo5Dm83p1i9Hgj/Zwel2Rjl/gSv8iGUbSkquBiWBSbv0zRB+mClgGITAay7l
	 uA//IMJYc4ZYEIzGG2v6pR5ZjEN1uVjg+sv3DawDE1ie28gKkg7JlikVQ1JYe8bMDz
	 z99f3Kf4k4N4QXQxnKOA2iJHjm1HWGuJH0CK39/tkEygzWQ4WYq6UkoWJwnGlKfYeJ
	 D2GSXm/aa3nzXvdlw2Aq/DE4wycYuwu1NyG/M1aJm3rzkunynE+S40E6TzQKgmn1Ny
	 ziAxWySThn29A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53de6b7da14so1378702e87.0
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Nov 2024 20:26:49 -0800 (PST)
X-Gm-Message-State: AOJu0Yz3lseh2pvXW/ZL2FQcR9f1Aru2hSxv+9334yIWPI0qkcfStu1g
	AbC9XdP7v+QeV1O6QFN3MD8e4enB5oXj26qZBVmPvP4zu93ewnM/ug85hYnB2TeCUf1oSvp7YdR
	iD+IyY7C9euueBLy1TbwwoGnKZNs=
X-Google-Smtp-Source: AGHT+IE2dldlTyz6sFW2PqW0RqrZ7eshUrDLP/LRwPTdAnajkbv0Jsm292yvVtYsZRD75/5WrpSpRHJGinzeb7sJaAc=
X-Received: by 2002:ac2:4189:0:b0:53d:d3ff:7875 with SMTP id
 2adb3069b0e04-53dd3ff78ebmr5752880e87.22.1732595208649; Mon, 25 Nov 2024
 20:26:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241125171800.1131761-1-jsbronder@cold-front.org>
In-Reply-To: <20241125171800.1131761-1-jsbronder@cold-front.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 Nov 2024 13:26:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARCB0Ce=gYjEZE1uSP0_Oyht91zxTQ1RZrMiChe3vgy+g@mail.gmail.com>
Message-ID: <CAK7LNARCB0Ce=gYjEZE1uSP0_Oyht91zxTQ1RZrMiChe3vgy+g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use lz4 instead of lz4c
To: jsbronder@cold-front.org
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 2:18=E2=80=AFAM Justin Bronder <jsbronder@cold-fron=
t.org> wrote:
>
> lz4c has been considered deprecated by upstream since at least 2018 [1]
> and has been disabled by default recently [2].  openSUSE Tumbleweed is
> no longer packaging the deprecated version and others will likely
> follow.
>
> Going back as far as Ubuntu 16.04/Fedora 25, both lz4 and lz4c are
> installed as part of the same package and both accept -9 to enable high
> compression so switching should be safe.
>
> 1. https://github.com/lz4/lz4/pull/553
> 2. https://github.com/lz4/lz4/pull/1479
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>


I already applied a similar patch.

https://lore.kernel.org/linux-kbuild/CAK7LNAS0VzqcKDz_1ds5qJcASqxVizE3kkdRk=
1Yiidch9KMxEQ@mail.gmail.com/T/#t



--=20
Best Regards
Masahiro Yamada

