Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09EE430B204
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Feb 2021 22:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbhBAVWa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Feb 2021 16:22:30 -0500
Received: from ms.lwn.net ([45.79.88.28]:50674 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230094AbhBAVWa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Feb 2021 16:22:30 -0500
X-Greylist: delayed 16994 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Feb 2021 16:22:30 EST
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 66D3E384;
        Mon,  1 Feb 2021 21:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 66D3E384
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1612214509; bh=zFCLGfAujq4fIR8VwOuNF0Vsve0622fqbiBDx88X0K8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EVyjPSnYscr9FSXgpl9ustjG4EMy7MWz4+J8hStXFNLzXhKJueffpwm0GmFJ0R08O
         VWxOTmaUV/yJWR3OU2DBRkreM2AV3+SyK8ziZWdVktlQnzt2V9GCVM8uHP7eMz6Txw
         FUBfXgnkipxQdRd7ME4Zl9iAFrCIyAV/pz+cUFIUSvfW1cZl8n8sgPhlXF6NSZdNB7
         CMPMA2asNUTzEqEXNQUxWoHhf6pfATNUI91+vnfvwiGcuZWKMuisvie25d97xC+Waw
         AXfmmkhLjd+79DgryDlwHfkfwI/5gz4ysyTF8btHQjLPaYmsN+qgIixBOisn0LYXyt
         jY/NtCop4AXWA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: remove PYTHON variable
In-Reply-To: <CAK7LNAQQ=kqhx6REix7j+ZndABjuCBEwp=yiQp71Z0fBrQZxog@mail.gmail.com>
References: <20210201010024.654526-1-masahiroy@kernel.org>
 <87r1lzvj3q.fsf@meer.lwn.net>
 <CAK7LNAQQ=kqhx6REix7j+ZndABjuCBEwp=yiQp71Z0fBrQZxog@mail.gmail.com>
Date:   Mon, 01 Feb 2021 14:21:48 -0700
Message-ID: <87czxjv5zn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> On Tue, Feb 2, 2021 at 1:38 AM Jonathan Corbet <corbet@lwn.net> wrote:
>> So this will have the effect of making the docs build impossible for
>> folks who only have Python 2.
>
> Is this a problem?  Python 2 is EOL.
>
> Everybody who wants to use Python
> must install Python 3.

I honestly don't know, but people do keep things around for a
surprisingly long time.

>>  As I said before, this is a step that we
>> knew was coming, we just hadn't decided on the exact timing - I guess
>> this decides for us :)
>>
>> That said, I'll copy linux-doc to see if anybody screams.  I assume this
>> is a 5.12 change?
>
> No, I am planning to do this for 5.11
> (a pull request this week if there is no objection).

I'm not going to truly object and try to block this, but I worry that
it's soon and without warning.  It's not a change I would merge for
-rc7.  IMO this should be done in 5.12 with an appropriate note added to
Documentation/process/changes.rst as well.

Thanks,

jon
