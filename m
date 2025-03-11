Return-Path: <linux-kbuild+bounces-6044-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E53A5BBDE
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 10:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013AD189667C
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 09:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266DB22ACF2;
	Tue, 11 Mar 2025 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJGWK4O0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E09222572;
	Tue, 11 Mar 2025 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741684668; cv=none; b=efNAm0asgg4gzXhfANFNWblEBoyTwe/KMBs1reR44P0zzenSuLbObmtqfxO5vKU9P2cCVoJIqhD0nV90+qrRkX3ikK/Fj762oK8KNGUHfVQ4L8cD6jvsN0cFD1St2YRaLnS4F+fjC4vZs45l+XNPEKyYhrrOjzA63vgWVcU5IZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741684668; c=relaxed/simple;
	bh=I3wvXEq4ikbk6K4qeOqy4pOSFqJ/9hXqSnnILl+b6SQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkhivHFtmvUqNfwLeNPAJgne63HKpQdDrQIaJTVrPJFNiaHeNQBeAlWd/tJtBBG+nzOQM31pDIwxMtnn0xOsaEh3Cz1xIBT3AG0CDu4R42cB7Mr/kOF6DEDDpi4AAm+3ZevnRiqK25cCpqhLIhHdRsdMYP83BcwgEqDNgwOdScs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJGWK4O0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FBA5C4CEF1;
	Tue, 11 Mar 2025 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741684667;
	bh=I3wvXEq4ikbk6K4qeOqy4pOSFqJ/9hXqSnnILl+b6SQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EJGWK4O0JvO72MUNTL9fyv6dFbUqrS+QlTHt9NSqPcSEJqsR93Ay3OI6sDys1v5Ps
	 ZOHEtYwl5HwMHmmalXc8osqgNPVM3DiAsgCavmEAhm8yAj55EqduZIi1MfudAjORht
	 x37BrIwjmNIZJpJgmBH+B0DoV3sLvdPKMFyBBJuA3HGrvdxypU2BcR9xDf/I172/2v
	 pa/oAPUJK9OsxoBcXkOwyI4vygXhqaUItZU9VQ4jApa63Z4eAJH4d+dp1mEKFMCbY1
	 TeeGKPxmFmsmdqmVkPXTMYPA221sp62O4MfsEFVGviIIvn8wPBA8WgsScwPnQpxUHk
	 3SGIedLzIEaWg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so5252886e87.1;
        Tue, 11 Mar 2025 02:17:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkWPk2zSJCTIsUlplIUkICws3HUUaVfSp695Ql3LHi9OwnU/35vAN6RMJD/wv9ZrEJwVknEGnxI7RCLfg=@vger.kernel.org, AJvYcCX66lzLtANeNyf0yCtFKOAsNvagxEwm3hMYrF7KOYSXuEhwNuu7ZMDpzONg367twf3iGIRWPApZg+BJfFUmtQTmTNP4@vger.kernel.org, AJvYcCXTmO/CTv0V30IJl5HGwuZyOmRDU3TELwKme2tIyPEk47zYVgUwwYZxj5vhKin8hQQrUO6ZVcVMCc7C2DgZ9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrE2q0ZX8OtEfa1qpe/qhDy7iohb00MlMDFAw9j/r9sHXAiHbs
	zWpB0SAewFjiale5qZxDiR11uCwgpeuIY6ROm03IrclXRqF6Lgew4K0peyO+UFsBm9ZJEL3GCAg
	DeYcQsQNqRF2J4gmHNBCJLxJSWWg=
X-Google-Smtp-Source: AGHT+IFNr/MqTS76yOqZHInZldYwY6xgGLGctV3Upe1fjkqrKfD1g+oL+NuiwvAIf/RdlzvPulALp+YL5nPG4/u5HHs=
X-Received: by 2002:ac2:44c6:0:b0:549:91d3:8e66 with SMTP id
 2adb3069b0e04-54991d38f57mr3671557e87.8.1741684665913; Tue, 11 Mar 2025
 02:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305192808.2826336-1-kris.van.hees@oracle.com>
In-Reply-To: <20250305192808.2826336-1-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Mar 2025 18:17:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvQJT5rCGGQT+L+JtRX32_amZz05QCn9cvT4W4+uVJuA@mail.gmail.com>
X-Gm-Features: AQ5f1JrfovPclrUeoRyJ5wu2zI2p6MJIrGdvqeXCG7Sskxj7mqOIUIcKMP8Uwhs
Message-ID: <CAK7LNASvQJT5rCGGQT+L+JtRX32_amZz05QCn9cvT4W4+uVJuA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: exclude .rodata.(cst|str)* when building ranges
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Jack Vogel <jack.vogel@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 4:28=E2=80=AFAM Kris Van Hees <kris.van.hees@oracle.=
com> wrote:
>
> The .rodata.(cst|str)* sections are often resized during the final
> linking and since these sections do not cover actual symbols there is
> no need to include them in the modules.builtin.ranges data.
>
> When these sections were included in processing and resizing occurred,
> modules were reported with ranges that extended beyond their true end,
> causing subsequent symbols (in address order) to be associated with
> the wrong module.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Jack Vogel <jack.vogel@oracle.com>
> ---

Applied with the following tag:

Fixes: 5f5e7344322f ("kbuild: generate offset range data for builtin module=
s")

Please let me know if this is wrong.

--=20
Best Regards
Masahiro Yamada

