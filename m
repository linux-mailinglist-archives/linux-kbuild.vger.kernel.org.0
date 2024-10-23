Return-Path: <linux-kbuild+bounces-4245-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A059ABC29
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 05:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C0CF1C2104F
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 03:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E29D1369AA;
	Wed, 23 Oct 2024 03:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTR3CnIp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D01126F0A;
	Wed, 23 Oct 2024 03:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729654204; cv=none; b=QE+9KWPwuqsMoOcKI2M8M+fCgPTr/Mp7PH2F+M1LLqlxmgpILad1WmICWEDApAYeEtdvI1VnHitdHM6lJDqshA3XVvmJvVXJBZDdgZ1RVeykiT+hB2I2RXm0orCK0P9hcmsZjexM4yw5zM522TiZMx6ZMSpW9rqLSq4gBsJEr+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729654204; c=relaxed/simple;
	bh=2QH7o/xnY5buqG6VSOOECvqeMUs3gXdxwVdicaQmOcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujxM6VRBX7SNEGvur44WI6bnlsC3Q5eSwCXCmrnfDlGfhDRqax70bt4dlmjU2bbfdgjlzJp0pjPdotVgO9efofKSYwl1O9mN03tgOJ3c1+ycpE9JcSUQoZREARXQET2FqXRb9ovyOYp4baDC5TYsKXc51GPNbaMLnotaTrhaNAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTR3CnIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED771C4CEE3;
	Wed, 23 Oct 2024 03:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729654204;
	bh=2QH7o/xnY5buqG6VSOOECvqeMUs3gXdxwVdicaQmOcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DTR3CnIp+vADatNfT9fxS0zkheAm72x0iEGSm1CVkE7/FQudeO5FHhHBUSvCEjlXG
	 AIHRH0epkrbAsMe2Ng7lsVB4osuwdeeXOJX9EcXmoDwgKt02yHIgKsb5MzbUlXFJYq
	 zWPwOQZ8r1CWXf1agCAC7jq3W7ypKHEIJBZHiPl7lnYnM6vnzWSTAlSUt8k9IbFE18
	 M+7mODoaECfOTg2m2h7x5UeMW87Ra8y27F6nqR7wAZnKvXSZZeAKn8WpIr2zqTh0z6
	 mUTa/7RyrRNqUMuoe/jimuyAD1Ur88xTlLwIAoJHWUqdjp7KYnAVmmREHWkK+I0yzd
	 7op7MBQasgFgQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so7091701e87.2;
        Tue, 22 Oct 2024 20:30:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULx/TQqrej3QKlDwpctxJm/0SOPADiSUJovT1CT6+VQLRSb6kJrbIuEE7DfDnuFx6/XcCDJuJ05zjSNg==@vger.kernel.org, AJvYcCUYeRnJDd2w+MQSEtP18H8idnvMQYnrK/MI1Af+jhDUceHJJHxWgCjKp2zNmhk3d4VWY4m0ofC8qZjxvj0=@vger.kernel.org, AJvYcCXDy1snZst8IWNYIh1qAQem07teyDZOJ4xolT/TCod+W0DttfsQ4GxpxBL5YXFvA+WWKh3JIR8TqKTgGqmu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1rZmwWCppzhcm7g3q3BIQ2JSpxS8nLyR2k9aEpJqoyXZWMIMn
	aSsY5iLmQa41q4w6cVbDqJtTOFCUyqlYpk5Fv3oOriEz9BV1DN8d0vqb29tJYzOH2i+OX+PVxAI
	AG0/nK4fX/Sa69ifWnacIdQqbYig=
X-Google-Smtp-Source: AGHT+IGSDt3HCGiS1BKVgcnN2K4EIB+exWXAN5PUwzfBHg3n+S5DeAzMkeNnBhyWbAqMZS39gSwENkzAJDlXj5dcYv4=
X-Received: by 2002:a05:6512:1312:b0:539:ea54:8d22 with SMTP id
 2adb3069b0e04-53b1a304bf6mr327527e87.18.1729654202655; Tue, 22 Oct 2024
 20:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
 <20241021201657.GA898643@thelio-3990X> <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com>
 <20241022200732.GA487584@thelio-3990X>
In-Reply-To: <20241022200732.GA487584@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 23 Oct 2024 12:29:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARSHhKr=4jrAFUrnVwU6Yw3reybku3CEVxDnSKqBptRVQ@mail.gmail.com>
Message-ID: <CAK7LNARSHhKr=4jrAFUrnVwU6Yw3reybku3CEVxDnSKqBptRVQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
To: Nathan Chancellor <nathan@kernel.org>
Cc: Koakuma <koachan@protonmail.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, 
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 5:07=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Oct 23, 2024 at 04:10:01AM +0900, Masahiro Yamada wrote:
> > I applied this patch set, but I still observe a build error.
> ...
> > masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ make
> > LLVM=3D~/tools/llvm-latest/bin/  ARCH=3Dsparc sparc64_defconfig all
> ...
> > clang: error: unsupported argument '--undeclared-regs' to option '-Wa,'
>
> Koakuma might know more than I do but I did not test either the
> integrated assembler or the rest of the LLVM tools; I only tested clang
> for CC. As far as I am aware, that has been where most of the effort in
> llvm-project has been going and I think there are probably other fixes
> that will be needed for the other tools. The command I tested was:
>
>   $ make -skj"$(nproc)" \
>          ARCH=3Dsparc64 \
>          CC=3Dclang \
>          CROSS_COMPILE=3Dsparc64-linux-gnu- \
>          LLVM_IAS=3D0 \
>          mrproper defconfig all


With running this command in Ubuntu 24.10, I got improvements,
but I still got another build error.  (unknown argument: '-mv8plus')


masahiro@3606c94ac88c:~/workspace/linux-kbuild$ make -skj"$(nproc)"
ARCH=3Dsparc64 CC=3Dclang CROSS_COMPILE=3Dsparc64-linux-gnu- LLVM_IAS=3D0
mrproper defconfig all
<stdin>:1519:2: warning: syscall clone3 not implemented [-W#warnings]
 1519 | #warning syscall clone3 not implemented
      |  ^
1 warning generated.
arch/sparc/vdso/vclock_gettime.c:274:1: warning: no previous prototype
for function '__vdso_clock_gettime' [-Wmissing-prototypes]
  274 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec =
*ts)
      | ^
arch/sparc/vdso/vclock_gettime.c:273:9: note: declare 'static' if the
function is not intended to be used outside of this translation unit
  273 | notrace int
      |         ^
      |         static
arch/sparc/vdso/vclock_gettime.c:302:1: warning: no previous prototype
for function '__vdso_clock_gettime_stick' [-Wmissing-prototypes]
  302 | __vdso_clock_gettime_stick(clockid_t clock, struct
__kernel_old_timespec *ts)
      | ^
arch/sparc/vdso/vclock_gettime.c:301:9: note: declare 'static' if the
function is not intended to be used outside of this translation unit
  301 | notrace int
      |         ^
      |         static
arch/sparc/vdso/vclock_gettime.c:327:1: warning: no previous prototype
for function '__vdso_gettimeofday' [-Wmissing-prototypes]
  327 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct
timezone *tz)
      | ^
arch/sparc/vdso/vclock_gettime.c:326:9: note: declare 'static' if the
function is not intended to be used outside of this translation unit
  326 | notrace int
      |         ^
      |         static
arch/sparc/vdso/vclock_gettime.c:363:1: warning: no previous prototype
for function '__vdso_gettimeofday_stick' [-Wmissing-prototypes]
  363 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv,
struct timezone *tz)
      | ^
arch/sparc/vdso/vclock_gettime.c:362:9: note: declare 'static' if the
function is not intended to be used outside of this translation unit
  362 | notrace int
      |         ^
      |         static
4 warnings generated.
clang: error: unknown argument: '-mv8plus'
make[5]: *** [scripts/Makefile.build:229:
arch/sparc/vdso/vdso32/vclock_gettime.o] Error 1
sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso-note.o: missing
.note.GNU-stack section implies executable stack
sparc64-linux-gnu-ld: NOTE: This behaviour is deprecated and will be
removed in a future version of the linker
make[5]: Target 'arch/sparc/vdso/' not remade because of errors.
make[4]: *** [scripts/Makefile.build:478: arch/sparc/vdso] Error 2



masahiro@3606c94ac88c:~/workspace/linux-kbuild$ clang --version
Ubuntu clang version 19.1.1 (1ubuntu1)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/lib/llvm-19/bin


Is this version too old, or am I missing something?





> I see this as more of a stepping stone series to make testing those
> other components easier as time goes on, hence why I did not really
> consider user facing documentation either like you brought up in the
> other thread.
>
> Cheers,
> Nathan




--=20
Best Regards
Masahiro Yamada

