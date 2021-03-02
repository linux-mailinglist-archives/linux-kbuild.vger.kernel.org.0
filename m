Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D5132B301
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Mar 2021 04:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbhCCB0e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Mar 2021 20:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239845AbhCBDPM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Mar 2021 22:15:12 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B704CC06178A;
        Mon,  1 Mar 2021 19:14:19 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id h8so18986011qkk.6;
        Mon, 01 Mar 2021 19:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fPaViRzaS6e9vqsXCb13buA8oLjLJRyu22haB5wSUkA=;
        b=cc0NXM+ntOgYxIA+svhasGvNDTFmIKSBrUlsDedxJjG4KR9KIeZM3QCI+ilnmMAzEh
         vt6VXpqf6o/S+oVWczN/rhZwcJKaTTirmjKazOZ6NQ/kH5qlPM2sx3watkbbcd+IFhCy
         bZpRUunDGJ2fxripyYnMCqcl258kq+IEZG1vsexVQ8YDzC0hDFMfX2dBcQB+L1AaVjK2
         Aa+8Lo/dzXSI6Nzl64jgMRmYW6t96rH7Rufp8Dsj4fgXTFob21wDqZYrTYT2PxzOy8uI
         nfBXyo61tqyRcwnt2SkKzC9ZvrOqZROiJ8Gvh+shrQsAh6XCy2P/IVToOwgWizewTZbZ
         F5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fPaViRzaS6e9vqsXCb13buA8oLjLJRyu22haB5wSUkA=;
        b=uDycTlqdtwBrGotwng+ON4UxgmnGBsyyoHVxOwZu/mDANXBi/UmkXvbl/pt+hkcFmU
         uzC1u3Km0QVL0ZDSNjwbyDrdWiAe1jPaPt1yaPOIO1qBSoBB+4j3SLgX6L8//DrrE8Nl
         9mGVFWJUbGSz71MCWDfhYDVU7UCOccDBhEeNX+0+ipjuPDGfXBV63rfZYGMe2+Jw1szf
         6rba8RtaAVPrhYCWwYZJNxatkNhjtIGrRwd2+TmZWJ+M6pVmoCxnnvn2bQYeP3EgMl3l
         OmLzrqTw81fGFF2eqzMygkuaijlIQjDlkhEqIGO23XQvEA+dHvLqOysegJqcwfrv518Q
         /iAQ==
X-Gm-Message-State: AOAM530Sezzi7VtmjJo1uV9Q7tgijVzvSbT2xZBPuIQRRGsxgTVK7wKT
        oVFSZZMDueedXyqQidL2FRI=
X-Google-Smtp-Source: ABdhPJzWpgcCFCgG5nl4mPbqZENzlSbRSGkQnLVrd8SoftLVQkdE5f+pnYGNWhsgsljfGc6z7qr+ag==
X-Received: by 2002:a37:73c3:: with SMTP id o186mr16916966qkc.194.1614654858885;
        Mon, 01 Mar 2021 19:14:18 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id d12sm12479791qth.11.2021.03.01.19.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 19:14:18 -0800 (PST)
Subject: Re: [PATCH V8 0/4] dt: Add fdtoverlay rule and statically build
 unittest
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>
References: <cover.1613127681.git.viresh.kumar@linaro.org>
 <20210301065625.rgo2xvr7ol2vycyf@vireshk-i7>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <31cbc900-fad2-4838-21d2-7204f1029a81@gmail.com>
Date:   Mon, 1 Mar 2021 21:14:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210301065625.rgo2xvr7ol2vycyf@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Viresh,

On 3/1/21 12:56 AM, Viresh Kumar wrote:
> On 12-02-21, 16:48, Viresh Kumar wrote:
>> Hi,
>>
>> This patchset adds a generic rule for applying overlays using fdtoverlay
>> tool and then updates unittests to get built statically using the same.
>>
>> V7->V8:
>> - Patch 1 is new.
>> - Platforms need to use dtb-y += foo.dtb instead of overlay-y +=
>>   foo.dtb.
>> - Use multi_depend instead of .SECONDEXPANSION.
>> - Use dtb-y for unittest instead of overlay-y.
>> - Rename the commented dtb filess in unittest Makefile as .dtbo.
>> - Improved Makefile code (I am learning a lot every day :)
> 
> Ping!
> 

Please respin on 5.12-rc1, and pull in the change you said
you would make in response to my post v8 comment about the
v7 patches.

-Frank
