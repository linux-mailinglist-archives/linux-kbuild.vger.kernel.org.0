Return-Path: <linux-kbuild+bounces-4240-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DB59ABAA0
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 02:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 851F41C22EFB
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 00:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6857C1B813;
	Wed, 23 Oct 2024 00:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gXmb9pwl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch [185.70.40.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC219BBC
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729644246; cv=none; b=LoaJOHyiqS5NkF4BHXzLRahB1uz3eyPNKP1UNQZBaJM7q8ZoilPguKGkuluUQqU8pSmiGbXe9k/yfmUs8BR4S+8Nr+igu95uiBMo+0WTwLSRp9WXtMJ8VCDX//1FeQJUOsQPlYKRyhPsQUxupvN6Rh7klAg0tQgEJPV/AoVe+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729644246; c=relaxed/simple;
	bh=yXgmq1BR3VIXZKYZe008gdI8Cfjzhsiou5L2Rb269o0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6jwD2Vq+YEJ6r/7GbFu5JQDBtDczVdVmilI/sl3jt5IewIBN6Uk7DSs2o0no+NX9MY6Ljst+t+A67pMMnmpRXkPW0MgX8T1kS0BLrMQwlxJuMbQ/LG2pPop5qh4I2PTHhGcoyhgVOLEIQvrHw1MzYwk7/8KESq8b6ALXiwMdUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gXmb9pwl; arc=none smtp.client-ip=185.70.40.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1729644236; x=1729903436;
	bh=yXgmq1BR3VIXZKYZe008gdI8Cfjzhsiou5L2Rb269o0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gXmb9pwlvx0UwV2UeaD4SyZmwijc3TRSsEITqiF6pZMX3qf0YY94usiKLSRqzx9gY
	 GnCxM+QcmlKPTJZX5G6qTasVM262/pClKcBUoDigMh1A8Vqvh+FKgjkgiDF6nmUxeF
	 11rHUgaPv3Ai7wCRsMTAD6pcIZQBrNN/2f7V307zUBESlcFcbimsO0Y081+KgUvZlr
	 coAF3VbEIvwFfWBQl+MPEb2K2IIZbtQz3MHx0lcnBtAJkjNOSX5FJIxp0mUSzQE8oT
	 gYg+6+zX3zDPncvMHeBf//yYZiw04F1m14Nbmab7jbfADmmrBWhgwr7byK2YW9quGE
	 poDOtBPoCBopg==
Date: Wed, 23 Oct 2024 00:43:51 +0000
To: Nathan Chancellor <nathan@kernel.org>
From: Koakuma <koachan@protonmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
Message-ID: <etezvjy_HnDpgOTBrzap29if1ChFBhl1RawcNJK3UAsFk6i_g_cyHoz7hlqfYqASgJZ97W4HxnGA-nbCXL73pIRN9tUKUttAp1JefMRp8rs=@protonmail.com>
In-Reply-To: <20241022200732.GA487584@thelio-3990X>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com> <20241021201657.GA898643@thelio-3990X> <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com> <20241022200732.GA487584@thelio-3990X>
Feedback-ID: 6608610:user:proton
X-Pm-Message-ID: b87481f0a5c05dc56ab15ff9c4c1b68a54acc11e
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Nathan Chancellor <nathan@kernel.org> wrote:=20
> Koakuma might know more than I do but I did not test either the
> integrated assembler or the rest of the LLVM tools; I only tested clang
> for CC. As far as I am aware, that has been where most of the effort in
> llvm-project has been going and I think there are probably other fixes
> that will be needed for the other tools. The command I tested was:
>=20
> $ make -skj"$(nproc)" \
> ARCH=3Dsparc64 \
> CC=3Dclang \
> CROSS_COMPILE=3Dsparc64-linux-gnu- \
> LLVM_IAS=3D0 \
> mrproper defconfig all
>=20
> I see this as more of a stepping stone series to make testing those
> other components easier as time goes on, hence why I did not really
> consider user facing documentation either like you brought up in the
> other thread.
>=20
> Cheers,
> Nathan

Ah, pardon me for forgetting to say it in the cover letter.
But yeah. At the moment only clang as CC works, all other LLVM tools are st=
ill
incomplete and need some work to be able to build the kernel, so these patc=
hes
indeed are intended as stepping stones to make it easier to work on
the rest of the tools.

I'm not sure if I should update the documentation now given that LLVM suppo=
rt
is nowhere near as complete as other architectures, but I'll do it if neede=
d...

