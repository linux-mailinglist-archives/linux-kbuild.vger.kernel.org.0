Return-Path: <linux-kbuild+bounces-131-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D697F5971
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 08:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4245281821
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 07:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CE1171C0;
	Thu, 23 Nov 2023 07:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQQ3yDji"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308F217998;
	Thu, 23 Nov 2023 07:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACE2C433CA;
	Thu, 23 Nov 2023 07:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700725154;
	bh=dnmMd/Gc51YGnbhok9mTHLUrlL/9RJjKE3NYV+vKfVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CQQ3yDjiaKQqXGl+F6WcMG1ruJBisZBke27GVjPRyHrQlhGpCyvtEUrGUWSpj4hCk
	 8ZqRP+sP3sSSqHK2zhMDkB0WGWRRPV3y+hFZogyl8aOCzDOoClk0xEMFgiBGc/oFmz
	 0IRp62rFN9A1VDadsEyDaD0ETrwL9TdooE7LzY4naj9tMp6UnzsBzgS7ajz/1Ghwr9
	 9mgK6xbwT+xtfo/UMTJ2bpznMC9sUmUxU6WY43I0Uurps2e/P9mxE/ba2a3GIAwAlA
	 LOLhilZLVDO2sd7yLrNdgdKY/pXI3UkhyjUUqKD3hWhpFmlOPXke2dKDX1bh2/HbHv
	 UdIzPBThbuZHA==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1eb39505ba4so436592fac.0;
        Wed, 22 Nov 2023 23:39:14 -0800 (PST)
X-Gm-Message-State: AOJu0YzU2M5Z7lhvk9uyvpKe2Jm6PtQNs1UrtebJbYt1q7jMzKFIloxS
	MKJkt2HQ6KzlTnkOymQVSF0C5xK2KMqdHOeGWb0=
X-Google-Smtp-Source: AGHT+IE/aHZ2CqZK023YoKIf3yCJ3PHVdOqmqOE42F0qp4WJHAcnHX3ZkplDwoELnnYLxCAA2La8Da6akCN0EmpAj1w=
X-Received: by 2002:a05:6870:6c0a:b0:1f0:d96:8d9c with SMTP id
 na10-20020a0568706c0a00b001f00d968d9cmr6123126oab.9.1700725154090; Wed, 22
 Nov 2023 23:39:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
In-Reply-To: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 23 Nov 2023 16:38:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
Message-ID: <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
To: Rob Herring <robh@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 7:12=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> This series adds support to set the dtc extra warning level on a per
> arch or per platform (directory really) basis.
>
> The first version of this was just a simple per directory override for
> Samsung platforms, but Conor asked to be able to do this for all of
> riscv.
>
> For merging, either I can take the whole thing or the riscv and samsung
> patches can go via their normal trees. The added variable will have no
> effect until merged with patch 2.
>
> v1:
>  - https://lore.kernel.org/all/20231116211739.3228239-1-robh@kernel.org/
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


There were some attempts in the past to enable W=3D1 in particular subsyste=
ms,
so here is a similar comment.

Adding a new warning flag to W=3D1 is always safe without doing any compile=
 test.

With this series, it would not be true any more because a new warning in W=
=3D1
would potentially break riscv/samsung platforms.

Linus requires a clean build (i.e. zero warning) when W=3D option is not gi=
ven.






> Rob Herring (4):
>       kbuild: Move dtc graph_child_address warning to W=3D2
>       kbuild: Allow arch/platform override of dtc warning level
>       riscv: dts: Always enable extra W=3D1 warnings
>       arm/arm64: dts: samsung: Always enable extra W=3D1 warnings
>
>  arch/arm/boot/dts/samsung/Makefile  |  3 +++
>  arch/arm64/boot/dts/exynos/Makefile |  3 +++
>  arch/riscv/boot/dts/Makefile        |  3 +++
>  scripts/Makefile.lib                | 16 +++++++++-------
>  4 files changed, 18 insertions(+), 7 deletions(-)
> ---
> base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
> change-id: 20231122-dtc-warnings-968ff83a86ed
>
> Best regards,
> --
> Rob Herring <robh@kernel.org>
>


--=20
Best Regards
Masahiro Yamada

