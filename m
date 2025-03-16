Return-Path: <linux-kbuild+bounces-6186-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2939A6334B
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 03:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB95F1712C7
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 02:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDA118027;
	Sun, 16 Mar 2025 02:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB9qZXiW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C87D847B;
	Sun, 16 Mar 2025 02:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742090804; cv=none; b=HbObS9fF+1HRAmhJ+TcmWPxnKj7C9WAhBy4rIBljb4Rjg817qEN75aakuKp8IvEv1LKl6nh1Vujlqd6/dVRiRJBpvnQJz4C/c7Iv+qIeKiVz0xifTv+kXSl/I2K5xKKFghzJuXPi/6tNALoSMf8GhcG8FaQp6byjSIQu6nC87ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742090804; c=relaxed/simple;
	bh=r4U5qipzRMjGnhgSCCfeQquOjlWze65n2jzeFq6AXeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HW5CNd5BLofyTFhI5i+DUHzE8ZC1KVO/SAQ/Ytqw6lle6SODn2eMq6c1aq2TNwMa1vkKesBB7N+QhqS43x4RhXLi0tu23u7jMwuxrs9jSAPkmSU5jedK624LAp0x0BEMmrIgsmEUB1pgQzJC4EmfO4dD6vvwzOo1s6BXPMN4p68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB9qZXiW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFF7C4CEEB;
	Sun, 16 Mar 2025 02:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742090804;
	bh=r4U5qipzRMjGnhgSCCfeQquOjlWze65n2jzeFq6AXeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YB9qZXiWny+W4qo1WW7QM+XmuLLCkuThbGrWFpEhzoiOOvB5X8DEYyFAaIh/bKJXS
	 AS6YyQ/ibY44Vzr274aQXqQ96u/mNKfJOGjxS21Ysk1yLeQYwdm3FVtwqXGV6Z/bx8
	 Acq7vZUZ/LMrdW0AxyiR5B/A92MHUj2laVDPlIXSA+EeN/0O9eLv8OlnwzR8s/Fnzl
	 0Dyu7e9w6YocFwgyOeB9RSjldyPnTQgT3SWTbyOP+SNtuH/y2yzR+L/vhfSfVrr8lH
	 FJM4UmmAb7JZTyXs57pWZ1GZAlMkHeh9zSdS2oTqnk6KRZxacz236/4KpcJasm5+eJ
	 jPa38peMMRuJA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5499bd3084aso3382260e87.0;
        Sat, 15 Mar 2025 19:06:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3BjgERCjvNvVVUgWb2UAs2OkxX6VhO+lwjmv/T44iZc4MFg3C+JVBXgyZgp5uivbGARUTdf3lBTO80wA1@vger.kernel.org, AJvYcCWWzZbR6LgD0s3iu6edLbviQ1KAQi3IMb0uGO34UwJBaldKBdJljOc0YH3sL2DdmH35YDSAowsJ2tX1Tv+l@vger.kernel.org, AJvYcCXjb3Kr06vQag5gD+fYXn9myjvHEDlcY++MhN3nbm1C+1dbxw/zZ6V/YYoV6PP9il5rDyvAuVoMvjw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8sP5GgzVRfR0RZuj8JVvvb8O+Xf8N79AEZlSxkIM/ShITotjb
	1Ka+2QPDQN1xQ/R0l1b0zKESG7rv6u55ciVWdTUnrY4p0Cf4n9h1QlnWNZneI3cWfiqNUprHieQ
	6TqqODqOdI+KshHwmMwGGXMF5prg=
X-Google-Smtp-Source: AGHT+IH07TW8aDJMfmSAV4IqU9+sW8S5rQwbsZKdm5zCr5yOp6mPkvpOTJuBf4XksN7Do9lIafO3ZNUxT5aJvwpqHqo=
X-Received: by 2002:ac2:4e04:0:b0:549:39d8:51ef with SMTP id
 2adb3069b0e04-549c38cf317mr2244671e87.6.1742090802558; Sat, 15 Mar 2025
 19:06:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
In-Reply-To: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 16 Mar 2025 11:06:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNATcqy9BPUZa_EUUzmGiXX=AWry_Emoj-pG76BLxGmJysw@mail.gmail.com>
X-Gm-Features: AQ5f1Jpy42g-Qp4C1iFBSDHVJyb9EX2VK31f46jCciQBI2SYF7v0xmYha7e_Lxo
Message-ID: <CAK7LNATcqy9BPUZa_EUUzmGiXX=AWry_Emoj-pG76BLxGmJysw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: make all file references relative to source root
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 10:20=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
> Other references, for example in debug information, are not affected.
> This makes handling of file references in the compiler outputs harder to
> use and creates problems for reproducible builds.
>
> Switch to -ffile-prefix map which affects all references.
>
> Also drop the documentation section advising manual specification of
> -fdebug-prefix-map for reproducible builds, as it is not necessary
> anymore.
>
> Suggested-by: Ben Hutchings <ben@decadent.org.uk>
> Link: https://lore.kernel.org/lkml/c49cc967294f9a3a4a34f69b6a8727a6d3959e=
d8.camel@decadent.org.uk/
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de> # arch/x86/
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Pick up Ack from Borislav
> - Merge all changes into single patch
> - Also drop link to KCFLAGS from docs
> - Link to v1: https://lore.kernel.org/r/20250313-kbuild-prefix-map-v1-0-3=
8cea8448c5f@weissschuh.net
> ---

Applied to linux-kbuild. Thanks.


--
Best Regards
Masahiro Yamada

