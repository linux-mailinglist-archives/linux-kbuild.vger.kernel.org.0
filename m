Return-Path: <linux-kbuild+bounces-4275-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5309AD122
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DBF61F21F38
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583091CB530;
	Wed, 23 Oct 2024 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sx7UIfkF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274941CACEF;
	Wed, 23 Oct 2024 16:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701500; cv=none; b=uC/qPbPIc8qTkCOKIbcnvdby/CMkBUad5fIQj88DNBI6CkTH8SS99OoUYcQspDw307FAq3aRjk1Go3HZQrGwhoIwrtrHMll0/4M7gc0FENqNZa3zhl8yTdPBb6tmy33KOHhfk43UeMz22dyh9UNFLVRSEKdp1fgry0uKAU02R14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701500; c=relaxed/simple;
	bh=zBWzdxtMqE04zFH37Kq6rdPIQeospljffkrLpgF+iX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kfa5SpPnMyc/3q/8P73SuW0FT2OaQkmhJKw346dx6rLufr61q8DMjezgM9eB+axPgT+/KCc/eWvKqy+R+EqUesDKkFeKvhlvSx8O3Q5HAbMbN06bqgSXGVODMpacddkDXfhJhyQeOvD8h1MbQkdeGkPMBi37CXIRoR2c8vXnAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sx7UIfkF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9686C4CEC6;
	Wed, 23 Oct 2024 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701499;
	bh=zBWzdxtMqE04zFH37Kq6rdPIQeospljffkrLpgF+iX8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sx7UIfkFy4rjNmXGxiRlC+ImA3kV4xk2q9pDU3S1+ISRNFJieMaBvBLRXuMBmzlkc
	 tvwNYnrrSqkgIwq9ABvvjVRB7iSLtF/KQMr6vwXaivOdE/2NR1L0YdZDwy9MwtrEBt
	 MduM3Uk4flstrJ3F1q2WIYyS/4Ou1vJjMznfAgPDl8TcLfUEhdpTzZdHDd3HJYlieE
	 ENYk2KudhpMtwOO8EKsFQGZqjOcGeQx1/zAPSk/eWrDbYy2Xiw5jSHgxuGrBj9NQsK
	 XnhgPayo3pOw4AVhoteSg85yto9gRbA5xzX0ywG+FPY7eIdtWbKY5IyMh7GougrdGu
	 vmybCOQ1ljjxg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso7158421e87.2;
        Wed, 23 Oct 2024 09:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXNP2TB/yVRYjnF5+4NTSSbp+rEDOR8cWT4FceHJqqS4jQXT5E+AwV4PgnizU1TszVWG2oK8YTuEQIBOk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/WzFicnrRV+WuRN6vYDtvWPfgpAF7q147sTMHh9mGHmGD5YfS
	Q7oWDrhZhbatHD5SP/CKl66xwrScaHgmP9P6KE8d2nrNDPbw87Bb6y/nS8HkyHSyqr6UONBhfMp
	Xn+EtPGOFmN0zh6yYId+zFCOoTs8=
X-Google-Smtp-Source: AGHT+IEi0xkayBFiea2qNGm/JwAHYsLaQGewVIuP65yv9vk4byO8t7L1HM8tSG+mvDOXcFvdu6OuT3+MxV1AYuX5Q0o=
X-Received: by 2002:a05:6512:31d1:b0:539:8d2c:c01c with SMTP id
 2adb3069b0e04-53b1a36b785mr2005374e87.41.1729701498414; Wed, 23 Oct 2024
 09:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4960180.31r3eYUQgx@devpool47.emlix.com> <13623531.uLZWGnKmhe@devpool47.emlix.com>
In-Reply-To: <13623531.uLZWGnKmhe@devpool47.emlix.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Oct 2024 01:37:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARt+7OMP2zFzQd=k3Ya2w8mwjA77pPMoV3zSzs1HWPTdQ@mail.gmail.com>
Message-ID: <CAK7LNARt+7OMP2zFzQd=k3Ya2w8mwjA77pPMoV3zSzs1HWPTdQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] kconfig: qconf: use QString to store path to
 configuration file
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 3:31=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
>
> This is the native type used by the file dialogs and avoids any hassle wi=
th
> filename encoding when converting this back and forth to a character arra=
y.
>
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---

Applied to linux-kbuild.
Thanks!



--
Best Regards
Masahiro Yamada

