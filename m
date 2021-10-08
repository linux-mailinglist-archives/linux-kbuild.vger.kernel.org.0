Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEE6427421
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Oct 2021 01:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhJHXZP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Oct 2021 19:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbhJHXZO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Oct 2021 19:25:14 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA82DC061570
        for <linux-kbuild@vger.kernel.org>; Fri,  8 Oct 2021 16:23:18 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v17so34131059wrv.9
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Oct 2021 16:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J1Gluz7YSA5Y/2WkI1jdMZQxl80MbpAoTFiAsvUYRBs=;
        b=HffuSJ6kz8F8zSiZcPVSRyw48qVRgUlJRkIOTAj/JlhCUU+5TL1KRDfaJnoXTUCVpx
         s3Vn0Ad7RMPvzYmZ62JPSIKJSX5M4i++yZ6fSZo1ZfrOJ7ObIzDgf5zWL5nGErk2LL9x
         dgrPHS+0aSB+zRG1gddeg49MyNUF5w0D0ACI6UtNbOuZXCxxTc5PGiP0DuOqpBNiLyyA
         Bq4MWKJdcneL0E1lV4t9TV2392vYOSb5r041OwL9iO6LofTUYLFU8DvmimAOndbVv46s
         WVvlwjMX5dHev5t+XZ/rL2NicnMJe1ztUhDYFvNzXA+l457Xk8OyAyc50x3+3gOQbjUA
         GSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J1Gluz7YSA5Y/2WkI1jdMZQxl80MbpAoTFiAsvUYRBs=;
        b=3rPy+5a8XHJlN7HyAdBiaUp/w6bbdxEfaOTIER6Ve4HuwJSNifwyXx2SRxvZbWWEMb
         DHqNQbHs+nBJsXMBxEJvwcjy+oJhfUxw2nxbx7cKvKGFJxn/oZxSaWKp+pNBRgxhg+tL
         VRBlQy65CgrAkkAg6lP8NO0g+kjFUSEYwE+cnBAWAFdWZSsG564SSqs0yEb6UCa5jx4q
         suRDWN9ZSg8w+LCWpZW8ixIpY8u5QRB+louW2fcHO2qq9kkxnpYDZxr0H7YdAAj3JU/F
         zE58HW3xHM3PakDocFXWBYpSIu5e9Zcm1pEzrb/rcyA46e0FJakjIcv+VwmUe6pAv6Fe
         UMFQ==
X-Gm-Message-State: AOAM530ZTCcgH+MjDFRCSOk5QCqUpx/MRDBtUhWWIre9ssPWE3bu8RY2
        p8Qz2xbU2eNg1/8aWhf58omq3YQg6+EMY4wBIHQEZw==
X-Google-Smtp-Source: ABdhPJzh7WZk24DrobmnXSICvgYoDctSChIsy8x8eoadJhZJEiviYla/RyUlSX9WqjlfIfL2T1FPLCSIOPkbs4UtKYk=
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr5504718wmc.7.1633735397264;
 Fri, 08 Oct 2021 16:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211008215133.9371-1-rdunlap@infradead.org>
In-Reply-To: <20211008215133.9371-1-rdunlap@infradead.org>
From:   David Gow <davidgow@google.com>
Date:   Sat, 9 Oct 2021 07:23:05 +0800
Message-ID: <CABVgOS=QVysVtN5seB5hp7hHAw5P0yuOaA3rgkRtEyiJu-1H6Q@mail.gmail.com>
Subject: Re: [PATCH] um: Add missing "FORCE" target when using if_changed
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um <linux-um@lists.infradead.org>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 9, 2021 at 5:51 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> 'make ARCH=um' says:
>
> ../arch/x86/um/Makefile:44: FORCE prerequisite is missing
>
> and adding "FORCE" there makes it be quiet, so do it.  :)
>
> Fixes: e1f86d7b4b2a ("kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and filechk")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: linux-um@lists.infradead.org
> Cc: x86@kernel.org
> ---

FYI, this looks identical to "uml: x86: add FORCE to user_constants.h":
http://lists.infradead.org/pipermail/linux-um/2021-September/001791.html

-- David
