Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5C179D993
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Sep 2023 21:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237610AbjILTaS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Sep 2023 15:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbjILTaR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2023 15:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 686C618D
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2023 12:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694546965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CUr8uffvIKRfj1LAAfZsZyfJJTJnjUDK/LWC7CZG7b8=;
        b=NRm56ZCZwnOLh200N+g00YmzgOaO9YKhw2XPRyiqL/ZiascVVZEGESsIRpBWI4q/w3OaLl
        DXfC6AHgr/yRJ94Wkq6veWg3aCfOTfXcAnSANMgqGu3iZMubtSLoKc2ti/+JmaEUWtuOqs
        XEtdpS4YjB1V/ZO4QK+4qoBUxU/66Ro=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-jRTHEZU0OrOiY8S003XDzA-1; Tue, 12 Sep 2023 15:29:22 -0400
X-MC-Unique: jRTHEZU0OrOiY8S003XDzA-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6b9f057f6daso5941229a34.0
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2023 12:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546961; x=1695151761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUr8uffvIKRfj1LAAfZsZyfJJTJnjUDK/LWC7CZG7b8=;
        b=eiax74CHn1oasW32Gok9J8QCqzlnLXq4tk2KPmK8Xoq35VhSqwX+YUQpQHX5luHKEr
         fnivnsXAcmgDg2syPAYt+6DACNd120hgqeAl27YBTVKvliEfuPN4Uz2RFIKsACFnTA15
         BGpl3ZQmgQ629oMGb3RO7KoN72YqO6I5tUfFRVzLTtBe31iTj0uKxoQjVwOlEcPsPu/P
         u/ihU3aGbMfGsEOO4Hwu1jwz02pp+6ytaKjxcuhIT9N41bLfSvLR4dvGm+9m+6HNmO0g
         Uk29C6Dy9EDup3BNyZRm5iZZBUwlM7ZKWQqnf1tJcS+96JJv4hVfFtSXPwz1lcdVnAHl
         p6Ew==
X-Gm-Message-State: AOJu0YwRSzPSMGHhFZjHMxr4V9BArY+ZHBemYK7kiV20LnKOJgcIP36L
        yA0MHyH/pGxC5H3NT9oQtSM0iZB8d0IAU64yOyhK8VqnCb599pbc54RB6oLdr1b6e3TaPSkX+tD
        gxl9xJhRRxRuqjA2J/BuXk1v177aVuzuL
X-Received: by 2002:a05:6830:4af:b0:6bc:8cd2:dd97 with SMTP id l15-20020a05683004af00b006bc8cd2dd97mr752358otd.29.1694546961669;
        Tue, 12 Sep 2023 12:29:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGleJyX0X3iapwL2vHV0dP7EtxVDVe3VLFKSVMQi6qzXHIfeZOnHRMYeKyD3en798V4yoBomA==
X-Received: by 2002:a05:6830:4af:b0:6bc:8cd2:dd97 with SMTP id l15-20020a05683004af00b006bc8cd2dd97mr752349otd.29.1694546961440;
        Tue, 12 Sep 2023 12:29:21 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:c91:da45:7fbc:86c3:920a])
        by smtp.gmail.com with ESMTPSA id d14-20020a05683018ee00b006b8c277be12sm4291056otf.8.2023.09.12.12.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:29:21 -0700 (PDT)
Date:   Tue, 12 Sep 2023 16:29:15 -0300
From:   Leonardo Bras <leobras@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/1] scripts: Introduce a default git.orderFile
Message-ID: <ZQC8C_CGLcU1vT-G@redhat.com>
References: <20230911234418.38154-2-leobras@redhat.com>
 <e0d83e21-c1fe-5f3b-9613-e9d137baaee7@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0d83e21-c1fe-5f3b-9613-e9d137baaee7@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 11, 2023 at 09:24:04PM -0700, Randy Dunlap wrote:
> 
> 
> On 9/11/23 16:44, Leonardo Bras wrote:
> > When reviewing patches, it looks much nicer to have some changes shown
> > before others, which allow better understanding of the patch before the
> > the .c files reviewing.
> > 
> > Introduce a default git.orderFile, in order to help developers getting the
> > best ordering easier.
> > 
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> 
> LGTM. Thanks.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks Randy!

> 
> > ---
> > 
> > Please provide feedback on what else to add / remove / reorder here!
> > 
> > Changes since RFCv1:
> > - Added Kconfig* (thanks Randy Dunlap!)
> > - Changed Kbuild to Kbuild* (improve matching)
> > 
> >  scripts/git.orderFile | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 scripts/git.orderFile
> > 
> > diff --git a/scripts/git.orderFile b/scripts/git.orderFile
> > new file mode 100644
> > index 000000000000..819f0a957fe3
> > --- /dev/null
> > +++ b/scripts/git.orderFile
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +# order file for git, to produce patches which are easier to review
> > +# by diffing the important stuff like header changes first.
> > +#
> > +# one-off usage:
> > +#   git diff -O scripts/git.orderfile ...
> > +#
> > +# add to git config:
> > +#   git config diff.orderFile scripts/git.orderfile
> > +#
> > +
> > +MAINTAINERS
> > +
> > +# Documentation
> > +Documentation/*
> > +*.rst
> > +
> > +# build system
> > +Kbuild*
> > +Kconfig*
> > +Makefile*
> > +*.mak
> > +
> > +# semantic patches
> > +*.cocci
> > +
> > +# headers
> > +*.h
> > +
> > +# code
> > +*.c
> 
> -- 
> ~Randy
> 

