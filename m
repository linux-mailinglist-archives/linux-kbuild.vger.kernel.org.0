Return-Path: <linux-kbuild+bounces-5266-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C719FDBA8
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 17:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC1C618829D1
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 16:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA99E19067A;
	Sat, 28 Dec 2024 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0R50ZPo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6AD18A93E;
	Sat, 28 Dec 2024 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735402404; cv=none; b=Tt1d9sK8xajRADN4b1dYz8Al2mvvHd0maQZhE2f2IVvP0dGdTLLZjr7UfdpEZLHJQaIjYDozrkRSexJapHmG+tFXWVbyJSqCXKcBiDDbUOpLqt7tpokYuDvJe7FdLCD7Qf/fkhrtqxj9NAJO8/jm2y6k2Li1XV14Hhl+fRu6ycM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735402404; c=relaxed/simple;
	bh=OZBISnJyZDUI6Ga4Bs7VhnrTsWcrX4fA+V96Jl7VoKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k70QTkwePvNXAm55OJOr/+dLc4ZNbpZsdQ6U9SodSkCwSM71KV8FWdRDDbghlxhdCS04lV59yRN89tfn9p2jNemGUShurvqCK2pqOTBvno9eQwCNTd1MIB9YVdAjE6wbuXsk3piydZeV8U+rDsCEHtIDnL2RtT/MyvtGbJ+k6Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0R50ZPo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0242DC4AF0B;
	Sat, 28 Dec 2024 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735402404;
	bh=OZBISnJyZDUI6Ga4Bs7VhnrTsWcrX4fA+V96Jl7VoKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o0R50ZPoBP9dzelpScRE0EecKyApI/Fy39+qII0vrJPh58mtlSJFFkIbgEbdWfhm+
	 Sr9+k1OupMeRAoPJKPrUAeZcXTf/JHuhsDoLDA6uNSowAOKsVNM8ZZE3ll/7TVgtYj
	 irTPPKNEqRagiNV4O0tLEk2gyXnxxgizAROlGE0G610GqHlGmoJy03zNl2q537iwLB
	 3yZMzBfTllHITw5wOj+f9qp3Y6Cj5xlHM1gRegACSXKfuPxvtCa3N5caXUArPWvhQ9
	 3Hj7Wgoye7HGgEx5Xo0U2jocofQSxrZhuwuqx9GAp6l8Bc+G16BLo72FafTd2jUSc9
	 yot4CVEhduvgw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54024ecc33dso10157362e87.0;
        Sat, 28 Dec 2024 08:13:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8auWFaOJZr8wRe5CGB1jpvsOFkvxujxCj9V+wnOFYQMTSHxqbIS1MP3iDij97dKt5NosJBCzReCYpRCjP@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnGeP+rpfqhKYLPtRCefsmhx9hKiu5Z61zDrs8jBpxT4NxJLE
	030fMim+DUVkF67vj794/QjyVWvVQG6eGlAnPg21IYjIPXCD7PjcHODP3EjaH0nvwjT5CB6dYMy
	V75whdge8Qxo9HlxbGizaK5uk+aU=
X-Google-Smtp-Source: AGHT+IGudUaCk7PEDTWzI6iw2AC1YBAwN2PIn/3sT52GANZdPRI7fPwyl5u75NAavHPLCtRWipTurwSRqkGIvAv/SjE=
X-Received: by 2002:a05:6512:3054:b0:53e:2f9d:6a7b with SMTP id
 2adb3069b0e04-54229524d49mr10195960e87.10.1735402402658; Sat, 28 Dec 2024
 08:13:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228154603.2234284-1-masahiroy@kernel.org> <20241228154603.2234284-2-masahiroy@kernel.org>
In-Reply-To: <20241228154603.2234284-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 29 Dec 2024 01:12:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS16MpmqLQuuibW842a0Je7UHbveWQAKzbgC_BLs_xyDg@mail.gmail.com>
Message-ID: <CAK7LNAS16MpmqLQuuibW842a0Je7UHbveWQAKzbgC_BLs_xyDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] module: get symbol crc back to unsigned
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2024 at 12:46=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> Commit 71810db27c1c ("modversions: treat symbol CRCs as 32 bit
> quantities") changed the CRC fields to s32 because the __kcrctab and
> __kcrctab_gpl sections contained relative references to the actual
> CRC values stored in the .rodata section when CONFIG_MODULE_REL_CRCS=3Dy.
>
> Commit 7b4537199a4a ("kbuild: link symbol CRCs at final link, removing
> CONFIG_MODULE_REL_CRCS") removed this complexity. Now, the __kcrctab
> and __kcrctab_gpl sections directly contain the CRC values in all cases.
>
> The genksyms tool outputs unsigned 32-bit CRC values, so u32 is preferred
> over s32.
>
> No functional changes are intended.
>
> Regardless of this change, the CRC value is assigned to the u32 variable,
> 'crcval' before the comparison, as seen in kernel/module/version.c:
>
>     crcval =3D *crc;


[Just in case for confused reviewers]

It was previously mandatory (but now optional) in order to avoid sign
extension because the following line previously compared 'unsigned long'
and 's32':

    if (versions[i].crc =3D=3D crcval)
            return 1;

versions[i].crc is still 'unsigned long' for backward compatibility.










--=20
Best Regards
Masahiro Yamada

