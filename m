Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBA1107630
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2019 18:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfKVRFz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Nov 2019 12:05:55 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:57378 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKVRFz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Nov 2019 12:05:55 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAMH4AwH053910;
        Fri, 22 Nov 2019 17:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=jXuGS2jXH16VrXXkHHcbm2NTJjQNRd2ykOYjGvvnY0Y=;
 b=FLbkwZWYFgMTYPtRuYvR8FehFDNHpNKImP5jvfP3c+95Q99p7JG29KmosyqWXek8lGIZ
 zEjRXcpeoXk5WqYfO5217aB39wE/AVEuP2UMPzEhH0hdBjg0w0IXmlCyFIEZL5jeTrHY
 vg3pegHhlAC02zYxXqJSz9b1AiXVoEv1/+tpSmQ88JfvkXfXk2euE0VwfHWqnkgrHBtS
 pRYon2846P/ynpS2uhOHN0I4TC92e24U6gT8dTZFc09F6AdTvzckHsisIbYjNwZ2GZQW
 Afs79pYLZxQi6M0lzCsbcElG/mgsVG7iDkEmHp466TWXrN0ow7CbAK96nB1jV5FWveb2 oA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2wa92qbu2r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Nov 2019 17:04:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAMH4c6T179772;
        Fri, 22 Nov 2019 17:04:46 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2wec296ba2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Nov 2019 17:04:46 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAMH4TEX028653;
        Fri, 22 Nov 2019 17:04:29 GMT
Received: from [10.211.14.86] (/10.211.14.86)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 22 Nov 2019 09:04:29 -0800
Subject: Re: [PATCH v3] kallsyms: add names of built-in modules
To:     Nick Alcock <nick.alcock@oracle.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Keller, Jacob E" <jacob.e.keller@intel.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
References: <20191119224225.2438-1-eugene.loh@oracle.com>
 <20191120045938.2155-1-eugene.loh@oracle.com>
 <CAK7LNASv4BkjHYaUXWEjeizHF6UckSef72y=X1VV2zEAOn1XdA@mail.gmail.com>
 <87tv6w9bqi.fsf@esperi.org.uk>
From:   Eugene Loh <eugene.loh@oracle.com>
Message-ID: <27a0ab27-82b3-0df1-9648-44454f900535@oracle.com>
Date:   Fri, 22 Nov 2019 09:04:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <87tv6w9bqi.fsf@esperi.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9448 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911220147
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9448 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911220147
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/22/2019 07:23 AM, Nick Alcock wrote:

> On 22 Nov 2019, Masahiro Yamada stated:

Thank you for the careful review.  I await your feedback on Nick's 
comments.  In particular, you raise good challenge cases, but like Nick 
I wonder if "better" might be good enough.

Meanwhile, ...

>> On Wed, Nov 20, 2019 at 2:02 PM <eugene.loh@oracle.com> wrote:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>> +static struct obj2mod_elem *obj2mod[OBJ2MOD_N];
>>> +
>>> +static void obj2mod_init(void)
>>> +{
>>> +       memset(obj2mod, 0, sizeof(obj2mod));
>>> +}
>>
>> Unneeded.
>>
>> The .bss section is automatically zero-cleared by
>> operating system.  obj2mod is already zero-filled.
> Agreed (with the caveat that I'm not the one shepherding this patch
> through, but I hope Eugene agrees as well. :) )

No caveat needed:  I'm on board!

>>> +       /* skip the .init.scratch section */
>>> +       if (strcmp(sym, "__init_scratch_end") == 0) {
>>> +               init_scratch = 0;
>>> +               goto read_another;
>>> +       }
>>> +       if (strcmp(sym, "__init_scratch_begin") == 0)
>>> +               init_scratch = 1;
>>> +       if (init_scratch)
>>> +               goto read_another;
>>
>> How is this hunk related?
>> I do not understand it from the commit log.

Right.  It's not described in the commit message.  I will pull this code 
out in the next version of this patch.

> Ah, sorry, this was a recent addition to work around problems in the
> parsing side in userspace: it really doesn't belong here, I suspect.
>
> (Our userspace-side parsing code (which was getting confused about the
> relatively recently-added presence of symbols that were neither 'all
> address in order, modules jumbled together' nor 'addresses not in order,
> one module at a time'. I suspect we should adjust to that instead -- but
> I didn't make that change so I'm not really an authoritative source
> here. Eugene?)
