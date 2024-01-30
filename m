Return-Path: <linux-kbuild+bounces-726-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C23842661
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jan 2024 14:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26EFF1C2105A
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jan 2024 13:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E394A67E7E;
	Tue, 30 Jan 2024 13:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cU72nRbx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE2666B51
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 13:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706622403; cv=none; b=c1hXamTv1AL0sns4txK2gD/pKxHNb6w9RlyEEWJ9ClsgpmrbRsQGtdpM/Mm2QklcYcFkUnYuhLWc1G50yLo6k90uIlbukbW1cJn4J9GiLyFIXw8WdO2B1u0GSlrXCTrgRpNvdnMG+bunGs96LrMEw+l0UDw7Kg2XrM2cYI8rBCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706622403; c=relaxed/simple;
	bh=aWGIg9ReBLDRYt9z1f6afh6iz5LLf+f//tpgPs5swLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeqQ5OTTuElY5jbSUYrKU67SvckbZ3KNNPMZbOUV85+rx9SLnEmDiHpHBfnrY6y0qZrd0WW/MR/zi6HXgMPr0Q0UGLFO7Nrg4Mr/KS64rAK8upo1rd3zWoQtToFzzVRadhmWvajfBOwM/2iFksx/fiMCpu8cp245syZ6T95zfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cU72nRbx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D07C433C7
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 13:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706622403;
	bh=aWGIg9ReBLDRYt9z1f6afh6iz5LLf+f//tpgPs5swLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cU72nRbxOWW+2R6upU1LGY33Xu0rPhthkE1ufx5178jqCDji6iizLwm1EzLtWUgjr
	 z76pkj+N8SYWDtEOk2EwdQJlP2Cs5IpWpnLPnoJnCZ+7KPwsq3VLrGtLMZ2f1GXvs+
	 YWI+OkMyN22yNUDEbPqiqeh91CnjyfcWIJM/UT/b+rw4kUdYJ59EqQvI9lybHx9cSn
	 GxHlZfkBSWaYtIiPXY5fa0heMLyT14gZDRhZF2x+nECnpiJxatdVc5ax7AaD1cphta
	 xW9ojD1+sWMDp3t6TpfsoseEm8ztVz389sXlPecJU8c0DZGDIO3YJoGzZYedoWVqZc
	 Xrr6hRBmx7lNg==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-214de82b6ddso2295153fac.3
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 05:46:42 -0800 (PST)
X-Gm-Message-State: AOJu0YwYA2DlOYYrsihxCKYwvl+QFeLLojcMe9MPt9zWUFmaabm2AlML
	tmcM0yiX4IZt0bZj54jDpMPm9fisVOwrg3Ok72IVQamodXgew4G5S4d4gpD3mZF43Uincls8cY+
	0uTVO8e1Gr22guCHmykRCgC/wbNk=
X-Google-Smtp-Source: AGHT+IFk8z74N0W1JtYDJNTyq2ZcgrOHbmOrNmAQ3PVaB/JbrUtL465oK88LYZsvWF+xSTVeml7LH4WD7iLKU7kfFoY=
X-Received: by 2002:a05:6870:e2d2:b0:218:3c0a:7d75 with SMTP id
 w18-20020a056870e2d200b002183c0a7d75mr7588160oad.9.1706622401508; Tue, 30 Jan
 2024 05:46:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG+Z0CsTWFxi74PKpCkPjM_-60PsvqS7gkZKs5yrsA8OqL6Hyg@mail.gmail.com>
 <CANiq72k+jEb2kc_LN48959k0u5v5m1qGiJR9tmuUyvUweuXGeQ@mail.gmail.com> <CAG+Z0CvndOvQEeNheb+iWURfpc39jMwAFtH+Xzc0AiTjUqN-8g@mail.gmail.com>
In-Reply-To: <CAG+Z0CvndOvQEeNheb+iWURfpc39jMwAFtH+Xzc0AiTjUqN-8g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 30 Jan 2024 22:46:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQKVonm4=ynoFj1p1w95L7z2=jtuyOn+0AhtG1Yc-M7kA@mail.gmail.com>
Message-ID: <CAK7LNAQKVonm4=ynoFj1p1w95L7z2=jtuyOn+0AhtG1Yc-M7kA@mail.gmail.com>
Subject: Re: [v2] kbuild: Replace tabs with spaces when followed by conditionals.
To: Dmitry Goncharov <dgoncharov@users.sf.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-kbuild@vger.kernel.org, 
	Martin Dorey <Martin.Dorey@hitachivantara.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 1:13=E2=80=AFAM Dmitry Goncharov
<dgoncharov@users.sf.net> wrote:
>
> On Sun, Jan 28, 2024 at 10:29=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Sun, Jan 28, 2024 at 4:10=E2=80=AFPM Dmitry Goncharov
> > <dgoncharov@users.sf.net> wrote:
> > >
> > > Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>
> >
> > My v1 still applies with the same conditions if the contents didn't cha=
nge.
>
> The contents of the patch is the same. I only changed the subject of
> the email per Masahiro's request.
>
> regards, Dmitry


Applied. Thanks.


--=20
Best Regards
Masahiro Yamada

