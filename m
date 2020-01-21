Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928941442CE
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 18:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgAURLO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jan 2020 12:11:14 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45315 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbgAURLO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 12:11:14 -0500
Received: by mail-wr1-f65.google.com with SMTP id j42so4075569wrj.12
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jan 2020 09:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZGs+4DUJDSvBqJ//fVqMbttGqRoxAKV0f+ErvAbm5L8=;
        b=EBsH58uX53UDW9/nRW8udKKKe06jKEr+n8gx6G9QSL2/NkKdjeoB1bVKUP6O/x3ouq
         cTuUJxlAHY5gB1+bQaH0jRnZtsfVFtunbtbfIspa/qvNnhkdCnLlq/zmIMUQN05k1DDG
         q+2M++veTbrYCoMSPp8GUjGatjIR2yq4peoPTH1U3X1y5nbegNcANqKY37WwRQM90+6M
         xu2TVvJo6hrsAneOloOPEw01LAQk3lB+2RXhKTeZmVGrV5j7dNi+GjcilaACOkvK+ac9
         SheTyjSLBZEoulkJdX9aGjip+T9fcLoaOtpf1XiEsfb9T0+56H8sqtuUxEdhNfUO8TmB
         kACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZGs+4DUJDSvBqJ//fVqMbttGqRoxAKV0f+ErvAbm5L8=;
        b=ErWfqrGa9H4NLmt0pmXeYjmV3uEVJFTV/RgTAFzXVEfdoC+03nJwrHPzf+PUAZW08b
         e+koaYlca9dvgLnFmuW6Kc0XiVPEgi9qvEA9sMJ4YC7xQqWobO2s4vz+PbsgvxJ3mY+d
         X0/7VBG5V8BuP6C5oGIlsrlfp/ZrvWOn+Vn6DBOjVlwueR970tlhXTCAgWTIQtAzn9G/
         1wVJzOo5nt0oAJdfYNtHqL3jrvve3ghCdlOprqHzU0pNSXjF8qR4i+lrXHrNd8+9Jb72
         TABV8yx/TuCXUf3A1dkuXkSSsocCq7n8zYP6I8YMD4Hi/jCRDt7+SzHUDDcD2g/tcOwJ
         W9cQ==
X-Gm-Message-State: APjAAAUy1VRlzk2VR4e3o37+EAdMRAldVXSoDegADQ6wB9BXpvGfq6zq
        ElV7jtjtaJRjrCRbBTaPMBvAdA==
X-Google-Smtp-Source: APXvYqxOw+/RCexAIK0/PEftnp59kp31SffdYzOIBv9fhO0Pd8QkKlcd4t1De7O+sOSBJ2kmnvIsaQ==
X-Received: by 2002:a5d:5491:: with SMTP id h17mr6324330wrv.374.1579626671678;
        Tue, 21 Jan 2020 09:11:11 -0800 (PST)
Received: from cheddar.halon.org.uk (cheddar.halon.org.uk. [93.93.131.118])
        by smtp.gmail.com with ESMTPSA id z83sm33634wmg.2.2020.01.21.09.11.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 09:11:11 -0800 (PST)
Received: from bsmtp by cheddar.halon.org.uk with local-bsmtp (Exim 4.89)
        (envelope-from <steve.mcintyre@linaro.org>)
        id 1itx3W-000263-Qo; Tue, 21 Jan 2020 17:11:10 +0000
Received: from steve by tack.einval.org with local (Exim 4.92)
        (envelope-from <steve.mcintyre@linaro.org>)
        id 1itx3I-0001fB-Ld; Tue, 21 Jan 2020 17:10:56 +0000
Date:   Tue, 21 Jan 2020 17:10:56 +0000
From:   Steve McIntyre <steve.mcintyre@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        david@gibson.dropbear.id.au, sjg@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Message-ID: <20200121171048.GF6796@tack.einval.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
 <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
 <220e3aea-b273-417a-69c9-059236c888af@st.com>
 <a1233cd8-e73a-82d7-74bf-69109d1a0a07@gmail.com>
 <20200120182837.GO3697@linaro.org>
 <f09ce50c-6721-c9d3-4f27-3f98a2d0b183@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f09ce50c-6721-c9d3-4f27-3f98a2d0b183@gmail.com>
X-attached: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-wibble: sender_address steve.mcintyre@linaro.org
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[ Adding lakml to the CC list ]

On Mon, Jan 20, 2020 at 09:20:55PM -0600, Frank Rowand wrote:
>On 1/20/20 12:28 PM, Steve McIntyre wrote:
>> On Mon, Jan 20, 2020 at 10:14:22AM -0600, Frank Rowand wrote:
>>> On 1/20/20 4:56 AM, Alexandre Torgue wrote:
>>>
>>> Here is an example of the info from one of my builds:
>>>
>>>   From Linux 5.5.0-rc2-dirty by frowand the Mon Jan 20 09:50:58 CST 2020.
>>>
>>> The information 'Linux 5.5.0-rc2-dirty' is precisely what was most objected
>>> to in my proposal.
>> 
>> ACK. :-( I'm surprised to see so much push-back on what looks like a
>> simple piece of information here.
>
>Me too.

So, looking at the comments back on the old thread...

Alexandre is proposing somthing slightly different here: a patch to
add a simple string to allow for a description of where the DTB came
from. The particular example he uses here fills in build details from
the Linux repo, but it could just as easily be filled in as part of a
U-Boot build, or the build of a DTB included with EDK2, or whatever
other firmware might include it. It might be useful to also add
similar debug output into U-Boot, or for that matter any other
DT-using project.

As Rob says later, it's simply information for humans to help identify
where a DTB came from. Nothing more.

>> I've had users *specifically* asking for this kind of identification
>> so that they can verify the version of the DTB they're using at
>> runtime. Right now it can be a guessing game, which does not help
>> people trying to debug problems.
>
>If the information was reported as debug information via pr_debug(),
>would that work for your use case?  Or would the users' kernels
>not have debug enabled in the configuration?

Quite possibly not - I'm not 100% sure to be honest. :-/

-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

