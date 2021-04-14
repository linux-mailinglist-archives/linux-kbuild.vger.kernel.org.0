Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC72F35FDE6
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 00:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234069AbhDNWg4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 18:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233204AbhDNWgy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 18:36:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1791C061756
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 15:36:28 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id n138so35950634lfa.3
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s+VGRBuPdmKutKxIYYlr7lTmNrQCLCweQw9SWmlzyUo=;
        b=N+uEViMICnndvL0isdw49RiQ0qEN5p8Dv4opi+pSvIFgeYBfXbb7yPNqvgdpjmHJPE
         3B1g0ufMGZ/Fro7POD4HcoJ5csMnob/rnMCHoH0j9RtLtkAV1Z4a8riYA8GnNcV1O2dT
         jL/0dwOwHy1WCk9GxlYEUpglJyQNV/q9boJTKDSiSVftls6y8d1e7RJKsX+tleJiiJo4
         tGMZzAPZnMiXQ5fbq7FLdWS7LTsdL2OqOGcEFLNeR4kXmxBCBhzyt9n5P7P42dFIZc7a
         pYTyoPc/48JTDs+u0Y77aOTEkIdXaP8oQQziJe0qeRU4WHsygOyJ/BJ1OS5TlxYdkZgs
         WTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s+VGRBuPdmKutKxIYYlr7lTmNrQCLCweQw9SWmlzyUo=;
        b=uDUNIT1E9VsJub2O7UTisi7xUDkcPxOccwujXyD5bLWupueySNAGpTTPVCHj1lAffI
         rnwP2ObIMlNkN003EpVly78n+9/Lwwu/XTRWpKELQlocgD0bqAMScWwCWPRtS0+KTm+/
         02Y9yzbOrwJmK7x7Nob9PCSMIAcOJuzfDfwfmFPmOyW+HtIscsHrPM/hqNujoNSHBsRo
         TaAIpuaonzyViW+6giaI1WV4eVpJO1SC+Mum0UHWWvO5XnsZDZGW1iTQ6+T+ZZBYhbUQ
         bf4Zusy7tAWd0A/7JHVBWBm/DnLnaGoTWHi6+62hr9n0zKtsqeKCxpIYW2TEdBaYFgV/
         gROw==
X-Gm-Message-State: AOAM532hF8G0ND52QrnJvh1QTqKaSv6fwx+6wMeNsDNs6upnsVAcyB2m
        3VGEKcXvqYSmQXx+WvFAi/hCgynpn1d+IRDk/AnnyQ==
X-Google-Smtp-Source: ABdhPJwWtbuJsvcv11qI8BqaFhOcOpRWm/UUOom7nk9emsiunf9lpKoCxjINZOypiABigrAkPa04FX0s9f4ScB2p+RU=
X-Received: by 2002:a05:6512:94d:: with SMTP id u13mr270494lft.368.1618439787310;
 Wed, 14 Apr 2021 15:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-12-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-12-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Apr 2021 15:36:15 -0700
Message-ID: <CAKwvOdkn9e59wizhbAFLGbCKn3JbsVxMHOLds6V7HE7C9Yoaig@mail.gmail.com>
Subject: Re: [PATCH 11/13] MAINTAINERS: Rust
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 11:50 AM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> Miguel, Alex and Wedson will be maintaining the Rust support.
>
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  MAINTAINERS | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9e876927c60d..de32aaa5cabd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15547,6 +15547,20 @@ L:     linux-rdma@vger.kernel.org
...
> +F:     rust/
> +F:     samples/rust/
> +F:     Documentation/rust/

Probably some other files, too? Like the target.json files under
arch/{arch}/rust/ ?

-- 
Thanks,
~Nick Desaulniers
