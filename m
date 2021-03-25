Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199B634976D
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 17:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhCYQ5F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 12:57:05 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:58560 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhCYQ4j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 12:56:39 -0400
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 12PGuILt028362;
        Fri, 26 Mar 2021 01:56:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 12PGuILt028362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616691379;
        bh=SEw9NUQiPzRJWv1uRyn0qV0CnBeuVaFzA6v0dADE/MM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p8K/VcY7F73/Tjj1tE40H37teCCJ5wzUbY5UIOmFB8U4K8A12nkCGJ1plUQ7sgiho
         /zSKvjTKsgSZZIn8WABEAUqpJXaZCYgFBX5zNp6YGKcTk/C8mRVjA5ApkbNlpk1GnX
         1kvcjlCv52bEILdVBeo9ub7Yud9k+54TD1JS3enoyYrWu/PvljsUF8Atek9410hGWN
         kXpAGp65ZQzr7dP+vJfv6Ac1HsJMAbXdNLe1PqI5JAQu3a+YxlWs5KBZd5QI33Jfj1
         +mcQkziay0gV63E6EZ0KdKP3anQyiOtqOHcJMcRSMvj0g6YrCqkRfCCREB2SlwqeBo
         woc492TgA0eiw==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so1206957pjb.0;
        Thu, 25 Mar 2021 09:56:19 -0700 (PDT)
X-Gm-Message-State: AOAM530G0B8uef4qZ09swCIoWaxZLXJyl7yv0nq9mmRiSeHwXz6OYtQF
        zKhG4rzlqIlgM+IRkbh8wbgNGVa9avpid6wD/og=
X-Google-Smtp-Source: ABdhPJxjIxSV38E1eZg7F1prXtIE1hCSCcZbdBEt9hdqj5KY/8de2Ou5N6QOlyNL/LpFq2X0I8uZuKUAW7MOrS7zL4w=
X-Received: by 2002:a17:90a:3b0e:: with SMTP id d14mr9871603pjc.198.1616691378154;
 Thu, 25 Mar 2021 09:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210319143231.25500-1-olaf@aepfle.de> <20210325121606.6a2e4e00.olaf@aepfle.de>
In-Reply-To: <20210325121606.6a2e4e00.olaf@aepfle.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 26 Mar 2021 01:55:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNARPs97+eQKMop9cYCs=D4Kwsf_5pq-614OUxT2iZptueg@mail.gmail.com>
Message-ID: <CAK7LNARPs97+eQKMop9cYCs=D4Kwsf_5pq-614OUxT2iZptueg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: enforce -Werror=unused-result
To:     Olaf Hering <olaf@aepfle.de>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 25, 2021 at 8:16 PM Olaf Hering <olaf@aepfle.de> wrote:
>
> Am Fri, 19 Mar 2021 15:32:31 +0100
> schrieb Olaf Hering <olaf@aepfle.de>:
>
> > It is a hard error if a return value is ignored.
>
> The automated builds found only a single error, in load_em86().


What about  drivers/net/ethernet/lantiq_etop.c  ?




> Let me know if there are other reasons why the patch was rejected.
>
> Olaf


I got a lot of complaints in the last trial.

It is easy to send a patch like this, but difficult to
make sure that I will not break any CI tests.

Over time, I started to believe keeping this as a warning
is OK.

The same problem happens when you add a new __must_check
annotation. You end up with fixing all the call-sites in advance.


-- 
Best Regards
Masahiro Yamada
