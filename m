Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33E477E4F4E
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Nov 2023 04:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjKHDGv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Nov 2023 22:06:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjKHDGu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2023 22:06:50 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76994114
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Nov 2023 19:06:48 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-28019b66ad5so5712842a91.3
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2023 19:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699412808; x=1700017608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXyl/VrB4j2M92tVMF9RjDMLzKBz8eKYKy041r0VnwI=;
        b=HFAVSYXVSrFG25Kikx3rDl9mC/j2QwkXWnm80HLZuDoTr772ahDDyxvrlDq4zgnO5C
         lcT5ZtfPpyIlt/FqKmIo5AD/4DxlGG8TFdqe96rPCpAYWTBkb8yHB7i9CeWiHkB9c6x8
         BQ8O4DOACyfrt0zK8bSGYwSOmXbsaBZvB+HMQeQW4olOgtI+ae4odegM9LwUQIfs4Oq7
         Fu8TWwhPUe2ukd4i/iz16QquMJQkooLDkvdhM0x/w8kfYeMwL+BJYCJ+HX+b2RnRk71X
         3AD4YcB9foX9nOzm/Wy8Yo0YktSng7QdjBnc5ESIoaWyOQEyr47FkJRXVjEl1ydSvH41
         JJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699412808; x=1700017608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXyl/VrB4j2M92tVMF9RjDMLzKBz8eKYKy041r0VnwI=;
        b=ILKmyP+5m0YK7lBmLwvsQ3ZfXBIxvxqwRAlK/wzVU9xiZMS12JYSGQvQoKC92JiMza
         01gfpth5va6Yy48PQ1ZT20bcAJJt3UQqdiqBsIUnB3P372st0cw7V1Ua7uTW/ZgMtpPd
         qNL6J+Am6sV4b23zkRfe0gwoEqZSt/O4TmxKGQAbTpqYp2K5rKV7s4qshlAYeYy0f4eZ
         9cVr2OFfZ2MvVGU5xYW3Gy5NkS4fSw1X0CICh6192YReUluvF5hG+gMtajIQUX6AUl3M
         c45WsKekkHEnS56qNfXYKHFhH/UEkqtwtLv28caixnVO5mF/jCWYcHNAHyXESqAS+mTh
         o8dw==
X-Gm-Message-State: AOJu0YyNDFjjmmJml2aevTTeNrqzzElIK+VAylJKnqfu2cKw3l8Chvov
        MShqxVaD6Ca9uhHl+/cFuXLSN5upn8Taqv566qM=
X-Google-Smtp-Source: AGHT+IHLkYXA4Fw74xG56i2rD6hz8beLnEarDdLtO1T2r96SP59a8cEG+Mail5QrIcCgxliASB8oliOUdxqepihdtY8=
X-Received: by 2002:a17:90b:4b48:b0:27c:f309:f381 with SMTP id
 mi8-20020a17090b4b4800b0027cf309f381mr656866pjb.6.1699412807625; Tue, 07 Nov
 2023 19:06:47 -0800 (PST)
MIME-Version: 1.0
References: <5ec262711df2f3d3ccd84930ed4e9778@free.fr>
In-Reply-To: <5ec262711df2f3d3ccd84930ed4e9778@free.fr>
From:   Jesse T <mr.bossman075@gmail.com>
Date:   Tue, 7 Nov 2023 22:06:11 -0500
Message-ID: <CAJFTR8Sfea5gCpYA+Xb5vAz=0nemrQNxSf5BFeD0jM+YfagpmA@mail.gmail.com>
Subject: Re: SymSearch can cause make nconfig to segfault
To:     Vivien Gallinaro <vivien.gallinaro@free.fr>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 7, 2023 at 9:30=E2=80=AFPM Vivien Gallinaro
<vivien.gallinaro@free.fr> wrote:
>
> Hi all,
>
> In make nconfig, when I perform a SymSearch (F8) for "x86", I get a
> segfault. It doesn't happen in make menuconfig (/ search).
>
> It doesn't seem to be a simple matter of "too many results" as a
> SymSearch for "fs" does ok.
>
>
> For a fresh 6.6 kernel :
>
> $ cd linux-6.6
> $ make mrproper
> $ make nconfig 2>../blarb
> (<F8> x86 <enter>)
> $ reset

I'm assuming "reset" here means you got put back into your shell and are
resetting the terminal state.

> $ cat ../blarb
>
> gives :
>
> make[2]: *** [scripts/kconfig/Makefile:48: nconfig] Segmentation fault
> make[1]: *** [/home/username/linux-6.6/Makefile:697: nconfig] Error 2
> make: *** [Makefile:234: __sub-make] Error 2

I can not recreate this error on my machine unfortunately are you
using the tar release?
What distro are you using?

Thanks,
Jesse Taube
>
>
> That's not very helpful, I know=E2=80=A6 looking up "x86" was not particu=
larly
> useful either! (I was following a wiki referring to x86_sysfb. Before I
> realized it probably doesn't exist any more, I tried to widen the
> search, since I had just come across the deprecation of efi_vars in
> favor of efivar_fs, so to speak.) I hope some one can help the search
> fail gracefully.
>
> Have a nice day,
> VG
