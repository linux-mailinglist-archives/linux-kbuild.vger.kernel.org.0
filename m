Return-Path: <linux-kbuild+bounces-6152-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F380A627DF
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 08:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E58C1899052
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 07:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDF61D7E54;
	Sat, 15 Mar 2025 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4NCo5Op"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3366A1A23A2;
	Sat, 15 Mar 2025 07:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742022623; cv=none; b=feHoV7JrbzIWeOUfAAmAiIHg2+ZT73B0+IvX16yg72KwVvM9CrrVRLpu96+qidH+cyzSm+4nR9lNGCmfsDuVFFCsdlAGKF55Rj95LeQOX1SnIPO3yqBYuioAngZZGs0sqxktdvRr7u1c1CXtm66XYdvQD0tB1/in+2Io//4ZajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742022623; c=relaxed/simple;
	bh=8T9+XnWY6sp+PiGu67STJ19Etl9arLDHTWoM6mJqp2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5t4HEP53xO7xZilLNNHoFhMvKDRI0U6fQnGMJvyssSDvBclcO1xYwxh5/fp8pYkpTEYsOVqSFev16ga8kzdN4OuKd9jhB2y/j2wimxwhEzR9pL2xZ3gS1bTdqyUoz2FtMuVFobyeaixtPqofRrdKRCrumFUMXfpfU7yvvQTI5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4NCo5Op; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFB2C4CEE9;
	Sat, 15 Mar 2025 07:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742022622;
	bh=8T9+XnWY6sp+PiGu67STJ19Etl9arLDHTWoM6mJqp2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o4NCo5OpGF4Z2ARaX+BLyEixn44qDVIOTwLI0OVBGTY9lo4VaQXN3K6GBJM4b25wr
	 ih2U39CdsykUypzBB2qcuxg+ROnRc9qoi0pBDTB85xKWAP8lP6slIGe9LGV13CZhJZ
	 MhTl/+FhaYFSQfbL7w9EdBKNewrH0plRurK8HTiKnjLAJW2ykXx9U0tvJuXCCVdxMR
	 WUOQid56cZfdl9PwkY7q7ZDVtN1Gb9FhIk3EDYZdlggicMKG8XACphDkqsOBYKZM29
	 SzcNhURRFp8z+1ZG7GnM3VpYa2ZtzNp+DzPxy8B0dHvHUrBffoCBP9BemfClMZxE3S
	 kNvqTOmr8OMzQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-543d8badc30so3261295e87.0;
        Sat, 15 Mar 2025 00:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXo9tdimn485LHN3+LXsKd/1RH9DM52/+6E0hUYRD7k61nrd/sz0vIVZ0/MKV8AIwP4oKvCdCYI6Q/DKYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Ny0Mci2hkjI1r61H8kLa9Ltu4C7poX2a1m56IaPAylGIqhdp
	E1gKtb/3WY1qyQnG+ZdfCEDoUJcG1jm0h2RDMkX7SPeSyEgjOZP6nOrEacpcJwFvxQl6D+X5PB1
	czrC3UIWOkE8ql+ONklShYkSyVJM=
X-Google-Smtp-Source: AGHT+IFfIu5yGJ8/EM9olWyeQ/H6eyxW4GftwMLY0SX6kST+37q47wk+dw6utJQ2IONaW876pX8JwtmktZRJ+JR7+FQ=
X-Received: by 2002:a05:6512:3981:b0:549:8537:79d5 with SMTP id
 2adb3069b0e04-549c3912139mr2049059e87.20.1742022621409; Sat, 15 Mar 2025
 00:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311110616.148682-6-ardb+git@google.com>
In-Reply-To: <20250311110616.148682-6-ardb+git@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Mar 2025 16:09:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNATU7fWmpPSm33FSq7B9gnhxRg-QhN_on1Ym9ZxV+PkmnA@mail.gmail.com>
X-Gm-Features: AQ5f1Jp3IErGYv9LAWkUhjIJPrfcthh0Lxotx225SaIaXBG8j73S7RMw5dXueiU
Message-ID: <CAK7LNATU7fWmpPSm33FSq7B9gnhxRg-QhN_on1Ym9ZxV+PkmnA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] x86/build: Get rid of vmlinux postlink step
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 8:06=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Kbuild supports an architecture specific Makefile.postlink file that is
> invoked for the vmlinux target after it has been built. This Makefile
> takes 'vmlinux' (which has just been built) as the target, and mangles
> the file and/or constructs other intermediate artifacts from it.
>
> This violates the general philosophy of Make, which is based on rules
> and dependencies, and artifacts that are rebuilt only when any of their
> dependencies have been updated.
>
> Instead, the different incarnations of vmlinux that are consumed by
> different stages of the build should be emitted as distinct files, where
> rules and dependencies are used to define one in terms of the other.
>
> This also works around an error observed here [0], where vmlinux is
> deleted by Make because a subsequent step that consumes it as input
> throws an error.
>
> So refactor the vmlinux shell scripts and build rules so that
> architectures that rely on --emit-relocs to construct vmlinux with
> static relocations preserved will get a separate vmlinux.unstripped file
> carrying those relocations. This removes the need for an imperative
> postlink step, given that any rules that depend on the unstripped
> vmlinux can now simply depend on vmlinux.unstripped, rather than inject
> a build step into Makefile.postlink
>
> S390 should be able to do the same. MIPS and RISC-V perform some
> post-build checks on vmlinux, which is reasonable in principle for a
> postlink step, although deleting vmlinux when the check fails is equally
> unhelpful.
>
> Changes since v1:
> - add vmlinux.unstripped to .gitignore and to the 'clean' target
> - move cmd_strip_relocs into Makefile.vmlinux

Applied to linux-kbuild.
Thanks!


--=20
Best Regards
Masahiro Yamada

