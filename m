Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA3E3392EE
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2019 19:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729931AbfFGRUX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Jun 2019 13:20:23 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34554 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729829AbfFGRUW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Jun 2019 13:20:22 -0400
Received: by mail-pg1-f196.google.com with SMTP id h2so1504668pgg.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Jun 2019 10:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4r6GwxGvl0zgmYTsnJpnkTK37LmB3ZK1B52Nf1m2Xtc=;
        b=Iji4lWYdr90JGsl7uzcN2zrOi8Z37hhEGqTARRcIdegyMU9aUSbbKAWJ/JD+B9AHu5
         dyJmOSRtJBs9JYjA0TOFc/+Ph98KEoeaY0QKw0QeMu/SfNt+ohq5YGaATktXppZXVXQ+
         yuFz9qCNn4hxVZWGFubN54MIRfP+jCXFPm2uOnM9SYvx+BQLM0C7TG1ftBjc1VHHOF7j
         X8/q9KqC8p7wEDmVnYNJ5QUuYQalNXTDlLbf2b5NiDdtNa+YI982pN10wL3h3os5FVkv
         sZr2GR6HgQ7jjW8SgeAnWJPNh9uvPBWw/PRTaAYMdG/XeGyOeqHkbRWmDUdEJYU+3Sn2
         Z4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4r6GwxGvl0zgmYTsnJpnkTK37LmB3ZK1B52Nf1m2Xtc=;
        b=SfT6NTyowPrCXtn3RLnbVYlD2U4RkoVxg7nHCED/uZstxfzC5a2cLEqx+Qa/67bEsM
         fHFFIUakH32xLJR5pAv2RjZ/1pOYvNx0AuFadY2o4FYHU1FW1H/D60QptOkIyNZD63d2
         z6E8mB/q1t1QSwFuh46+gTDFd6lg/dEnsvWqUibg0ZKcjCYOfG0VAgFzmVvrMxA69gkc
         cPrqKAt49k8gH15DYKm587AOjxsDGmRaf8NVDafJKeHX+ia2X5RK8iIHQV/RbnkUn/vY
         EoVSvC1XXYqZa6UtudDE52SOQcgKIthvm0+z2n3sIg1e3aGBRzXJCHeWj06BDijHCOaW
         azHQ==
X-Gm-Message-State: APjAAAV0Mq4sSYBcEdYNxkBQ6X2nZ5VIXHhjjSTn+X/Krew1sa2N0H7/
        t1mabzia8HaRFDZxvWqMcLqEFoFBuLLOlw==
X-Google-Smtp-Source: APXvYqx7n4L85nJ/b/yAbxgf2eN9wdrvqxhhzcwX6swNcdMstn4xqcPB18jDJfoa9YbDIHsxDFcFEw==
X-Received: by 2002:a17:90a:195e:: with SMTP id 30mr7069639pjh.116.1559928021274;
        Fri, 07 Jun 2019 10:20:21 -0700 (PDT)
Received: from google.com ([2620:0:1008:1100:dac3:f780:2846:b802])
        by smtp.gmail.com with ESMTPSA id c12sm2724358pfn.104.2019.06.07.10.20.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 10:20:20 -0700 (PDT)
Date:   Fri, 7 Jun 2019 10:20:15 -0700
From:   Tom Roeder <tmroeder@google.com>
To:     Derrick McKee <derrick.mckee@gmail.com>
Cc:     linux-kbuild@vger.kernel.org
Subject: Re: Adding new build target
Message-ID: <20190607172015.GA165542@google.com>
References: <CAJoBWHw2yPgT_25UVF_3tTx6_FfZMBbDqVW5TASb4aPu2JKHZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJoBWHw2yPgT_25UVF_3tTx6_FfZMBbDqVW5TASb4aPu2JKHZg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 07, 2019 at 12:58:33PM -0400, Derrick McKee wrote:
> Hi all,
> 
> Now that the kernel can be built with clang, I'd like to implement a
> new build target to generate LLVM bytecode for all C source files
> involved for a specific build configuration.  I am thinking that this
> should be very simple if I know the make variables that captures the
> needed information.  Specifically, I think I just need to perform the
> following command for all C files:
> 
> clang -emit-llvm -c <appropriate CFLAGS and include paths> <source
> file> -o <corresponding object file location>.bc
> 
> My problem is that I don't know how to get the info in the brackets,
> but I am thinking that I should make a new build target `bytecode`.
> Any help would be appreciated.  Thanks.

I know this isn't exactly what you're asking for, but one way to get
kernel object files as bitcode is to add -save-temps=obj to KCFLAGS.
That gives you bitcode for each object file, and you can pull them
together into a single object using llvm-link.

Note that at least when I was experimenting with this, I also needed to
turn off some warnings, because setting -save-temps=obj changes the way
that clang builds the objects. In particular, I needed to set

	-Wno-constant-logical-operand
	-Wno-parentheses-equality
	-Wno-pointer-bool-conversion
	-Wno-self-assign

> 
> Derrick McKee
