Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 693981435FE
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 04:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgAUDjb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jan 2020 22:39:31 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:40153 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgAUDjb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jan 2020 22:39:31 -0500
Received: by mail-qv1-f66.google.com with SMTP id dp13so809395qvb.7;
        Mon, 20 Jan 2020 19:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zdgsz84FvwJzIN/En/yZAdV4WDABHd4kiHJoyghAqMA=;
        b=E0rGhZJTc7LrntC7wA6B/ETc1nRH8YtUrXlz+Pgq0AHx/c9KXbI4UCuv5Cxtxo0IYP
         04KOPPEaVLUD4VgkLT2R5TUn4Nn2eXygh/WPH0fIhFtQpmcQ6ZsCtKqAIe2KHUllEpx1
         FQIwhUmuUiA3uxr7eQwyevTVy5fDFV3kfx/JuQ+Wj8n7N/8rWv2qupGBqnrsMoa0E0+a
         G/yYs9DiMOZwZFDdfMnSI6CweIQxxrPl73jZEgg9IYLTR43pgFBTLMwbkBNmBhFsnVOC
         TKRylTPKHDXRz6Dh2MIhFRj0oBRMsb7edt4B2VYYzsLv2Js69qqDeN2WMzwQXI9ROUN4
         jhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zdgsz84FvwJzIN/En/yZAdV4WDABHd4kiHJoyghAqMA=;
        b=TLvabdMefNcSBXnQtp7Pnu8ckGyfVFIfI4xaM5jPg+GzKd++GM4CzeJ0qUOW3puv4W
         /C5AGtjwE2lGFrXrw6yk7Vw+BVlDu5NW3kdtT4AT7ece63TlysbrMl2S543t/zWUxTg+
         bFucE+nxm57pU1ixIPeyL0dBk/f+Gx/Jbt4fviRn6RYN/yehN9xJ/9xFo5tpYyntp3i7
         dMEwGzwiYrfuaMoAam0Ng0DiEtGp+HBLc8SOMV42a6YdLn2KxQTB/EYzUTcpYzbu+sXj
         JQHfF/gby9bX6zgeM5OajQsETO9tRFPsQuinC9vkyLzJJKUwGWiNAF0/zN4dg1CObojr
         ijvg==
X-Gm-Message-State: APjAAAVwFPot1jpsaYv7WFrAy0fbA4iyOt+oM0JouUU0wSffrOQ5Pq7r
        CXAG4hXhess8w1piY8YvweQ=
X-Google-Smtp-Source: APXvYqwUfj2YD1sGgvoN79oBFVUE/pV8wx0UGCxlDZ/Nx1621wSd4zo48zzZYlwvfg+oU3rr8oP2AQ==
X-Received: by 2002:ad4:4f45:: with SMTP id eu5mr2948932qvb.235.1579577969907;
        Mon, 20 Jan 2020 19:39:29 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id d3sm18165079qtp.25.2020.01.20.19.39.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 19:39:29 -0800 (PST)
Subject: Re: [RFC PATCH 0/3] Add device tree build information
From:   Frank Rowand <frowand.list@gmail.com>
To:     Steve McIntyre <steve.mcintyre@linaro.org>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        david@gibson.dropbear.id.au, sjg@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
 <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
 <220e3aea-b273-417a-69c9-059236c888af@st.com>
 <a1233cd8-e73a-82d7-74bf-69109d1a0a07@gmail.com>
 <20200120182837.GO3697@linaro.org>
 <f09ce50c-6721-c9d3-4f27-3f98a2d0b183@gmail.com>
Message-ID: <e8cdbcaa-800b-18db-11ec-3d8df9da68b5@gmail.com>
Date:   Mon, 20 Jan 2020 21:39:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f09ce50c-6721-c9d3-4f27-3f98a2d0b183@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/20/20 9:20 PM, Frank Rowand wrote:
> On 1/20/20 12:28 PM, Steve McIntyre wrote:
>> Hi Frank!
>>
>> Thanks for the link back to the previous discussion, it's very
>> helpful.
>>
>> On Mon, Jan 20, 2020 at 10:14:22AM -0600, Frank Rowand wrote:
>>> On 1/20/20 4:56 AM, Alexandre Torgue wrote:
>>
>> ...
>>
>>>> and the date). There are no "dtb versions", and "absolute/relative"
>>>> path which created concerns. One remaining concern is "reproducible
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
> Me too.
> 
> 
>>
>> I've had users *specifically* asking for this kind of identification
>> so that they can verify the version of the DTB they're using at
>> runtime. Right now it can be a guessing game, which does not help
>> people trying to debug problems.
>>
>> Cheers,
>>
> 
> If the information was reported as debug information via pr_debug(),
> would that work for your use case?  Or would the users' kernels
> not have debug enabled in the configuration?

And even pr_debug() might not be sufficient since the property
value is available via /proc/device-tree if the proc file
system is enabled.
