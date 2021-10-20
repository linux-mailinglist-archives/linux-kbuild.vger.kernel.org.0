Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2E343466E
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 10:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhJTII1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 04:08:27 -0400
Received: from out2.mail.ruhr-uni-bochum.de ([134.147.42.229]:52570 "EHLO
        out2.mail.ruhr-uni-bochum.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229544AbhJTII0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 04:08:26 -0400
X-Greylist: delayed 52644 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Oct 2021 04:08:26 EDT
Received: from mx2.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by out2.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4HZ38g2Vvxz8SZx;
        Wed, 20 Oct 2021 10:06:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
        t=1634717171; bh=pPm0zmczl1MpyjihSMWnM8oS2ko3rCNXdKd6WxUatNg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=i+om3kQsy0JhGYp8rZhB7lDXOqBuQ+esqV7a7rAVU48CGqJPx7atGU4fdUyR1TZ89
         zal2YQUHaWsLvcTr0IHsVf/FGIkTehBYnxVayS137mFbR3R6NOqoYd4ixz5CqKRSvF
         nsoQYGkqQmYHeFP3D0KJuFnNXRzD4EMey2aTeK2M=
Received: from out2.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by mx2.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4HZ38g1sF5z8Sb2;
        Wed, 20 Oct 2021 10:06:11 +0200 (CEST)
X-Envelope-Sender: <thorsten.berger@rub.de>
X-RUB-Notes: Internal origin=IPv6:2a05:3e00:c:1001::8693:2aec
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:c:1001::8693:2aec])
        by out2.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 4HZ38f6Njxz8SZt;
        Wed, 20 Oct 2021 10:06:10 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.1 at mx2.mail.ruhr-uni-bochum.de
Received: from [192.168.188.22] (unknown [5.63.48.164])
        by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4HZ38f1dGFzDgyZ;
        Wed, 20 Oct 2021 10:06:10 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.0 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <176bb83c-1269-6970-128c-9b170d5120c4@rub.de>
Date:   Wed, 20 Oct 2021 10:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC 0/3] kconfig: add support for conflict resolution
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org
Cc:     "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <f89e6f6d-99a1-ab3f-ead8-c55b7144ebe5@rub.de>
 <20b94a01-63d3-1cfd-320c-ddbe112bab29@infradead.org>
From:   Thorsten Berger <thorsten.berger@rub.de>
In-Reply-To: <20b94a01-63d3-1cfd-320c-ddbe112bab29@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Randy,

Yes, they might have been too large. We'll send a more fine-grained 
patch set. Shall we create a new thread or reply to the first email I 
sent yesterday?

Best, Thorsten


On 20.10.2021 03:32, Randy Dunlap wrote:
> On 10/19/21 10:28 AM, Thorsten Berger wrote:
>> Hi,
>>
>> Configuring a kernel requires a forward enabling approach where one
>> enables each option one needs at a time. If one enables an option
>> that selects other options, these options are no longer de-selectable
>> by design. Likewise, if one has enabled an option which creates a
>> conflict with a secondary option one wishes to enable, one cannot
>> easily enable that secondary option, unless one is willing to spend
>> time analyzing the dependencies that led to this conflict. Sometimes,
>> these conflicts are not easy to understand [0,1].
>>
>> This patch series (for linux-next) provides support to enable users to
>> express their desired target configuration and display possible 
>> resolutions
>> to their conflicts. This support is provided within xconfig.
>>
>> Conflict resolution is provided by translating kconfig's configuration
>> option tree to a propositional formula, and then allowing our resolution
>> algorithm, which uses a SAT solver (picosat, implemented in C) calculate
>> the possible fixes for an expressed target kernel configuration.
>>
>> New UI extensions are made to xconfig with panes and buttons to allow 
>> users
>> to express new desired target options, calculate fixes, and apply any of
>> found solutions.
>>
>> We created a separate test infrastructure that we used to validate the
>> correctness of the suggestions made. It shows that our resolution
>> algorithm resolves around 95% of the conflicts. We plan to incorporate
>> this with a later patch series.
>>
>> We envision that our translation of the kconfig option tree into into a
>> propositional formula could potentially also later be repurposed to
>> address other problems. An example is checking the consistency
>> between the use of ifdefs and logic expressed in kconfig files.
>> We suspect that this could, for example, help avoid invalid kconfig
>> configurations and help with ifdef maintenance.
>>
>> You can see a YouTube video demonstrating this work [2]. This effort is
>> part of the kernelnewbies Kconfig-SAT project [3], the approach and 
>> effort is
>> also explained in detail in our paper [4].
>>
>> Patches applicable to linux-next.
>>
>> [0] https://gsd.uwaterloo.ca/sites/default/files/vamos12-survey.pdf
>> [1] https://www.linux-magazine.com/Issues/2021/244/Kconfig-Deep-Dive
>> [2] https://youtu.be/vyX7zCRiLKU
>> [3] https://kernelnewbies.org/KernelProjects/kconfig-sat
>> [4] 
>> http://www.cse.chalmers.se/~bergert/paper/2021-icseseip-configfix.pdf
>>
>> Thanks from the team! (and thanks to Luis Chamberlain for guiding us 
>> here)
>>
>> Co-developed-by: Patrick Franz <deltaone@debian.org>
>> Signed-off-by: Patrick Franz <deltaone@debian.org>
>> Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
>> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
>> Reviewed-by: Luis Chamberlain <mcgrof@suse.com>
>> Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
>> Suggested-by: Sarah Nadi <nadi@ualberta.ca>
>> Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
>> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
>>
>
> Hi,
>
> It looks like patches 1/3 and 2/3 didn't make it to the
> mailing list.  My guess is that they are too large
> (I don't know the limit -- it may be 100 KB per email).
>
>
>>
>> Patrick Franz (3):
>>    Add PicoSAT.
>>    Add ConfigFix.
>>    Simplify dependencies for MODULE_SIG_KEY_TYPE_RSA &
>>      MODULE_SIG_KEY_TYPE_ECDSA.
>>
>>   certs/Kconfig                    |    3 +-
>>   scripts/kconfig/Makefile         |   19 +-
>>   scripts/kconfig/cf_constraints.c | 1219 +++++
>>   scripts/kconfig/cf_constraints.h |   23 +
>>   scripts/kconfig/cf_defs.h        |  233 +
>>   scripts/kconfig/cf_expr.c        | 2146 ++++++++
>>   scripts/kconfig/cf_expr.h        |  237 +
>>   scripts/kconfig/cf_rangefix.c    | 1017 ++++
>>   scripts/kconfig/cf_rangefix.h    |   18 +
>>   scripts/kconfig/cf_satutils.c    |  536 ++
>>   scripts/kconfig/cf_satutils.h    |   30 +
>>   scripts/kconfig/cf_utils.c       |  510 ++
>>   scripts/kconfig/cf_utils.h       |   90 +
>>   scripts/kconfig/cfconfig.c       |  176 +
>>   scripts/kconfig/cfoutconfig.c    |  128 +
>>   scripts/kconfig/configfix.c      |  422 ++
>>   scripts/kconfig/configfix.h      |   41 +
>>   scripts/kconfig/expr.h           |   13 +
>>   scripts/kconfig/picosat.c        | 8502 ++++++++++++++++++++++++++++++
>>   scripts/kconfig/picosat.h        |  658 +++
>>   scripts/kconfig/qconf.cc         | 1003 +++-
>>   scripts/kconfig/qconf.h          |  179 +-
>>   22 files changed, 16945 insertions(+), 258 deletions(-)
>>   create mode 100644 scripts/kconfig/cf_constraints.c
>>   create mode 100644 scripts/kconfig/cf_constraints.h
>>   create mode 100644 scripts/kconfig/cf_defs.h
>>   create mode 100644 scripts/kconfig/cf_expr.c
>>   create mode 100644 scripts/kconfig/cf_expr.h
>>   create mode 100644 scripts/kconfig/cf_rangefix.c
>>   create mode 100644 scripts/kconfig/cf_rangefix.h
>>   create mode 100644 scripts/kconfig/cf_satutils.c
>>   create mode 100644 scripts/kconfig/cf_satutils.h
>>   create mode 100644 scripts/kconfig/cf_utils.c
>>   create mode 100644 scripts/kconfig/cf_utils.h
>>   create mode 100644 scripts/kconfig/cfconfig.c
>>   create mode 100644 scripts/kconfig/cfoutconfig.c
>>   create mode 100644 scripts/kconfig/configfix.c
>>   create mode 100644 scripts/kconfig/configfix.h
>>   create mode 100644 scripts/kconfig/picosat.c
>>   create mode 100644 scripts/kconfig/picosat.h
>>
>
>


-- 
Prof. Dr. Thorsten Berger
Chair of Software Engineering

Faculty of Computer Science
Ruhr University Bochum, Germany

http://www.thorsten-berger.net
Tel.: +49 (0) 234 32 25975
Mob.: +49 (0) 160 926 878 10
Skype: tberger.work

