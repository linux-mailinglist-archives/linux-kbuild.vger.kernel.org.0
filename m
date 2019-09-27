Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED003C0565
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 14:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfI0Mo4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 08:44:56 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42828 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfI0Mov (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 08:44:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id n14so2560388wrw.9
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2019 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iQL/mBFoyT5w4+hqPmctLZTeB55w7NLl/wO5PdSiL2U=;
        b=myBhg/eGuipuj/7sSVjnjujigvoCGLp1eCc3gH/+ShzrqZTEiNeAsQO5iFxgOrXhZ0
         iT/cp4R/uktq28HYdiQjaevn/BI4XxDSO0LJIdd+4SXdZROwKVUpsWkaC/CAIuYIeZF6
         KNB44AZ7EwARPpc+ksUoIxDOHnh2+f72TqOuTNeHwGj5rYDUarg7X3eE1+XPC8dRm6r6
         GQEf9qpoVYT/3ImSdHxdS9OUtJ0RreW1yo56qA+XwY3h4jtozieTx7s66FL6GcI5SpcA
         zXKE40T/1sW+8byUh+KODrKra+jt+AHhdsG9IIHNstzAwmfblkzrVf6oqbQfiYY2QUJC
         ExNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iQL/mBFoyT5w4+hqPmctLZTeB55w7NLl/wO5PdSiL2U=;
        b=K0TN2M4YdzLyF/RCRhrjheoLmDxjZiDuKv8QtP9KIAdp34hxmSlhS8dB1L9WoP876S
         7y5FLsJILE11bitPqgGRBRUCNym6gR/unaXH2KoUnI9ltCJ6MIZBYKIItaMod1xYwSWG
         I0+6WNXyV7xvoDKe66Nlk14VWReMXkt5JJC3aomP8kAyGsCLNobOujdQ+WFBwsKqIAbe
         z1zjFt19/5UzYY4B8aQ1QDOIIvKqOZzbnJId53tKkp8Ljv8swJvq5/moclirs1/alBTH
         +E00Zzp2sVrc0KG4dwJ6a/8o/FKXkZbl0qY4stinMUo+pliSI2s7NaJLqAGQVBFPa7di
         GMJQ==
X-Gm-Message-State: APjAAAW61DdVAewmLodiBNtBZZKjKn1ZMldFbpJzw7q7Mfd8fiPqXkpG
        06dZ1ugFRI1MF6XW3BxMdjdmuw==
X-Google-Smtp-Source: APXvYqzSC7+dVijO0hQycnadf7tT0XIPdovlOCjVDrWfHckpArc6CW+OsTBS1TZwnP1NrZaSUrm1qw==
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr2867784wrr.302.1569588289230;
        Fri, 27 Sep 2019 05:44:49 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id v4sm4201457wrg.56.2019.09.27.05.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 05:44:48 -0700 (PDT)
Date:   Fri, 27 Sep 2019 13:44:46 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] kbuild: fix build error of 'make nsdeps' in clean
 tree
Message-ID: <20190927124446.GE259443@google.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
 <20190927093603.9140-6-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190927093603.9140-6-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 27, 2019 at 06:36:01PM +0900, Masahiro Yamada wrote:
>Running 'make nsdeps' in a clean source tree fails as follows:
>
>$ make -s clean; make -s defconfig; make nsdeps
>   [ snip ]
>awk: fatal: cannot open file `init/modules.order' for reading (No such file or directory)
>make: *** [Makefile;1307: modules.order] Error 2
>make: *** Deleting file 'modules.order'
>make: *** Waiting for unfinished jobs....
>
>The cause of the error is 'make nsdeps' does not build modules at all.
>Set KBUILD_MODULES to fix it.

You reported that issue earlier, but having nsdeps depend on modules
(see Makefile:1708) resolved that for me. I wonder what I missed. But I
won't disagree with you on kbuild advise. :-)

Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> Makefile | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/Makefile b/Makefile
>index d456746da347..80ba8efd56bb 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -616,7 +616,7 @@ endif
> # in addition to whatever we do anyway.
> # Just "make" or "make all" shall build modules as well
>
>-ifneq ($(filter all _all modules,$(MAKECMDGOALS)),)
>+ifneq ($(filter all _all modules nsdeps,$(MAKECMDGOALS)),)
>   KBUILD_MODULES := 1
> endif
>
>-- 
>2.17.1
>
