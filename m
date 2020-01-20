Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6204214315F
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jan 2020 19:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgATSSH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jan 2020 13:18:07 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55221 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgATSSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jan 2020 13:18:06 -0500
Received: by mail-wm1-f65.google.com with SMTP id b19so278900wmj.4
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2020 10:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ueFhoq0888bObMU/MyWNjalID6TVX62BYMUk86CN9sY=;
        b=URqlkO1HRRK4JEksGOMOKBeLeUw2xDoWJkLqihkgtjh2adEvHnEmR5yDIn4unCT45S
         aFI8umb1/wYVs0ip9chXxIwjwYTv8fb+Lo9xbBt67VEjKe71syIiJEjSf+avDIUlgkMm
         nR2TS/uAT9ysoaxOMFy3QHwy/79RTB8MB9eBRgdpfovmPUGEEmNuxqyf6trbybXWs7U5
         6MVZwQ1HJ3tg5qIIDFq+SGn+dJsFh7VKygE4O/gkq9Trlit+pEb6pqGuCWb+a/PO4DdN
         j30va57due0cY8AGVnhpGRp/pSPv9uepqdnyuBhF72i5RG3ZbdrxQY3eRtfEUYeyHjsR
         OOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ueFhoq0888bObMU/MyWNjalID6TVX62BYMUk86CN9sY=;
        b=MdFQV9xziffrSgzgYhPVezLw9Ii6c1hCIQlQfmCmobOQW9UJZTniFXSgx90HgZWrm+
         eP8xc2i9mnz1xajkvCVBAWh334P66D3/CGMefaHQO2ZTwUx/+a0rz0Gp4cBcwfc5hXvW
         sWFA2LIKriTjC3cKG1Pr2D9vhrXiFwGuYz1+jEK//+7z13t8tVYEZq7YjG6g47eWKeM4
         7dLTDmDjtrY6jjPo+D6hk4W2F2x8l1k+04B0A6n/CiO4aCQdG1nB/yBwpEZz1ZkMjBZg
         l/tjWiAIOPxTDp/hKzxb1kJ46rHO56kd1XrxWLStJNrFvzbwElDyDBgUz1vwAYofz4mr
         ZADg==
X-Gm-Message-State: APjAAAXJb7Jpdvgnv7gMC4BHIdakdfD3ohd+P0RYpHQSa+WpIUq2fefz
        3P9NK7uZHNC3Sc8kFP0U/NrApg==
X-Google-Smtp-Source: APXvYqwhBmzOsrIOPrRrZOZmMA2xlzfmjsCTPyWP8T4P9O74PDIhglC7uHXDKLHNFKMef4S3xh3WHQ==
X-Received: by 2002:a1c:f407:: with SMTP id z7mr180451wma.72.1579544283637;
        Mon, 20 Jan 2020 10:18:03 -0800 (PST)
Received: from cheddar.halon.org.uk (cheddar.halon.org.uk. [93.93.131.118])
        by smtp.gmail.com with ESMTPSA id u84sm305253wmg.10.2020.01.20.10.18.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 10:18:02 -0800 (PST)
Received: from bsmtp by cheddar.halon.org.uk with local-bsmtp (Exim 4.89)
        (envelope-from <steve.mcintyre@linaro.org>)
        id 1itbcg-0002Fz-0e; Mon, 20 Jan 2020 18:18:02 +0000
Received: from stemci01 by c30-smcintyre.einval.org with local (Exim 4.92)
        (envelope-from <steve.mcintyre@linaro.org>)
        id 1itbbu-0000zW-8O; Mon, 20 Jan 2020 18:17:14 +0000
Date:   Mon, 20 Jan 2020 18:17:14 +0000
From:   Steve McIntyre <steve.mcintyre@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     David Gibson <david@gibson.dropbear.id.au>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Message-ID: <20200120181708.GN3697@linaro.org>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
X-attached: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-wibble: sender_address steve.mcintyre@linaro.org
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
>On Fri, Jan 17, 2020 at 6:26 AM David Gibson
><david@gibson.dropbear.id.au> wrote:

...

>> What might be better would be to have a dtc option which force appends
>> an extra .dts to the mail .dts compiled.  You can then put an overlay
>> template in that file, something like:
>>
>> &{/} {
>>         linux,build-info = /incbin/ "build-info.txt;
>> }
>
>I like this suggestion either as an include another dts file or an
>overlay. The latter could be useful as a way to maintain current dtb
>files while splitting the source files into base and overlay dts
>files.

ACK, that sounds like it could be helpful.

>But no, let's not prepend this with 'linux'. It's not a property
>specific for Linux to consume.

Right. We might be seeing the data coming through from U-Boot (or any
other random bootloader) too.

Cheers,
-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

