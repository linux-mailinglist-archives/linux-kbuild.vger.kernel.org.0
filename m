Return-Path: <linux-kbuild+bounces-3733-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 922979857F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 13:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 472721F2167F
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 11:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB46140E30;
	Wed, 25 Sep 2024 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQYE976G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FF012AAC6;
	Wed, 25 Sep 2024 11:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727263661; cv=none; b=GqWnqdTTFQ8e3VX4spnNWYmvB5kICtL0/pNUBQc+KgUpQs44l+bCSoReFCd71UGDTJfcG0o9kCaXFy9YcO+PfVaGPOEDt/RU9Jcr90r5S8uQrf0FN4DJFtOcpS9q/+q85FwrFdI1KLQHnQQ6LntKrrHymKUzT14eYrELKuIvjog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727263661; c=relaxed/simple;
	bh=0Gj1uox717iZ2CzrG/UNwTUtmfDL3zydP7VtIqDGXIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZyeuFjV8Of4S7oaCN/sMJWff9RzjYmfM1orpOfRRSERY23GL7kZI8cJP5kTrUnnpRQzdRwDp04hHqTzNNGiyp4N5TXSTJb1hPFvTqNG/x4TWZWTXi4L4Nj4em581l6gQNikjiGduUQ+HMe845tayLVQExzS34VZtybz5m6gCmGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQYE976G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC9CC4CEC3;
	Wed, 25 Sep 2024 11:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727263661;
	bh=0Gj1uox717iZ2CzrG/UNwTUtmfDL3zydP7VtIqDGXIw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uQYE976Gyq9INGzAxUEdHOFI1VTXhRgWeVdydeACgcEmh831WSAg3fTwTa+WfOUia
	 7CdYze8d7ycGU0Uv0NzId/GEImGl/c24gP/TADwNBAbtPqXc+cvlWmWIFVWH38E98F
	 IHW8GUKqJI+vaQ8VBOFQeOeYgpSgwHg42VjFJKbtOkwaZUVjPjcV9dmOEh3ZYkh1n3
	 gqgUeeV9nNb26Ux+e17vtvCnVve9XBgZ7m7dSGz4RTUufd/8qIgxB7cOj3ZG9t0Or/
	 YhuVBfWagKFJDbSyNqblQMhFqxKPtSIJ4cIB97vNH3UYwveO8TSBc/6Xj+rpFpK+3J
	 OriBZAzFskZhg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53653682246so1100673e87.1;
        Wed, 25 Sep 2024 04:27:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUc4DQDOACD7eV1hOQWm1CK0KQr4NQgGX0aw2FDi6Hku5yXRVLXXsNdk413XFE5IxXNzrKLGN5yLQxEGwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhWvGXpEZxvVeuD6M0s2Iy2UBSwDbf/aUjGI0PwbgU9N1Fxe0z
	rGnwAwm/26cZCv0beNDL/qZ61sS+emN9ELFLDubjTZCvG5joglvPoRKruZqaxEVFkyrK4PMHUxA
	QNWRHme6XjgoSKgNTCqak1yx3zeE=
X-Google-Smtp-Source: AGHT+IGIt06f3VlhdI4HCBy5MqZ8fPDUhzjtWTTLtm+PB2Crkuaifr13ysKmDjALp3/fGv0gxr4vRiw3e6wJVqQbuXA=
X-Received: by 2002:a05:6512:4008:b0:536:536f:c666 with SMTP id
 2adb3069b0e04-5387752fa74mr1518490e87.8.1727263660328; Wed, 25 Sep 2024
 04:27:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1763151587.3581913.1727224126288@privateemail.com>
In-Reply-To: <1763151587.3581913.1727224126288@privateemail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 25 Sep 2024 20:27:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS0wreFRe4LmvecY7b3i+H3nkJEb+AMY9w63iOHxAcQcw@mail.gmail.com>
Message-ID: <CAK7LNAS0wreFRe4LmvecY7b3i+H3nkJEb+AMY9w63iOHxAcQcw@mail.gmail.com>
Subject: Re: Broken Kconfig scripts in v6.11: conf/mconf stuck in endless loop
 at 100% CPU
To: Marco Bonelli <marco@mebeim.net>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 9:28=E2=80=AFAM Marco Bonelli <marco@mebeim.net> wr=
ote:
>
> I was building v6.11 for PowerPC when I noticed that `make olddefconfig` =
hangs
> indefinitely when running `scripts/kconfig/conf` and gets stuck in what s=
eems
> an infinite loop at 100% CPU while evaluating an expression.
>
> The issue is still present on master of linux-next. I did a bisect run an=
d
> narrowed it down to this commit:
>
>         f79dc03fe68c79d388908182e68d702f7f1786bc kconfig: refactor choice=
 value calculation
>
> Steps to reproduce:
>
>         git checkout v6.11
>         export ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-
>         make distclean
>         make ppc64_defconfig
>         ./scripts/config --file .config -d PPC64
>         make olddefconfig
>         # Hangs indefinitely running scripts/kconfig/conf
>

>
> Let me know if any additional information is needed. Happy to help.


This provides enough information to figure out the issue.

I posted a patch.

Thanks.




--
Best Regards
Masahiro Yamada

