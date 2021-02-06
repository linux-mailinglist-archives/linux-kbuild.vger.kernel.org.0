Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BD9311D07
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 13:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhBFMI3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 07:08:29 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:43414 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhBFMI1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 07:08:27 -0500
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 116C7VMD016673;
        Sat, 6 Feb 2021 21:07:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 116C7VMD016673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612613252;
        bh=HdoLE03CK15wGQr5Q0QSpne0yUJVrCWsgwIqdjsO7ik=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Nr04RuuBjtk2s0cm45dAsuIxjk7enbyRmeDXRsLW6wM69EQAijqFeZ3wvDpSVtV9U
         8S6NSZZ1TzntQ5VCcZ6mnRQdcgbIfS/jxJZQRASHoPFawQ1QJ88QB9KyvcEzTyXKTS
         Eswf18Jy3YChQo2rG6GrN6Z+S5+kY0Q04p9Mr8AAG28bpNNAhx5D2iPYRyB7gdV4zr
         2OVmMovQds/OwZvBpb03QMPDKznYhp+kNdjxjpxeC1GWMxe4Q+Gey/FvdtOkIivrNx
         PqWDMGv/TnnUH1di1FYQtjU8dZcUHCuALQDKvrwwAMxrELKQBljTRZnPE9i3Ol0+56
         hfMvRtbnanjpA==
X-Nifty-SrcIP: [209.85.210.182]
Received: by mail-pf1-f182.google.com with SMTP id q131so6158895pfq.10;
        Sat, 06 Feb 2021 04:07:32 -0800 (PST)
X-Gm-Message-State: AOAM5333QdwGiLAknHNr6sHVJ78ZU/UxAr3fLfQ1UoZtlFyus6b0x6Wt
        5oXkeJ0CYWW3z7qznZIl+Tb9Lv65kT09rA9ok4g=
X-Google-Smtp-Source: ABdhPJyTMgZZWKHhhdikXWtKjnCd+VTpjNA3wKpcdML7atGMT3CZaAiMRRXN3Fnp2lAU/+VDkxq70fDiSQtIJ1qYByQ=
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr9083496pgf.47.1612613251324;
 Sat, 06 Feb 2021 04:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20210206035033.2036180-1-sashal@kernel.org>
In-Reply-To: <20210206035033.2036180-1-sashal@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Feb 2021 21:06:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARn+rPSUhFFwyePyAPMAVC=R2sHMdAo2FkVh_8GXOxGCw@mail.gmail.com>
Message-ID: <CAK7LNARn+rPSUhFFwyePyAPMAVC=R2sHMdAo2FkVh_8GXOxGCw@mail.gmail.com>
Subject: Re: [PATCH 1/3] Revert "kbuild: give the SUBLEVEL more room in KERNEL_VERSION"
To:     Sasha Levin <sashal@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 6, 2021 at 12:50 PM Sasha Levin <sashal@kernel.org> wrote:
>
> This reverts commit 537896fabed11f8d9788886d1aacdb977213c7b3.
>
> This turns out to be a bad idea: userspace has coded the structure of
> KERNEL_VERSION on it's own and assumes the 2-1-1 byte split, making it
> userspace ABI we can't break.

It is unfortunate...

I will drop this from my tree.

This did not hit Linus' tree yet.



> The reverted patch didn't make it past linux-next, so no userspace was
> hurt in the process.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Makefile                                       | 7 ++-----
>  drivers/net/ethernet/mellanox/mlx5/core/main.c | 4 ++--
>  drivers/usb/core/hcd.c                         | 4 ++--
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c       | 4 ++--
>  include/linux/usb/composite.h                  | 4 ++--
>  kernel/sys.c                                   | 2 +-
>  tools/perf/tests/bpf-script-example.c          | 2 +-
>  tools/perf/tests/bpf-script-test-kbuild.c      | 2 +-
>  tools/perf/tests/bpf-script-test-prologue.c    | 2 +-
>  9 files changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 28019532e55ac..49ac1b7fe8e99 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1259,11 +1259,8 @@ endef
>
>  define filechk_version.h
>         echo \#define LINUX_VERSION_CODE $(shell                         \
> -       expr $(VERSION) \* 16777216 + 0$(PATCHLEVEL) \* 65536 + 0$(SUBLEVEL)); \
> -       echo \#define LINUX_VERSION_MAJOR $(VERSION); \
> -       echo \#define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL); \
> -       echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL); \
> -       echo '#define KERNEL_VERSION(a,b,c) (((a) << 24) + ((b) << 16) + (c))'
> +       expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
> +       echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
>  endef
>
>  $(version_h): FORCE
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
> index 989f15d9aa7d4..e4c9627485aa5 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
> @@ -237,8 +237,8 @@ static void mlx5_set_driver_version(struct mlx5_core_dev *dev)
>         remaining_size = max_t(int, 0, driver_ver_sz - strlen(string));
>
>         snprintf(string + strlen(string), remaining_size, "%u.%u.%u",
> -               (u8)(LINUX_VERSION_MAJOR), (u8)(LINUX_VERSION_PATCHLEVEL),
> -               (u16)(LINUX_VERSION_SUBLEVEL));
> +                (u8)((LINUX_VERSION_CODE >> 16) & 0xff), (u8)((LINUX_VERSION_CODE >> 8) & 0xff),
> +                (u16)(LINUX_VERSION_CODE & 0xffff));
>
>         /*Send the command*/
>         MLX5_SET(set_driver_version_in, in, opcode,
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 3f0381344221e..ad5a0f405a75c 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -111,8 +111,8 @@ DECLARE_WAIT_QUEUE_HEAD(usb_kill_urb_queue);
>   */
>
>  /*-------------------------------------------------------------------------*/
> -#define KERNEL_REL     bin2bcd(LINUX_VERSION_MAJOR)
> -#define KERNEL_VER     bin2bcd(LINUX_VERSION_PATCHLEVEL)
> +#define KERNEL_REL     bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
> +#define KERNEL_VER     bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
>
>  /* usb 3.1 root hub device descriptor */
>  static const u8 usb31_rh_dev_descriptor[18] = {
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> index 5c7dea5e0ff16..bfd8e77788e29 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> @@ -46,8 +46,8 @@
>   *    - Make vid/did overridable
>   *    - make it look like usb1 if usb1 mode forced
>   */
> -#define KERNEL_REL     bin2bcd(LINUX_VERSION_MAJOR)
> -#define KERNEL_VER     bin2bcd(LINUX_VERSION_PATCHLEVEL)
> +#define KERNEL_REL     bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
> +#define KERNEL_VER     bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
>
>  enum {
>         AST_VHUB_STR_INDEX_MAX = 4,
> diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
> index c71150f2c6390..5646dad886e61 100644
> --- a/include/linux/usb/composite.h
> +++ b/include/linux/usb/composite.h
> @@ -575,8 +575,8 @@ static inline u16 get_default_bcdDevice(void)
>  {
>         u16 bcdDevice;
>
> -       bcdDevice = bin2bcd(LINUX_VERSION_MAJOR) << 8;
> -       bcdDevice |= bin2bcd(LINUX_VERSION_PATCHLEVEL);
> +       bcdDevice = bin2bcd((LINUX_VERSION_CODE >> 16 & 0xff)) << 8;
> +       bcdDevice |= bin2bcd((LINUX_VERSION_CODE >> 8 & 0xff));
>         return bcdDevice;
>  }
>
> diff --git a/kernel/sys.c b/kernel/sys.c
> index b09fe21e88ff5..8bb46e50f02d4 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -1242,7 +1242,7 @@ static int override_release(char __user *release, size_t len)
>                                 break;
>                         rest++;
>                 }
> -               v = LINUX_VERSION_PATCHLEVEL + 60;
> +               v = ((LINUX_VERSION_CODE >> 8) & 0xff) + 60;
>                 copy = clamp_t(size_t, len, 1, sizeof(buf));
>                 copy = scnprintf(buf, copy, "2.6.%u%s", v, rest);
>                 ret = copy_to_user(release, buf, copy + 1);
> diff --git a/tools/perf/tests/bpf-script-example.c b/tools/perf/tests/bpf-script-example.c
> index a56bf381335e9..ab4b98b3165db 100644
> --- a/tools/perf/tests/bpf-script-example.c
> +++ b/tools/perf/tests/bpf-script-example.c
> @@ -5,7 +5,7 @@
>   */
>  #ifndef LINUX_VERSION_CODE
>  # error Need LINUX_VERSION_CODE
> -# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x4020000" into llvm section of ~/.perfconfig'
> +# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x40200" into llvm section of ~/.perfconfig'
>  #endif
>  #define BPF_ANY 0
>  #define BPF_MAP_TYPE_ARRAY 2
> diff --git a/tools/perf/tests/bpf-script-test-kbuild.c b/tools/perf/tests/bpf-script-test-kbuild.c
> index 21663295d5b5a..219673aa278fb 100644
> --- a/tools/perf/tests/bpf-script-test-kbuild.c
> +++ b/tools/perf/tests/bpf-script-test-kbuild.c
> @@ -5,7 +5,7 @@
>   */
>  #ifndef LINUX_VERSION_CODE
>  # error Need LINUX_VERSION_CODE
> -# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x4020000" into llvm section of ~/.perfconfig'
> +# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x40200" into llvm section of ~/.perfconfig'
>  #endif
>  #define SEC(NAME) __attribute__((section(NAME), used))
>
> diff --git a/tools/perf/tests/bpf-script-test-prologue.c b/tools/perf/tests/bpf-script-test-prologue.c
> index 8db19e70813cc..bd83d364cf30d 100644
> --- a/tools/perf/tests/bpf-script-test-prologue.c
> +++ b/tools/perf/tests/bpf-script-test-prologue.c
> @@ -5,7 +5,7 @@
>   */
>  #ifndef LINUX_VERSION_CODE
>  # error Need LINUX_VERSION_CODE
> -# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x4020000" into llvm section of ~/.perfconfig'
> +# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x40200" into llvm section of ~/.perfconfig'
>  #endif
>  #define SEC(NAME) __attribute__((section(NAME), used))
>
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
