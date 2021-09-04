Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0B2400C77
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 20:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237260AbhIDSFm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Sep 2021 14:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21381 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237237AbhIDSFl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Sep 2021 14:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630778679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cz9Ku9KOf6mZgZXN1NhnjRDs1hLQrX4dFP4M4XexeGM=;
        b=K2JgeCxuGAHtertYo0NJGA4S/3H7XiNeboSKAU2M9gc/+lbcYSvROSSWZ+drCqoqGBhZDR
        aVHiizZXQc6HYxKidR+3nLnhsczQN+kcxzeV1mRJf+Rcb4X5vKmtys2Jf8cILYYC1omCvx
        id5ilFrJF3OsjcRmHHBe/pGkCYRhG3Q=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-aK3XuAl7P1ymzgtxLBUSvQ-1; Sat, 04 Sep 2021 14:04:38 -0400
X-MC-Unique: aK3XuAl7P1ymzgtxLBUSvQ-1
Received: by mail-ot1-f70.google.com with SMTP id i11-20020a9d53cb000000b00538e5ca17d6so1415873oth.18
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Sep 2021 11:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cz9Ku9KOf6mZgZXN1NhnjRDs1hLQrX4dFP4M4XexeGM=;
        b=ZHRns5oaOT+pl9S/0txGns3MeIUKX7qdnctEMHU30hI0ZpGPhmc4tA78VCzq77L8ze
         4KmUnG0i/jUjChWinphpqzhgGHwf1KGQCFlLt9DaWNHbADqD69jBagEE6hDj96ohZJ5I
         cuXCvH00+KyWVZXfxGGBD9l6JEb249y8ZPWr0IHjHnOagAfePbAWufYrM8jU9aY0zHes
         rNpO5rc7pBdBOsvoOmdBRQ+FFWR1aQk2+L4Fq/oinMeVUYNkT6zltRsN2JBXAQR338N/
         mi9++wJC7w7mEHkn5SgSJZsEfOzgwYWhKf0NZ3H5JzUbvM6pNkoTbInCCu/o5Bm0C1nc
         KzoA==
X-Gm-Message-State: AOAM530R4cak5Fta8sCz/9AgEP6FXmoFxNA8lVsrpix10begPME96Am8
        DZyQ5yGKDdY6jmt386r7WPO6gUuOvlJQ0fEheC5fs4tvjyWNIuA2tilPMLbIlK2LNIGAPeqIZto
        /cj+AQ/0vabfxdJ0d934o3h10
X-Received: by 2002:a05:6808:bc2:: with SMTP id o2mr3449039oik.73.1630778677894;
        Sat, 04 Sep 2021 11:04:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbMykEdwn1S/PtlTn9+yNv6kBsjxqNdyp/i5WxcXA84q+inbL+YCZ7Bae/m99bNG4eGCNt0A==
X-Received: by 2002:a05:6808:bc2:: with SMTP id o2mr3449020oik.73.1630778677623;
        Sat, 04 Sep 2021 11:04:37 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id v11sm650179oto.22.2021.09.04.11.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 11:04:37 -0700 (PDT)
Date:   Sat, 4 Sep 2021 11:04:34 -0700
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/13] kbuild: store the objtool command in *.cmd files
Message-ID: <20210904180434.qkdbs27i5f2vtoxv@treble>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-4-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:39:54PM +0900, Masahiro Yamada wrote:
> objtool_dep includes include/config/{ORC_UNWINDER,STACK_VALIDATION}
> so that all the objects are rebuilt when any of CONFIG_ORC_UNWINDER
> and CONFIG_STACK_VALIDATION is toggled.
> 
> As you can see in 'objtool_args', there are more CONFIG options
> that affect the objtool command line.
> 
> Adding more and more include/config/* is ugly and unmaintainable.
> 
> Another issue is that non-standard objects are needlessly rebuilt.
> Objects specified as OBJECT_FILES_NON_STANDARD is not processed by
> objtool, but they are rebuilt anyway when CONFIG_ORC_UNWINDER or
> CONFIG_STACK_VALIDATION is toggled. This is not a big deal, but
> better to fix.
> 
> A cleaner and more precise fix is to include the objtool command in
> *.cmd files so any command change is naturally detected by if_change.

Nice improvement, thanks!

s/CONFIG_ORC_UNWINDER/CONFIG_UNWINDER_ORC/g

And yes, this means the original ORC unwinder dependency didn't
work:

> -objtool_dep = $(objtool_obj)					\
> -	      $(wildcard include/config/ORC_UNWINDER		\
> -			 include/config/STACK_VALIDATION)


-- 
Josh

