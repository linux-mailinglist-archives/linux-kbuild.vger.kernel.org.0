Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0EA27AB3E
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Sep 2020 11:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgI1JyH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Sep 2020 05:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgI1JyH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Sep 2020 05:54:07 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196F0C061755;
        Mon, 28 Sep 2020 02:54:07 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id u25so313009otq.6;
        Mon, 28 Sep 2020 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=XrekDJ8/Kn4liZXu7G8whetkgOzyeeLWcjBGPZVdnBc=;
        b=PTIDYztEvAXGUq+l2r9F7MMpiFiawKjmDr3Nd5T/NqihOWWz33ZD49IPcTpPaOsn8n
         B79Beh17TkYx8od2qPKWs9tr1spr1CgAySBG1TmgomzoAbQhU4FqM2C6qWPU6UDjoDZe
         hbWccRKVm0ocHDuhnIFwK/M+rgHOS+IaUcsBWeEPOAXAaG8P4SdXNX1qNA+oq8Y30LwZ
         qd3D03fu0o7Z1hqseSNkXUJV/BLvUWIS+YPayorYi4EItRZwX7Fjao4mw3PEU4UIGIvr
         3jAaoeU5xgE8WK2kQe58D5UTnR0/0tRKksu0/HF1uLElDYABqeN5HkwT3MKsQuvRMs5O
         kdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=XrekDJ8/Kn4liZXu7G8whetkgOzyeeLWcjBGPZVdnBc=;
        b=LlVrugIRPZyG5unbh/AJNRNWwA8lywYPgHCsYnL0SwN/zUSn8+mhA6xdvAy1CnXG2y
         sLWvl+ePENQt0286XGApgq9IIivS3Ut+NDwn3hPo8zZCNcgtm6ttH2yeRrWs+TQtyeVi
         28FMmk7Q+utLh95q+5Lm3iZ2rxJAmWwRPjpvfloNT0Ul5l+t+2/zrDT8wG499G16QkNw
         I6diOOdmZYGZjdh1DsDCxgmYZ6GFPctCSyXL83U9YBSR42Qe9td1PuEzSHquAKQjV6qo
         yCubv3PG51q9gJR4ohSJdqIbGIOCfoV5UJplTMzLzirHTGmMdLAikspu1Zg1hqDppefX
         OncA==
X-Gm-Message-State: AOAM5305t2Bq/FDVRSLattsidJsPjKIgStv8gmiWzONhh6rJVzjxoI9V
        HmgYxzLzH4o9ZZG7P6Sqzvl1kaKrV8MTmHK0ZJY=
X-Google-Smtp-Source: ABdhPJy2k1qsenOpWYSTD92r+jTDynh5HVDLWCCESCjkL0O44siJno5Cosq9Ii+SuYqrp2lVdLdrDkzAjQkXjqYMwAA=
X-Received: by 2002:a05:6830:13da:: with SMTP id e26mr431811otq.28.1601286846444;
 Mon, 28 Sep 2020 02:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200928085505.GA22244@shbuild999.sh.intel.com>
In-Reply-To: <20200928085505.GA22244@shbuild999.sh.intel.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 28 Sep 2020 11:53:54 +0200
Message-ID: <CA+icZUWvVB_D2USqUivohvywjtxe5jfW1phcA84Rfz9Cwy9jfQ@mail.gmail.com>
Subject: Re: PROBLEM: zstd bzImage decompression fails for some x86_32 config
 on 5.9-rc1
To:     Feng Tang <feng.tang@intel.com>
Cc:     Nick Terrell <terrelln@fb.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, rong.a.chen@intel.com,
        philip.li@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 28, 2020 at 10:55 AM Feng Tang <feng.tang@intel.com> wrote:
>
> Hi Nick,
>
> 0day has found some kernel decomprssion failure case since 5.9-rc1 (X86_32
> build), and it could be related with ZSTD code, though initially we bisected
> to some other commits.
>
> The error messages are:
>
>         early console in setup code
>         Wrong EFI loader signature.
>         early console in extract_kernel
>         input_data: 0x046f50b4
>         input_len: 0x01ebbeb6
>         output: 0x01000000
>         output_len: 0x04fc535c
>         kernel_total_size: 0x055f5000
>         needed_size: 0x055f5000
>
>         Decompressing Linux...
>
>         ZSTD-compressed data is corrupt
>
> This could be reproduced by compiling the kernel with attached config,
> and use QEMU to boot it.
>
> We suspect it could be related with the kernel size, as we only see
> it on big kernel, and some more info are:
>
> * If we remove a lot of kernel config to build a much smaller kernel,
>   it will boot fine
>
> * If we change the zstd algorithm from zstd22 to zstd19, the kernel will
>   boot fine with below patch
>

Hi,

Recently, Debian has updated initramfs-tools/initramfs-tools-core packages
with ZSTD support:

[ /usr/sbin/mkinitramfs ]

case "${compress}" in
gzip)   # If we're doing a reproducible build, use gzip -n
       if [ -n "${SOURCE_DATE_EPOCH}" ]; then
               compress="gzip -n"
       # Otherwise, substitute pigz if it's available
       elif command -v pigz >/dev/null; then
               compress=pigz
       fi
       ;;
lz4)    compress="lz4 -9 -l" ;;
zstd)   compress="zstd -q -19 -T0" ;;
xz)     compress="xz --check=crc32"
       # If we're not doing a reproducible build, enable multithreading
       test -z "${SOURCE_DATE_EPOCH}" && compress="$compress --threads=0"
       ;;
bzip2|lzma|lzop)
       # no parameters needed
       ;;
*)      echo "W: Unknown compression command ${compress}" >&2 ;;
esac

As you can see it uses compression-level 19 for ZSTD.
Maybe it is good to change from 22 to 19 in the Linux-kernel sources?

Thanks.

Regards,
- Sedat -

>         diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
>         index 3962f59..8fe71ba 100644
>         --- a/arch/x86/boot/compressed/Makefile
>         +++ b/arch/x86/boot/compressed/Makefile
>         @@ -147,7 +147,7 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
>          $(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
>         -       $(call if_changed,zstd22)
>         +       $(call if_changed,zstd)
>
>
> Please let me know if you need more info, and sorry for the late report
> as we just tracked down to this point.
>
> Thanks,
> Feng
>
>
>
