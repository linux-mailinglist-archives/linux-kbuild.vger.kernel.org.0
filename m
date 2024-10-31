Return-Path: <linux-kbuild+bounces-4447-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A09B7AEF
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 13:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C434E1F25154
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 12:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4969619B3E2;
	Thu, 31 Oct 2024 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYZGpylW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613319ADA2;
	Thu, 31 Oct 2024 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730378518; cv=none; b=CDyfsahbe7EYfWHdAOK3oPUKPUeV7Ag+iP44GhYqnL6Ms/zRHUcB25Drmp2j8+nFVTt4XD+tN3gfBY1gPNhcfiNP4HVCV5S5wHiRvGkeJs0evMsngICAbKn33SVAv2XtrT4/ubtTzweUOs2zwqImnMubsaBlB7C7iQvUmovU2M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730378518; c=relaxed/simple;
	bh=/LfKvq6dIo9tufP9FTjYMW0VjRLKNdwA70Xr/eIJDGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjSPDsAe1POMQtqLwK16+IQwKy7IzXzX+KAdCwH+8twr05k/1X90lmeUmEjVsdwokJTix+vRW6OpHWx5MfLsKIWwXEmEQCPMHsvOcmDPe0iDCFzM7GYSC7++duoZs3zfINEwMfS7NqsHbXd89Ggxi3cla3tGKGn3WHEFs3fBEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYZGpylW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B648C5811E;
	Thu, 31 Oct 2024 12:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730378517;
	bh=/LfKvq6dIo9tufP9FTjYMW0VjRLKNdwA70Xr/eIJDGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MYZGpylWp5sBs8eWTkTMvRZqLJRA7w7vzWH/b4EJoAGLenPNve5cm31L7k8PpeojB
	 6UdQMZ2vMhtuK1pNqiE+8rXuWDOnjsqipfgGWgCRNnjLKTGqOLuNd+7RRa/pExLcFq
	 v4QfzLKj6j4wKHxqzvliEnzXSAB9o49iV5SOA4mcnR7QE2zuzV895FamG1IPVe8AvV
	 x+pQOEmgieoDjMB5a3QUAEGC68MknYQJcIokNCm69o50ACZbYsIcuXncHvrBgX3gaq
	 UO9Li4kP+4YB8wmzZcaUmUwlV1yHPhJyldeAxZuj3YtB/7qYrfqSKWUMWibMMlEaEl
	 F9ybpq2T0b8Kg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fc968b3545so8874771fa.2;
        Thu, 31 Oct 2024 05:41:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFdPOACRcAwQClWySht/9bDriKE6ofPKUt4AoIb5NhZb5J7eYiII6pJ1bLUx0K0xBENiJWCPARyY+n+jE=@vger.kernel.org, AJvYcCXeGBiakajFlswRgEsMV9Bm1yNR8jeGIPYozsN7YU7dq6FJhBSXJUfIZ0Uyr/mbxNI9ogrkgghFrzr6uaVo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9U9Mo8TUp1rax1tqtdaCWrhlIHiobsT8JGCOcUR2CKIbCVtNM
	e9CS6TlGCrE9NpLYNYMjpbNWVrHqa5TA4W7Sp5JoeQb7Id11nSJLHIfhuynpc9Se5qRQXUbGpjs
	jXc3kpQSx3E4wFbZdu/1qInRK6g==
X-Google-Smtp-Source: AGHT+IEI386DS5UFNGyRCj6MrWuZGhuOwMIP6WJ5Lqrnp7+oZdnvlteZCCFq9nn/s8YBEzEHew3YxWkjWsJhzHPBAvw=
X-Received: by 2002:a05:651c:552:b0:2fb:39e3:592e with SMTP id
 38308e7fff4ca-2fdec709ad7mr17453891fa.19.1730378515977; Thu, 31 Oct 2024
 05:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <269854a8-1041-4ba6-b022-ba8ec15c6b78@alliedtelesis.co.nz> <2a2be28c-fd5e-45b0-8834-611d35c5e6a6@alliedtelesis.co.nz>
In-Reply-To: <2a2be28c-fd5e-45b0-8834-611d35c5e6a6@alliedtelesis.co.nz>
From: Rob Herring <robh@kernel.org>
Date: Thu, 31 Oct 2024 07:41:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJOcRGCtsG5rxYLVVBoMXiM0tN0wCMFa7AaS+CAcQvv7w@mail.gmail.com>
Message-ID: <CAL_JsqJOcRGCtsG5rxYLVVBoMXiM0tN0wCMFa7AaS+CAcQvv7w@mail.gmail.com>
Subject: Re: Building out of tree dtbs
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 4:01=E2=80=AFPM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
>
>
> On 16/10/24 09:16, Chris Packham wrote:
> > (resend without HTML part)
> >
> > Hi,
> >
> > I just noticed with the latest 6.12-rc I'm no longer able to build an
> > out of tree dtb by just copying it into arch/$ARCH/boot/dts (at least
> > for ARCH=3Dmips and ARCH=3Darm64) and running `make my-board.dtb`. I
> > believe buildroot relies on this as well[1].
>
> A simple repro is
>
> make ARCH=3Darm mvebu_v7_defconfig
> cp arch/arm/boot/dts/marvell/armada-385-db-ap.dts
> arch/arm/boot/dts/myboard.dts
> make ARCH=3Darm myboard.dtb
>
> >
> > Is this an intentional change? Is it too late to undo it (or provide
> > an alternative way of having out of tree dts that make use of in-tree
> > dtsi).
> Looks like this is caused by commit e7e2941300d2 ("kbuild: split device
> tree build rules into scripts/Makefile.dtbs"). The conditional include
> of Makefile.dtbs isn't satisfied when building an out of tree dtb.

News to me that used to work. That's not supported behavior. Only
targets listed in 'dtbs-' are supported.

Rob

