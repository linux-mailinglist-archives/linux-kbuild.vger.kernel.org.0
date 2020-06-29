Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6219B20E45F
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 00:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390935AbgF2VYl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 17:24:41 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:46325 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391015AbgF2VYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 17:24:40 -0400
Received: by mail-il1-f196.google.com with SMTP id w9so15791277ilk.13;
        Mon, 29 Jun 2020 14:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=70WJ+qIYv3twQa9oIbP0W90ImfwlEJn6IZKm97PIadY=;
        b=ol/1LFhs1z7BNaP/K6lQ8O0LLi06XiiPB9a95vlfGkuTjpWzptzhVHUUYewi9wq/aV
         nNWC1GVSw9/vmVm3kNMf9hZJqmjW/ElRPvSajxM4cCqThIbqht8kpBZ1CqFXPk3h3xH4
         Gsqjm60V1laAKX8c2mDyjvHxgZZyibA+AV9LS0bGJEBv0CmJfIWOd0t8UhzH7OVZzDwD
         qJPPzLuA/t/0Zc+Os0TZCPA/cBAHpLS5AdSkwb7Hq8kNkeT4gV8WZJSB8J48c9rAq246
         1zn7Y1E0SFHYYwX/4yOnnEhc1/4Lq/WgV0dwSDX7G1uoWmoUvbIZxNhm9rkeBL/AUpDw
         5PLg==
X-Gm-Message-State: AOAM5303Zxmeo5vv7DzzMF4Zlv8d2vOtBRZiD3p/CUVGFeF90Isa2o1f
        j/PuPwTm0N8DcswPZIhWIoyLP+A7yA==
X-Google-Smtp-Source: ABdhPJx7N1hclSAGU5RD7z6LsZcvE2bJ0953gV2C1HnxvIs1jAiI/HWiPN7Jy8gBh7z92FSSfsW0iQ==
X-Received: by 2002:a92:d6d2:: with SMTP id z18mr6547533ilp.272.1593465878953;
        Mon, 29 Jun 2020 14:24:38 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id o66sm621346ilb.26.2020.06.29.14.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:24:38 -0700 (PDT)
Received: (nullmailer pid 2934095 invoked by uid 1000);
        Mon, 29 Jun 2020 21:24:36 -0000
Date:   Mon, 29 Jun 2020 15:24:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: fix error in 'make clean' after 'make
 dt_binding_check'
Message-ID: <20200629212436.GA2933965@bogus>
References: <20200625170434.635114-1-masahiroy@kernel.org>
 <20200625170434.635114-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625170434.635114-2-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 26 Jun 2020 02:04:31 +0900, Masahiro Yamada wrote:
> We are having more and more schema files.
> 
> Commit 8b6b80218b01 ("dt-bindings: Fix command line length limit
> calling dt-mk-schema") fixed the 'Argument list too long' error of
> the schema checks, but the same error happens while cleaning too.
> 
> 'make clean' after 'make dt_binding_check' fails as follows:
> 
>   $ make dt_binding_check
>     [ snip ]
>   $ make clean
>   make[2]: execvp: /bin/sh: Argument list too long
>   make[2]: *** [scripts/Makefile.clean:52: __clean] Error 127
>   make[1]: *** [scripts/Makefile.clean:66: Documentation/devicetree/bindings] Error 2
>   make: *** [Makefile:1763: _clean_Documentation] Error 2
> 
> 'make dt_binding_check' generates so many .example.dts, .dt.yaml files,
> which are passed to the 'rm' command when you run 'make clean'.
> 
> I added a small hack to use the 'find' command to clean up most of the
> build artifacts before they are processed by scripts/Makefile.clean
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/devicetree/bindings/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Applied, thanks!
