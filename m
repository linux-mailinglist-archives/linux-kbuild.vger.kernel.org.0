Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79BC8E2EBA
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2019 12:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409005AbfJXKY2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Oct 2019 06:24:28 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35476 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407344AbfJXKY1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 06:24:27 -0400
Received: by mail-qt1-f193.google.com with SMTP id m15so37165751qtq.2;
        Thu, 24 Oct 2019 03:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fvdFMXu4f/m9PNa/Dm+FLyMw/J1lwnGj00apTLD33aE=;
        b=jj17DnwxtQSTsS8Aqm6J87x8ZMQKgyoe+PPlvInJPDc/in657kBaLmylCZPcltooLI
         m3o+Ja4jNmS5Zah7ao/RcStG80ckiJvrLHPmEPG3vZdEYEmPWb/e0f048g/9fD+1K6jp
         57m6U4LcwqKjrMy8vkHir+v/+ns0OoXNRksMpUsddvVRbWyqp4VKJXIQFQujaIyo6S2o
         5IeOIN3AyesFfUGmLWCgEuMGIYXN/3agvs8FtsuaQqoJmaPSeCJ8Wlwm+nHAXXozalO3
         11YfG3G+qUvZniJal/N0ln31Nsb1nBlam5p+IIfO3Yuch9HGfKd+lBGvARRg1h464ejO
         KsQQ==
X-Gm-Message-State: APjAAAV/zVcPd7ot4Y2NKAkmcA19n4G3NRIFcTtzSTJSefNL58zulKh+
        LYXvhZHH+Corslv15Q6enrI=
X-Google-Smtp-Source: APXvYqzKoWrUiSADuSEdAg9zu1c7XQk5ezth585fij3Jr03nhQ482j5PevCmM6xYiLnjLI6ua4Vphg==
X-Received: by 2002:a05:6214:10e3:: with SMTP id q3mr11486283qvt.63.1571912666564;
        Thu, 24 Oct 2019 03:24:26 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id m186sm12257080qkd.119.2019.10.24.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 03:24:25 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id 60DBD40244; Thu, 24 Oct 2019 10:24:24 +0000 (UTC)
Date:   Thu, 24 Oct 2019 10:24:24 +0000
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Matthias Maennich <maennich@google.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org
Subject: Re: [PATCH v2 0/4] export/modpost: avoid renaming __ksymtab entries
 for symbol namespaces
Message-ID: <20191024102424.GL11244@42.do-not-panic.com>
References: <20191010151443.7399-1-maennich@google.com>
 <20191018093143.15997-1-maennich@google.com>
 <20191023122222.GA27861@42.do-not-panic.com>
 <20191024093546.GB199239@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024093546.GB199239@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 24, 2019 at 10:35:46AM +0100, Matthias Maennich wrote:
> On Wed, Oct 23, 2019 at 12:22:22PM +0000, Luis Chamberlain wrote:
> > On Fri, Oct 18, 2019 at 10:31:39AM +0100, Matthias Maennich wrote:
> > > The introduction of the symbol namespace patches changed the way symbols are
> > > named in the ksymtab entries. That caused userland tools to fail (such as
> > > kmod's depmod). As depmod is used as part of the kernel build it was worth
> > > having another look whether this name change can be avoided.
> > 
> > Why have this as a default feature? What about having an option to
> > disable this feature? The benefit being that without a full swing of
> > tests to avoid regressions its not clear what other issues may creep
> > up. With this as optional, those wanting the mechanism can enable it
> > and happilly find the issues for those more conservative.
> 
> The strongest argument against that is, that the 'conservative' people
> would constantly break things for the more 'adventurous' ones. They
> would introduce namespace requirements by just using symbols without
> correctly adjusting the imports.
> 
> Second, vmlinux and modules would have to be compiled in the same
> configuration. Otherwise they are incompatible and we would likely have
> to maintain code in the module loader to catch issues caused by that.
> In general, I think for the adoption of this feature and one of its
> purposes - making unexpected use of symbols across the tree visible
> already at review time - we should not make this an optional one.
> Enforcing the imports at module load time is optional (there is an
> option).
> 
> And finally, having that code configurable for both options introduces
> quite some complexity in kernel/module.c, modpost and
> include/linux/export.h that would make the code hard to maintain and
> complex to test. Hence that would likely introduce more issues.
> 
> I know the feature came with some rough edges. Sorry about that. I
> think, we got most of them worked out pretty well (big thanks to
> Masahiro and Jessica and others helping with that). Now the actual
> change to the surface exposed to userland tools is much smaller and the
> feature itself less intrusive.

This logic makes sense, the complexity over module loading is already
high and supporting yet another division would be a burden for review
and maintenace.

However I'd feel much more inclined to support such decisions when and if
we had a series of test cases to prevent possible regressions. Since
effort with testing will move forward, I'm happy with the status quo.

  Luis
