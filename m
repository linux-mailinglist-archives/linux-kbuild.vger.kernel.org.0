Return-Path: <linux-kbuild+bounces-2579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2119C934137
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 19:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 520CB1C210C2
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 17:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1691822C6;
	Wed, 17 Jul 2024 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ki9eTF5B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AC7181B9A;
	Wed, 17 Jul 2024 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721236310; cv=none; b=U4APT30t2hrQ09AdECOAR3MlwVj6jdFMHk0POoDVHtSmUtyFUkuxeS06jON7JOEya+nvcJ7N92Jj+s65JVQOVySgz3ZUpY0dXDpX/FU9MVF3Q/CrEF6+mek7KMYk8FMxe+HS4prFetuhzc2KsxW7TgSrUjBAucBdGrO3QC3sN/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721236310; c=relaxed/simple;
	bh=ReKLHgSjgA76AfuilwFIqJCfCIWoTsx9fQiCVzgyaFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WU8RlRjSy27fVYTfj8Jjrqkjjq4As5n2xWdMhAtVuVQjXqYfEtM4oTDfbT+gV3siMSniDyqIkS5BhUR5K6FGadg3i/mS9gnSLZ8D+C08rBjCJ7oyRn4lr89wZ3begPtvOB462vvPEoWIfTg+dSkjCEIJN8ZSnibjLs3Og5dycmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ki9eTF5B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6098CC32782;
	Wed, 17 Jul 2024 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721236310;
	bh=ReKLHgSjgA76AfuilwFIqJCfCIWoTsx9fQiCVzgyaFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ki9eTF5BsP8ujUOeVMpZlL/2EuwTT8uF/P+KRrA7Nv+fg5jyjbdMiL2/I938Ywq0L
	 V7LXBTAon6nI3vXJqojl55Ng1SVZ+SieYJSgkC60Z9Aj5+CUdhrQWu9lCfT2wiSJIH
	 jPzou6h/QyjW1S/Xob0BPC0RK5194hADJnwBnMtMK+m52jAaa2DA/JUGm7E3eDrg7Y
	 urj5Ql4fFU3jnRgtaI2Jd2VzTkytWGnHe4dtP6XLVaFWM6fxJ8BxuxsyavkLMDG4GS
	 xS6zs3j3DaxDWEuxxviOrSk1ULv83q18rrUf1kUsiNEqjTd4oYsDnnv3DzK9bidDkX
	 Rdp4hlOGmDTBA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ee9b1b422fso183941fa.0;
        Wed, 17 Jul 2024 10:11:50 -0700 (PDT)
X-Gm-Message-State: AOJu0YyrXYFshuxDGXxAE3V+fc211QOsw18GHOqwOMrZeco24UnzHT4c
	kxCbNXnRypcEdIZ4Or0dQhcijMgFYEPm5k8f310q8ZxMlWUYgyOcIr1QjPxDts6Ged+5TtFngCQ
	xr9q7YdmQKK+oLrUCdHFus+aZ64A=
X-Google-Smtp-Source: AGHT+IHcdkncFRLO7Kjf/ZekTpI/exRqzff7TsQcxuO897kglzVwBk6WO1w7a0azpCR3pSZD4V/MBkRpEP8yT0MuDuA=
X-Received: by 2002:a2e:6804:0:b0:2ec:3e02:9736 with SMTP id
 38308e7fff4ca-2ef04ee43b6mr953681fa.4.1721236309067; Wed, 17 Jul 2024
 10:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716084944.132226-1-masahiroy@kernel.org>
In-Reply-To: <20240716084944.132226-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Jul 2024 02:11:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYd2NgeS62DwotesZcJ51eeoZLsLuvcSTx32nYXFRrOg@mail.gmail.com>
Message-ID: <CAK7LNATYd2NgeS62DwotesZcJ51eeoZLsLuvcSTx32nYXFRrOg@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: get rid of code for absolute kallsyms
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 5:49=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> From: Jann Horn <jannh@google.com>
>
> Commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")
> removed the last use of the absolute kallsyms.
>
> Signed-off-by: Jann Horn <jannh@google.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/all/20240221202655.2423854-1-jannh@google.c=
om/
> [masahiroy@kernel.org: rebase the code and reword the commit description]
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.
Thanks!

--=20
Best Regards
Masahiro Yamada

