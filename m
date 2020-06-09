Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E041F354E
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2020 09:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgFIHpX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jun 2020 03:45:23 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60814 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgFIHpV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 03:45:21 -0400
Received: from ip5f5af183.dynamic.kabel-deutschland.de ([95.90.241.131] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1jiYwa-00061m-MX; Tue, 09 Jun 2020 07:45:12 +0000
Date:   Tue, 9 Jun 2020 09:45:12 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Christian Brauner <christian@brauner.io>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samples: binderfs: really compile this sample and fix
 build issues
Message-ID: <20200609074512.4uh7gs5gg6tewmj5@wittgenstein>
References: <20200607032053.145302-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200607032053.145302-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 07, 2020 at 12:20:53PM +0900, Masahiro Yamada wrote:
> Even after commit c624adc9cb6e ("samples: fix binderfs sample"), this
> sample is never compiled.
> 
> 'hostprogs' teaches Kbuild that this is a host program, but not enough
> to order to compile it. You must add it to 'always-y' to really compile
> it.
> 
> Since this sample has never been compiled in upstream, various issues
> are left unnoticed.
> 
> [1] compilers without <linux/android/binderfs.h> are still widely used
> 
> <linux/android/binderfs.h> is only available since commit c13295ad219d
> ("binderfs: rename header to binderfs.h"), i.e., Linux 5.0
> 
> If your compiler is based on UAPI headers older than Linux 5.0, you
> will see the following error:
> 
>   samples/binderfs/binderfs_example.c:16:10: fatal error: linux/android/binderfs.h: No such file or directory
>    #include <linux/android/binderfs.h>
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   compilation terminated.
> 
> You cannot rely on compilers to have such a new header.
> 
> The common approach is to install UAPI headers of this kernel into
> usr/include, and then add it to the header include path.
> 
> I added 'depends on HEADERS_INSTALL' in Kconfig, and '-I usr/include'
> compiler flag in Makefile.
> 
> [2] compile the sample for target architecture
> 
> Since headers_install works for the target architecture, only the native
> build was able to build sample code that requires '-I usr/include'.
> 
> Commit 7f3a59db274c ("kbuild: add infrastructure to build userspace
> programs") added the new syntax 'userprogs' to compile user-space
> programs for the target architecture.
> 
> Use it, and 'ifndef CROSS_COMPILE' will go away.
> 
> I added 'depends on CC_CAN_LINK' because $(CC) is not necessarily capable
> of linking user-space programs.
> 
> [3] use subdir-y to descend into samples/binderfs/
> 
> Since this directory does not contain any kernel-space code, it has no
> point to generate built-in.a or modules.order.
> 
> Replace obj-$(CONFIG_...) with subdir-$(CONFIG_...).
> 
> [4] -Wunused-variable warning
> 
> If I compile this, I see the following warning.
> 
>   samples/binderfs/binderfs_example.c: In function 'main':
>   samples/binderfs/binderfs_example.c:21:9: warning: unused variable 'len' [-Wunused-variable]
>      21 |  size_t len;
>         |         ^~~
> 
> I removed the unused 'len'.
> 
> [5] CONFIG_ANDROID_BINDERFS is not required
> 
> Since this is a user-space standalone program, it is independent of
> the kernel configuration.
> 
> Remove 'depends on ANDROID_BINDERFS'.
> 
> Fixes: 9762dc1432e1 ("samples: add binderfs sample program")
> Fixes: c624adc9cb6e ("samples: fix binderfs sample")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Sorry, I missed this:

Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

Thanks!
Christian

> ---
> 
>  samples/Kconfig                     | 2 +-
>  samples/Makefile                    | 2 +-
>  samples/binderfs/Makefile           | 9 ++++-----
>  samples/binderfs/binderfs_example.c | 1 -
>  4 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/samples/Kconfig b/samples/Kconfig
> index 0cbb6146f3cf..953abbdebf7b 100644
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@ -185,7 +185,7 @@ config SAMPLE_VFIO_MDEV_MBOCHS
>  
>  config SAMPLE_ANDROID_BINDERFS
>  	bool "Build Android binderfs example"
> -	depends on ANDROID_BINDERFS
> +	depends on CC_CAN_LINK && HEADERS_INSTALL
>  	help
>  	  Builds a sample program to illustrate the use of the Android binderfs
>  	  filesystem.
> diff --git a/samples/Makefile b/samples/Makefile
> index 29c66aadd954..4029d207cebb 100644
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@ -2,7 +2,7 @@
>  # Makefile for Linux samples code
>  
>  subdir-$(CONFIG_SAMPLE_AUXDISPLAY)	+= auxdisplay
> -obj-$(CONFIG_SAMPLE_ANDROID_BINDERFS)	+= binderfs/
> +subdir-$(CONFIG_SAMPLE_ANDROID_BINDERFS) += binderfs
>  obj-$(CONFIG_SAMPLE_CONFIGFS)		+= configfs/
>  obj-$(CONFIG_SAMPLE_CONNECTOR)		+= connector/
>  subdir-$(CONFIG_SAMPLE_HIDRAW)		+= hidraw
> diff --git a/samples/binderfs/Makefile b/samples/binderfs/Makefile
> index a3ac5476338a..989e4badaee2 100644
> --- a/samples/binderfs/Makefile
> +++ b/samples/binderfs/Makefile
> @@ -1,6 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -ifndef CROSS_COMPILE
> -ifdef CONFIG_SAMPLE_ANDROID_BINDERFS
> -hostprogs := binderfs_example
> -endif
> -endif
> +userprogs := binderfs_example
> +always-y := $(userprogs)
> +
> +userccflags += -I usr/include
> diff --git a/samples/binderfs/binderfs_example.c b/samples/binderfs/binderfs_example.c
> index 5bbd2ebc0aea..0fd92cdda460 100644
> --- a/samples/binderfs/binderfs_example.c
> +++ b/samples/binderfs/binderfs_example.c
> @@ -18,7 +18,6 @@
>  int main(int argc, char *argv[])
>  {
>  	int fd, ret, saved_errno;
> -	size_t len;
>  	struct binderfs_device device = { 0 };
>  
>  	ret = unshare(CLONE_NEWNS);
> -- 
> 2.25.1
> 
