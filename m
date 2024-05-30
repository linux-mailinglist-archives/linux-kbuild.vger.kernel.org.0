Return-Path: <linux-kbuild+bounces-1956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 184BB8D4DFB
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 May 2024 16:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B57471F2431E
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 May 2024 14:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AC3176231;
	Thu, 30 May 2024 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTHA7zTK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB34F1865C;
	Thu, 30 May 2024 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717079446; cv=none; b=ioFqkpcCNrphXAyKDqbcJU2XL/FqQoZxdOAYJlTU0M+cxCQZ6JLieRNaHgXdhXlmCgmDrqutL1P71O2qDRuwzN6Ef4WMANAco3qiDz4+YAkNz43XMB/c1PzWgfqqeaLZwDB9Wzhms28Stl4N2J/tzyQJwDwVyK/FYEzzlWHq2KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717079446; c=relaxed/simple;
	bh=nlTzN1tiBIJlOFBCsVeFUoLFdlHQE7Fcao9Gp+nkCmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9liXm86TwAYb3Tbr1kKxhePfYCSzh3srQH26FuJRXSUOaGITCaw4J5L6jPdOfZcwTTTGesR/8MS5XWD8NnwRdsLeTsr9yFrTrhACzW87I/GbSkhwZtyTgNX86R3uSivGD2jUWcFPEriBTQvV65zdV3hyLwmRdPdYFIDs3QGk9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTHA7zTK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B99FC32789;
	Thu, 30 May 2024 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717079446;
	bh=nlTzN1tiBIJlOFBCsVeFUoLFdlHQE7Fcao9Gp+nkCmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VTHA7zTKVN68bEXgmIsAJhwKfC8ys4e8eUcZVHx21wSXUoVvevH85nZp924bXGAs9
	 Tp7BAesP3yVMnaZeZdPmjc5LOIQ186aPRN4eo5+C/B2WLVZCGueFcByvtVe/tFwhre
	 qFECkQi/JUsxBYtaRgY2N3UWpqvw181TEolkPuW5xzA8Tt8ToGgNlGwVJ18KoGgqCq
	 rc6lWoq3W2CgjLO1s9jru8n26SFNA20NYmgfJJgtQKoL0Tz2gDtWc/d8VRc5CDcVcG
	 HChuAvDKnXEOo/Ti8XrFXfGEVtr6DWAmhLRojFG1BTRtwOaU65m+SlWFIVQsVgFM8D
	 /yq1jJ51IMldw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e3efa18e6aso8165631fa.0;
        Thu, 30 May 2024 07:30:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7uMM66G+rY/Ee6t9GBydEdtbTAT9dux1omt5gmIDEa9+iETbl81UzxztVN/lnEUWa/Gs+00O9qsFMgrSlFHqKV6NryaLzSVLFbeWEp+/iIM2Ahu6Ah1GIUS/L2euTCp8OlBbz
X-Gm-Message-State: AOJu0Yxk5yg6XCoZ26LuP56DyvHILTS0A+STiL7XUpNYQOt4SxO12+8M
	jmi9QcAYwlN7xPtx+vTj9byd7uWYMjm2IyBFUO2TF0PB5cTLFOieaR+NdwuqhSDFUvFAJAlb96y
	vHG7j9J1unn8EMgunZ+KtU2xuJa8=
X-Google-Smtp-Source: AGHT+IE3BY/0eADZ4sxaHelrIE27Nau5aVVM2SSVHa/wUuA3Ak+SLLHCytmmNO8hfDW35ntq0ntMVqup0kboHx5DnH0=
X-Received: by 2002:a2e:9b59:0:b0:2e9:65b3:49f2 with SMTP id
 38308e7fff4ca-2ea84c31c69mr5373901fa.8.1717079445293; Thu, 30 May 2024
 07:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528113243.827490-2-maennich@google.com>
In-Reply-To: <20240528113243.827490-2-maennich@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 30 May 2024 23:30:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS-sCFCh6Hyrj4qra6b-Bx4HjQLt_FfJb=FB2xUWE_YiA@mail.gmail.com>
Message-ID: <CAK7LNAS-sCFCh6Hyrj4qra6b-Bx4HjQLt_FfJb=FB2xUWE_YiA@mail.gmail.com>
Subject: Re: [PATCH] kheaders: explicitly define file modes for archived headers
To: =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, gprocida@google.com, 
	stable@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Joel Fernandes <joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 8:33=E2=80=AFPM Matthias M=C3=A4nnich <maennich@goo=
gle.com> wrote:
>
> From: Matthias Maennich <maennich@google.com>
>
> Build environments might be running with different umask settings
> resulting in indeterministic file modes for the files contained in
> kheaders.tar.xz. The file itself is served with 444, i.e. world
> readable. Archive the files explicitly with 744,a+X to improve
> reproducibility across build environments.
>
> --mode=3D0444 is not suitable as directories need to be executable. Also,
> 444 makes it hard to delete all the readonly files after extraction.
>
> Cc: stable@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Signed-off-by: Matthias Maennich <maennich@google.com>
> ---

Applied to linux-kbuild.
Thanks!



--=20
Best Regards
Masahiro Yamada

