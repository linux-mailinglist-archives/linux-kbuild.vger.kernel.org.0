Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A930E2D7E
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2019 11:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732606AbfJXJfu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Oct 2019 05:35:50 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46658 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408871AbfJXJfu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 05:35:50 -0400
Received: by mail-wr1-f68.google.com with SMTP id n15so14467481wrw.13
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Oct 2019 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kmED9H3HhgwVVQ86s12b9wU01cqR0QgzFhbCOFHeClU=;
        b=S1mM97qME0Ixk73g4LGqcCagCBx33p9xYc6nmNo95xpmoy4pywt5jOn1AOzctxPT0N
         nB8+li9SpYltwU9/B58VVKFmqClfis9qWSOprXtc6VB6a9Puf83HLXQkNBet/h33yqAR
         WVArAD+EZt2+aaggCpxWLw+3LbCroUBv86+xfu3mB6539VfCotaYfsEgnnCDrmW5n5+E
         XHbqIRWbvT+T7Np7UUuoTXPX8BPuLV6v0uHCj35eGdrCSPzSfzUz9Eo49WkDWFFsqcgS
         vLpKsOhAAQstb+gTrd/fpMaJDfK81gR6ltUBmaTVsSQ0P+GSWyVj3T4N0+tHa5V2Pqnh
         9SFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kmED9H3HhgwVVQ86s12b9wU01cqR0QgzFhbCOFHeClU=;
        b=k0OzjAjJlNSaboD645YoYm2RBFhOZjOzVzUNnawSSGHlxemRovZJVAR4+gY4+akb9l
         bFWGGW2sdeXGg7R+5UrJwTd9pzHdi5VX4nM02d2sITqPoo/loHGgYnyeyS+xEwHxHFbJ
         snAnO/ncPioimr+ieAqoPbAJCMOdXvIYVqUCV3pC/kzLcy1bdwjShwC4/+jM3Y0BOUXc
         8MTtMxyZ9vm6Cr5GeA09kJWnRv0BRoWGHxEqzlBHqCaIBKhcrDzJNbDo1E6EDI2Jdl1C
         MYzBBeuYe6nGOAZoKJuWdJJfGyrRf4V+0DUJmg1R5hEAFXKWwTG3f4mpJOF7qsQgHi0U
         iUjA==
X-Gm-Message-State: APjAAAXaDftA9JL088mLKBFK9HoBzmIdRMKTRPKq9R00/noFeB0P9i4C
        fYwYyj6z9fTfoGPGHKCAymivGQ==
X-Google-Smtp-Source: APXvYqwxrDmy4CJmsq3rBjQJVIc2QqLxi0MkLafXCzaC4bsC3/cOsLzto1cuoPgY1rOynnJee1G1RA==
X-Received: by 2002:a5d:630f:: with SMTP id i15mr2972442wru.226.1571909747667;
        Thu, 24 Oct 2019 02:35:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id i18sm22647040wrx.14.2019.10.24.02.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 02:35:47 -0700 (PDT)
Date:   Thu, 24 Oct 2019 10:35:46 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Luis Chamberlain <mcgrof@kernel.org>
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
Message-ID: <20191024093546.GB199239@google.com>
References: <20191010151443.7399-1-maennich@google.com>
 <20191018093143.15997-1-maennich@google.com>
 <20191023122222.GA27861@42.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191023122222.GA27861@42.do-not-panic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 23, 2019 at 12:22:22PM +0000, Luis Chamberlain wrote:
>On Fri, Oct 18, 2019 at 10:31:39AM +0100, Matthias Maennich wrote:
>> The introduction of the symbol namespace patches changed the way symbols are
>> named in the ksymtab entries. That caused userland tools to fail (such as
>> kmod's depmod). As depmod is used as part of the kernel build it was worth
>> having another look whether this name change can be avoided.
>
>Why have this as a default feature? What about having an option to
>disable this feature? The benefit being that without a full swing of
>tests to avoid regressions its not clear what other issues may creep
>up. With this as optional, those wanting the mechanism can enable it
>and happilly find the issues for those more conservative.

The strongest argument against that is, that the 'conservative' people
would constantly break things for the more 'adventurous' ones. They
would introduce namespace requirements by just using symbols without
correctly adjusting the imports.

Second, vmlinux and modules would have to be compiled in the same
configuration. Otherwise they are incompatible and we would likely have
to maintain code in the module loader to catch issues caused by that.
In general, I think for the adoption of this feature and one of its
purposes - making unexpected use of symbols across the tree visible
already at review time - we should not make this an optional one.
Enforcing the imports at module load time is optional (there is an
option).

And finally, having that code configurable for both options introduces
quite some complexity in kernel/module.c, modpost and
include/linux/export.h that would make the code hard to maintain and
complex to test. Hence that would likely introduce more issues.

I know the feature came with some rough edges. Sorry about that. I
think, we got most of them worked out pretty well (big thanks to
Masahiro and Jessica and others helping with that). Now the actual
change to the surface exposed to userland tools is much smaller and the
feature itself less intrusive.

Cheers,
Matthias

>
>  Luis
