Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E106B2F10EF
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 12:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbhAKLRz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 06:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728592AbhAKLRz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 06:17:55 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0B3C061795
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 03:17:15 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id be12so9343938plb.4
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 03:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vBU9e6qyBvT5ZyCJomv4xriQsn7W38v5x67CwrScjsY=;
        b=nYSrbnM/SnogBIYP8F8QIZmbgrUADTNeZxHozvUNmjqEjOIqHbwP6EdZageFoUCpbp
         RlFDS1YbJSKKIYteN71fcaSAxssopABgaek9Dp7ZuCaQLYrnB2Bbw+SN/q7uTDK5kP6U
         WIZ64yWIGwm+vYX2Gh3d8diTBeb46C7C4HhNWm5eNMPpcKJPMnsQ3w9k+/tFlmGlpcsO
         ubmPWOj6PNYow3oURddjaOKgO1moyoGDB5fM2F5jjMRHZyfDad0nN0n9YUYNmYDEbP9U
         9AQ3LQqPleAHxKEzp2N4ouXkCvhywR+I05n5ohiQbmYi6u4c68wvJ0J/A+uU5f2NwwmN
         +dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vBU9e6qyBvT5ZyCJomv4xriQsn7W38v5x67CwrScjsY=;
        b=bNRsfbm3ABEfrkl1+9lpOFJIZEI/+JTsoGUSPtSVbQaTmQ6lW6BrxAmmfyeXjU6/Jo
         +VQoRMmSLaL0RwKdUhmO4YJIa01nkCweFvkJVSXFiBCTuG1eYGbPtJSPFUvzItsZY4TE
         S8PeYV2UijSByvT3lSL0eulm5uQC7USirIU0WdPfzFZVkAcjmhokkLC3cuyim/YvgLaG
         kzrU1DU7mqSqcw77Rcn6GX/ZzqneTqmVqJrXlTMvQd5jes6bbm5hFl4oDZqqaNmFV/dM
         reD6Z+MRUEoBw2HwiYxtGpHWiuVL1rFy8k+bDZCNzECGn32CGSeG9HWn52WJ2xCNcMtu
         J56A==
X-Gm-Message-State: AOAM530LgS4DOrCrDnNr1IEAXR313lOmexNhfNpoUxUIPSKvEnermkdY
        lLVN9ktWbUeiEvNnX+1U0yFs0g==
X-Google-Smtp-Source: ABdhPJxt34tCOBXDfUJk3pPZ0yxAGN7NW92b+4hhJvRSg1GMXrG/sPu4+TJ2kUlBUKmqgX1XaFfS3w==
X-Received: by 2002:a17:902:9a90:b029:da:ba07:efdc with SMTP id w16-20020a1709029a90b02900daba07efdcmr16068115plp.1.1610363834824;
        Mon, 11 Jan 2021 03:17:14 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id y21sm20500535pfr.90.2021.01.11.03.17.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 03:17:14 -0800 (PST)
Date:   Mon, 11 Jan 2021 16:47:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, tero.kristo@gmail.com
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210111111711.r2xesydzhq5js2nf@vireshk-i7>
References: <cover.1609844956.git.viresh.kumar@linaro.org>
 <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
 <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 07-01-21, 14:28, Masahiro Yamada wrote:
> Viresh's patch is not enough.
> 
> We will need to change .gitignore
> and scripts/Makefile.dtbinst as well.
> 
> In my understanding, the build rule is completely the same
> between .dtb and .dtbo
> As Rob mentioned, I am not sure if we really need/want
> a separate extension.
> 
> A counter approach is to use an extension like '.ovl.dtb'
> It clarifies it is an overlay fragment without changing
> anything in our build system or the upstream DTC project.

By the time you gave feedback, I have already sent the dtbo change for
DTC to the device-tree-compiler list (based on Rob's suggestion).

And it got merged today by David:

https://github.com/dgibson/dtc/commit/163f0469bf2ed8b2fe5aa15bc796b93c70243ddc

Can we please finalize what we need to do with naming here and be done
with it, so I can rework my patches and get going ?

Thanks.

-- 
viresh
