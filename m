Return-Path: <linux-kbuild+bounces-6238-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CCAA679E3
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Mar 2025 17:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84D7188A627
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Mar 2025 16:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEB32080D6;
	Tue, 18 Mar 2025 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bOJtO65h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F80D204C39
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Mar 2025 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742316104; cv=none; b=Muqxcnto9w4lnIyKGLGNrSp5UGDjPcvKQ6IMEReXSE7DPSGwaUl7RB29Xrget0ZaaGM6qELIJdti981YjFYokbdKpaecml+VJckJ9sOzVS44Um8rjjGxIy/Ft+pcm2RNY8sH8Zgp4DSx3SI+qMwnmlHGe6ed47//W+sMmYDzfyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742316104; c=relaxed/simple;
	bh=+CwDqE0Jy7xemprqpdbhN6+eMuZiaFCKAqG81f7NNf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKrSDGhvsdNbw1N7Ygsj1cOPY9Oy/eLkitcgmWl5fpGIQ7kLvVz3DmaruaCipAVhjZlpG68EtqKL+DZ7Oo8gfyVXGyLyK2qicEQAppspWmJhD9PJlfnxkSChkGXOrLrgtCDDs0jYZp2EhGb2jFZG/DXU3nz7OBfI9usyLKCCbgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bOJtO65h; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499bd3084aso5880666e87.0
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Mar 2025 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742316095; x=1742920895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOg4onZlczYUopmqvMhF5e0J5/uBp1U0C4HX9hJitis=;
        b=bOJtO65hq9vqD+Y+UjSvbfVrtNOqnydPjYzFRf8t8aaTez1wMs08xV/866RZ6XoMdQ
         +ucpAASaWN4T24/KU54hnrq6jOHOmysXbyYtdDfQwPu7pQa07EFX1CvnmhFj565zO31d
         OJ5gb4NpfnqMLXr6ApKPUqtcuIS0FJN0zMESM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742316095; x=1742920895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOg4onZlczYUopmqvMhF5e0J5/uBp1U0C4HX9hJitis=;
        b=Q3GftLUVQTfDejuhjNaAXzHwxGe00AKQHu7tejAsUPe82RCEgQSQqkrLRwvBzgZVnL
         LI04UOoSQKwEr4UFhnHOPoBBcSJQWIOhq3eJ3LxOzBRkukBN8z/qvlCre2rWQptwXvh3
         /Xkv1NVzmbYUqQzs11LCeyOfu+BitaWNxXOA5hXBuJ78RwhcATW1/WVpT3ZOEiwA4Iu2
         1KYL0k1VrZO03i5cADhU5EY51gUh97jNhPXiK0xE0Zr8XdqXQn3v5YpsVzPW/pI37X0d
         o3YeIbQRjwCHIPVSq+/e/xEduPG7a0qd/kM0Ki0lcrpfDfYq0dnGBts1tktpOk3lwBZ4
         TItA==
X-Forwarded-Encrypted: i=1; AJvYcCUqsoEujzyH0Zg9CArs9bM/DTBHM+2pLEeCb7fQHcPybCIc9dfOY9nyf237AgYGPAwxlWZ37G2lKbumE1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFe3X2QVgaJz9c4xn1ElUSXipWr6j3TNsO33VU8OmuPPwlu6rB
	klOSMZer9Fvn0bkpzhkOOHNSnJCrC71hj0AzeAEjWtL3VoNA/OH0VPa5FVNx1s0Pm+8EHwSpGTx
	Tvw==
X-Gm-Gg: ASbGncvqcYZHIW1JD/REPOfdRBhI43/xvujHX0GUwYO3ITSsUWIqX4auuvawZk7xey4
	yUpwfxUUIVOffCS0CtoQIVxlfLVWc15E29MDnBhbWyXfTuifNJa+K9ONdhK9cyIrgc0LR7rzVuv
	fnn9bO4l0yfzTU3+0bA43ceSu/0MsckR3HPfuZ/brymzSg1EG1DltuI40OSEL1VU+dPkORxvMUV
	N5AtYGMakb5OGB/TS+d+fMOIYhevgIwqJgdGSjX+Bc0MVpVddWtuMwmJfaCKTfqd4w56iafv9hx
	JxtTkuahw/PbokC/DTvlkADsbe0FNzowm3zqvKM0MnijVdr1wRMX4YWN2P5map8HgJR0Rk2jAkB
	hSGTNpQJh
X-Google-Smtp-Source: AGHT+IHBwPjdAE+sl26Kjubt5+RocOdlspEJz5StY2xvV0of7NL1Hs1iKnBP2pbUSplci8wwXdovOw==
X-Received: by 2002:a05:6512:696:b0:549:8b24:9896 with SMTP id 2adb3069b0e04-549c360f4a4mr10946202e87.0.1742316095097;
        Tue, 18 Mar 2025 09:41:35 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a9201sm1703853e87.250.2025.03.18.09.41.32
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 09:41:32 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549b116321aso6416839e87.3
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Mar 2025 09:41:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpBl0X3+5SLUU9aBU8PkvqB6gyfnaA72YrjCEaIjQ5E0fewiP0A52i9oDE1wp8REx63JiFOa+X026+vtU=@vger.kernel.org
X-Received: by 2002:a05:6512:ba8:b0:545:109b:a9c7 with SMTP id
 2adb3069b0e04-549c3924ec3mr10662030e87.35.1742316092405; Tue, 18 Mar 2025
 09:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211002930.1865689-1-masahiroy@kernel.org>
In-Reply-To: <20250211002930.1865689-1-masahiroy@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Mar 2025 09:41:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V19pgzU8NSyWwHSEs85kU_Fbofcn8uJVj-TE2DNKfUHQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrtVKlA3T-hQmTx0UN5J-nOczdtlwAB856CkOgr9IjXZF78oLoe0IpSDm8
Message-ID: <CAD=FV=V19pgzU8NSyWwHSEs85kU_Fbofcn8uJVj-TE2DNKfUHQ@mail.gmail.com>
Subject: Re: [PATCH] tools: fix annoying "mkdir -p ..." logs when building
 tools in parallel
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Borislav Petkov <bp@suse.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 10, 2025 at 4:30=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> When CONFIG_OBJTOOL=3Dy or CONFIG_DEBUG_INFO_BTF=3Dy, parallel builds
> show awkward "mkdir -p ..." logs.
>
>   $ make -j16
>     [ snip ]
>   mkdir -p /home/masahiro/ref/linux/tools/objtool && make O=3D/home/masah=
iro/ref/linux subdir=3Dtools/objtool --no-print-directory -C objtool
>   mkdir -p /home/masahiro/ref/linux/tools/bpf/resolve_btfids && make O=3D=
/home/masahiro/ref/linux subdir=3Dtools/bpf/resolve_btfids --no-print-direc=
tory -C bpf/resolve_btfids
>
> Defining MAKEFLAGS=3D<value> on the command line wipes out command line
> switches from the resultant MAKEFLAGS definition, even though the command
> line switches are active. [1]
>
> The first word of $(MAKEFLAGS) is a possibly empty group of characters
> representing single-letter options that take no argument. However, this
> breaks if MAKEFLAGS=3D<value> is given on the command line.
>
> The tools/ and tools/% targets set MAKEFLAGS=3D<value> on the command
> line, which breaks the following code in tools/scripts/Makefile.include:
>
>     short-opts :=3D $(firstword -$(MAKEFLAGS))
>
> If MAKEFLAGS really needs modification, it should be done through the
> environment variable, as follows:
>
>     MAKEFLAGS=3D<value> $(MAKE) ...
>
> That said, I question whether modifying MAKEFLAGS is necessary here.
> The only flag we might want to exclude is --no-print-directory, as the
> tools build system changes the working directory. However, people might
> find the "Entering/Leaving directory" logs annoying.
>
> I simply removed the offending MAKEFLAGS=3D.
>
> [1]: https://savannah.gnu.org/bugs/?62469
>
> Fixes: a50e43332756 ("perf tools: Honor parallel jobs")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

I happened to sync up to mainline today and noticed that my build was
broken. I bisected it to this change and reverting this change fixes
my build on mainline.

In my case I'm building in a ChromeOS environment and using clang as
my compiler. I'm also cross-compiling an arm64 kernel on x86 host.
...but the pure mainline kernel should work there. Presumably the
environment is a bit different compared to the typical one, though?

The error comes up when doing a clean build and the first error messages ar=
e:

In file included from libbpf.c:36:
.../tools/include/uapi/linux/bpf_perf_event.h:14:21: error: field has
incomplete type
      'bpf_user_pt_regs_t' (aka 'struct user_pt_regs')
   14 |         bpf_user_pt_regs_t regs;
      |                            ^
.../tools/include/../../arch/arm64/include/uapi/asm/bpf_perf_event.h:7:16:
note: forward
      declaration of 'struct user_pt_regs'
    7 | typedef struct user_pt_regs bpf_user_pt_regs_t;
      |                ^

btf_dump.c:1860:10: error: cast to smaller integer type 'uintptr_t'
(aka 'unsigned int') from 'const void *'
      [-Werror,-Wvoid-pointer-to-int-cast]
 1860 |         return ((uintptr_t)data) % alignment =3D=3D 0;
      |                 ^~~~~~~~~~~~~~~
btf_dump.c:2045:4: error: format specifies type 'ssize_t' (aka 'long')
but the argument has type 'ssize_t' (aka 'int')
      [-Werror,-Wformat]
 2044 |                 pr_warn("unexpected elem size %zd for array
type [%u]\n",
      |                                               ~~~
      |                                               %d
 2045 |                         (ssize_t)elem_size, id);
      |                         ^~~~~~~~~~~~~~~~~~
./libbpf_internal.h:171:52: note: expanded from macro 'pr_warn'
  171 | #define pr_warn(fmt, ...)       __pr(LIBBPF_WARN, fmt, ##__VA_ARGS_=
_)
      |                                                   ~~~    ^~~~~~~~~~=
~


I don't have time to dig right now, but I figured I'd at least post in
case the problem is obvious to someone else.


-Doug

