Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E47E20E478
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 00:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387852AbgF2VZp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 17:25:45 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:37277 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgF2VZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 17:25:22 -0400
Received: by mail-il1-f193.google.com with SMTP id r12so8592120ilh.4;
        Mon, 29 Jun 2020 14:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8sRNZq3i6sSIEbh/4bbkFq8rEMNhJ4QITzwGR/lljm8=;
        b=BMC1syC41NCzxzB/pbvJpgmQ9FcJc5r2D9qsr143aDRDPwde32ULP75xo6hvY+HWtd
         zDs9rX3aN+AZolPZnXfuJ/Pddaesd9gT3tUQhK1K5K72vX/qyoEOfeHK7MeisQh8vr6K
         qPAivX8E+N9cl/7GtrHIjbACdnyPdHdSYBkce5VbSW3vJXAB0GlvsKZpksM7dgjTn/a8
         CRq13jzvF8q+y0d4Gd0yz54JG48+UWl8PBqLIZpum2LNlhjllL2RzF1DgC116EdW50gy
         bxMNzYL+dJMt6a9IJAfS84wSVfPTENitg2A8kHmFF/xZ10pVbQdB1JYin3bSl7doJ/qe
         /fFQ==
X-Gm-Message-State: AOAM531oa1G9btWWBSgKh3ZdNF6mVUbfN1BL+izUwqhB4NJd2u4Vhzxa
        9+MVaBm15Ar84+kjGg5y3g==
X-Google-Smtp-Source: ABdhPJx7dUZO0U25grEUl0vGwvMDDg6JWilgQ6/cy87UtwfMefk9HX94VG7CywqBbog84JPOnX3tTQ==
X-Received: by 2002:a92:b685:: with SMTP id m5mr17246717ill.219.1593465921481;
        Mon, 29 Jun 2020 14:25:21 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id v3sm630164ili.12.2020.06.29.14.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:25:21 -0700 (PDT)
Received: (nullmailer pid 2935889 invoked by uid 1000);
        Mon, 29 Jun 2020 21:25:19 -0000
Date:   Mon, 29 Jun 2020 15:25:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 3/4] dt-bindings: copy process-schema-examples.yaml to
 process-schema.yaml
Message-ID: <20200629212519.GA2935789@bogus>
References: <20200625170434.635114-1-masahiroy@kernel.org>
 <20200625170434.635114-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625170434.635114-4-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 26 Jun 2020 02:04:33 +0900, Masahiro Yamada wrote:
> There are two processed schema files:
> 
>  - processed-schema-examples.yaml
> 
>     Used for 'make dt_binding_check'. This is always a full schema.
> 
>  - processed-schema.yaml
> 
>     Used for 'make dtbs_check'. This may be a full schema, or a smaller
>     subset if DT_SCHEMA_FILES is given by a user.
> 
> If DT_SCHEMA_FILES is not specified, they are the same. You can copy
> the former to the latter instead of running dt-mk-schema twice. This
> saves the cpu time a lot when you do 'make dt_binding_check dtbs_check'
> because building the full schema takes a couple of seconds.
> 
> If DT_SCHEMA_FILES is specified, processed-schema.yaml is generated
> based on the specified yaml files.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/devicetree/bindings/Makefile | 28 +++++++++++++++-------
>  scripts/Makefile.lib                       |  3 +++
>  2 files changed, 23 insertions(+), 8 deletions(-)
> 

Applied, thanks!
