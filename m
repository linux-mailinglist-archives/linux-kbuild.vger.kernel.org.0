Return-Path: <linux-kbuild+bounces-2766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C59194412B
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 04:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 027A91F21435
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 02:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4121EB35;
	Thu,  1 Aug 2024 02:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1NzOZIG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22461E4AB;
	Thu,  1 Aug 2024 02:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722479248; cv=none; b=f3q4VXDaiZtkCWrxAC6yJzi6EgtxrIQzbZNj7HVQMrbBakHrGAjMLVfPbCU9Hu/+98QtoTeUkFV7lD3CuMIT93yDVxu/n2jN2n5jRT/1xi66thGxD4F1idwrSy5H+UTDw1NRSbkbiMmLCT67x31VRhEARiKtmZm//cfSk6f41fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722479248; c=relaxed/simple;
	bh=yFcrZhj0VkexDX1C2kvWAWJfbG/Sjjm/3SWECp7+MFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrgmJGpT9QmxRp7+u1YpkSZcJWdMcHoYHksRi/GcYPZ7k/2WEGqNytK074256FFONekiMYzQORy8WTZD+NopFp7xFVA04kybcZSrfWIMFz9OFKFuRein58SjkoXuyG2BtyvB8kvFvHvgIVvpMQAtsy4M07LS6UBxoMm8jtKR5cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1NzOZIG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39AC8C4AF0C;
	Thu,  1 Aug 2024 02:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722479248;
	bh=yFcrZhj0VkexDX1C2kvWAWJfbG/Sjjm/3SWECp7+MFU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o1NzOZIGLKbIXogc4kRnpTrvIBoQL/nZWOTKsbAUw8jdaFmMIw6jIxKGAex/nZaJV
	 sAckBc6sZkLAqywESsH9sbSH18ectp1kgYMEzvR4yXwgPbm6R2zxO7o6OMQ7I6HcHN
	 xLYCxeqXRrRu0Y/Qw03CJ6NMifZZ6pXNPIa4MliytO03dT0emvgGsXoFWo/pFc/Z5X
	 sZ7e/frKQbBrRw15jOIGtuL2JbNfaHTQ3Llw1tc3OT6/U94ChCh6/wdd1RR2WSmcSn
	 q8k/BxJZTasw1oj6LfYB7ieq0/6hEfhZHrl8VugyIy6ov8F7vJ/FUloRjRfUwxhAUp
	 dTOfJ88h0Y60Q==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efd8807aaso9651103e87.3;
        Wed, 31 Jul 2024 19:27:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4KQy9mZrV+VVZ1AslSoyvIPxkNLASVCSiF5eTah3KXYxEWJ98iVF65svj7gNqNuk2r6eRXeZ+4hp6Txf8v4EaErAo8zr/44274rbZ
X-Gm-Message-State: AOJu0YzYMcqQuJdsdf7u5AIFBKVNKST1j+pHn6SskdHuZizef0AAjjQo
	WpkfYYF8Y+wfm1UoR7/cb7kTpeEbAWfE+7psKTEiOiYYkhClk9QfH+BD0RnR47hEcZLCjsTbhsS
	tS3axreM0UFF1HD2EwDr8zXN0Wrw=
X-Google-Smtp-Source: AGHT+IE3GnfbOLJ3T+CoN9IxrOmZJpbe0PHk+HYS37DkErXKuJeNkp66TdLX7kvrDUMEkjw67U3mjMWnKgd40jGqWZA=
X-Received: by 2002:ac2:5682:0:b0:52c:812b:6e72 with SMTP id
 2adb3069b0e04-530b61a5d1cmr439887e87.1.1722479246935; Wed, 31 Jul 2024
 19:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-5-masahiroy@kernel.org> <202407291757.BE6D847803@keescook>
In-Reply-To: <202407291757.BE6D847803@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 1 Aug 2024 11:26:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQcV2v9ooOYhkj-Kqx9RACZ==GO9z2cepL5Jx_gxJWXKQ@mail.gmail.com>
Message-ID: <CAK7LNAQcV2v9ooOYhkj-Kqx9RACZ==GO9z2cepL5Jx_gxJWXKQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] kbuild: cross-compile linux-headers package when possible
To: Kees Cook <kees@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 10:03=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Sat, Jul 27, 2024 at 04:42:04PM +0900, Masahiro Yamada wrote:
> > There are known limitations:
> >
> >  - GCC plugins
> >
> >    It would possible to rebuild GCC plugins for the target architecture
> >    by passing HOSTCXX=3D${CROSS_COMPILE}g++ with necessary packages
> >    installed, but gcc on the installed system emits
> >    "cc1: error: incompatible gcc/plugin versions". I did not find a
> >    solution for this because 'gcc' on a foreign architecture is a
> >    different compiler after all.
>
> Do you mean having a plugins as part of a distro package? Does anyone do
> this?


I think the use of GCC plugins is not so common in distributions,
presumably due to its strong limitation.

In my quick research,
Debian, Ubuntu, Fedora disable CONFIG_GCC_PLUGINS.
Arch Linux enables CONFIG_GCC_PLUGINS.







> --
> Kees Cook
>


--=20
Best Regards
Masahiro Yamada

