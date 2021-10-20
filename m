Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A44E4342E2
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 03:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhJTBec (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Oct 2021 21:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhJTBec (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Oct 2021 21:34:32 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4320C06161C
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Oct 2021 18:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=mG3AGwd+8WNQf9grmy2epbFId9OuWsdE4xss2v2eX2I=; b=5EQ12WoyjxvpucH2OuenLQo3pm
        fwAVrtDeqqvi5HTiHytRNn2vrDq3NSx1eNMqezuXXY2jnx/PByWdzdXGugbpCTT1/tqzXtVzRKeiz
        BSqooJuP8+XeAh+zC9R/3Ko11h2ARRSI8765eVlhj2lEubzmha1JUhr3DAT1uz/YdjvWxKkzPvvuo
        md+OVnyI7Yz6Qm9sLpeK7DQ6pmiMH38pnJwhNoPYg4p5It2G2durY+5tklFA/t/ILY1a5l78mxOXv
        mEVr7vm8NANuDFLtc7ZZDqihu33rBEXTf0dXulV4z4rcaB/3z/fGJ6OQ/4DZ5DNSse0De8mGcV8yA
        +sZkJ6Qw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1md0Se-0037YY-W7; Wed, 20 Oct 2021 01:32:09 +0000
Subject: Re: [RFC 0/3] kconfig: add support for conflict resolution
To:     Thorsten Berger <thorsten.berger@rub.de>,
        linux-kbuild@vger.kernel.org
Cc:     "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <f89e6f6d-99a1-ab3f-ead8-c55b7144ebe5@rub.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20b94a01-63d3-1cfd-320c-ddbe112bab29@infradead.org>
Date:   Tue, 19 Oct 2021 18:32:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f89e6f6d-99a1-ab3f-ead8-c55b7144ebe5@rub.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/19/21 10:28 AM, Thorsten Berger wrote:
> Hi,
> 
> Configuring a kernel requires a forward enabling approach where one
> enables each option one needs at a time. If one enables an option
> that selects other options, these options are no longer de-selectable
> by design. Likewise, if one has enabled an option which creates a
> conflict with a secondary option one wishes to enable, one cannot
> easily enable that secondary option, unless one is willing to spend
> time analyzing the dependencies that led to this conflict. Sometimes,
> these conflicts are not easy to understand [0,1].
> 
> This patch series (for linux-next) provides support to enable users to
> express their desired target configuration and display possible resolutions
> to their conflicts. This support is provided within xconfig.
> 
> Conflict resolution is provided by translating kconfig's configuration
> option tree to a propositional formula, and then allowing our resolution
> algorithm, which uses a SAT solver (picosat, implemented in C) calculate
> the possible fixes for an expressed target kernel configuration.
> 
> New UI extensions are made to xconfig with panes and buttons to allow users
> to express new desired target options, calculate fixes, and apply any of
> found solutions.
> 
> We created a separate test infrastructure that we used to validate the
> correctness of the suggestions made. It shows that our resolution
> algorithm resolves around 95% of the conflicts. We plan to incorporate
> this with a later patch series.
> 
> We envision that our translation of the kconfig option tree into into a
> propositional formula could potentially also later be repurposed to
> address other problems. An example is checking the consistency
> between the use of ifdefs and logic expressed in kconfig files.
> We suspect that this could, for example, help avoid invalid kconfig
> configurations and help with ifdef maintenance.
> 
> You can see a YouTube video demonstrating this work [2]. This effort is
> part of the kernelnewbies Kconfig-SAT project [3], the approach and effort is
> also explained in detail in our paper [4].
> 
> Patches applicable to linux-next.
> 
> [0] https://gsd.uwaterloo.ca/sites/default/files/vamos12-survey.pdf
> [1] https://www.linux-magazine.com/Issues/2021/244/Kconfig-Deep-Dive
> [2] https://youtu.be/vyX7zCRiLKU
> [3] https://kernelnewbies.org/KernelProjects/kconfig-sat
> [4] http://www.cse.chalmers.se/~bergert/paper/2021-icseseip-configfix.pdf
> 
> Thanks from the team! (and thanks to Luis Chamberlain for guiding us here)
> 
> Co-developed-by: Patrick Franz <deltaone@debian.org>
> Signed-off-by: Patrick Franz <deltaone@debian.org>
> Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
> Reviewed-by: Luis Chamberlain <mcgrof@suse.com>
> Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
> Suggested-by: Sarah Nadi <nadi@ualberta.ca>
> Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
> 

Hi,

It looks like patches 1/3 and 2/3 didn't make it to the
mailing list.  My guess is that they are too large
(I don't know the limit -- it may be 100 KB per email).


> 
> Patrick Franz (3):
>    Add PicoSAT.
>    Add ConfigFix.
>    Simplify dependencies for MODULE_SIG_KEY_TYPE_RSA &
>      MODULE_SIG_KEY_TYPE_ECDSA.
> 
>   certs/Kconfig                    |    3 +-
>   scripts/kconfig/Makefile         |   19 +-
>   scripts/kconfig/cf_constraints.c | 1219 +++++
>   scripts/kconfig/cf_constraints.h |   23 +
>   scripts/kconfig/cf_defs.h        |  233 +
>   scripts/kconfig/cf_expr.c        | 2146 ++++++++
>   scripts/kconfig/cf_expr.h        |  237 +
>   scripts/kconfig/cf_rangefix.c    | 1017 ++++
>   scripts/kconfig/cf_rangefix.h    |   18 +
>   scripts/kconfig/cf_satutils.c    |  536 ++
>   scripts/kconfig/cf_satutils.h    |   30 +
>   scripts/kconfig/cf_utils.c       |  510 ++
>   scripts/kconfig/cf_utils.h       |   90 +
>   scripts/kconfig/cfconfig.c       |  176 +
>   scripts/kconfig/cfoutconfig.c    |  128 +
>   scripts/kconfig/configfix.c      |  422 ++
>   scripts/kconfig/configfix.h      |   41 +
>   scripts/kconfig/expr.h           |   13 +
>   scripts/kconfig/picosat.c        | 8502 ++++++++++++++++++++++++++++++
>   scripts/kconfig/picosat.h        |  658 +++
>   scripts/kconfig/qconf.cc         | 1003 +++-
>   scripts/kconfig/qconf.h          |  179 +-
>   22 files changed, 16945 insertions(+), 258 deletions(-)
>   create mode 100644 scripts/kconfig/cf_constraints.c
>   create mode 100644 scripts/kconfig/cf_constraints.h
>   create mode 100644 scripts/kconfig/cf_defs.h
>   create mode 100644 scripts/kconfig/cf_expr.c
>   create mode 100644 scripts/kconfig/cf_expr.h
>   create mode 100644 scripts/kconfig/cf_rangefix.c
>   create mode 100644 scripts/kconfig/cf_rangefix.h
>   create mode 100644 scripts/kconfig/cf_satutils.c
>   create mode 100644 scripts/kconfig/cf_satutils.h
>   create mode 100644 scripts/kconfig/cf_utils.c
>   create mode 100644 scripts/kconfig/cf_utils.h
>   create mode 100644 scripts/kconfig/cfconfig.c
>   create mode 100644 scripts/kconfig/cfoutconfig.c
>   create mode 100644 scripts/kconfig/configfix.c
>   create mode 100644 scripts/kconfig/configfix.h
>   create mode 100644 scripts/kconfig/picosat.c
>   create mode 100644 scripts/kconfig/picosat.h
> 


-- 
~Randy
