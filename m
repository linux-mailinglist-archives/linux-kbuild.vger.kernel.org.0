Return-Path: <linux-kbuild+bounces-1333-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9586D88C80E
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 16:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A8361F80D58
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 15:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0EB13C9AA;
	Tue, 26 Mar 2024 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmC9PRCr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4C13D50C
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711467726; cv=none; b=oFSHXE9/QR+RqZq9H+8sS4pW134cDxKuzxYLsmz73Eacg/AiTljgibrZ6iL+S+uq1/nYMSjWMQJFs4D5diz0y2hVOCAFTobXs5iHw8WnQSjleyXPNu8njhE5+waJFfxMgmzLQN8jsSTgKorHt2gflD6+BN+A4aR+owPP5slleGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711467726; c=relaxed/simple;
	bh=WjxorTNm16pmawi2QrpcbXtzMMk9UnMvAB/SISpbzEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjhMBLoDmJ8HZZYa3fpTsNGMepmRp/27RTxx+9pesCtFfHujWfVLsBk3fWxlUSmgzUscDDl6WuYqR5vy6ELIImrAk0iIr86psSL8kKPPkH7utlv2siUzgpZUiSFUzjgKVaZJlTGpLHCCMvI23zbmkSyPS2CQEhlqmXVeOCZ7llk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmC9PRCr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C06C43330
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711467725;
	bh=WjxorTNm16pmawi2QrpcbXtzMMk9UnMvAB/SISpbzEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KmC9PRCrEZu4SiGvHWvtThKdCe+eW/4/k6AIv1L2zpXChZqs3VPvY7bItW1xXmBi8
	 cHwdxcgZEgsR8wbT3F8gmDqX7prdF26/kSAIR+bShkk7ILh2RyBU+BTbhwClMu3+S/
	 xS4ZK8da8lj9q1ezivMGAI9+QiFFWyoHB7devsqYZxmpSrgFEFMuqXad2Zpmbx8wNN
	 teCaYwpD0Ne2kSuu9+HWcclzmsUsVBJLl/O/qf3krP6HyMt+MVE1lmI4pKXT/IQ3t2
	 Dj+t1x1IIIUZHWC9esARSVLXi7sQMODkPxTfDxGlmFcADXYpmVBW5odt24C5p1lXRh
	 ZLdSmfNtT3ErA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d475b6609eso71433051fa.2
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 08:42:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YyNNuFE74evuak/D1g4n7swqdgoIslYEy8IYENPGQ3ob55BbDV3
	TMpUwhM/KSNDCkxDyt6rIjcb6IB6CkgX5+6HTRLGIZxJ/SGkesaAFPQDSEmPEGdvl6prsY7mjdq
	9QC1pHSd43sXQFMoRM1qpL0hdYag=
X-Google-Smtp-Source: AGHT+IGBjbfnutWizOG4D+Y2Ce7JcBLvcXREvmL/5vUZ5omtP/DI9YkkoY1H5oFNMwi+Mh0v0WtWKqlJd4crDHOnXGo=
X-Received: by 2002:a2e:3613:0:b0:2d4:6bc3:192b with SMTP id
 d19-20020a2e3613000000b002d46bc3192bmr6902404lja.31.1711467724641; Tue, 26
 Mar 2024 08:42:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
In-Reply-To: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 27 Mar 2024 00:41:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNASeOf2ythmXoFS7-fdE40R1BX=JT=v4SmHxq61Hww1Vqw@mail.gmail.com>
Message-ID: <CAK7LNASeOf2ythmXoFS7-fdE40R1BX=JT=v4SmHxq61Hww1Vqw@mail.gmail.com>
Subject: Re: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	Karolis Mituzas <Karolis.Mituzas@imgtec.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Carlos de Paula <me@carlosedp.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 8:59=E2=80=AFPM Matt Coster <Matt.Coster@imgtec.com=
> wrote:
>
> From: Karolis Mituzas <karolis.mituzas@imgtec.com>
>
> This matches the behavior for arm64 [1] and prevents clobbering of
> vmlinux-${KERNELRELEASE}.




What problem are you trying to solve?


Why is clobbering vmlinux-${KERNELRELEASE} a problem?







--=20
Best Regards
Masahiro Yamada

