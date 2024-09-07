Return-Path: <linux-kbuild+bounces-3457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3564A9700ED
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 10:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA195281735
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 08:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C10D14A4C7;
	Sat,  7 Sep 2024 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bt+223O8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276541BC23;
	Sat,  7 Sep 2024 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725698038; cv=none; b=cmFdcZzMWKWY3KYVp+hMHmA1Mrt1FgM/m9GpAb+ntpaCnZ8bZp/dbkQBiFV7ozBfeprmNBfxjHoDyJ9GkT52jGteGV9eY5VXZDo5AkfPWdwAgAlLB0TB9mP8obVWPrgAuPrFD8erUcAPuZr1javPZ7Xq6f1o7YZ4wSbzjALcmkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725698038; c=relaxed/simple;
	bh=28Hazu9X3gNJl3G8MxXIbEf04c6aPW6n4xtnOcKil40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tt/rUB7l01mfwa9rdI5cssPN3eeGI9YRrJ9r7WxrArVPIz6GRqZDDyHvybAbsY9ucjU8iguKSxBi/uEQDpuTrGoP3oNS/oiQ6z9R6ANcOUGEcAhQihZeGeVrGFPD1mG5+qqvQ/0T9Yzv1wBJCsb3G067l448V8UqJaxTtfYLbW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bt+223O8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD34C4CEC2;
	Sat,  7 Sep 2024 08:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725698036;
	bh=28Hazu9X3gNJl3G8MxXIbEf04c6aPW6n4xtnOcKil40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bt+223O8CGiUdqQTBKe1Dd1i2GE9czyhTdZHdAJ4W1kq7B4exG1Y52JTa4XalMtLw
	 3EjGPKhbeHMxsRRCzdPO9qpbqEoG3zACev1lIyYSD1+6F9l//e6Y3WLBQZIExz4fy6
	 zrt9/nWMkrMg8ZnaBmfwmZ3prqm8l5PXaip/Kbg7k1R1YRRy6PbS1vUebBiZwUoezm
	 abONWDXSWj/bfxnWp1xOSzgNit2MDR2y7tr5MA+r/B/W31o7cmRlplWnZlxdDqfzMI
	 2/LSzCUP9j467u6EqPukQBc7z72J8DbHww1OJJLOB4vZw28NFQn3qu2B1IvFW0+fIY
	 Ddny+PjU6Pr2A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f75aa08a96so5369721fa.1;
        Sat, 07 Sep 2024 01:33:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSBI2hLciR7WgN/ZEJ85J6Q7K9aCcQbPKOCYNZP6S6J/A0CnTvIf2avgOPzG6KKX8kPPFxlWnT7s46wTJi@vger.kernel.org, AJvYcCUlv/5sIilXh2IA88MowweBEb2sgGxIIzzpuGzVh5qoy8bFlJ6A64IcHOC1ga/vbYTAlgiPj3C9uSiSkNQ=@vger.kernel.org, AJvYcCVDnn+8sUzdaLtgmQ8A/SbpAyWwPMBrqdlHDaD33O0aSvR8sliKaBfgFH8MDibdDzefw4ylLidpEqK31BOA@vger.kernel.org, AJvYcCWUwfWn5JeLBACpSzZuurOffwTLa7M8BIp3s2/HsbDnKpfleGpPY2T+uwqmW0e4+vBMav9vrCVMZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfe8NuvKC8/aOk5tLbVCFXLTL9Ul1W2EbMAn9ciX6re+0h8ZRx
	GGY063XFsqDdokBPCLZ5SMV54wh0e6juNEfz2vk410mLfkRS4ZtNW6cunV3LCp7QsO7b87LhMcI
	07OX8uBguPFBGpB3M7jrm4SWZTpA=
X-Google-Smtp-Source: AGHT+IGiO0grfYCPThFgBWdbGnh5ywWPEfhApDWuSp1Dpho+N3p8He+DadB7u7HS7zJcZD43BZdwwTxPjh5NmXNMfjQ=
X-Received: by 2002:a05:6512:e97:b0:533:3fc8:9ac0 with SMTP id
 2adb3069b0e04-536587c6a50mr3459219e87.34.1725698035371; Sat, 07 Sep 2024
 01:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com> <20240906-macos-build-support-v2-8-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-8-06beff418848@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Sep 2024 17:33:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASpWSXbjF_7n0MhosNism=BpvHOnKsa344RPM_wmC9dGA@mail.gmail.com>
Message-ID: <CAK7LNASpWSXbjF_7n0MhosNism=BpvHOnKsa344RPM_wmC9dGA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] Documentation: add howto build in macos
To: da.gomez@samsung.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> Add documentation under kbuild/llvm to inform about the experimental
> support for building the Linux kernel in macOS hosts environments.
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>


Instead, you can add this instruction to:

https://github.com/bee-headers/homebrew-bee-headers/blob/main/README.md





> ---
>  Documentation/kbuild/llvm.rst | 78 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 78 insertions(+)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rs=
t
> index 6dc66b4f31a7..de3bde925793 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -186,6 +186,84 @@ yet. Bug reports are always welcome at the issue tra=
cker below!
>       - Supported
>       - ``LLVM=3D1``
>
> +Experimental Build in macOS
> +---------------------------
> +
> +Building on macOS with LLVM is experimental. This section provides steps=
 to
> +install dependencies via Homebrew, set up the environment, and start the=
 build
> +process.
> +
> +1. **Create a Case-Sensitive Volume**
> +
> +   For fetching and building the project, you need a case-sensitive volu=
me. Use the following
> +   command to create one:
> +
> +   .. code-block:: shell
> +
> +      diskutil apfs addVolume /dev/disk<N> "Case-sensitive APFS" linux
> +
> +   Replace `/dev/disk<N>` with the appropriate disk identifier.
> +
> +2. **Install Build Dependencies**
> +
> +Use Homebrew to install the required build dependencies.
> +
> +- **Core Utilities**: `coreutils`, `findutils`, `gnu-sed`, `gnu-tar`, `g=
rep`,
> +  `llvm`, `make`, and `pkg-config`.
> +
> +   .. code-block:: shell
> +
> +      brew install coreutils findutils gnu-sed gnu-tar grep llvm make pk=
g-config
> +
> +- **Bee Headers**: Install byteswap, elf and endian headers using the
> +  `Bee Headers Project <https://github.com/bee-headers/headers>`_.
> +
> +   .. code-block:: shell
> +
> +      brew tap bee-headers/bee-headers
> +      brew install bee-headers/bee-headers/bee-headers
> +
> +   After installation, verify the `CFLAGS` with `pkg-config`:
> +
> +   .. code-block:: shell
> +
> +      pkg-config --cflags bee-headers
> +      -I/opt/homebrew/Cellar/bee-headers/0.1/include
> +
> +3. **Configure the PATH**
> +
> +   Include all the required GNU tools and LLVM in your `PATH`. This ensu=
res that
> +   the necessary tools are available during the build process.
> +
> +   .. code-block:: shell
> +
> +      PATH=3D"/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/make/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/llvm/bin:$PATH"
> +
> +Building the Project
> +--------------------
> +
> +Once the environment is set up, you can start the build process using LL=
VM. Run
> +the following commands to initiate the build:
> +
> +.. code-block:: shell
> +
> +   make LLVM=3D1 allyesconfig
> +   make LLVM=3D1 -j$(nproc)
> +
> +Supported in macOS
> +~~~~~~~~~~~~~~~~~~
> +
> +At the moment, only arm64 is supported and tested with `allyesconfig` Ma=
kefile
> +configuration target. Other Kconfig options not included in `allyesconfi=
g`
> +target and architectures may be supported as well as support in macOS is=
 based
> +on LLVM effort and maintenance.
> +
>  Getting Help
>  ------------
>
>
> --
> 2.46.0
>
>


--
Best Regards
Masahiro Yamada

