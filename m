Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F666148D88
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jan 2020 19:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391307AbgAXSJv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jan 2020 13:09:51 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:52992 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388558AbgAXSJv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 13:09:51 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OI2u2G071912;
        Fri, 24 Jan 2020 18:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=PZ4YA1PJ36hu0C8Tg45keQpYsThJkCnvSMmzSo33pkg=;
 b=pfIQ0pN3cxlJ6J3Qm815tBplu2lHb/HJUV5hU4++IKahuI7SfFt0UKwJ12XtdV8g+6bM
 a8B2Uy8CFJDS0TnO331yXJd+y7bCwz3FwvcrGeRm6SUtkzGgggA6Fw8oC15iAJhEIvBu
 tiUWkugGfWAKwRi0e1nKGIzAm/3ZeUcx8CkVHc9CecE9fBhunt2i4MEAqqLB3rhp0pue
 0Qtteg7tuQuurRtks4dxNXAv948Tp7YvZhmFVWWD9kiuKpgXk0E9KBzU3oDO3IddsR/C
 TUgu10cB7zArOKWU8jS2pW+HL/thyM1LBF95NE3quwPWUjyIBc9gN2gByBCC9TsFFR/e 4g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2xksev2p1u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jan 2020 18:08:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OI3G5T079508;
        Fri, 24 Jan 2020 18:08:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2xr2yhhy84-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jan 2020 18:08:39 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00OI8Y1U030521;
        Fri, 24 Jan 2020 18:08:35 GMT
Received: from [10.211.15.86] (/10.211.15.86)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 24 Jan 2020 10:08:34 -0800
Subject: Re: [PATCH v4] kallsyms: add names of built-in modules
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Keller, Jacob E" <jacob.e.keller@intel.com>,
        Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>
References: <7e0f4a74-63c5-ad62-c619-c6277c4bc791@oracle.com>
 <20191210174826.5433-1-eugene.loh@oracle.com>
 <2a535000-e71e-fab9-cf6a-e7e5fb8053d8@oracle.com>
 <20191218222931.76131c6a@rorschach.local.home>
 <CAK7LNATJZCekCoj0ruPUGRv7sH_hcJP-dFPd-3_EOR5hFNW-Xg@mail.gmail.com>
 <aa165beb-a92c-c3b9-d57a-4046ba91f677@oracle.com>
 <CAK7LNATnYNpNXYF+Ttv9y6AcE85f1uN2USrR0+FnUffp40MKkw@mail.gmail.com>
From:   Eugene Loh <eugene.loh@oracle.com>
Message-ID: <ec2e9f63-f54b-f156-e1a8-f5367e7ee0fa@oracle.com>
Date:   Fri, 24 Jan 2020 10:08:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNATnYNpNXYF+Ttv9y6AcE85f1uN2USrR0+FnUffp40MKkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001240149
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001240149
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 01/19/2020 10:37 PM, Masahiro Yamada wrote:

> Hi Eugene,
>
> On Thu, Jan 9, 2020 at 3:32 AM Eugene Loh <eugene.loh@oracle.com> wrote:
>> On 12/18/2019 08:28 PM, Masahiro Yamada wrote:
>>
>>> On Thu, Dec 19, 2019 at 12:29 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>>>> Couple of notes:
>>>> 1) this affects code that doesn't really have a maintainer. I could
>>>> take it in my tree, but I would like to have acks from other
>>>> maintainers. Perhaps Jessica Yu (Module maintainer), and probably one
>>>> from Linus himself.
>>>>
>>>> 2) Do not send new versions of a patch as a reply to the old version. I
>>>> and many other maintainers sort our inbox by threads, and I look at the
>>>> top of the thread for patches. That is, if there's another version of a
>>>> patch that is a reply to a previous version, it is basically off my
>>>> radar, unless I happen to notice it by chance (which I did with this
>>>> email).
>>>>
>>>> You can send your v4 patch again, but please send it as its own thread,
>>>> that way it will be on the radar of other maintainers. Hopefully we can
>>>> get some acks on this as well.
>> Sorry.  I misunderstood some process doc.  But before I resend...
>>
>>> I do not like this patch.
>>>
>>> scripts/Makefile.modbuiltin is really ugly.
>>> It traverses all the directories once again.
>>>
>>> This patch makes it even worse,
>>> Kbuild would traverse the
>>> whole directories three times.
>>>
>>> I was thinking to remove scripts/Makefile.modbuiltin
>>> and Kconfig's tristate.conf entirely
>>> because it is possible to generate modules.builtin more simply.
>> Sorry about the delayed response, due in part to holidays.  Thank you
>> for your on-going review and the pointer to
>> https://lore.kernel.org/patchwork/project/lkml/list/?series=423205
>>
>> I agree your proposed patch simplifies some build code, but this is
>> long-standing code.  Also, the build time -- either that would be saved
>> by your patch or that would be incurred by a third traversal -- is
>> miniscule.
>>
>> Further, I do not see how to add object-to-module information to your
>> proposed scheme.  Can you suggest something?  If not, then it seems the
>> proposed code simplification is limiting functionality.
>
> The object-to-module information can be retrieved by a similar
> way as I did in
> https://lore.kernel.org/patchwork/project/lkml/list/?series=423205

Thanks again for that pointer.  I'm looking at how that approach can be 
generalized to the functionality we need for the object-to-module mapping.

> But, even if modules_think.builtin is produced in a new way,
> there would make no difference in the fact that
> the build system needs to generate modules_think.builtin and
> .tmp_vmlinux.range, and kallsyms must integrate a big
> parser of them.
>
> So, I think this patch lacks the taste as overall.

Unfortunately we need to get the information from somewhere.  I'll work 
on streamlining the implementation more, and prepare an updated patch.

>>> As I said, the name of builtin module is not fixed info.
>>> And, this makes kallsyms fat just for less important info.
>> The name of the builtin module can be ambiguous in some cases, but in
>> most cases it is not.  Indeed, the extra information is typically
>> useful, and comments from, e.g., Linus and Steve were positive about
>> adding that information to kallsyms.  Further, we have even heard
>> favorable feedback for adding such built-in-module information to
>> available_filter_functions as well.
> In my opinion, this should be determined by the balance
> between the added value and the ugliness of the code.
>
> (Real) module names are obvious, but as I stated,
> built-in module names are somewhat subtle, so I do not
> like to extend it too much.
>
> Perhaps, I was the only person who reviewed the code in detail.
> After looking at how this feature is integrated,
> I do not believe this should go in. Sorry.

Thanks for the review.  In light of the value of the functionality and the
expressed interest in this feature, I'll work towards an updated patch for
further review.

>>>>> On 12/10/2019 09:48 AM, eugene.loh@oracle.com wrote:
>>>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>>>
>>>>>> /proc/kallsyms is very useful for tracers and other tools that need
>>>>>> to map kernel symbols to addresses.
>>>>>>
>>>>>> It would be useful if there were a mapping between kernel symbol and
>>>>>> module name that only changed when the kernel source code is changed.
>>>>>> This mapping should not vanish simply because a module becomes built
>>>>>> into the kernel.
