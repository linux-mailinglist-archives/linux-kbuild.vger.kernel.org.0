Return-Path: <linux-kbuild+bounces-105-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D317F3D01
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 05:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC7712827B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 04:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1928494;
	Wed, 22 Nov 2023 04:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlzj0bYD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475472BB0B;
	Wed, 22 Nov 2023 04:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97637C433C8;
	Wed, 22 Nov 2023 04:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700628462;
	bh=RI6M9xEbhPfKHmCxWYgz352YqmJ/ZLpTnwPJ8ATtxVI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=dlzj0bYDKXeSVNOhbvioDXzV3bJiD78y6ilyFp/Hx/QEr4f6hCdTHbUmZfcntzMC2
	 JAGHW8ONV+8tsKkdFTS8qSAFT3heCDTtMdVH6SDzNhHNiAGOJtZwCg+OQXyRbcUD2B
	 vqm2c3+e0QzKNl4I9pAMlpckLVrYyjtlCTaeoORi9jztHJGZLZL9bST6nQ62YpvdKs
	 NpSbm7gLGysuZok1YAdYshmS6oUwq9/iJ/V5l8yG02v22U2rJ2PIIQ+UlAPVe0N/86
	 yrfP0WOX5Qlo0EyflIGCDolPdpc5Kzaqqwp3HvDY0Qa01KWOEXVT3pfLIoLNpazyZ6
	 vH5kwLNzXekfg==
Date: Tue, 21 Nov 2023 20:47:40 -0800
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, ndesaulniers@google.com
CC: Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Tom Rix <trix@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
User-Agent: K-9 Mail for Android
In-Reply-To: <CAK7LNARAvH=tWpsXJ640y04Ju8UbPmDze_NC6ax1EKK4Xy73fw@mail.gmail.com>
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com> <CAK7LNARAvH=tWpsXJ640y04Ju8UbPmDze_NC6ax1EKK4Xy73fw@mail.gmail.com>
Message-ID: <5EB120AB-1F30-4403-B652-DC0D2772B25E@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 19, 2023 9:17:20 AM PST, Masahiro Yamada <masahiroy@kernel=2Eo=
rg> wrote:
>On Sat, Nov 18, 2023 at 4:24=E2=80=AFAM <ndesaulniers@google=2Ecom> wrote=
:
>>
>> [=2E=2E=2E]
>> Wake me when you need me=2E
>>
>> Signed-off-by: Nick Desaulniers <ndesaulniers@google=2Ecom>
>
> [=2E=2E=2E]
>(The patch was addressed to Kees, so I will not touch it=2E
>I think he will pick it up=2E)

Yeah, I will snag this soon: I'm out this week for US Thanksgiving, but wi=
ll get it to Linus shortly=2E (Unless someone else picks it up before then=
=2E)

-Kees

--=20
Kees Cook

