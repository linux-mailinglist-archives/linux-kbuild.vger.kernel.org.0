Return-Path: <linux-kbuild+bounces-173-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF647FA1E3
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Nov 2023 15:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7747B280F4A
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Nov 2023 14:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32AB3067D;
	Mon, 27 Nov 2023 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2aOf09I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8A2FE0F;
	Mon, 27 Nov 2023 14:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12D1C4AF73;
	Mon, 27 Nov 2023 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701093816;
	bh=KCZKisXR1n78+RfI83KrbOl2Cm27WXfa6iz/K1QPJPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a2aOf09I75DdKUvvNJhSkD9GQ6WGBE1jrWs9pDpOCpwNhS0TbxHWoRRSn9ck5Mhc+
	 gZca7EfxNyQp1inBZAfRqD47gcVR/2j2P6kSPCkih7i49cwEZ7pOo/irs5zW0XlMiF
	 9t3wBImUkMRmLnPX2jf+oEXtdtP3HdA2v5iDopicDPaZiELC/QCHIid2KwS9yeW8Yk
	 sDtIdNfLMQ2+8k4BxzPSCP/qhcQirHg9eszKNpXUSGX6VzAN3kehB6MI8Qj+xuPUcx
	 pQuQyJsiwfL3/G2Nx7qvojox0+j3lTPPcUWpxZDJzU/NZmi7fMpyxZ2ILAb/+cKK1F
	 d3or7UmfDwFkA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso5863772e87.2;
        Mon, 27 Nov 2023 06:03:36 -0800 (PST)
X-Gm-Message-State: AOJu0YzKhEgsCPjAFuBPAKg2p3Slb4kxARX4ofB65cuZ1KNRZXMMxL6X
	cxHKF5Lr8XxvaH6WIGu5pOTim5HmUO/Pp39UpA==
X-Google-Smtp-Source: AGHT+IHHn/0tbob/Zvt/F/xavRxwGiGH47uaym2qWQ3/Wvw2D2ahyijP+Gg34c/5ffttsPErtLGmPrZcuMVpkTAoeU0=
X-Received: by 2002:a19:7514:0:b0:4fb:9168:1fce with SMTP id
 y20-20020a197514000000b004fb91681fcemr7182211lfe.59.1701093814870; Mon, 27
 Nov 2023 06:03:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org> <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
In-Reply-To: <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Nov 2023 08:03:22 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+N0GxwZ2YmspEzfiuGOw7M+DmYkyhLgaYtk+Ov2ycY_A@mail.gmail.com>
Message-ID: <CAL_Jsq+N0GxwZ2YmspEzfiuGOw7M+DmYkyhLgaYtk+Ov2ycY_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
To: Masahiro Yamada <masahiroy@kernel.org>
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

On Thu, Nov 23, 2023 at 1:39=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Nov 23, 2023 at 7:12=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > This series adds support to set the dtc extra warning level on a per
> > arch or per platform (directory really) basis.
> >
> > The first version of this was just a simple per directory override for
> > Samsung platforms, but Conor asked to be able to do this for all of
> > riscv.
> >
> > For merging, either I can take the whole thing or the riscv and samsung
> > patches can go via their normal trees. The added variable will have no
> > effect until merged with patch 2.
> >
> > v1:
> >  - https://lore.kernel.org/all/20231116211739.3228239-1-robh@kernel.org=
/
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
>
>
> There were some attempts in the past to enable W=3D1 in particular subsys=
tems,
> so here is a similar comment.
>
> Adding a new warning flag to W=3D1 is always safe without doing any compi=
le test.
>
> With this series, it would not be true any more because a new warning in =
W=3D1
> would potentially break riscv/samsung platforms.

The difference here is the people potentially adding warnings are also
the ones ensuring no warnings.

> Linus requires a clean build (i.e. zero warning) when W=3D option is not =
given.

Linus doesn't build any of this AFAICT. We are not always warning free
for W=3D0 with dtbs.

Rob

