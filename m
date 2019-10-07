Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18670CDBAF
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Oct 2019 07:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfJGF7h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Oct 2019 01:59:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45671 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfJGF7h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 01:59:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id q7so7487746pgi.12;
        Sun, 06 Oct 2019 22:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oqFdqqUqLg52ExVds7ZRy0HYDyhYJV6Q8ZIB5Rw2isk=;
        b=nP+sss48EWXlNFGfoK7E2mq5jsUFr5XIM6R0v0DQUIalN+UibCCos8d5esx3p9uLDs
         1J2P2BKiPmtGXgQ3YkqdV4tOwFXeeEHjSkNt0j9tZYsUlgNRuQ66Qj8L6+FulrnixdBi
         de4kWQv38SGK9eqne12JMwwso5geSBBjeR6ZC0Lax/zRcPrJ0Rbb80eRp1kNljSRzqBV
         dDpsKF7EvoUCkgBeAoNeJ69nEQ//VoNaj88OARHQLdHtO8OIAV30ersvxyXyUNE10yVr
         8f1fi8K3eQCTH2Gwn1ZBrNsR1VBco4xyK6mHMjQu5kv8E1XpOgKjvUPDfsCVWR2YZJ83
         HtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oqFdqqUqLg52ExVds7ZRy0HYDyhYJV6Q8ZIB5Rw2isk=;
        b=PhUDfpF+vbyXB7xMZjYrmbqs9JKoWhD21IJpQfyV4mO5kmieGfKU0GfJ1VZHRu1tqJ
         aW0eIYoB1iAcipbapqLvP/BL1vLQdN13CUa5AXxPPJuEahCYESfmFNjFRzTOOnlUAav9
         8uq1Ipa8Y0ZZKgSBXSCnY693VMlCgB/z9Z0X6ZMuMjSWnbtbwo2SACr0JoCJiBHGloZD
         jrWkJysl3aSwkktBVn0lk64VDLjKsfDmWjE4MAFQ7m4gL6+NTi4sXzx72h5z96Kxwv7D
         0Ha8EBHDUwxLwrOD6VjQaeauVd946xoMvTPqV3v7eIvkZR7mYrZCQxerrcotAlHJV1Ls
         V1sw==
X-Gm-Message-State: APjAAAV9rUKgbBycrMaKy/Hu3VWA1n9yPuXL2h+VkrM2D3Ajo7IVltMa
        2LDjWDCMs9nN6arXSP/hQdQ=
X-Google-Smtp-Source: APXvYqyOPvQG9GmEJ1vI64O6QXSEJQcrBowAjBEfCT7sL6q2XRjSPEgP449VEUEsh5lzk7bYNIdNgg==
X-Received: by 2002:a17:90a:310:: with SMTP id 16mr32181448pje.100.1570427974602;
        Sun, 06 Oct 2019 22:59:34 -0700 (PDT)
Received: from gmail.com (ip-103-85-37-165.syd.xi.com.au. [103.85.37.165])
        by smtp.gmail.com with ESMTPSA id w134sm14739677pfd.4.2019.10.06.22.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 22:59:33 -0700 (PDT)
Date:   Mon, 7 Oct 2019 16:59:26 +1100
From:   Adam Zerella <adam.zerella@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: move namespaces.rst out of kbuild directory
Message-ID: <20191007055926.GA9631@gmail.com>
References: <20191007043611.31036-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007043611.31036-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 07, 2019 at 01:36:11PM +0900, Masahiro Yamada wrote:
> I did not notice this document was added to Documentation/kbuild/,
> and I do not understand how it is related to the build system.
> 
> Kick it out of the kbuild directory.

Should we delete the file entirely or does it belong somewhere else? It
was added in c4f4af4094d6c7dbca3acd8d04df2759d268a116 and is referenced
in `Documentation/kernel-hacking/hacking.rst`.

Can we put into the `kernel-hacking` directory?

> I am not sure if this is the perfect place, but I added its index
> close to the module-signing.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Documentation/admin-guide/index.rst                  | 1 +
>  Documentation/{kbuild => admin-guide}/namespaces.rst | 0
>  MAINTAINERS                                          | 1 +
>  3 files changed, 2 insertions(+)
>  rename Documentation/{kbuild => admin-guide}/namespaces.rst (100%)
> 
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> index 34cc20ee7f3a..ca632fda700f 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -65,6 +65,7 @@ configure specific aspects of kernel behavior to your liking.
>     parport
>     md
>     module-signing
> +   namespaces
>     rapidio
>     sysrq
>     unicode
> diff --git a/Documentation/kbuild/namespaces.rst b/Documentation/admin-guide/namespaces.rst
> similarity index 100%
> rename from Documentation/kbuild/namespaces.rst
> rename to Documentation/admin-guide/namespaces.rst
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55199ef7fa74..91815dcc5914 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11547,6 +11547,7 @@ NSDEPS
>  M:	Matthias Maennich <maennich@google.com>
>  S:	Maintained
>  F:	scripts/nsdeps
> +F:	Documentation/admin-guide/namespaces.rst
>  
>  NTB AMD DRIVER
>  M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> -- 
> 2.17.1
> 
