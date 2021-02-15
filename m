Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9958A31BD99
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Feb 2021 16:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhBOPuZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Feb 2021 10:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbhBOPr5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Feb 2021 10:47:57 -0500
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [IPv6:2001:1600:3:17::42af])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972F4C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Feb 2021 07:39:48 -0800 (PST)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DfSw063mzzMprKn;
        Mon, 15 Feb 2021 16:39:44 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4DfSvz3vM9zlh8TM;
        Mon, 15 Feb 2021 16:39:43 +0100 (CET)
Subject: Re: [PATCH v1 2/3] kconfig: Ask user if string needs to be changed
 when dependency changed
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     James Morris <jmorris@namei.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>
References: <20210215122513.1773897-1-mic@digikod.net>
 <20210215122513.1773897-3-mic@digikod.net>
 <boris.20210215155804@codesynthesis.com>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <ad0cc042-f192-f85b-5fd6-9d99ad3d8c6a@digikod.net>
Date:   Mon, 15 Feb 2021 16:40:34 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <boris.20210215155804@codesynthesis.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 15/02/2021 15:13, Boris Kolpackov wrote:
> Mickaël Salaün <mic@digikod.net> writes:
> 
>> Content of string configuration may depend on related kernel
>> configurations.  Modify oldconfig and syncconfig to inform users about
>> possible required configuration update and give them the opportunity to
>> update it:
>> * if dependencies of this string has changed (e.g. enabled or disabled),
>> * and if the current value of this string is different than the (new)
>>   default one.
> 
> I have a number of questions:
> 
> 1. Why is a change in dependencies necessarily means that the dependent's
>    value must be revised? Here is a specific example (to make sure we are
>    talking about the same things):
> 
>    config FOO
>      string "Foo value"
>      depends on BAR || BAZ
> 
>    Why, in the general case, when I disable BAR and enable BAZ I must
>    also revise the value of FOO?

It may be necessary, or not, depending of the use of the string. This
semantic is not clearly expressed by kconfig but looking at the current
configuration, there is only 4 strings depending on more than one
dependency:
* SIMDISK1_FILENAME for arch/xtensa
* CMDLINE for arch/sh
* SECURITY_TOMOYO_POLICY_LOADER
* SECURITY_TOMOYO_ACTIVATION_TRIGGER

Such patterns seem in line with this patch.

> 
> 2. How do you know that what's in the user's .config is the old default
>    and in Kconfig -- the new default value? What if in the user's .config
>    is a custom value (with which the user is perfectly happy) and what's
>    in Kconfig is the old default (which the user has already seen)?

The current behavior (i.e. keeping the current user config) is not
changed. The oldconfig target only stops when a string may require an
update, shows to the user the (potentially new but not necessary best)
default value along with the value already in place in the .config file,
and if the user just type enter this current value will not be changed.

> 
> 3. Why limit this to strings only?

Strings contain configuration blobs that may be interpreted by the
kernel but not by kconfig (cf. CONFIG_LSM). It will still be possible to
handle other types if there is some related use cases.

> 
> 
>> This is particularly relevant for CONFIG_LSM which contains a list of
>> LSMs enabled at boot, but users will not have a chance to update this
>> list with a make oldconfig.
> 
> If my understanding above is correct, this feels like it's been purpose-
> made to address whatever issue you are having with CONFIG_LSM. If so,
> what about potential numerous other options that don't have this issue
> but will now be presented to the user for modification?

This patch series helps address the LSM stacking issue. The 4 other
cases may benefit from this patch too.
