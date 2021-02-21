Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206243209C9
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 12:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhBULMV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 06:12:21 -0500
Received: from smtp-bc0e.mail.infomaniak.ch ([45.157.188.14]:52349 "EHLO
        smtp-bc0e.mail.infomaniak.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229902AbhBULMU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 06:12:20 -0500
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Dk2gn0S83zMq6CJ;
        Sun, 21 Feb 2021 12:11:33 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Dk2gl6mnVzlh8TG;
        Sun, 21 Feb 2021 12:11:31 +0100 (CET)
Subject: Re: [PATCH v2 3/3] security: Add LSMs dependencies to CONFIG_LSM
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>
References: <20210215181511.2840674-1-mic@digikod.net>
 <20210215181511.2840674-4-mic@digikod.net>
 <CAFqZXNsvqx-pbC+wzHB4aXX6h=buU3csM_a=By-zCOmx0n-xCQ@mail.gmail.com>
 <CAK7LNAQDWxGJU41D4+AbjFiX63BiA+bsNzTHZsKKc-LPyO7oCQ@mail.gmail.com>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <8809a929-980a-95d1-42dc-576ff54e2923@digikod.net>
Date:   Sun, 21 Feb 2021 12:12:44 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQDWxGJU41D4+AbjFiX63BiA+bsNzTHZsKKc-LPyO7oCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 21/02/2021 09:50, Masahiro Yamada wrote:
> On Tue, Feb 16, 2021 at 4:03 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>>
>> On Mon, Feb 15, 2021 at 7:17 PM Mickaël Salaün <mic@digikod.net> wrote:
>>> From: Mickaël Salaün <mic@linux.microsoft.com>
>>>
>>> Thanks to the previous commit, this gives the opportunity to users, when
>>> running make oldconfig, to update the list of enabled LSMs at boot time
>>> if an LSM has just been enabled or disabled in the build.  Moreover,
>>> this list only makes sense if at least one LSM is enabled.
>>>
>>> Cc: Casey Schaufler <casey@schaufler-ca.com>
>>> Cc: James Morris <jmorris@namei.org>
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Cc: Serge E. Hallyn <serge@hallyn.com>
>>> Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
>>> Link: https://lore.kernel.org/r/20210215181511.2840674-4-mic@digikod.net
>>> ---
>>>
>>> Changes since v1:
>>> * Add CONFIG_SECURITY as a dependency of CONFIG_LSM.  This prevent an
>>>   error when building without any LSMs.
>>> ---
>>>  security/Kconfig | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/security/Kconfig b/security/Kconfig
>>> index 7561f6f99f1d..addcc1c04701 100644
>>> --- a/security/Kconfig
>>> +++ b/security/Kconfig
>>> @@ -277,6 +277,10 @@ endchoice
>>>
>>>  config LSM
>>>         string "Ordered list of enabled LSMs"
>>> +       depends on SECURITY || SECURITY_LOCKDOWN_LSM || SECURITY_YAMA || \
>>> +               SECURITY_LOADPIN || SECURITY_SAFESETID || INTEGRITY || \
>>> +               SECURITY_SELINUX || SECURITY_SMACK || SECURITY_TOMOYO || \
>>> +               SECURITY_APPARMOR || BPF_LSM
>>
>> This looks really awkward, since all of these already depend on
>> SECURITY (if not, it's a bug)... I guarantee you that after some time
>> someone will come, see that the weird boolean expression is equivalent
>> to just SECURITY, and simplify it.
> 
> 
> Currently, LSM does not depend on SECURITY.
> So you can always define LSM irrespective of SECURITY,
> which seems a bug.
> 
> So, I agree with adding 'depends on SECURITY'.
> 
> What he is trying to achieve in this series
> seems wrong, of course.

This may be wrong in the general case, but not for CONFIG_LSM.

> 
> 
>> I assume the new mechanism wouldn't work as intended if there is just
>> SECURITY? If not, then maybe you should rather specify this value
>> dependency via some new  field rather than abusing "depends on" (say,
>> "value depends on"?). The fact that a seemingly innocent change to the
>> config definition breaks your mechanism suggests that the design is
>> flawed.

Masahiro, what do you think about this suggested "value depends on"?


>>
>> I do think this would be a useful feature, but IMHO shouldn't be
>> implemented like this.
>>
>>>         default "lockdown,yama,loadpin,safesetid,integrity,smack,selinux,tomoyo,apparmor,bpf" if DEFAULT_SECURITY_SMACK
>>>         default "lockdown,yama,loadpin,safesetid,integrity,apparmor,selinux,smack,tomoyo,bpf" if DEFAULT_SECURITY_APPARMOR
>>>         default "lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf" if DEFAULT_SECURITY_TOMOYO
>>> --
>>> 2.30.0
>>>
>>
>> --
>> Ondrej Mosnacek
>> Software Engineer, Linux Security - SELinux kernel
>> Red Hat, Inc.
>>
> 
> 
