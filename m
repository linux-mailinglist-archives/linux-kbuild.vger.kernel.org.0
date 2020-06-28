Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DCE20C55F
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 04:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgF1CRY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Jun 2020 22:17:24 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45700 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgF1CRW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 22:17:22 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 05S2GpKY019135;
        Sun, 28 Jun 2020 11:16:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 05S2GpKY019135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593310612;
        bh=rY/0X8wDdH/OppPIbg3bn9miQy2NtSJWkHyvn81VgTQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zWk6Ubxh7EeIJwHsGsYANQrAwipL/H+0loj7+02Lb+6oq+tVMdMsffEQmfZVb4Uf3
         A8Q7xE5hapq8Vp3Lj4jmjAW9Z4aLxNbnuMocpoLWmXEqlxpRehycBpgkhc0oDpZgjH
         /GAL1D55zpCNDy7cM5R6auuyNyAoqscUMb8ogS80iKCFbXV53vDvI52QglzjG6A2Sl
         WWtWxalQ0rvWqrv/LHshcVRt2qp3q5liBDWQC4rYHjW6sKR4yXptydGtpjVe68+OMc
         YULkKW63xIDWvLkkXYOP1fNaQxigfUCmtlc8dqGqdTJTjeD7URptODYeFWN1ZGLxJ5
         AdBCoMPrqrjJg==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id s18so7480616vsi.6;
        Sat, 27 Jun 2020 19:16:51 -0700 (PDT)
X-Gm-Message-State: AOAM5319Esou97ZJm5yTE2JyTRsTPAcNSi9hV8tj30t1TG0mnc5nBA6r
        r7QcGCh6dqVOY1sG6ruzYmVsPddZ8T9Cj/O+fbg=
X-Google-Smtp-Source: ABdhPJyV0+QzYH9ugRIW/wmYF8Yh1BKt0nhPYLIEFJRYPjbO8Dv67C5Xl+tH/RG9xCvtlJzTVvZ/lZKUXU2YVgn3Shg=
X-Received: by 2002:a67:6c84:: with SMTP id h126mr5653011vsc.181.1593310610605;
 Sat, 27 Jun 2020 19:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200622124343.121043-1-dovmurik@linux.vnet.ibm.com>
In-Reply-To: <20200622124343.121043-1-dovmurik@linux.vnet.ibm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 11:16:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASD4ha4AGSPY4=mALo4JY0WfSLTrmJBUPeiH8yWjSsO=Q@mail.gmail.com>
Message-ID: <CAK7LNASD4ha4AGSPY4=mALo4JY0WfSLTrmJBUPeiH8yWjSsO=Q@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild: fix ReST formatting
To:     Dov Murik <dovmurik@linux.vnet.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 22, 2020 at 9:44 PM Dov Murik <dovmurik@linux.vnet.ibm.com> wrote:
>
> Commit cd238effefa2 ("docs: kbuild: convert docs to ReST and rename to
> *.rst") missed a ReST header and a verbatim file content area.
>
> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> ---

Applied to linux-kbuild.
Thanks.


>  Documentation/kbuild/modules.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index a45cccff467d..85ccc878895e 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -182,7 +182,8 @@ module 8123.ko, which is built from the following files::
>         8123_pci.c
>         8123_bin.o_shipped      <= Binary blob
>
> ---- 3.1 Shared Makefile
> +3.1 Shared Makefile
> +-------------------
>
>         An external module always includes a wrapper makefile that
>         supports building the module using "make" with no arguments.
> @@ -470,9 +471,9 @@ build.
>
>         The syntax of the Module.symvers file is::
>
> -       <CRC>       <Symbol>         <Module>                         <Export Type>     <Namespace>
> +               <CRC>       <Symbol>         <Module>                         <Export Type>     <Namespace>
>
> -       0xe1cc2a05  usb_stor_suspend drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL USB_STORAGE
> +               0xe1cc2a05  usb_stor_suspend drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL USB_STORAGE
>
>         The fields are separated by tabs and values may be empty (e.g.
>         if no namespace is defined for an exported symbol).
>
> base-commit: b103c607654e55dcb1da40557628a2044b72c936
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
