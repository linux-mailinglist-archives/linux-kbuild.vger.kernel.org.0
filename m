Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71EA82FCB15
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 07:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbhATGbk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 01:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728992AbhATGVK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 01:21:10 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CF5C0613D3
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 22:20:23 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id o20so5458219pfu.0
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 22:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s6C+mbhedQCP+zudi5mxquluGRK7D+VGS5SgYthRSds=;
        b=WgYhoD8yxocJ85iXXmVyCBnc24BrEivMRF1Tb8iCP7Uda5K63BkrHdCjTqppP/WbCA
         zI2onxF6t3pfa2MTQMPIVzMcCtPfE3zhIoEdsNh5CWE8uECvpKXRewnhVQnjT7B/+mwk
         rIU0TpWE/YqQyWwzP/xTAmTQRTndEF+vK/v0ymWR/DQtzwqz9XzYQICA11Y70fBgYS+l
         8g8JeQeEjmtg0veHXZRqAuTosQUaByNm8iLNxxIn4YXf5Ps8YsIvk+TJNdwOqyW5so8p
         LyYZrYiF4x0MdQx0tl35ZBr1N4mKau2k/l4ae+N57NAJzrysiCr1uENk7QPQI+WgPqLd
         O5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s6C+mbhedQCP+zudi5mxquluGRK7D+VGS5SgYthRSds=;
        b=JS/PBZAkSm9MPwFcHaxT+2h1jMJA98HR8/pLLRRXB4w3q2vNDifDged/g9DNtuVvf8
         6UQbJpGXyZDQQJLmH8b24OXowJ7+57cYLx4pqn3hygkh1QP7ZlWnCH0mrlZk4lOAb2aD
         BNf1CQiMisPrmZK8YtnwLGNUXrH9u6FoVb0cOytOzNTiQrsGiHfTmVDF8S+EpDGaJwvq
         m2zWXKrfGp+Ws4sTISTN1gJxr3XJatbYdYefqMtZJW/0Dws7qLPFX/U2ME9uNs+18vXj
         KMPcJ/FFP2teIUSMUI4a2WEHgf41wphuIDARJ/GoxxyHDWLuFPcL0gtWJXXajJKG9jGv
         0gXw==
X-Gm-Message-State: AOAM532FNdap/387lqfSCIZQX1oIMM3ri/8YnVZm35pBtPX2wcDfeeuB
        as30jLwO7QV+mcE2ZGo2R21wog==
X-Google-Smtp-Source: ABdhPJxLMUyE+2pwrS0UVGPFMaBcYi/uM33r5JfTx1Pgy3Xp8LXpTj6aZrSgZfqJw/i9I+XYAOqi5g==
X-Received: by 2002:a65:458e:: with SMTP id o14mr7834909pgq.444.1611123622455;
        Tue, 19 Jan 2021 22:20:22 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id n8sm1015976pjo.18.2021.01.19.22.20.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 22:20:21 -0800 (PST)
Date:   Wed, 20 Jan 2021 11:50:19 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
Message-ID: <20210120062019.itpakykj2ah5oxp3@vireshk-i7>
References: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <20210119022154.2338781-1-frowand.list@gmail.com>
 <20210119080546.dzec3jatsz2662qs@vireshk-i7>
 <f7133d16-510b-f730-a43b-89edab08aabe@gmail.com>
 <20210120050606.b2m4jssh73wexybx@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120050606.b2m4jssh73wexybx@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 20-01-21, 10:36, Viresh Kumar wrote:
> On 19-01-21, 09:44, Frank Rowand wrote:
> > No.  overlay_base.dts is intentionally compiled into a base FDT, not
> > an overlay.  Unittest intentionally unflattens this FDT in early boot,
> > in association with unflattening the system FDT.  One key intent
> > behind this is to use the same memory allocation method that is
> > used for the system FDT.
> > 
> > Do not try to convert overlay_base.dts into an overlay.
> 
> Okay, but why does it have /plugin/; specified in it then ?
> 
> And shouldn't we create two separate dtb-s now, static_test.dtb and
> static_overlay_test.dtb ? As fdtoverlay will not be able to merge it with
> testcase.dtb anyway.
> 
> Or maybe we can create another file static_overlay.dts (like testcases.dts)
> which can include both testcases.dts and overlay_base.dts, and then we can
> create static_test.dtb out of it ? That won't impact the runtime tests at all.

Hmm, I noticed just now that you have kept overlay.dtb out of the build,
probably we should then drop overlay_base.dtb as well ?

-- 
viresh
