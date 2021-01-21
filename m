Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDC62FE172
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 06:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbhAUFS7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 00:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbhAUFJ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 00:09:59 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF485C061575
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jan 2021 21:09:19 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id i7so606603pgc.8
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jan 2021 21:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+ziGzMN3/gLL8DtYTqVljYCruFFRjjjEaJ7y7XyhFL4=;
        b=iDv6v5uCY3Zua0I3KQwsWBukYKQ2YMAPXP1fqHyqRFJV2Z50vu0ClyvaY7eG9gtnCX
         hgLa4UoczoIt+Oop4ITJJhLMpqINlhscY5JYwgUk1cPR1R+K0HfKAFfh+SyaSSMJVdCn
         fmDyRphqwM+Jrs5+NxMvCHeXEx8qXBgN0BtSeUsnxhkOLhSE86pbfSNbLNYp0zDFF57R
         g1XfUneaQqpNiW3pNM9zhlidI68DM8yCs7GHFYkKZU7Gs8K7tC6AKBKk7UHZYNYmGFoE
         nI+6Ar+VXdcKCn9FiFypXx/MJLVYVPEDmVyXsSPWX/0sF14Fu5fI2YZ/UW1+VHm/zFIW
         MYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+ziGzMN3/gLL8DtYTqVljYCruFFRjjjEaJ7y7XyhFL4=;
        b=kftkNz/o4b/iN4DEKW1pIzp0GReIEWC4Fhqfr45MgXe6Feu95rnK8o+7kcCA5Xw2w+
         xGcncxjEIuxMyANRtYL2/9mZVOpyv2BWOhQhVEDkCUClbK2t/IDpb76LiTjPU+rr+b9z
         tSTcaikZw5Z5U07GQ/+cxvRafGPhWrqxGJYJCHD7fzUq1HY71awuNPbZvj7C9mSyhuXq
         TRWCshUSxjQ/zHn5k+N4nhWZeaLoSihIuXzBmB5qK3jH3Ycy3vHBaISNP9g00kPr5aGc
         UB7YL/4O1107jaqJY9iStywiLUgJXJ0GSqkxzigjvopNkPTY/IjWng5ksQ4Qs5KkKOvY
         X3jQ==
X-Gm-Message-State: AOAM532pDipAwt/RJsW7eHDVJ9xcnC/dPN+OjqfNA2Jer5MPfl3JKMJM
        kKfOZjBAV1CFuMw3obm0jZRDpQ==
X-Google-Smtp-Source: ABdhPJymtba80r4ZOg+CreJD1LGitzW/rg3A48sdo91Pby/H44gTqNkG6fMKAiI4k6j9P8R9iyWcKw==
X-Received: by 2002:a62:5105:0:b029:1bc:3b3d:30a5 with SMTP id f5-20020a6251050000b02901bc3b3d30a5mr1221625pfb.43.1611205759123;
        Wed, 20 Jan 2021 21:09:19 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id e21sm3826873pgv.74.2021.01.20.21.09.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2021 21:09:18 -0800 (PST)
Date:   Thu, 21 Jan 2021 10:39:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
Message-ID: <20210121050916.4rrumkoy3jsdh4hx@vireshk-i7>
References: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <20210119022154.2338781-1-frowand.list@gmail.com>
 <20210119080546.dzec3jatsz2662qs@vireshk-i7>
 <f7133d16-510b-f730-a43b-89edab08aabe@gmail.com>
 <20210120050606.b2m4jssh73wexybx@vireshk-i7>
 <95cfc497-3d12-fd46-6e42-2a77612236ea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95cfc497-3d12-fd46-6e42-2a77612236ea@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 20-01-21, 23:00, Frank Rowand wrote:
> unittest.c first unflattens overlay_base.dtb during early boot.  Then later
> it does some phandle resolution using the overlay metadata from overlay_base.
> Then it removes the overlay metadata from the in kernel devicetree data
> structure.  It is a hack, it is ugly, but it enables some overlay unit
> tests.
> 
> Quit trying to change overlay_base.dts.

I have already done so (in the latest series I sent yesterday).

> In my suggested changes to the base patch I put overlay_base.dtb in the
> list of overlays for fdtoverlay to apply (apply_static_overlay in the
> Makefile) because overlay_base.dts is compiled as an overlay into
> overlay_base.dtb and it can be applied on top of the base tree
> testcases.dtb.  This gives a little bit more testcase data for
> fdtoverlay from an existing dtb.

Okay, but fdtoverlay tool can't apply overlay_base.dtb to
testcases.dtb as none of its node have the __overlay__ property and so
I have entirely skipped overlay_base.dtb and overlay.dtb now.

Yes this reduces the test coverage a bit as you said, but I don't see
a way to make it work right now. And I am not even sure if it is a
fdtoverlay bug, it expects the __overlay__ thing to be there for each
node, otherwise it can't figure out where this node should be applied.

-- 
viresh
