Return-Path: <linux-kbuild+bounces-1783-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E258BC6BA
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2024 07:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A6BC1F21BFA
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2024 05:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542A64D58E;
	Mon,  6 May 2024 05:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqHS/vGn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A90482C3;
	Mon,  6 May 2024 05:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714972876; cv=none; b=LHYY/yHn1EMpmKUUIsS7loS/vm8njq5ITML7Ui6hFnSNn+UjcRwyEIZEpzqv55ER+/dYHAn2uG0M61994bE2CBIYdXT4M/bfNvgk920T6guMnabKMsKLuV9Dvj9UWJSce/hluubqEVY7J8T3p2lVPhznsYnIfIdl1LC12GxxWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714972876; c=relaxed/simple;
	bh=IKlIvjuBn/H754DI9jvJWcFPcdV3jR8qdRnrj4+WI+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTNkp4lLt5ir7vVD9cX50esZmzprHcolyE25WBUBhthMgi4Yur3iBO0i4DXRuGC5r0xGmvjcjPFUkAWTrisd5914DK8fQp+95pZ0hZEZ9Foe9s10TIZaltM27fs7pxQVSTDxrIgIM+gW36mQ8iJAeQh4GXgN18mjrs2mW6C3aug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqHS/vGn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A56C116B1;
	Mon,  6 May 2024 05:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714972875;
	bh=IKlIvjuBn/H754DI9jvJWcFPcdV3jR8qdRnrj4+WI+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tqHS/vGnvtQgm5ottAK403iYyDc6/kLmsTqJatmTnLywHGL2J4Yx3BQFHn8kIh5py
	 nAooPFJ/9D/gp80HpsyAE7VLHtgoEXN2oFlLX5jPGy9UcaNhHy63gOMOzCBNTTjYzY
	 zTp1VSdM3dp9bb6a1cRiUxYBB01w14LtjpGUitKZvmBd////F+XFWc+2WhNuCayL1f
	 5DKi+xN1JCPwBItgzdC22IH1kLTrDRX9bueAA25gRiT5J7ruCdhav0YQqrZ4kFm33e
	 GoiquvMi/ejmmVn8rmJXrvcabBTLqBrTOjH9PoG8HDm8g2HgzSTiZfZk5HaOctZgEA
	 vnVuNTv7yqmXw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f72a29f13so1793397e87.3;
        Sun, 05 May 2024 22:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUN5bEpBmEgr3VFQifDqAad5vcxr7JTmsV4nAOzCMOqLiX1hFq62oU34QTfvd32oBL7oElXIcSyMpIwBMX8bQ5cwujIJfjSalv+8gB1cWhJBS3K0zcNCt1MFYZVzDLfe6spJcM3VP8Brrt8P/nHONeTGKHIPrtN+wuF1WDPPeTm57lQfepwgjI=
X-Gm-Message-State: AOJu0YzaY9FmWx1A2wyhiu7Pe6CI8Rekok3SQkU3tXm1E9qvibdT+EcT
	yNbbo6DHwUd+C2TMjx45w0KemVURI6FfKMU8vfOdtUJmj6wU4hEsh6fGO4O0aMOZgpQkeoQ24dX
	G8VpSsnur6at4brRsKVIhwXnV2wg=
X-Google-Smtp-Source: AGHT+IHQJhS1znz8gVwOUrqUtv4OQz0bCGrfCQ1loRBZocjB8uJP1gVAFiA08qYh/ghUaXKQtWYvCUkCZIIXeKTn4Jg=
X-Received: by 2002:ac2:4189:0:b0:51d:aaf7:a92e with SMTP id
 z9-20020ac24189000000b0051daaf7a92emr6626911lfh.47.1714972874359; Sun, 05 May
 2024 22:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503091823.3616962-9-senozhatsky@chromium.org>
 <202405041440.UTBQZAaf-lkp@intel.com> <20240504071416.GH14947@google.com>
 <20240504161004.f5a0aab5e5aa1033d4696c20@linux-foundation.org>
 <20240505043957.GA8623@google.com> <20240505051305.GB8623@google.com>
 <20240505064832.GC8623@google.com> <20240506032207.GD8623@google.com>
In-Reply-To: <20240506032207.GD8623@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 6 May 2024 14:20:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNARUBuR3gDtX6GfB7Zv6dydt1+qzBB_XT58wOg3WeCTVvA@mail.gmail.com>
Message-ID: <CAK7LNARUBuR3gDtX6GfB7Zv6dydt1+qzBB_XT58wOg3WeCTVvA@mail.gmail.com>
Subject: Re: [PATCH 08/14] zram: check that backends array has at least one backend
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Minchan Kim <minchan@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 12:22=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (24/05/05 15:48), Sergey Senozhatsky wrote:
> > On (24/05/05 14:13), Sergey Senozhatsky wrote:
> > > On (24/05/05 13:39), Sergey Senozhatsky wrote:
> > > [..]
> > > > > I guess just pick one if none were selected.
> > >
> > > How do I pick one if none were selected? Does Kconfig support
> > > something like that?
> >
> > This triggers Kconfig error:
> >
> > config ZRAM_EMPTY_BACKENDS_FIXUP
> >        bool
> >        depends on ZRAM && !ZRAM_BACKEND_LZO && !ZRAM_BACKEND_LZ4 && \
> >                !ZRAM_BACKEND_LZ4HC && !ZRAM_BACKEND_ZSTD && \
> >                !ZRAM_BACKEND_DEFLATE
> >        select ZRAM_BACKEND_LZO
> >
> >
> > drivers/block/zram/Kconfig:17:error: recursive dependency detected!
> > drivers/block/zram/Kconfig:17:  symbol ZRAM_BACKEND_LZO is selected by =
ZRAM_EMPTY_BACKENDS_FIXUP
> > drivers/block/zram/Kconfig:52:  symbol ZRAM_EMPTY_BACKENDS_FIXUP depend=
s on ZRAM_BACKEND_LZO
> >
> >
> > I'm a little surprised by this - EMPTY_BACKENDS_FIXUP does not depend
> > on ZRAM_BACKEND_LZO, it depends on NOT ZRAM_BACKEND_LZO.
> >
> > Let me Cc linux-kbuild. Kbuild folks, how do I workaround this?
>
> Is this how one does it?
>
> config ZRAM_BACKEND_LZO
>        bool "lzo and lzo-rle compression support"
>        depends on ZRAM
>        default y if !ZRAM_BACKEND_LZ4 && !ZRAM_BACKEND_LZ4HC && \
>                !ZRAM_BACKEND_ZSTD && !ZRAM_BACKEND_DEFLATE
>        default n
>        select LZO_COMPRESS
>        select LZO_DECOMPRESS
>
>
> User still can select N and then we'll have empty backends, but
> at least default is Y if none of the algorithms were selected.
> Is it good enough?


I interpret this sentence into:

"randconfig will eventually disable all ZRAM_BACKEND_*,
causing the build error again.
Is it good enough, Arnd?"



Some possible solutions:



config ZRAM_BACKEND_FORCE_LZO
        def_bool !ZRAM_BACKEND_LZ4 && !ZRAM_BACKEND_LZ4HC && \
                 !ZRAM_BACKEND_ZSTD && !ZRAM_BACKEND_DEFLATE
        depends on ZRAM
        select ZRAM_BACKEND_LZO

config ZRAM_BACKEND_LZO
        bool "lzo and lzo-rle compression support"
        depends on ZRAM
        select LZO_COMPRESS
        select LZO_DECOMPRESS


OR


config ZRAM_BACKEND_FORCE_LZO
        def_bool !ZRAM_BACKEND_LZ4 && !ZRAM_BACKEND_LZ4HC && \
                 !ZRAM_BACKEND_ZSTD && !ZRAM_BACKEND_DEFLATE

config ZRAM_BACKEND_LZO
        bool "lzo and lzo-rle compression support" if !ZRAM_BACKEND_FORCE_L=
ZO
        depends on ZRAM
        default ZRAM_BACKEND_FORCE_LZO
        select LZO_COMPRESS
        select LZO_DECOMPRESS




BTW, "default n" you are adding are redundant.

--=20
Best Regards
Masahiro Yamada

