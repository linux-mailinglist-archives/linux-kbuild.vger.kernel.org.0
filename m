Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D907130E16
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 08:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgAFHn1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 02:43:27 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:33815 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgAFHn1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 02:43:27 -0500
Received: by mail-pg1-f202.google.com with SMTP id t189so33763447pgd.1
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jan 2020 23:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=jO5A+N0h1VUx5wWr6Ly4SVQVvrkMeU+RIQPrlwxnXKI=;
        b=gKSoZr/ov1hUV3VoGmhKfRYwayKxw9K5wvIWSIXrdbYhn5nVmJP1g00w+sP1RjNIKq
         yKdS60v/h6oY0NUo8NYKXgoatPCD8fkYKzY1z0nxMqp8mf9AwxtNgeGE+KP+bZrUHH3O
         InGfAJiqTOVNPUVLSh3zM9F80Ew9f2P1JBrolGaVwWQZjUB0h6wU+y4pNbHTLxVCy9du
         YYDmdxJBA5KIXntyQ/MNXllQYbIsYoaJmEc15wpTdrqe2HWczrcnSaSkQrZi7UFr8lda
         i2W1WVhtCE9kEHmGqSPJNWOFbvyRFii/kCqFWfB6UcXwnqtuUso7UuTIpuiJh/hMvAFq
         eXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=jO5A+N0h1VUx5wWr6Ly4SVQVvrkMeU+RIQPrlwxnXKI=;
        b=fOxThqe+QwzwC7FQY5PfJm3KqNbg4eikRxs/cLqMgxQJXJfEGRdsYxlQ2/YMpEMFOW
         kDJfOY1Qqh/ZKzQZIQlCFTyjOyCca76Z2vB9kjWxfI/+SvNoF1D4vXujqRsYqnyKrzUz
         SfteMYxgpeqbSPfcbb2SiTYJuX+mI8uA8A/rg+y1QtIoJC4C6zvag16mcay7zER+QqJ1
         COGCeQTD25TqUKOfMFBEHhcuYKsC1/ZdjItFYHQOTZXGbNsWrOVguCbVxmFoA4/Rdlh6
         0aGktBgV4VY4a3WvfIB95CQheBjHRSsJS6qhEcHKOhKIdPbUJJhEFKRbJ3sH8NIhoieP
         gvKQ==
X-Gm-Message-State: APjAAAUNfAIlgknDzWtbz74hb0tZr1BmJhP9lqWVBMG4H9/tc6uox3bn
        1uJY0rTkYGsXVmcfvechZkD7Wh0JjUCx
X-Google-Smtp-Source: APXvYqyJhyqaS1b5r5/akYnlROnDPMiz7QrKAihuxtQ4RvX18vsqnFjr7V/LNoV4wFO/MCb12hnSoDxwGgFA
X-Received: by 2002:a65:6916:: with SMTP id s22mr106609055pgq.244.1578296606813;
 Sun, 05 Jan 2020 23:43:26 -0800 (PST)
Date:   Sun, 05 Jan 2020 23:43:24 -0800
In-Reply-To: <20200104150238.19834-5-masahiroy@kernel.org>
Message-Id: <xr93ftgt6ndv.fsf@gthelen.svl.corp.google.com>
Mime-Version: 1.0
References: <20200104150238.19834-1-masahiroy@kernel.org> <20200104150238.19834-5-masahiroy@kernel.org>
Subject: Re: [PATCH v2 04/13] initramfs: rename gen_initramfs_list.sh to gen_initramfs.sh
From:   Greg Thelen <gthelen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> wrote:

> The comments in usr/Makefile wrongly refer to the script name (twice).
>
> Line 37:
>     # The dependency list is generated by gen_initramfs.sh -l
>
> Line 54:
>     # 4) Arguments to gen_initramfs.sh changes
>
> There does not exist such a script.
>
> I was going to fix the comments, but after some consideration, I thought
> "gen_initramfs.sh" would be more suitable than "gen_initramfs_list.sh"
> because it generates an initramfs image in the common usage.
>
> The script generates a list that can be fed to gen_init_cpio only when
> it is directly run without -o or -l option.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2: None
>
>  usr/Makefile                                    | 2 +-
>  usr/{gen_initramfs_list.sh => gen_initramfs.sh} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename usr/{gen_initramfs_list.sh => gen_initramfs.sh} (100%)

Will this break klibc?  It might have a ref to the old name.
https://git.kernel.org/pub/scm/libs/klibc/klibc.git/tree/usr/Kbuild#n55

> diff --git a/usr/Makefile b/usr/Makefile
> index 55c942da01cd..e44a66b8c051 100644
> --- a/usr/Makefile
> +++ b/usr/Makefile
> @@ -24,7 +24,7 @@ $(obj)/initramfs_data.o: $(obj)/$(datafile_y) FORCE
>  # Generate the initramfs cpio archive
>  
>  hostprogs-y := gen_init_cpio
> -initramfs   := $(CONFIG_SHELL) $(srctree)/$(src)/gen_initramfs_list.sh
> +initramfs   := $(CONFIG_SHELL) $(srctree)/$(src)/gen_initramfs.sh
>  ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
>  			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)
>  ramfs-args  := \
> diff --git a/usr/gen_initramfs_list.sh b/usr/gen_initramfs.sh
> similarity index 100%
> rename from usr/gen_initramfs_list.sh
> rename to usr/gen_initramfs.sh
