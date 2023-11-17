Return-Path: <linux-kbuild+bounces-44-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2CF7EFBA1
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Nov 2023 23:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F065428137B
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Nov 2023 22:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9832B2CA8;
	Fri, 17 Nov 2023 22:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZXeKAOm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF4C46522;
	Fri, 17 Nov 2023 22:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920E3C433C7;
	Fri, 17 Nov 2023 22:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700261594;
	bh=fYfdWTUVkCPyxIsQpwaVzldzkEf3EyKbHITL/LAApho=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WZXeKAOmxCi7Aw6m84HAOHiTPIrKA8ERE4ElvYNyhlIJCnvUxKPVwkmM0aGapkI7G
	 hq9oO4VNuSld3SxuNo3V2/Dz9DmNfap5st64cJznQh0NzSJvcSwKM08CyKkZNzzhdi
	 24Rkl+YNgHG4O0i19w7kYdsK6Oz1H0Y8VSWJXi8RYKj32rFvYbQAUqd0TOidWiafid
	 UeXd9cCOdX4z0rGnW09JMJtDS/qIW3mGAqEtt91Xx4B1RDLZm+NoXaSQD2K7grtYZd
	 b+eVOjGB9B3rDnafI+NTD/bpmxy+gxQkw/FFEW26BVSQoaSrADboIho/JzkFUKiAhv
	 R0nMiVX8/ZbJA==
Date: Fri, 17 Nov 2023 14:53:12 -0800
From: Kees Cook <kees@kernel.org>
To: ndesaulniers@google.com, Kees Cook <keescook@chromium.org>
CC: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>,
 Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
User-Agent: K-9 Mail for Android
In-Reply-To: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
Message-ID: <8243E862-CFC1-4658-B07E-9FB87E34E12B@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 17, 2023 11:24:02 AM PST, ndesaulniers@google=2Ecom wrote:
>I'll be taking a step back from kernel work

NAK ;)

>to focus on my growing
>family and helping Google figure out its libc story=2E

These are both big challenges, worthy of your attention=2E :)

>For CLANG/LLVM BUILD SUPPORT I'm bumping myself down from maintainer to
>reviewer, adding Bill and Justin, and removing Tom (Tom and I confirmed t=
his
>via private email; thanks for the work done Tom, ++beers_owed)=2E

Thanks Tom, and glad to have Bill and Justin stepping up!

>Wake me when you need me=2E

As the prophecy has foretold!

>Signed-off-by: Nick Desaulniers <ndesaulniers@google=2Ecom>

Reviewed-by: Kees Cook <keescook@chromium=2Eorg>

We'll just report all issues as LTS kernel bugs and use the MAINTAINERS en=
tries from there=2E ;) We'll miss you, but you won't be far!

Good hunting,

-Kees

--=20
Kees Cook

