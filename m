Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63729CF28D
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2019 08:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730092AbfJHGP1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Oct 2019 02:15:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41557 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729926AbfJHGP0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 02:15:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id q9so17846869wrm.8
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Oct 2019 23:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E71giQmMij00dVZC1MhajR7ZkRCMhyeEhHHekrYHzJo=;
        b=e6B88wfiaQtJEuGtwLFB2tp0DVFW7RKkM9KtSuOw3IUwN5tbCGQUZqOpRgWdrdMytw
         02KEDRLZWYQCJBbf9SAxYvBMiTjb4ktnqWEqK/FtHHJO2VtvWoTxJ2JLVTgJUp546nc8
         Z6B7tlotl/P4XNsDSHq11NKHRspsUuwGwOro2pZXJYCtYrJ1MdSKYRwUlImCzOEtPefk
         J1s8mVNHj4EhOwh/jQQjmdw30UfJbi8qBVY/W2BHXf3JPXDwCPq3gmm8EmTNdZiT0iQN
         xdfIfYamgHXcmYsVg0ZnLgThiaHPu8KKtpgZn0cgCN76Wu0Js2IkORzU7uwkPPhHEtQ2
         bvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E71giQmMij00dVZC1MhajR7ZkRCMhyeEhHHekrYHzJo=;
        b=ExArg0KMwST5CtUvNxjGR5GShyZL7Og7xYzCsqNcsjVK86gCoHNj+m43nBKzOQbdjX
         9oZMWtcFx3MCA1EIPIOojCD7KCT8cKo5ca1tRdOoCApd18JiNla1dHG088CAMm8CTslk
         UlcFGE7caMgZcX02tNj4X3ov9r4Jga/qwZv0F6E3ryQo3kGakYilo7JiY25nDYeWSEbA
         OfjqWqOmm4gBGQ5ggNXLbMt3nIrxIEPhDftQ5IX3UyBUnosCM8PIPJQ2UGZHdI8Uk9NQ
         Hlmk6Be2/f8bEbaxd5jsgwg8Hh0onr0VSJfJSw7Z55Us29yQxr/RbEDT0hn79qCSypjl
         Kg9A==
X-Gm-Message-State: APjAAAUhScDuqOgHTqaiusFxDssKym8a2vPQU4QEdiS51E21dVN+uiNG
        fB8H4cTXgcIRaRUW++/loY6/kA==
X-Google-Smtp-Source: APXvYqzonXSfQ3IqovyLtUkcieMOHhIx076yuyqJl6GycLQeI3fTH5SSWCjKL4p7JInVnQ0wY+gAMA==
X-Received: by 2002:a5d:6052:: with SMTP id j18mr15168796wrt.40.1570515322804;
        Mon, 07 Oct 2019 23:15:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id t83sm3247995wmt.18.2019.10.07.23.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 23:15:22 -0700 (PDT)
Date:   Tue, 8 Oct 2019 07:15:21 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Jessica Yu <jeyu@kernel.org>,
        Adam Zerella <adam.zerella@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: move namespaces.rst from kbuild/ to core-api/
Message-ID: <20191008061521.GD23938@google.com>
References: <20191008031009.17364-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191008031009.17364-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 08, 2019 at 12:10:09PM +0900, Masahiro Yamada wrote:
>We discussed a better location for this file, and agreed that
>core-api/ is a good fit. Rename it to symbol-namespaces.rst
>for disambiguation, and also add it to index.rst and MAINTAINERS.

Acked-by: Matthias Maennich <maennich@google.com>

Thank you!

Cheers,
Matthias
>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> Documentation/core-api/index.rst                                 | 1 +
> .../{kbuild/namespaces.rst => core-api/symbol-namespaces.rst}    | 0
> MAINTAINERS                                                      | 1 +
> 3 files changed, 2 insertions(+)
> rename Documentation/{kbuild/namespaces.rst => core-api/symbol-namespaces.rst} (100%)
>
>diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
>index fa16a0538dcb..ab0eae1c153a 100644
>--- a/Documentation/core-api/index.rst
>+++ b/Documentation/core-api/index.rst
>@@ -38,6 +38,7 @@ Core utilities
>    protection-keys
>    ../RCU/index
>    gcc-plugins
>+   symbol-namespaces
>
>
> Interfaces for kernel debugging
>diff --git a/Documentation/kbuild/namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
>similarity index 100%
>rename from Documentation/kbuild/namespaces.rst
>rename to Documentation/core-api/symbol-namespaces.rst
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 55199ef7fa74..a0ca64057b0d 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -11547,6 +11547,7 @@ NSDEPS
> M:	Matthias Maennich <maennich@google.com>
> S:	Maintained
> F:	scripts/nsdeps
>+F:	Documentation/core-api/symbol-namespaces.rst
>
> NTB AMD DRIVER
> M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>-- 
>2.17.1
>
