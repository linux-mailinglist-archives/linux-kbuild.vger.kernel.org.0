Return-Path: <linux-kbuild+bounces-9928-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 825F9C988C8
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 18:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B780E3437F7
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 17:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA7D335BDB;
	Mon,  1 Dec 2025 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+Yc8qza"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796083358DA
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Dec 2025 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764610615; cv=none; b=Kl56Ft3AS1BeeHRnIo8PT65V+TVKnOIqj3IQgGcUu0Hcn9x/F6rEuaNHWtDwWvzNklwOMOVffKO+RX6dgFnU04bzh67j9yf05FHTGA54le1RkNjgNf9mFAYl7GYfzMNPgGe3zv54hKyH0YGHVi5o3KbsQKgK6Dnxbb5GOydQUOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764610615; c=relaxed/simple;
	bh=l7lepSBdXzuxXxrZd0g9DnDrgxwSSxjIk8ToGZdo9SA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a82Q4hWZHyLaETHKqnr8GDc8TVAZV5kGx21PQP8eBztyrdgjrHEV3TwCesopW2MSsocsNJPJn9SU6BY7lvmCWbId2BGjiA76jvv+QsbWR0WlQsppasTE0W6IU1uAeTdfq02Ln+1Wl0phB95pQsH5FCi+s4pcxrE5sQ7wHW/xJVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+Yc8qza; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FB7C16AAE
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Dec 2025 17:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764610615;
	bh=l7lepSBdXzuxXxrZd0g9DnDrgxwSSxjIk8ToGZdo9SA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W+Yc8qzaOC/ELJf2N2REiwvJ4+n0/pvxvrYgzx10lROuoXVuExAUMKxq6S8y+BA/P
	 Qn9S5kInMH0eOk3XtHQZnAJxWuXanI1Z02gEJZ6wTcplVJrOy8hkvzrQUUyrxEkwFq
	 Va+ggYQMiQQyvoxifrGlGFTrWHQBjY/CqscU/NPPATBXzJrETJqRkST13zCiITXGmY
	 t3lHRbI025jxcUP15enew9dUl7QS9LtQ3LvvYjtVYhJl3pEvP5devp+qTqTa8hZxgY
	 71pz2m5IoJa+4IBYXEQ+nYl+MkyTcru9dq7PXAMm4/Qv1sLtIPr2Tk02Ij4TB43NPA
	 4AYWDaCwavW8Q==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso8103516a12.2
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Dec 2025 09:36:55 -0800 (PST)
X-Gm-Message-State: AOJu0YwechyZ794RPZWsxrx29FFzfs9rnLxHFOp+lVh8tv3SLUhEDNck
	/MGbbrRolSiktNl9e9AYVLcYuLm1nKqj6a0PI5Q2Vn1xAcF2DXs/cg7XUXYEv5E/fgtLL+XLPLq
	ch8jmq5L64uVaM9z/fV4S9G7vMg5ppQ==
X-Google-Smtp-Source: AGHT+IGj8oMirdblOspbjRhLXsJWPqJR33BkQWdVGDGlsoGf9edwoBiuC9xB4rEyfTckQc6Z0TRpEva24xHdlAJlFIA=
X-Received: by 2002:a05:6402:2354:b0:640:9eb3:3673 with SMTP id
 4fb4d7f45d1cf-64555b87582mr37254320a12.4.1764610613611; Mon, 01 Dec 2025
 09:36:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126100017.1162330-1-thomas.de_schampheleire@nokia.com>
In-Reply-To: <20251126100017.1162330-1-thomas.de_schampheleire@nokia.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 1 Dec 2025 11:36:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK5qS--kTudaEM-hBkVo=ck073gskum3puM_fp7nT6BPQ@mail.gmail.com>
X-Gm-Features: AWmQ_blbL-lnSmx1N8cBZcucbWyLwr2dHZw334kVh9Hh3jN1vh-yn_k8I_BmeFQ
Message-ID: <CAL_JsqK5qS--kTudaEM-hBkVo=ck073gskum3puM_fp7nT6BPQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix compilation of dtb specified on
 command-line without make rule
To: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 4:00=E2=80=AFAM Thomas De Schampheleire
<thomas.de_schampheleire@nokia.com> wrote:
>
> Since commit e7e2941300d2 ("kbuild: split device tree build rules into
> scripts/Makefile.dtbs"), it is no longer possible to compile a device tre=
e
> blob that is not specified in a make rule
> like:
>     dtb-$(CONFIG_FOO) +=3D foo.dtb
>
> Before the mentioned commit, one could copy a dts file to e.g.
> arch/arm64/boot/dts/ (or a new subdirectory) and then convert it to a dtb
> file using:
>     make ARCH=3Darm64 foo.dtb
>
> In this scenario, both 'dtb-y' and 'dtb-' are empty, and the inclusion of
> scripts/Makefile.dtbs relies on 'targets' to contain the MAKECMDGOALS. Th=
e
> value of 'targets', however, is only final later in the code.
>
> Move the conditional include of scripts/Makefile.dtbs down to where the
> value of 'targets' is final. Since Makefile.dtbs updates 'always-y' which=
 is
> used as a prerequisite in the build rule, the build rule also needs to mo=
ve
> down.
>
> Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scripts/=
Makefile.dtbs")
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com=
>
> ---
> v2: fix 'make dtbs' by moving the 'Build' rule along
>
>  scripts/Makefile.build | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

