Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BC72F2756
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 05:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731559AbhALEtb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 23:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbhALEta (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 23:49:30 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F49C061786
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 20:48:50 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id h10so643715pfo.9
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 20:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6XEbGkPVwRDanX/I2P6uhWlodWlqXcGCFNj2dY44RU0=;
        b=e+ZX8khPSgjivRpNFVdUaQFDkJbcVIohhxpJnLap07MwZXlSquRgCeTkiPp2YTxEte
         maItIY05EXnSPWvSAO8KXFMKq5xouooO3HE/0SM8Z5ZNNnDSb9POp5C0RsIBRkBiPnd8
         qBlvE6/H7aATiHRxnniZlQu+smiiMr1PMCiAHDsgzS+2Bntt4EpALyDlMHf1BRcyhwkm
         Xk6FrTQotrnboRGhHO29VBnE7TYd0/skUZtl8wm0nfALqD9hcjGGFmSVmgxXYKEybgsY
         w+uUdjb0J6xPLwi+0wFK8LY9plf2rDzXR+Q9aZd8h4OJDafTnol0+blIJWqPVnyFaTqN
         GFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6XEbGkPVwRDanX/I2P6uhWlodWlqXcGCFNj2dY44RU0=;
        b=EtP0zCKict9ir81/8JgCq/G0AC5YioKjEU/OVletD1OH8ptIdPX7LzReAwTED07TPF
         BKEFON1/4YzIQ04iMIG5RIy7e5q8GiebHx+7u4rpZvkjnOJZWCMhuMhxEwQcABlZzVnB
         THZWOWFL9ZsEt3brqDKVqoj2g858mwUhdnQXltwxy9iXBDYzbAMtWXy6Wybo9SamXGy9
         urM1vIz6+HxA041gvuq5x+2dIQFdnAaSrEkq4j1Beb8Ywdi56cPP8KelZ1x+o5NsyLz7
         RwpRSvKS/+qn1HwMKnEhc2tsiV5vxsc6KoYDrJ2VB8kKG84lqan4M8rmljcCrGyPgcAr
         m9Lw==
X-Gm-Message-State: AOAM531bcn2P5SSF2aKNgx1+ftLv34X6rJVmUpee3Eej61nXgr0itQVE
        tLAApPD/JUI8wCzGWGzM3M08sg==
X-Google-Smtp-Source: ABdhPJzQPpAHrtaGK4/DtxiUE2mB5Qyjs5gxlhcr/XuwWqjBx8Li6i+JvRM3AMei68AePo/MRKvs3Q==
X-Received: by 2002:a65:494f:: with SMTP id q15mr2854002pgs.367.1610426930315;
        Mon, 11 Jan 2021 20:48:50 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id p8sm1172317pjf.11.2021.01.11.20.48.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 20:48:49 -0800 (PST)
Date:   Tue, 12 Jan 2021 10:18:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH V3 2/2] scripts: dtc: Build fdtoverlay and fdtdump tools
Message-ID: <20210112044847.e6aiaskvllgcll6z@vireshk-i7>
References: <CAK7LNAQT5nVHGAZDhj4dct0v8UMzQ+-mdfBXJsfedR-7mZTnyA@mail.gmail.com>
 <72c3a4f63dde3c172c11153e9a5b19fb6cdb4498.1610000585.git.viresh.kumar@linaro.org>
 <94990759-34ff-0f4a-c913-dbcc679219be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94990759-34ff-0f4a-c913-dbcc679219be@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11-01-21, 18:55, Frank Rowand wrote:
> Hi Viresh,
> 
> I may have an email hiccup,

No you don't, I just sent the 2nd patch alone.

> but I don't see a "[PATCH V3 1/2]" email, I
> only see this "V3 2/2" email.
> 
> Please start each new version of a patch series as a stand alone email
> instead of a reply to an email in a previous version of the series.
> That way each patch series discussion stands out as a separate thread.
> 
> Also each version of the patch series needs to include all of the patches
> in the current version, even if they are unchanged from the previous
> version.

Sure, just that some people like to just bump individual patches until
the time there is an agreement and then send the whole stuff together.

I will send the whole stuff going forward whenever the versions
change.

Thanks Frank.

-- 
viresh
